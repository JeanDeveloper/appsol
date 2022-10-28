import 'package:flutter/material.dart';
import 'package:solgis/projects/people/theme/theme.dart';


AppBar appBarNoSearching ( BuildContext context, String title, Function startSearchFunction){


  return AppBar(
    backgroundColor: Colors.blue,
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppThemePeople.lighThemePeople.primaryIconTheme.color),
      onPressed: ()=>Navigator.pop(context), 
    ),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search, size: AppThemePeople.lighThemePeople.primaryIconTheme.size, color: AppThemePeople.lighThemePeople.primaryIconTheme.color),
        onPressed: () =>startSearchFunction()
      ),
    ],            
  );


}

AppBar appBarBuscando(Function cancelSearch, Function() searching, Function(String) onchanged) {
    
  return AppBar(

    leading: IconButton(
      icon: const Icon(Icons.clear, color: Colors.white,),
      onPressed: () {
        cancelSearch();
      }
    ),

    title: SizedBox(
      width: 250,
      child: TextField(
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        cursorColor: Colors.white,
        autofocus: true,
        onChanged: onchanged,
        decoration: const InputDecoration(
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
        ),
      ),
    ),

    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: IconButton(
          onPressed: ()=>searching(),
          icon: const Icon(Icons.search, color: Colors.white,) ,
        ),
      )
    ],

  );
}