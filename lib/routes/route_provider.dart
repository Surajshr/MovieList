import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_model.dart';
import 'package:listmovie/features/screens/dashboard_fragment/presentation/dashboard_fragment.dart';
import 'package:listmovie/features/screens/detail_page.dart';
import 'package:listmovie/routes/route_path.dart';

class RouteProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RoutePaths.dashboardFragment:
        return MaterialPageRoute(builder: (_) => const DashboardFragment());
      case RoutePaths.detailPage:
        final typedArgs = args as DetailData;
        return MaterialPageRoute(
            builder: (_) => DetailPage(results: typedArgs.resultData,));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Text("Under Construction..!!!");
    });
  }
}

class DetailData{

  final List<Results>? resultData;

  DetailData({this.resultData});

}