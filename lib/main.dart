import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_repository.dart';
import 'package:listmovie/features/screens/dashboard_fragment/presentation/dashboard_fragment.dart';
import 'package:listmovie/routes/route_provider.dart';
import 'package:listmovie/utils/pref_utils.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtils.initPreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context)=> MovieRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home:  DashboardFragment(),
          onGenerateRoute:  RouteProvider.generateRoute
      ),
    );
  }
}
