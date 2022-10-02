import 'package:flutter/material.dart';
import 'package:listmovie/common/widgets/custom_card.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_model.dart';

class GridViewLabelCard extends StatelessWidget {
   const GridViewLabelCard({
     this.movieModel,
     this.axisCount,
    Key? key,
  }) : super(key: key);

final MovieModel? movieModel;
  final int? axisCount;
  @override
  Widget build(BuildContext context) {
    // if (kDebugMode)
    //   print(movieModel!.results);
    // }
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: axisCount??2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0),
      itemCount: movieModel!.results!.length,
      itemBuilder: (BuildContext context, index) {
        return  CustomCard(
          result: [movieModel!.results![index]],
          imagePath: "${movieModel!.results![index].posterPath}",
          description:movieModel!.results![index].title
        );
      },
    );
  }
}