import 'package:events_app/constants/strings.dart';
import 'package:events_app/data/models/category_model.dart';
import 'package:events_app/data/models/ticket_model.dart';
import 'package:events_app/data/models/notification_model.dart';
import 'package:events_app/presentation/screens/home_screen.dart';
import 'package:events_app/presentation/screens/profile_screen.dart';
import 'package:events_app/presentation/widgets/onboard_page.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [
  const OnboardPage(
    imageUrl: 'assets/images/onboardf.png',
    title: 'مناسبات',
  ),
  const OnboardPage(
    imageUrl: 'assets/images/onboards.png',
    title: 'حفلات',
  ),
  const OnboardPage(
    imageUrl: 'assets/images/onboardt.png',
    title: 'مباريات',
  ),
];

final List<Widget> screens = [
  const HomeScreen(),
  const HomeScreen(),
  const HomeScreen(),
  const HomeScreen(),
  const ProfileScreen(),
];

final List<String> icons = [
  'home',
  'ticket',
  'search',
  'saved',
  'profile',
];

List<Category> categories = [
  Category(
    title: 'أعياد ميلاد',
    imageUrl: 'assets/images/pic_three.png',
  ),
  Category(
    title: 'حفلات',
    imageUrl: 'assets/images/pic_one.png',
  ),
  Category(
    title: 'رياضة',
    imageUrl: 'assets/images/pic_five.png',
  ),
  Category(
    title: 'فن',
    imageUrl: 'assets/images/pic_four.png',
  ),
  Category(
    title: 'رياضة',
    imageUrl: 'assets/images/pic_seven.png',
  ),
  Category(
    title: 'فن',
    imageUrl: 'assets/images/pic_two.png',
  ),
  Category(
    title: 'حفلات',
    imageUrl: 'assets/images/pic_six.png',
  ),
  Category(
    title: 'أعياد ميلاد',
    imageUrl: 'assets/images/pic_three.png',
  ),
];

List<NotificationModel> notifications = [
  const NotificationModel(
    id: 1,
    title: 'للمسح',
    body: Strings.onboardPageText,
    time: '10:30 مساءاً',
  ),
  const NotificationModel(
    id: 1,
    title: 'رسالة من لوحة التحكم',
    body: Strings.onboardPageText,
    time: '10:30 مساءاً',
  ),
  const NotificationModel(
    id: 1,
    title: 'رسالة من لوحة التحكم',
    body: Strings.onboardPageText,
    time: '10:30 مساءاً',
  ),
  const NotificationModel(
    id: 1,
    title: 'رسالة من لوحة التحكم',
    body: Strings.onboardPageText,
    time: '10:30 مساءاً',
  ),
  const NotificationModel(
    id: 1,
    title: 'رسالة من لوحة التحكم',
    body: Strings.onboardPageText,
    time: '10:30 مساءاً',
  ),
  const NotificationModel(
    id: 1,
    title: 'رسالة من لوحة التحكم',
    body: Strings.onboardPageText,
    time: '10:30 مساءاً',
  ),
];

List<Ticket> tickets = [
  Ticket(
    id: 1,
    name: 'حفلة تجمع الأطفال',
    imageUrl: 'assets/images/pic_two.png',
    formattedDate: '15\nمايو',
    formattedTime: '10:00 صباحاً',
    numericDate: '2019-02-02',
    price: 1500,
    location: 'المنصورة',
    remainingHours: '2 س',
    isSaved: true,
  ),
  Ticket(
    id: 1,
    name: 'حفلة تجمع الأطفال',
    imageUrl: 'assets/images/pic_two.png',
    formattedDate: '15\nمايو',
    formattedTime: '10:00 صباحاً',
    numericDate: '2019-02-02',
    price: 1500,
    location: 'المنصورة',
    remainingHours: '2 س',
    isReserved: true,
  ),
  Ticket(
    id: 1,
    name: 'حفلة تجمع الأطفال',
    imageUrl: 'assets/images/pic_two.png',
    formattedDate: '15\nمايو',
    formattedTime: '10:00 صباحاً',
    numericDate: '2019-02-02',
    price: 1500,
    location: 'المنصورة',
    remainingHours: '2 س',
    isSaved: true,
  ),
  Ticket(
    id: 1,
    name: 'حفلة تجمع الأطفال',
    imageUrl: 'assets/images/pic_two.png',
    formattedDate: '15\nمايو',
    formattedTime: '10:00 صباحاً',
    numericDate: '2019-02-02',
    price: 1500,
    location: 'المنصورة',
    remainingHours: '2 س',
    isSaved: true,
  ),
  Ticket(
    id: 1,
    name: 'حفلة تجمع الأطفال',
    imageUrl: 'assets/images/pic_two.png',
    formattedDate: '15\nمايو',
    formattedTime: '10:00 صباحاً',
    numericDate: '2019-02-02',
    price: 1500,
    location: 'المنصورة',
    remainingHours: '2 س',
    isReserved: true,
  ),
  Ticket(
    id: 1,
    name: 'حفلة تجمع الأطفال',
    imageUrl: 'assets/images/pic_two.png',
    formattedDate: '15\nمايو',
    formattedTime: '10:00 صباحاً',
    numericDate: '2019-02-02',
    price: 1500,
    location: 'المنصورة',
    remainingHours: '2 س',
    isSaved: true,
  ),
];
