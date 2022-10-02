import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmovie/common/base_page/base_page.dart';
import 'package:listmovie/common/text_field/custom_text_field.dart';
import 'package:listmovie/common/widgets/grid_view_label_card.dart';
import 'package:listmovie/common/widgets/premium_offer_card.dart';
import 'package:listmovie/core/constant/app_text_style.dart';
import 'package:listmovie/core/constant/res_string.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_repository.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Logic/popular_movie_bloc.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Logic/popular_movie_event.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Logic/popular_movie_state.dart';

class DashboardFragment extends StatefulWidget {
  const DashboardFragment({Key? key}) : super(key: key);

  @override
  State<DashboardFragment> createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  TextEditingController searchMovie = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) =>
          PopularMovieBloc(RepositoryProvider.of<MovieRepository>(context))
            ..add(GetPopularMovieEvent()),
      child: BasePage(
        showBackButton: false,
        showAppBar: true,
        elevation: 0.2,
        title: Text(
          ResString.search,
          style: AppTextStyle.head,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Column(
            children: [
              CustomTextField(
                controller: searchMovie,
                hintText: ResString.searchMovie,
              ),
              const Expanded(flex: 2,
                  child: PremiumOfferCard()),
              Expanded(
                flex: 3,
                child: SizedBox(
                    height: height * .5,
                    child: BlocBuilder<PopularMovieBloc, PopularMovieState>(
                      builder: (context, state) {
                        if (state is PopularMovieLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is PopularMovieLoadedState) {
                          return GridViewLabelCard(
                              movieModel: state.popularMovie);
                        }
                        return Text(ResString.errorMessage);
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
