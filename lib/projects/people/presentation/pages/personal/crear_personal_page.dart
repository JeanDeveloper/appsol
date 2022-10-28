import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/providers/crear_personal_provider.dart';
import 'package:solgis/projects/people/presentation/pages/personal/widgets/widgets.dart';
import 'package:solgis/projects/people/styles/style.dart';

class CrearPersonalPage extends StatelessWidget {
  
  const CrearPersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


  // final documento = ModalRoute.of(context)?.settings.arguments as String;

  return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context)=> CrearPersonalProvider()))
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            titleSpacing: 20,
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: AutoSizeText('Crear Personal', style:styleCrearPersonalTitulo()),
          ),
          body: CrearPersonalBody(),
        ),
      ),
    );
  
  }

}