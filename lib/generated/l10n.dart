// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Didn’t have any account?`
  String get didntHaveAnyAccount {
    return Intl.message(
      'Didn’t have any account?',
      name: 'didntHaveAnyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please select your preferred language`
  String get selectLanguage {
    return Intl.message(
      'Please select your preferred language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Client`
  String get client {
    return Intl.message(
      'Client',
      name: 'client',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get company {
    return Intl.message(
      'Company',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up here`
  String get sign_up_here {
    return Intl.message(
      'Sign Up here',
      name: 'sign_up_here',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get try_again {
    return Intl.message(
      'Try again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `This account doesn't exit! `
  String get this_account_exit {
    return Intl.message(
      'This account doesn\'t exit! ',
      name: 'this_account_exit',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password! please try again`
  String get wrong_password {
    return Intl.message(
      'Wrong password! please try again',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get company_name {
    return Intl.message(
      'Company Name',
      name: 'company_name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `If you have an account?`
  String get if_you_have_account {
    return Intl.message(
      'If you have an account?',
      name: 'if_you_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign In here`
  String get sign_in_here {
    return Intl.message(
      'Sign In here',
      name: 'sign_in_here',
      desc: '',
      args: [],
    );
  }

  /// `Company License ID`
  String get company_license_id {
    return Intl.message(
      'Company License ID',
      name: 'company_license_id',
      desc: '',
      args: [],
    );
  }

  /// `Service Category`
  String get service_category {
    return Intl.message(
      'Service Category',
      name: 'service_category',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Find What\nYou Need !`
  String get let_find_what_you_need {
    return Intl.message(
      'Let’s Find What\nYou Need !',
      name: 'let_find_what_you_need',
      desc: '',
      args: [],
    );
  }

  /// `Search your service ..`
  String get search_your_service {
    return Intl.message(
      'Search your service ..',
      name: 'search_your_service',
      desc: '',
      args: [],
    );
  }

  /// `Our Best Services`
  String get our_best_services {
    return Intl.message(
      'Our Best Services',
      name: 'our_best_services',
      desc: '',
      args: [],
    );
  }

  /// `View All >>`
  String get viewAll {
    return Intl.message(
      'View All >>',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get bodyTitle2 {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'bodyTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Bokhour and Perfumes`
  String get bodyTitle1 {
    return Intl.message(
      'Bokhour and Perfumes',
      name: 'bodyTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Hey`
  String get hey {
    return Intl.message(
      'Hey',
      name: 'hey',
      desc: '',
      args: [],
    );
  }

  /// `Your favorites`
  String get yourFavorites {
    return Intl.message(
      'Your favorites',
      name: 'yourFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Apartment repair`
  String get apartmentRepair {
    return Intl.message(
      'Apartment repair',
      name: 'apartmentRepair',
      desc: '',
      args: [],
    );
  }

  /// `Certified`
  String get certified {
    return Intl.message(
      'Certified',
      name: 'certified',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `From minor repairs to major installations, we tackle each project with precision and care, ensuring that your plumbing systems are in optimal condition.`
  String get company_description {
    return Intl.message(
      'From minor repairs to major installations, we tackle each project with precision and care, ensuring that your plumbing systems are in optimal condition.',
      name: 'company_description',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message(
      'Book Now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  /// `Confirm date and time`
  String get confirm_date_and_time {
    return Intl.message(
      'Confirm date and time',
      name: 'confirm_date_and_time',
      desc: '',
      args: [],
    );
  }

  /// `Please add your location first to confirm the appointment`
  String get please_add_your_location {
    return Intl.message(
      'Please add your location first to confirm the appointment',
      name: 'please_add_your_location',
      desc: '',
      args: [],
    );
  }

  /// `Add your location`
  String get add_your_location {
    return Intl.message(
      'Add your location',
      name: 'add_your_location',
      desc: '',
      args: [],
    );
  }

  /// `Your Appointment has been confirmed successfully`
  String get yourAppointmentHasBeenConfirmedSuccessfully {
    return Intl.message(
      'Your Appointment has been confirmed successfully',
      name: 'yourAppointmentHasBeenConfirmedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `My appointments`
  String get myAppointments {
    return Intl.message(
      'My appointments',
      name: 'myAppointments',
      desc: '',
      args: [],
    );
  }

  /// `Today’s Appointments`
  String get todayAppointments {
    return Intl.message(
      'Today’s Appointments',
      name: 'todayAppointments',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any appointments yet ..`
  String get you_don_have_any_appointments_yet {
    return Intl.message(
      'You don\'t have any appointments yet ..',
      name: 'you_don_have_any_appointments_yet',
      desc: '',
      args: [],
    );
  }

  /// `Get an appointment`
  String get getAnAppointment {
    return Intl.message(
      'Get an appointment',
      name: 'getAnAppointment',
      desc: '',
      args: [],
    );
  }

  /// `You don’t have any messages yet ..`
  String get youDonHaveAnyMessagesYet {
    return Intl.message(
      'You don’t have any messages yet ..',
      name: 'youDonHaveAnyMessagesYet',
      desc: '',
      args: [],
    );
  }

  /// `Search your message ..`
  String get searchYourMessage {
    return Intl.message(
      'Search your message ..',
      name: 'searchYourMessage',
      desc: '',
      args: [],
    );
  }

  /// `This screen is still loading ..\nThank you for your patience`
  String get thisScreenIsStillLoading {
    return Intl.message(
      'This screen is still loading ..\nThank you for your patience',
      name: 'thisScreenIsStillLoading',
      desc: '',
      args: [],
    );
  }

  /// `Opps !`
  String get opps {
    return Intl.message(
      'Opps !',
      name: 'opps',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong with your\nconnection, Please try again ..`
  String get somethingWrongWithYourConnection {
    return Intl.message(
      'Something wrong with your\nconnection, Please try again ..',
      name: 'somethingWrongWithYourConnection',
      desc: '',
      args: [],
    );
  }

  /// `Restore the internet`
  String get restoreTheInternet {
    return Intl.message(
      'Restore the internet',
      name: 'restoreTheInternet',
      desc: '',
      args: [],
    );
  }

  /// `We can't seem to find the page\nthat you are looking for ..`
  String get weCantSeemToFindThePage {
    return Intl.message(
      'We can\'t seem to find the page\nthat you are looking for ..',
      name: 'weCantSeemToFindThePage',
      desc: '',
      args: [],
    );
  }

  /// `Back to home`
  String get backToHome {
    return Intl.message(
      'Back to home',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `No Results !`
  String get noResults {
    return Intl.message(
      'No Results !',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, there are no results for this\nsearch. Please try another name ..`
  String get sorryThereAreNoResultsForThisSearch {
    return Intl.message(
      'Sorry, there are no results for this\nsearch. Please try another name ..',
      name: 'sorryThereAreNoResultsForThisSearch',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, there is no notifications ..`
  String get sorryThereIsNoNotifications {
    return Intl.message(
      'Sorry, there is no notifications ..',
      name: 'sorryThereIsNoNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Check the settings`
  String get checkTheSettings {
    return Intl.message(
      'Check the settings',
      name: 'checkTheSettings',
      desc: '',
      args: [],
    );
  }

  /// `Internet is restored !`
  String get internetIsRestored {
    return Intl.message(
      'Internet is restored !',
      name: 'internetIsRestored',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection !`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection !',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Get to know more about our services`
  String get getToKnowMoreAboutOurServices {
    return Intl.message(
      'Get to know more about our services',
      name: 'getToKnowMoreAboutOurServices',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `WebSite`
  String get website {
    return Intl.message(
      'WebSite',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `LinkedIn`
  String get linkedin {
    return Intl.message(
      'LinkedIn',
      name: 'linkedin',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get twitter {
    return Intl.message(
      'Twitter',
      name: 'twitter',
      desc: '',
      args: [],
    );
  }

  /// `Any questions or remarks ? Just write us a message`
  String get anyQuestionsOrRemarksJustWriteUsMessage {
    return Intl.message(
      'Any questions or remarks ? Just write us a message',
      name: 'anyQuestionsOrRemarksJustWriteUsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send Message`
  String get sendMessage {
    return Intl.message(
      'Send Message',
      name: 'sendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `1. Types data we collect`
  String get typesDataWeCollect {
    return Intl.message(
      '1. Types data we collect',
      name: 'typesDataWeCollect',
      desc: '',
      args: [],
    );
  }

  /// `2. Use of your personal data`
  String get useOfYourPersonalData {
    return Intl.message(
      '2. Use of your personal data',
      name: 'useOfYourPersonalData',
      desc: '',
      args: [],
    );
  }

  /// `3. Disclosure of your personal data`
  String get disclosureOfYourPersonalData {
    return Intl.message(
      '3. Disclosure of your personal data',
      name: 'disclosureOfYourPersonalData',
      desc: '',
      args: [],
    );
  }

  /// `General Settings`
  String get generalSettings {
    return Intl.message(
      'General Settings',
      name: 'generalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Personalize your experience`
  String get personalizeYourExperience {
    return Intl.message(
      'Personalize your experience',
      name: 'personalizeYourExperience',
      desc: '',
      args: [],
    );
  }

  /// `Promotions`
  String get promotions {
    return Intl.message(
      'Promotions',
      name: 'promotions',
      desc: '',
      args: [],
    );
  }

  /// `App Updates`
  String get appUpdates {
    return Intl.message(
      'App Updates',
      name: 'appUpdates',
      desc: '',
      args: [],
    );
  }

  /// `General Notification`
  String get generalNotification {
    return Intl.message(
      'General Notification',
      name: 'generalNotification',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Working days and Hours`
  String get workingDaysAndHours {
    return Intl.message(
      'Working days and Hours',
      name: 'workingDaysAndHours',
      desc: '',
      args: [],
    );
  }

  /// `Form`
  String get from {
    return Intl.message(
      'Form',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `This week`
  String get thisWeek {
    return Intl.message(
      'This week',
      name: 'thisWeek',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Write your message ..`
  String get writeYourMessage {
    return Intl.message(
      'Write your message ..',
      name: 'writeYourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to cancel the appointment ?`
  String get doYouWantToCancelTheAppointment {
    return Intl.message(
      'Do you want to cancel the appointment ?',
      name: 'doYouWantToCancelTheAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `The appointment have been\ncancelled successfully`
  String get theAppointmentHaveBeenCancelledSuccessfully {
    return Intl.message(
      'The appointment have been\ncancelled successfully',
      name: 'theAppointmentHaveBeenCancelledSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email address`
  String get verifyYourEmailAddress {
    return Intl.message(
      'Verify your email address',
      name: 'verifyYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Resend Verification Email`
  String get resendVerificationEmail {
    return Intl.message(
      'Resend Verification Email',
      name: 'resendVerificationEmail',
      desc: '',
      args: [],
    );
  }

  /// `Check Verification Email`
  String get checkVerificationEmail {
    return Intl.message(
      'Check Verification Email',
      name: 'checkVerificationEmail',
      desc: '',
      args: [],
    );
  }

  /// `A verification link has been sent to your email address. Please check your inbox and click on the link to verify your email.`
  String get aVerificationLinkHasBeenSentToYourEmailAddress {
    return Intl.message(
      'A verification link has been sent to your email address. Please check your inbox and click on the link to verify your email.',
      name: 'aVerificationLinkHasBeenSentToYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// ` Sign Up`
  String get signUp {
    return Intl.message(
      ' Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation`
  String get passwordConfirmation {
    return Intl.message(
      'Password Confirmation',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Your password will be your key to secure access in the future`
  String get yourPasswordWillBeYourKeyToSecureAccessIn {
    return Intl.message(
      'Your password will be your key to secure access in the future',
      name: 'yourPasswordWillBeYourKeyToSecureAccessIn',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get sendEmail {
    return Intl.message(
      'Send Email',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `abdullah@gmail.com`
  String get emailHint {
    return Intl.message(
      'abdullah@gmail.com',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `123456qwe!Q`
  String get passwordHint {
    return Intl.message(
      '123456qwe!Q',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid`
  String get emailIsNotValid {
    return Intl.message(
      'Email is not valid',
      name: 'emailIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Required Field`
  String get requiredField {
    return Intl.message(
      'Required Field',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `must be at least {minLength}`
  String mustBeAtLeastMinlength(Object minLength) {
    return Intl.message(
      'must be at least $minLength',
      name: 'mustBeAtLeastMinlength',
      desc: '',
      args: [minLength],
    );
  }

  /// `Mobile is not valid`
  String get mobileIsNotValid {
    return Intl.message(
      'Mobile is not valid',
      name: 'mobileIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Signed Up Successfully`
  String get signedUpSuccessfully {
    return Intl.message(
      'Signed Up Successfully',
      name: 'signedUpSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Signed In Successfully`
  String get signedInSuccessfully {
    return Intl.message(
      'Signed In Successfully',
      name: 'signedInSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `You don’t have any messages yet ..`
  String get youDontHaveAnyMessagesYet {
    return Intl.message(
      'You don’t have any messages yet ..',
      name: 'youDontHaveAnyMessagesYet',
      desc: '',
      args: [],
    );
  }

  /// `This screen is still loading ..\n`
  String get thisScreenIsStillLoadingN {
    return Intl.message(
      'This screen is still loading ..\n',
      name: 'thisScreenIsStillLoadingN',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get thankYou {
    return Intl.message(
      'Thank you',
      name: 'thankYou',
      desc: '',
      args: [],
    );
  }

  /// ` for your patience`
  String get forYourPatience {
    return Intl.message(
      ' for your patience',
      name: 'forYourPatience',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otpVerification {
    return Intl.message(
      'OTP Verification',
      name: 'otpVerification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP code sent to {number}`
  String enterTheOtpCodeSentToNumber(Object number) {
    return Intl.message(
      'Enter the OTP code sent to $number',
      name: 'enterTheOtpCodeSentToNumber',
      desc: '',
      args: [number],
    );
  }

  /// `Verified Successfully`
  String get verifiedSuccessfully {
    return Intl.message(
      'Verified Successfully',
      name: 'verifiedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Verification code has been sent to your email`
  String get verificationCodeHasBeenSentToYourEmail {
    return Intl.message(
      'Verification code has been sent to your email',
      name: 'verificationCodeHasBeenSentToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Find What You Need !`
  String get homeMessage {
    return Intl.message(
      'Let’s Find What You Need !',
      name: 'homeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Search your service ..`
  String get searchServiceHint {
    return Intl.message(
      'Search your service ..',
      name: 'searchServiceHint',
      desc: '',
      args: [],
    );
  }

  /// `Cars Service`
  String get category1Name {
    return Intl.message(
      'Cars Service',
      name: 'category1Name',
      desc: '',
      args: [],
    );
  }

  /// `Outdoors Service`
  String get category2Name {
    return Intl.message(
      'Outdoors Service',
      name: 'category2Name',
      desc: '',
      args: [],
    );
  }

  /// `The Mall Service`
  String get category3Name {
    return Intl.message(
      'The Mall Service',
      name: 'category3Name',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get category1Description {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'category1Description',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get category2Description {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'category2Description',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get category3Description {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'category3Description',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get category4Description {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'category4Description',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get category5Description {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'category5Description',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get category6Description {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'category6Description',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get category7Description {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'category7Description',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get category8Description {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'category8Description',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get category9Description {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'category9Description',
      desc: '',
      args: [],
    );
  }

  /// `Get your problem fixed with our fast service`
  String get category10Description {
    return Intl.message(
      'Get your problem fixed with our fast service',
      name: 'category10Description',
      desc: '',
      args: [],
    );
  }

  /// `Our Best Services`
  String get ourBestServices {
    return Intl.message(
      'Our Best Services',
      name: 'ourBestServices',
      desc: '',
      args: [],
    );
  }

  /// `Salons Service`
  String get category4Name {
    return Intl.message(
      'Salons Service',
      name: 'category4Name',
      desc: '',
      args: [],
    );
  }

  /// `Food and Beverages`
  String get category5Name {
    return Intl.message(
      'Food and Beverages',
      name: 'category5Name',
      desc: '',
      args: [],
    );
  }

  /// `Video Games`
  String get category6Name {
    return Intl.message(
      'Video Games',
      name: 'category6Name',
      desc: '',
      args: [],
    );
  }

  /// `Pets Service`
  String get category7Name {
    return Intl.message(
      'Pets Service',
      name: 'category7Name',
      desc: '',
      args: [],
    );
  }

  /// `Clinics Service`
  String get category8Name {
    return Intl.message(
      'Clinics Service',
      name: 'category8Name',
      desc: '',
      args: [],
    );
  }

  /// `Legal Service`
  String get category9Name {
    return Intl.message(
      'Legal Service',
      name: 'category9Name',
      desc: '',
      args: [],
    );
  }

  /// `Bokhour and Perfumes`
  String get category10Name {
    return Intl.message(
      'Bokhour and Perfumes',
      name: 'category10Name',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Any questions or remarks ?  Just write us a message`
  String get anyQuestionsOrRemarksJustWriteUsAMessage {
    return Intl.message(
      'Any questions or remarks ?  Just write us a message',
      name: 'anyQuestionsOrRemarksJustWriteUsAMessage',
      desc: '',
      args: [],
    );
  }

  /// `Abdullah Otaibi`
  String get nameHint {
    return Intl.message(
      'Abdullah Otaibi',
      name: 'nameHint',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Select time`
  String get selectTime {
    return Intl.message(
      'Select time',
      name: 'selectTime',
      desc: '',
      args: [],
    );
  }

  /// `Your Appointments`
  String get clientAppointmentsMessage {
    return Intl.message(
      'Your Appointments',
      name: 'clientAppointmentsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to cancel the appointment?`
  String get cancelAppointmentConfirmation {
    return Intl.message(
      'Do you want to cancel the appointment?',
      name: 'cancelAppointmentConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait`
  String get pleaseWait {
    return Intl.message(
      'Please Wait',
      name: 'pleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Your Favorites`
  String get favoritesMessage {
    return Intl.message(
      'Your Favorites',
      name: 'favoritesMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
