import 'package:alrehila/screens/settings/auth/password/forgetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../tools/class/status_request.dart';
import '../../../../../tools/functions/handing_data_controller.dart';
import '../../../../../tools/routes/app_route.dart';
import '../../../../../../tools/services/services.dart';
import '../../../../../tools/design/color_panel.dart';
import '../../../../remote/auth/facebook.dart';
import '../../../../remote/auth/google.dart';
import '../../../../remote/auth/signin.dart';
import '../../../../screens/settings/auth/signup/signup.dart';

abstract class LoginController extends GetxController {
  goToSignUp();
  goToForgetPassword();
  signin();
  gSignin();
  fSignin();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstatesignin = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find());
  GoogleLogin googleLogin = GoogleLogin(Get.find());
  FaceBookLogin faceBookLogin = FaceBookLogin(Get.find());

  late TextEditingController email;
  late TextEditingController password;
  bool isshowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  Services services = Get.find();

  @override
  signin() async {
    var formdatasignin = formstatesignin.currentState;
    if (formdatasignin!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      if (kDebugMode) {
        print("Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['approve'] == 1) {
            Get.offNamed(AppRoute.home);
            services.sharedPreferences.setInt("signin", 1);
            int id = response['data']['id'];
            String name = response['data']['name'];
            String email = response['data']['email'];
            String phone = response['data']['phone'] ?? '';
            String avatar = response['data']['avatar'];
            int google = response['data']['google'];
            int facebook = response['data']['facebook'];
            services.sharedPreferences.setInt("id", id);
            services.sharedPreferences.setString("username", name);
            services.sharedPreferences.setString("email", email);
            services.sharedPreferences.setString("phone", phone);
            services.sharedPreferences.setString("img", avatar);
            services.sharedPreferences.setInt("google", google);
            services.sharedPreferences.setInt("facebook", facebook);
            Get.offNamed(AppRoute.home);
            successDialog();
          } else {
            Get.offNamed(
              AppRoute.verifyCodeSignUp,
              arguments: {"email": email.text},
            );
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  gSignin() async {
    statusRequest = StatusRequest.loading;
    update();
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Future.delayed(const Duration(seconds: 2));

    statusRequest = StatusRequest.none;
    update();

    Future<void> updateAccount(
        GoogleSignInAccount gUser, User? currentUser) async {
      statusRequest = StatusRequest.loading;
      update();

      var response = await googleLogin.postdata(
        gUser.displayName!,
        gUser.email,
        gUser.photoUrl!,
        '2',
      );

      int id = response['data']['id'];
      String name = response['data']['name'];
      String email = response['data']['email'];
      String phone = response['data']['phone'] ?? '';
      String avatar = response['data']['avatar'] ?? gUser.photoUrl;
      int google = response['data']['google'];
      int facebook = response['data']['facebook'];

      if (response['status'] == "success") {
        services.sharedPreferences.setInt("signin", 2);
        services.sharedPreferences.setInt("id", id);
        services.sharedPreferences.setString("username", name);
        services.sharedPreferences.setString("email", email);
        services.sharedPreferences.setString("phone", phone);
        services.sharedPreferences.setString("img", avatar);
        services.sharedPreferences.setInt("google", google);
        services.sharedPreferences.setInt("facebook", facebook);

        Get.offAllNamed(AppRoute.home);
        successDialog();
      } else {
        // Handle account linking error
      }
    }

    Future<void> createNewAccount(
        GoogleSignInAccount gUser, AuthCredential credential) async {
      // UserCredential userCredential =
      //     await FirebaseAuth.instance.signInWithCredential(credential);
      var response = await googleLogin.postdata(
        gUser.displayName!,
        gUser.email,
        gUser.photoUrl!,
        '3',
      );
      int id = response['data']['id'];
      String name = gUser.displayName ?? 'user-$id';
      String email = gUser.email;
      String phone = response['data']['phone'] ?? '';
      String avatar = gUser.photoUrl ?? '';

      if (response['status'] == "success") {
        services.sharedPreferences.setInt("signin", 2);
        services.sharedPreferences.setInt("id", id);
        services.sharedPreferences.setString("username", name);
        services.sharedPreferences.setString("email", email);
        services.sharedPreferences.setString("phone", phone);
        services.sharedPreferences.setString("img", avatar);

        Get.offAllNamed(AppRoute.home);
        successDialog();
      } else {
        // Handle account linking error
      }
      successDialog();
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
      if (checkResponse['account'] == 'Exist') {
        await handleExistingAccount(gUser, credential);
      } else {
        await createNewAccount(gUser, credential);
      }
    } else {
      // Handle check response error
    }
  }

  @override
  fSignin() async {
    final LoginResult fUser = await FacebookAuth.instance.login(permissions: [
      'email',
      'public_profile',
    ]);
    if (fUser.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData(
        fields: "name,email,picture.width(200)",
      );
      final OAuthCredential credential = FacebookAuthProvider.credential(
        fUser.accessToken!.tokenString,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await _handleFacebookUser(userData);
    } else {
      if (kDebugMode) {
        print("Facebook login failed: ${fUser.status}");
      }
    }
  }

  Future<void> _handleFacebookUser(Map<String, dynamic> userData) async {
    services.sharedPreferences.setInt("signin", 3);
    services.sharedPreferences.setString("username", userData['name']);
    services.sharedPreferences.setString("email", userData['email']);
    services.sharedPreferences
        .setString("img", userData['picture']['data']['url']);

    statusRequest = StatusRequest.loading;
    update();

    // String phonenum = userData['phone'] ?? '';

    var response = await faceBookLogin.postdata(
      userData['name'],
      userData['email'],
      // phonenum,
      userData['picture']['data']['url'],
    );

    if (kDebugMode) {
      print("Controller response: $response ");
    }
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
        services.sharedPreferences
            .setString("email", response['data']['email']);
        services.sharedPreferences
            .setString("phone", response['data']['phone']);
        services.sharedPreferences.setString("img", response['data']['avatar']);
        // Save other data as needed
        if (kDebugMode) {
          print("Linked Successfully");
        }
      } else {
        Get.offAllNamed(AppRoute.home);
        if (kDebugMode) {
          print("Already linked. Email or Phone already exists.");
        }
      }
    }
    update();
  }

  @override
  goToSignUp() {
    Get.to(
      () => const SignUp(),
      transition: Transition.rightToLeft,
    );
  }

  showPassword() {
    isshowPassword = isshowPassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((token) {
      if (kDebugMode) {
        print(token);
      }
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.to(
      () => const ForgetPassword(),
      transition: Transition.rightToLeft,
    );
  }
}

Future<void> successDialog() async {
  Get.snackbar(
    "",
    "",
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.only(bottom: 70),
    maxWidth: 300,
    backgroundColor: Colors.green[900],
    borderRadius: 20,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(seconds: 3),
    titleText: const Center(
      child: Text(
        "Success",
        style: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w800,
          fontSize: 19,
          color: AppColor.white,
        ),
      ),
    ),
    messageText: const Center(
      child: Text(
        "You have been signed in",
        style: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: AppColor.white,
        ),
      ),
    ),
  );
}
