import 'dart:io';
import 'package:alrehila/remote/data/user/data/editimg.dart';
import 'package:alrehila/remote/data/user/data/editname.dart';
import 'package:alrehila/remote/data/user/data/editphone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import '../../../tools/class/status_request.dart';
import '../../../tools/design/color_panel.dart';
import '../../../tools/functions/handing_data_controller.dart';
import '../../../tools/routes/app_route.dart';
import '../../../tools/services/services.dart';
import '../../../remote/auth/facebook.dart';
import '../../../remote/auth/google.dart';
import '../../../remote/data/user/data/editmail.dart';
import '../../../screens/Home/bottombar.dart';
import '../../../widgets/customs/custom_snackbar.dart';
import '../settings.dart';
import 'package:image_cropper/image_cropper.dart';

abstract class ProfileController extends GetxController {
  backButton();
  actionButton();
  updateImg();
  updateName();
  updateEmail();
  updatePhone();
  googleLink();
  facebookLink();
}

class ProfileControllerImp extends ProfileController {
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  Services services = Get.find();
  EditName editName = EditName(Get.find());
  EditMail editMail = EditMail(Get.find());
  EditPhone editPhone = EditPhone(Get.find());
  EditImg editImg = EditImg(Get.find());
  GoogleLogin googleLogin = GoogleLogin(Get.find());
  FaceBookLogin faceBookLogin = FaceBookLogin(Get.find());
  FocusNode userFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController repassword;
  late TextEditingController phone;
  late int google = 0;
  late int facebook = 0;
  late String img = '';
  late String id = '';

  String selectedImagePath = '';
  late File image;
  final imagePicker = ImagePicker();
  bool isEnable = true;
  bool isImagePickerActive = false;

  @override
  backButton() {
    Get.offAll(
      const BottomBar(initialPageIndex: 3),
      transition: Transition.leftToRight,
    );
  }

  selectImageFromGallery() async {
    if (!isImagePickerActive) {
      isImagePickerActive = true;
      XFile? file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      isImagePickerActive = false;

      if (file != null) {
        selectedImagePath = file.path;
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: file.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: AppColor.primary,
              toolbarWidgetColor: Colors.white,
              activeControlsWidgetColor: AppColor.primary,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
              aspectRatioPresets: [
                CropAspectRatioPreset.square,
              ],
            ),
            IOSUiSettings(
              minimumAspectRatio: 1.0,
              aspectRatioPresets: [
                CropAspectRatioPreset.square,
              ],
            ),
          ],
        );

        if (croppedFile != null) {
          selectedImagePath = croppedFile.path;
          await updateImg();
          return selectedImagePath;
        } else {
          return '';
        }
      } else {
        return '';
      }
    } else {
      if (kDebugMode) {
        print('Image picker is already active');
      }
      return '';
    }
  }

  @override
  actionButton() {
    if (isEnable) {
      isEnable = false;
      username.text = services.sharedPreferences.getString('username')!;
      email.text = services.sharedPreferences.getString('email')!;
      phone.text = services.sharedPreferences.getString('phone')!;
      id = services.sharedPreferences.getInt("id").toString();
    } else {
      isEnable = true;
      username.clear();
      email.clear();
      phone.clear();
    }
  }

  @override
  updateImg() async {
    File imgFile = File(selectedImagePath);

    statusRequest = StatusRequest.loading;
    update();

    Uint8List bytes = await imgFile.readAsBytes();

    File tempFile = File('${imgFile.path}.temp');
    await tempFile.writeAsBytes(bytes);

    Map data = {
      'id': id,
      'email': email.text,
    };

    var response = await editImg.postData(
      data,
      imgFile,
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success &&
        response['status'] == "success") {
      if (kDebugMode) {
        print("Img updated successfully");
      }
      services.sharedPreferences.setString("img", selectedImagePath);
      SettingControllerImp settingControllerImp = SettingControllerImp();
      settingControllerImp.getData();
    } else {
      if (kDebugMode) {
        print("Img update failed");
      }
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  updateName() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await editName.postData(
      email.text,
      username.text,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (kDebugMode) {
          print("Name updated successfully");
          services.sharedPreferences.setString("username", username.text);
          SettingControllerImp settingControllerImp = SettingControllerImp();
          settingControllerImp.getData();
        }
      } else {
        if (kDebugMode) {
          print("Name update failed");
        }
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  updateEmail() {
    statusRequest = StatusRequest.loading;
    update();
    var response = editMail.postData(
      email.text,
      phone.text,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (kDebugMode) {
          print("eMail updated successfully");
          services.sharedPreferences.setString("email", email.text);
          services.sharedPreferences.setString("phone", phone.text);
          SettingControllerImp settingControllerImp = SettingControllerImp();
          settingControllerImp.getData();
        }
      } else {
        if (kDebugMode) {
          print("eMail update failed");
        }
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  updatePhone() {
    if (phone.text == '') {
      Get.showSnackbar(
        CustomSnackBarConfig.buildSnackBar(
          title: 'Error',
          message: 'Phone number can\'t be empty',
          backgroundColor: Colors.red,
          icon: Icons.close,
        ),
      );
      update();
      return;
    }
    statusRequest = StatusRequest.loading;
    update();
    var response = editPhone.postData(
      email.text,
      phone.text,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (kDebugMode) {
          print("Phone updated successfully");
          services.sharedPreferences.setString("email", email.text);
          services.sharedPreferences.setString("phone", phone.text);
          SettingControllerImp settingControllerImp = SettingControllerImp();
          settingControllerImp.getData();
        }
      } else {
        if (kDebugMode) {
          print("Phone update failed");
        }
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  googleLink() async {
    Future<void> updateAccount(
        GoogleSignInAccount gUser, User? currentUser) async {
      var response = await googleLogin.postdata(
        gUser.displayName!,
        gUser.email,
        gUser.photoUrl!,
        '2',
      );
      if (response['status'] == "success") {
        int id = response['data']['id'];
        services.sharedPreferences.setInt("signin", 2);
        services.sharedPreferences.setInt("id", id);
        services.sharedPreferences.setString("email", gUser.email);
        services.sharedPreferences.setString("img", gUser.photoUrl ?? '');

        Get.offAllNamed(AppRoute.home);
        successDialog('Success', 'Google account linked');
      } else {
        // Handle account linking error
      }
    }

    Future<void> handleExistingAccount(
      GoogleSignInAccount gUser,
      AuthCredential? credential,
    ) async {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        if (credential != null) {
          await currentUser.linkWithCredential(credential);
        }
        await updateAccount(gUser, currentUser);
      } else {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential!);
        await updateAccount(gUser, userCredential.user);
      }
    }

    final GoogleSignInAccount? currentUser = GoogleSignIn().currentUser;

    if (currentUser != null) {
      if (kDebugMode) {
        print("User is already signed in: ${currentUser.email}");
      }
      await handleExistingAccount(currentUser, null);
      return;
    }

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) {
      if (kDebugMode) {
        print("Google Sign-In aborted by user.");
      }
      return;
    }

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    if (gAuth.accessToken == null || gAuth.idToken == null) {
      if (kDebugMode) {
        print("Failed to obtain IDs during sign-in.");
      }
      return;
    }

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    statusRequest = StatusRequest.loading;
    update();

    var checkResponse = await googleLogin.postdata(
      gUser.displayName!,
      gUser.email,
      gUser.photoUrl!,
      '1',
    );
    if (checkResponse['status'] == 'success') {
      await handleExistingAccount(gUser, credential);
    } else {
      // Handle check response error
    }
  }

  @override
  facebookLink() async {
    final LoginResult fUser = await FacebookAuth.instance.login(permissions: [
      'email',
      'public_profile',
    ]);
    final userData = await FacebookAuth.instance.getUserData(
      fields: "name,email,picture.width(200)",
    );
    final OAuthCredential credential = FacebookAuthProvider.credential(
      fUser.accessToken!.tokenString,
    );

    final currentUser = FirebaseAuth.instance.currentUser;
    Get.offNamed(AppRoute.profile);
    statusRequest = StatusRequest.loading;
    update();
    var response = await faceBookLogin.postdata(
      userData['name'],
      userData['email'],
      // userData['phone'],
      userData['picture']['data']['url'],
    );
    if (kDebugMode) {
      print("Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.profile);
        if (kDebugMode) {
          print("linked Successfully");
        }
      } else {
        Get.offNamed(AppRoute.profile);
        if (kDebugMode) {
          print("Already linked And Email Or Phone Alreday Exist");
        }
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    await FirebaseAuth.instance.signInWithCredential(credential);
    await currentUser?.linkWithCredential(credential);
  }

  @override
  void onInit() {
    img = services.sharedPreferences.getString('img')!;
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    username.text = services.sharedPreferences.getString('username')!;
    phone.text = services.sharedPreferences.getString('phone')!;
    email.text = services.sharedPreferences.getString('email')!;
    id = services.sharedPreferences.getInt("id").toString();
    google = services.sharedPreferences.getInt("google")!;
    facebook = services.sharedPreferences.getInt("facebook")!;
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    username.dispose();
    email.dispose();
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}

Future<void> successDialog(title, description) async {
  Get.snackbar(
    "",
    "",
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(bottom: 70),
    maxWidth: 300,
    backgroundColor: Colors.green,
    borderRadius: 20,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(seconds: 3),
    titleText: Center(
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w800,
          fontSize: 19,
          color: AppColor.white,
        ),
      ),
    ),
    messageText: Center(
      child: Text(
        description,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: AppColor.white,
        ),
      ),
    ),
  );
}
