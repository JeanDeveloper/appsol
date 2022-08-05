import 'package:flutter/material.dart';
import 'package:solgis/home/data/data/data_apps.dart';
import 'package:solgis/home/domain/models/app_model.dart';
import 'package:solgis/home/presentation/pages/home/widgets/card_app.dart';
import 'package:solgis/home/presentation/widgets/drawer_widget.dart';
import 'package:solgis/theme/theme_general.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


      return Scaffold(

        backgroundColor: AppThemeGeneral.lighTheme.backgroundColor,
        drawer: const DrawerWidget(),

        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: const Text('APPSOL', style: TextStyle()),
          centerTitle: true,
        ),

        body: const HomePageBody(),

      );

  }

}


class HomePageBody extends StatelessWidget {

  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final List<AppModel> apps = getApps();

    return GridView.builder(
      
      padding: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.04),
      itemCount: apps.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

        crossAxisCount: 2,
        mainAxisSpacing:  size.height*0.05 ,
        crossAxisSpacing: size.width*0.05,
        mainAxisExtent: size.height*0.3

      ),

      itemBuilder: (context, index) {

        return CardApp(app: apps[index]);

      },

    );

  }

}