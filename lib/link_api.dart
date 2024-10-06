class AppLink {
  static const String server = "https://app.alrehila.elmoparmg.com/";
  static const String img = "https://dashboard.alrehila.elmoparmg.com/";
  static const String data = "$server/getdata";
  static const String functions = "$server/appfunctions";
  static const String users = "$server/users";
  static const String userdata = "$users/data";
  static const String userfavorite = "$users/favorite";
  // static const String freelancers = "$server/freelancers";

//  =======================  AUTH  =======================  //

  // USERS  AUTH   //
  static const String signUp = "$users/auth/signup.php";
  static const String login = "$users/auth/login.php";
  static const String googlelogin = "$users/auth/google.php";
  static const String facebooklogin = "$users/auth/facebook.php";
  static const String verifycode = "$users/auth/verifycode.php";
  static const String resend = "$users/auth/resend.php";

  // USERS  FORGET PASSWORD  //
  static const String checkEmail = "$users/forgetpassword/checkemail.php";
  static const String resetPassword = "$users/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$users/forgetpassword/verifycode.php";

//  =======================  GET DATA  =======================  //
  static const String freelancers = "$data/freelancers.php";

  // user data
  static const String getUserData = "$userdata/getuserdata.php";
  static const String username = "$userdata/updatename.php";
  static const String usermail = "$userdata/updatemail.php";
  static const String userphone = "$userdata/updatephone.php";
  static const String userimg = "$userdata/updateimg.php";

  // user favorite
  static const String favorite = "$userfavorite/favorite.php";
  static const String addBeachFavorite =
      "$userfavorite/beaches/addfavorite.php";
  static const String removeBeachFavorite =
      "$userfavorite/beaches/removefavorite.php";
  static const String addEventFavorite = "$userfavorite/events/addfavorite.php";
  static const String removeEventFavorite =
      "$userfavorite/events/removefavorite.php";
  static const String addHotelFavorite = "$userfavorite/hotels/addfavorite.php";
  static const String removeHotelFavorite =
      "$userfavorite/hotels/removefavorite.php";
  static const String addPlaceFavorite = "$userfavorite/places/addfavorite.php";
  static const String removePlaceFavorite =
      "$userfavorite/places/removefavorite.php";
  static const String addRestaurantFavorite =
      "$userfavorite/restaurants/addfavorite.php";
  static const String removeRestaurantFavorite =
      "$userfavorite/restaurants/removefavorite.php";

  // countries
  static const String countries = "$data/countries.php";
  static const String country = "$data/country.php";
  static const String governorate = "$data/governorate.php";
  static const String about = "$data/about.php";
  static const String events = "$data/events.php";
  static const String store = "$data/store.php";

//  FUNCTIONS //
  static const String sendMail = "$functions/sendMail.php";
}
