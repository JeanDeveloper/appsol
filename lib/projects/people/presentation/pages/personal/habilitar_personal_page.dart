import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/models/persona_model.dart';
import 'package:solgis/projects/people/domain/providers/habilitar_personal_provider.dart';
import 'package:solgis/projects/people/presentation/pages/personal/widgets/widgets.dart';
import 'package:solgis/projects/people/styles/style.dart';

class HabilitarPersonalPage extends StatelessWidget {
  
  const HabilitarPersonalPage(
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final PersonalModel personal = ModalRoute.of(context)?.settings.arguments as PersonalModel;

  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context)=> HabilitarPersonalProvider()))
    ],
    child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 20,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: AutoSizeText('Habilitar Personal', style:styleCrearPersonalTitulo()),
        ),
        body: HabilitarPersonalBody(personal: personal,),
      ),
    ),
  );

  }

}