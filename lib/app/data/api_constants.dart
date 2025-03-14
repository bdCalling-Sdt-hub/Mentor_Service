class ApiConstants{
/// google maps

  static String googleBaseUrl="https://maps.googleapis.com/maps/api/place/autocomplete/json";
  static String estimatedTimeUrl="https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&";

    static String baseUrl="http://10.0.60.220:8081/api/v1";
    static String  imageBaseUrl="http://10.0.60.220:8081";
    static String socketUrl="http://10.0.60.220:8081";

  //static String baseUrl="http://dapperdriver.com:3030/api/v1";// live

 // static String  imageBaseUrl="http://dapperdriver.com:3030"; //LIVE

  static String googleApiKey="AIzaSyBFi80uuJIWkkLCpodFa8oXmD8XD_h8LMc";


///>>>>>>>>>>>>>>>>>>>>>>>>>>> Shopper End Point>>>>>>>>>>>>>>>>>>>

///>>>>>>>>>>>>>>>>>>>>>>>>>>> User Auth>>>>>>>>>>>>>>>>>>>

static String registerUrl= '$baseUrl/auth/register';
static String categoryUrl= '$baseUrl/users/category';
static String emailSendUrl= '$baseUrl/auth/forgot-password';
static String resendOtpUrl= '$baseUrl/auth/resend-otp';
static String verifyEmailWithOtpUrl= '$baseUrl/auth/verify-email';
static String logInUrl= '$baseUrl/auth/login';
static String resetPasswordUrl= '$baseUrl/auth/reset-password';
static String allUpcomingScheduleUrl= '$baseUrl/schedule/all-upcoming-schedules';
static String todayScheduleUrl= '$baseUrl/schedule/mentor-today-schedules';



static String  getProfileUrl (dynamic postId)=> '$baseUrl/users/$postId';
static String  updateProfileUrl (dynamic postId)=> '$baseUrl/users/$postId';
static String  sendFriendRequestUrl (dynamic postId)=> '$baseUrl/friend/request?receiverId=$postId';
static String  searchNameUrl (String name)=> '$baseUrl/users?fullName=$name';


}