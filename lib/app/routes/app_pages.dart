import 'package:get/get.dart';
import 'package:mentors_service/app/modules/send_connection/bindings/send_message_binding.dart';
import 'package:mentors_service/app/modules/send_connection/views/send_connection_view.dart';

import '../modules/add_goal/bindings/add_goal_binding.dart';
import '../modules/add_goal/views/add_goal_view.dart';
import '../modules/add_schedule/bindings/add_schedule_binding.dart';
import '../modules/add_schedule/views/add_schedule_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/event_list/bindings/event_list_binding.dart';
import '../modules/event_list/views/event_list_view.dart';
import '../modules/filter/bindings/filter_binding.dart';
import '../modules/filter/views/filter_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mentor_mentee_details/bindings/mentor_mentee_details_binding.dart';
import '../modules/mentor_mentee_details/views/mentor_mentee_details_view.dart';
import '../modules/mentor_or_mentees/bindings/mentor_or_mentees_binding.dart';
import '../modules/mentor_or_mentees/views/mentor_or_mentees_view.dart';
import '../modules/mentorship_request/bindings/mentorship_request_binding.dart';
import '../modules/mentorship_request/views/mentorship_request_view.dart';
import '../modules/message/bindings/message_binding.dart';
import '../modules/message/views/message_view.dart';
import '../modules/message_inbox/bindings/message_inbox_binding.dart';
import '../modules/message_inbox/views/message_inbox_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/edit_profile_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/schedule_details/bindings/schedule_details_binding.dart';
import '../modules/schedule_details/views/schedule_details_view.dart';
import '../modules/schedule_list/bindings/schedule_list_binding.dart';
import '../modules/schedule_list/views/schedule_list_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/find_mentor_mentee_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/account_info_view.dart';
import '../modules/sign_up/views/basic_info_view.dart';
import '../modules/sign_up/views/role_and_profile_view.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/support/bindings/support_binding.dart';
import '../modules/support/views/support_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.BASIC_INFO,
      page: () => const BasicInfoView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.ROLE_AND_PROFILE,
      page: () => const RoleAndProfileView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_INFO,
      page: () => const AccountInfoView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.MENTOR_OR_MENTEES,
      page: () => const MentorOrMenteesView(),
      binding: MentorOrMenteesBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const FindMentorMenteeView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.MENTOR_MENTEE_DETAILS,
      page: () => const MentorMenteeDetailsView(),
      binding: MentorMenteeDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_GOAL,
      page: () => const AddGoalView(),
      binding: AddGoalBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SCHEDULE,
      page: () => const AddScheduleView(),
      binding: AddScheduleBinding(),
    ),
    GetPage(
      name: _Paths.SEND_MESSAGE,
      page: () => const SendConnectionView(),
      binding: SendConnectionBinding(),
    ),
    GetPage(
      name: _Paths.FILTER,
      page: () => const FilterView(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_LIST,
      page: () => ScheduleListView(),
      binding: ScheduleListBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_DETAILS,
      page: () => const ScheduleDetailsView(),
      binding: ScheduleDetailsBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_LIST,
      page: () => const EventListView(),
      binding: EventListBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MENTORSHIP_REQUEST,
      page: () => const MentorshipRequestView(),
      binding: MentorshipRequestBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => const SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () => const MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE_INBOX,
      page: () => const MessageInboxView(),
      binding: MessageInboxBinding(),
    ),
  ];
}
