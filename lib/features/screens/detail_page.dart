import 'package:flutter/material.dart';
import 'package:listmovie/common/base_page/base_page.dart';
import 'package:listmovie/core/constant/app_text_style.dart';
import 'package:listmovie/core/constant/image_path_constant.dart';
import 'package:listmovie/core/constant/res_string.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_model.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, this.results}) : super(key: key);
  List<Results>? results;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "$imageConstant${widget.results![0].posterPath}",
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Text(
                  "${widget.results![0].title}",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.title,
                ),
                 Text(
                  ResString.overview,
                  style: AppTextStyle.head,
                ),
                Text("${widget.results![0].overview}",),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${ResString.release} :${widget.results![0].releaseDate}",style: AppTextStyle.date,),
                )
              ],
            )

            // Text("${widget.results![0].title}")
            ),
      ),
    );
  }
}
