import 'package:alrehila/screens/Home/country.dart';
import 'package:alrehila/screens/settings/AboutUS/about.dart';
import 'package:alrehila/screens/Home/Events/classic_events.dart';
import 'package:alrehila/screens/Home/Events/premiem_events.dart';
import 'package:alrehila/screens/Home/home_skeleton.dart';
import 'package:alrehila/screens/Home/country/about.dart';
import 'package:alrehila/screens/settings/Support/contactus.dart';
import 'package:alrehila/screens/settings/polices/privacypolicy.dart';
import 'package:alrehila/screens/settings/polices/terms.dart';
import 'package:alrehila/screens/Home/search.dart';
import 'package:get/get.dart';
import '../../screens/settings/account/profile.dart';
import '../../screens/Home/freelancers/freelancers_profile.dart';
import '../../screens/settings/auth/password/forgetpassword.dart';
import '../../screens/settings/auth/password/resetpassword.dart';
import '../../screens/settings/auth/password/verifycode.dart';
import '../../screens/settings/auth/signin/signin.dart';
import '../../screens/settings/auth/signup/signsuccess.dart';
import '../../screens/settings/auth/signup/signup.dart';
import '../../screens/settings/auth/signup/verifycode.dart';
import '../../screens/Home/Events/events.dart';
import '../../screens/guide_list.dart';
import '../../screens/Home/country/store.dart';
import '../../screens/settings/Support/support.dart';
import '../../screens/settings/Support/tawkto.dart';
import '../../screens/driverbook.dart';
import '../../screens/Home/country/governorate.dart';
import '../../screens/settings/polices/termsofservice.dart';
import '../../screens/settings/appearance.dart';
import '../../screens/onboarding_screen/onboarding.dart';
import '../../screens/settings/change_password.dart';
import '../../screens/settings/settings.dart';
import '../middleware/about_us_middleware.dart';
import '../middleware/middleware.dart';
import 'app_route.dart';

List<GetPage<dynamic>>? routes = [
  // START UP //
  GetPage(
    name: "/",
    page: () => const OnBoarding(),
    middlewares: [MiddleWare()],
  ),

  // AUTH //
  GetPage(
    name: AppRoute.signin,
    page: () => const SignIn(),
  ),
  GetPage(
    name: AppRoute.signup,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRoute.forGetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoute.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoute.verifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(
    name: AppRoute.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPassword(),
  ),

  // ABOUT APP & US //
  GetPage(
    name: AppRoute.onboarding,
    page: () => const OnBoarding(),
  ),
  GetPage(
    name: AppRoute.aboutAPP,
    page: () => const OnBoarding(),
    middlewares: [AboutUSMiddleWare()],
  ),
  GetPage(
    name: AppRoute.terms,
    page: () => const Terms(),
  ),
  GetPage(
    name: AppRoute.polices,
    page: () => const PrivacyPolicy(),
  ),
  GetPage(
    name: AppRoute.tOFs,
    page: () => const TermsOfService(),
  ),
  GetPage(
    name: AppRoute.aboutUS,
    page: () => const AboutUS(),
  ),

  // SUPPORT WAYS //
  GetPage(
    name: AppRoute.support,
    page: () => const Support(),
  ),
  GetPage(
    name: AppRoute.tawkto,
    page: () => const TawkTO(),
  ),
  GetPage(
    name: AppRoute.contactUS,
    page: () => const ContactUS(),
  ),

  // HOME PAGES //
  GetPage(
    name: AppRoute.guideList,
    page: () => const Guidelist(),
  ),
  GetPage(
    name: AppRoute.freelancersProfile,
    page: () => const FreelancersProfile(),
  ),
  GetPage(
    name: AppRoute.profile,
    page: () => const Profile(),
  ),
  // GetPage(name: AppRoute.medical, page: () => const Medical(),),
  // GetPage(name: AppRoute.safari, page: () => const Safari(),),
  GetPage(
    name: AppRoute.driverBook,
    page: () => const DriverBook(),
  ),
  GetPage(
    name: AppRoute.changePassword,
    page: () => const Changepassword(),
  ),
  GetPage(
    name: AppRoute.settings,
    page: () => const Settings(),
  ),
  GetPage(
    name: AppRoute.appearance,
    page: () => const Appearance(),
  ),
  GetPage(
    name: AppRoute.home,
    page: () => const HomeSkeleton(),
  ),

  // COUNTRY //
  GetPage(
    name: AppRoute.country,
    page: () => Country(),
  ),
  GetPage(
    name: AppRoute.governorate,
    page: () => const Governorate(),
  ),
  GetPage(
    name: AppRoute.about,
    page: () => About(),
  ),
  GetPage(
    name: AppRoute.events,
    page: () => const Events(),
  ),
  GetPage(
    name: AppRoute.store,
    page: () => const Store(),
  ),

  //EVENTS//
  GetPage(
    name: AppRoute.classicEvents,
    page: () => const ClassicEvents(),
  ),
  GetPage(
    name: AppRoute.premiumEvents,
    page: () => const PremiumEvents(),
  ),

  //Search
  GetPage(
    name: AppRoute.search,
    page: () => const Search(),
  ),
];
