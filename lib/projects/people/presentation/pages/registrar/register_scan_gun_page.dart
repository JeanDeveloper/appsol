import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/domain/helpers/consultar_doi_people.dart';
import 'package:solgis/projects/people/domain/helpers/get_responsive_text.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';
import 'package:solgis/projects/people/theme/theme.dart';

class RegisterScanGunPage extends StatefulWidget {

  const RegisterScanGunPage({Key? key}) : super(key: key);

  @override
  State<RegisterScanGunPage> createState() => _RegisterScanGunPageState();

}

class _RegisterScanGunPageState extends State<RegisterScanGunPage> {


  late FocusNode myFocusNode;
  late TextEditingController myController ;


  @override
  void initState() {
    
    myFocusNode = FocusNode();
    myController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {  
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    myController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final viewBotton  = MediaQuery.of(context).viewInsets.bottom;
    final loginProvider = Provider.of<GlobalProvider>(context);


    return Scaffold(

      body: SizedBox(
      
        width: size.width,
        height: size.height,
      
        child: Stack(
      
          children:  [
      
            //FONDO 9387010
            const HomePageBackGroundPeople(),
      
            Column(

              children: [

                const Expanded( flex: 2, child: SizedBox()),

                Expanded(flex: 1,child: AutoSizeText('Escanee el fotocontrol', style: AppThemePeople.lighThemePeople.textTheme.headline2)), 

                Expanded(
                  flex: 8,

                  // child: Text('76216238'),

                  child: TextField(

                    // keyboardType: TextInputType,
                    focusNode: myFocusNode,

                    controller: myController,
                    autofocus: true,
                    enableSuggestions: false,

                    onSubmitted: (value) {

                      if(value== '') return showSnackBarAwesome(context, 'Atencion', 'Escanee el fotocontrol correctamente', ContentType.failure);
                      consultarDOI(context, value, loginProvider.codServicio, loginProvider.codCliente);
                      myController.text = '';
                      myFocusNode.requestFocus();

                    },

                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveText(size, size.width*0.08)
                    ),

                    decoration: InputDecoration(
      
                      counterText: '',
                      // contentPadding: EdgeInsets.symmetric(vertical: size.height*0.015),
                      hintText: 'Escanee',
      
                      hintStyle: TextStyle(
                        fontSize: getResponsiveText(size, size.width*0.06),
                        color: Colors.white 
                      ),
      
                      errorStyle: TextStyle(
                        fontSize: getResponsiveText(size, size.width*0.06)
                      ),
      
                      errorBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
      
                      focusedErrorBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
      
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
      
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
      
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),

                  ),

                ),

              ],

            ),

            //MENU BOTTOM
            Visibility(
              visible: (viewBotton==0) ? true: false,
              child: Positioned(
                bottom: 0,
                child: FondoMenuPeople(
                padding: EdgeInsets.symmetric(vertical: size.height*0.035 ),
                  child: ButtonMenuPeople(
                    icon: FontAwesomeIcons.house,
                    text: 'Inicio', 
                    onpressed:()=> Navigator.pop(context),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}