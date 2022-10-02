import 'package:flutter/material.dart';
import 'package:listmovie/core/constant/image_path_constant.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_model.dart';
import 'package:listmovie/routes/route_path.dart';
import 'package:listmovie/routes/route_provider.dart';

class CustomCard extends StatefulWidget {
  CustomCard({Key? key, this.imagePath, this.description, this.result})
      : super(key: key);
  final String? imagePath;
  final String? description;
  List<Results>? result;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.detailPage,
            arguments: DetailData(resultData: widget.result));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: SizedBox(
                height: height * .20,
                //width: width * .30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "$imageConstant${widget.imagePath}",
                    // height: 200,
                    // width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Text(
                  "${widget.description}",
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
