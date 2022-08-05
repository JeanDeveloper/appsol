import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/people/domain/providers/crear_personal_provider.dart';
import 'package:solgis/people/presentation/pages/personal/widgets/widgets.dart';
import 'package:solgis/theme/style_people.dart';
import 'package:solgis/theme/theme_people.dart';


class CrearPersonalPage extends StatelessWidget {
  
  const CrearPersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: ((context)=> CrearPersonalProvider()))
      ],

      child: SafeArea(

        child: Scaffold(

          appBar: AppBar(

            elevation: 0,
            titleSpacing: 20,
            backgroundColor: AppThemePeople.lighThemePeople.appBarTheme.backgroundColor,
            centerTitle: true,

            title: AutoSizeText('CREAR PERSONAL', style:styleCrearPersonalTitulo()),

            leading:  IconButton(
              
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: ()=> Navigator.pop(context),
              
            ),

          ),

          body: const CrearPersonalBody(),

        ),
      
      ),
    
    );
  
  }

}