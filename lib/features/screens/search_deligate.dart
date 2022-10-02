import 'package:flutter/material.dart';
import 'package:listmovie/core/constant/app_color.dart';
import 'package:listmovie/core/constant/app_icon.dart';
import 'package:listmovie/core/constant/app_text_style.dart';
import 'package:listmovie/core/constant/res_string.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_model.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_repository.dart';
import 'package:listmovie/features/screens/detail_page.dart';
import 'package:listmovie/utils/pref_utils.dart';

import '../../common/widgets/custom_card.dart';

class MovieSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: AppIcons.close,
        onPressed: () {
          if (query.isEmpty) {
            // close(context, );
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AppIcons.backButton,
      onPressed: () => close(context, query),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<MovieModel>(
      future: MovieRepository.fetchSearchMovieList(query: query),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasError) {
              return Container(
                color: AppColors.bgColor,
                alignment: Alignment.center,
                child: Text(
                  ResString.notFound,
                  style: const TextStyle(
                    fontSize: 28,
                    color: AppColors.textColor,
                  ),
                ),
              );
            } else {
              return GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (BuildContext context, index) {
                  return CustomCard(
                      result: [snapshot.data!.results![index]],
                      imagePath: "${snapshot.data!.results![index].posterPath}",
                      description: snapshot.data!.results![index].title);
                },
              );
            }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> resentSearchData = [];
    return Container(
      child: FutureBuilder<MovieModel>(
        future: MovieRepository.fetchSearchMovieList(query: query),
        builder: (context, snapshot) {
          if (query.isEmpty) {
            return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ResString.resentSearch,
                          style: AppTextStyle.title.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: PrefUtils.getStringList("resentData")!=null?
                        ListView.builder(
                            itemCount:
                                PrefUtils.getStringList("resentData").length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  query = PrefUtils.getStringList(
                                      "resentData")[index];
                                },
                                leading: AppIcons.time,
                                trailing: AppIcons.close,
                                title: Text(PrefUtils.getStringList(
                                    "resentData")[index]),
                              );
                            }):const Text(""),
                      ),
                    ],
                  );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError || snapshot.data!.results!.isEmpty) {
                return buildNoSuggestions();
              } else {
                resentSearchData.add(query);
                PrefUtils.setStringList("resentData", resentSearchData);
                return ListView.builder(
                  itemCount: snapshot.data!.results!.length,
                  itemBuilder: (context, index) {
                    // resentSearchData.add(query);
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      results: [snapshot.data!.results![index]],
                                    )));
                      },
                      leading: Text("${snapshot.data!.results![index].title}"),
                    );
                  },
                );
              }
          }
        },
      ),
    );
  }

  Widget buildNoSuggestions() => const Center(
        child: Text(
          'No suggestions!',
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
      );
}
