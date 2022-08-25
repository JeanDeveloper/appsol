import 'package:flutter/material.dart';


class InitializedTestWidget extends StatefulWidget{
  const InitializedTestWidget({Key? key}) : super(key: key);
  @override
  State<InitializedTestWidget> createState() => _InitializedTestWidgetState();
}

class _InitializedTestWidgetState extends State<InitializedTestWidget> with WidgetsBindingObserver {
  
  @override
  Widget build(BuildContext context) { 


    return Container(

    );
  }
}