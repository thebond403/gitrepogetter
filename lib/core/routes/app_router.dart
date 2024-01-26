import 'package:flutter/material.dart';
import 'package:gitstaredrepogetter/layers/presentation/home/details_page/details_page.dart';
import 'package:gitstaredrepogetter/layers/presentation/home/home_page/home_page.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    homePage: (context) => const HomePage(),
    repoDetailsPage: (context) => const DetailsPage(),
  };
  static const homePage = "/";
  static const repoDetailsPage = "/repoDetails";
}
