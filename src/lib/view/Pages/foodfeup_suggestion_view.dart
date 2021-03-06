import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uni/model/foodfeup_review_page_model.dart';
import 'package:uni/view/Pages/foodfeup_rating_view.dart';

import 'package:uni/model/foodfeup_suggestion_model.dart';


class FoodFeupSuggestion extends StatefulWidget{
  final String mealType;
  final double mealRating;
  final String mealRatingQuant;
  final String mealName;
  final String establishment;
  final String dropdownValue;

  const FoodFeupSuggestion({Key key,
    this.mealType ,
    this.mealRating ,
    this.mealRatingQuant ,
    this.mealName ,
    this.establishment,
    @required this.dropdownValue
  }) : super(key: key);

  @override
  FoodFeupSuggestionState createState() => FoodFeupSuggestionState(
    mealType: mealType,
    mealRating: mealRating,
    mealRatingQuant: mealRatingQuant,
    mealName: mealName,
    establishment: establishment,
    dropdownValue: dropdownValue
  );
}

class FoodFeupSuggestionState extends State<FoodFeupSuggestion> {
  FoodFeupSuggestionState({
    Key key,
    //this.options,
    this.mealType = "Vegetariano",
    this.mealRating = 4,
    this.mealRatingQuant = "23",
    this.mealName = "Jardineira de soja (batata,ervilhas e cenoura)",
    this.establishment = "Cantina almoço",
    @required this.dropdownValue
    });

  final List<String> options = ["Indiferente","Carne","Peixe","Vegetariano","Dieta","Sopa"];
  String dropdownValue;
  String mealType;
  double mealRating;
  String mealRatingQuant;
  String mealName;
  String establishment;

  @override
  Widget build(BuildContext context){
    return (SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15)),
          Text(establishment,
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30)),
          Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15)),
          Text(mealType,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30,
              color:Theme.of(context).accentColor ),),
          Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3)),
          Row( children: [
            RatingBar.builder(
              initialRating: roundRating(),
              glow: false,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 40,
              ignoreGestures: true,
              allowHalfRating: true,
              itemBuilder: (context, _) =>
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
            ),
            Text("(" + mealRatingQuant + ")",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,
                color:Theme.of(context).accentColor ))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15)),
          Divider(thickness: 3,indent: 20,endIndent: 20,color: Theme.of(context).accentColor),
          Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15)),
          Text(mealName,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,
              color:Colors.black , ), textAlign: TextAlign.center,overflow: TextOverflow.fade),
          Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 40)),
          createReviewButton(Theme.of(context).accentColor)]
        ,)
      ));
    }

  Widget createReviewButton(Color color){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: SizedBox(
          height: 55,
          width: 55,
          child: ElevatedButton(
            child: Center(
              child: Icon(Icons.star,color: Colors.white,size: 35,),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(55),
              ),
              primary: color,
            ),
            onPressed:  () => transitionToRatingPage(context),
          )
      ),
    );
  }

  double roundRating(){
    if(mealRating==null) this.mealRating = 0;
    double remainder = mealRating.remainder(1);


    if(remainder < 0.25){
      return mealRating.floorToDouble();
    }
    if(remainder < 0.75){
      return mealRating.floorToDouble()+0.5;
    }

    return mealRating.ceilToDouble();
  }

  bool transitionToRatingPage(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoodFeupReviewPage(resturant: establishment, meal: mealName)));
    return true;
  }

  bool transitionToSuggestion(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoodFeupSuggestionPage(dropdownValue: dropdownValue)));

    return true;
  }
}