import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/data/services/permisos_service.dart';
import 'package:solgis/core/domain/models/permisos_model.dart';
import 'package:solgis/core/domain/models/project_model.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';
import 'package:solgis/core/presentation/pages/home/widgets/card_app.dart';
import 'package:solgis/core/presentation/widgets/drawer_widget.dart';
import 'package:solgis/core/theme/theme.dart';

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

    // final personAuth      = Provider.of<PersonAuthProvider>(context);
    // final serviceProvider = Provider.of<GlobalProvider>(context);

    final size = MediaQuery.of(context).size;

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.04),
      itemCount: ProjectModel.listProjects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing:  size.height*0.05 ,
        crossAxisSpacing: size.width*0.05,
        mainAxisExtent: size.height*0.3
      ),
      itemBuilder: (context, index) {
        return CardApp(
          project: ProjectModel.listProjects[index]
        );
      },
    );

  }

}