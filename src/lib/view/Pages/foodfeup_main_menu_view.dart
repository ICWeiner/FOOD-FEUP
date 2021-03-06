import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/bug_report_form.dart';
import 'package:uni/view/Widgets/foodfeup_main_menu.dart';


class FoodFeupMainMenuPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FoodFeupMainMenuPageViewState();
}

class FoodFeupMainMenuPageViewState extends SecondaryPageViewState {

  @override
  Widget getBody(BuildContext context) {
    return  Container(
        margin:  EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child:  FoodFeupMainMenu()
    );
  }
}