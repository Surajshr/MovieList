import 'package:flutter/material.dart';
import 'package:listmovie/core/constant/app_text_style.dart';
import 'package:listmovie/core/constant/res_string.dart';

class PremiumOfferCard extends StatefulWidget {
  const PremiumOfferCard({Key? key}) : super(key: key);

  @override
  State<PremiumOfferCard> createState() => _PremiumOfferCardState();
}

class _PremiumOfferCardState extends State<PremiumOfferCard> {
  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      height: height*.25,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage("assets/ad_background.jpg"), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
           Text(ResString.premium,style: AppTextStyle.head,),
           Text(ResString.premiumMessage,style:  AppTextStyle.body,),
          Padding(
            padding: const EdgeInsets.only(top: 20.0,right: 10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(onPressed: (){

              }, child: Text(ResString.learnMore)),
            ),
          )
        ],
      ),
    );
  }
}
