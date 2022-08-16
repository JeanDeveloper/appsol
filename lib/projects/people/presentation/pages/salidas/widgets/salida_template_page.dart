import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';

class SalidaTemplatePage extends StatelessWidget {

  String titleIngreso;
  Color colorAppBar;
  Widget body ;
  ConsultaModel consulta;
  Function()? registrarFunction;


  SalidaTemplatePage({
    super.key, 
    required this.titleIngreso,
    required this.colorAppBar,
    required this.body,
    required this.registrarFunction,
    required this.consulta,
  });

  @override
  Widget build(BuildContext context) {

    final viewBotton  = MediaQuery.of(context).viewInsets.bottom;
    
    return SafeArea(

      child: Scaffold(
        
        appBar: AppBar(

          leading: IconButton(

            onPressed: ()=>Navigator.of(context).pop(), 
            icon: const Icon(Icons.arrow_back_ios, size: 30)
          
          ),

          centerTitle: true,
          backgroundColor: colorAppBar,

          title: Text(
            titleIngreso, 
            style: const  TextStyle(
              fontSize: 25, 
              fontWeight: FontWeight.bold
            )
          ) //dinamico,

        ),

        body: _SalidaTemplateBody(
          bodyIngreso: body,
          funtionAccept: (registrarFunction==null)? null : registrarFunction , 
          consulta: consulta,viewBotton: viewBotton
        ), //dinamico
      ),

    );

  }

}


class _SalidaTemplateBody extends StatelessWidget {

  final Widget bodyIngreso;
  final Function()? funtionAccept;
  final ConsultaModel consulta;
  final double viewBotton;

  const _SalidaTemplateBody({

    // ignore: unused_element
    super.key, 
    required this.bodyIngreso, 
    required this.funtionAccept, 
    required this.consulta, 
    required this.viewBotton
    
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
  
    return SafeArea(

      child: SizedBox.expand(

        child: Stack(

          children: [
            
            SingleChildScrollView(

              child: Column(

                children: [

                  //WIDGET DE CAMPOS CONSTANTES.
                  ConstantesWidget(consulta: consulta),

                  //WIDGET DE CAMPOS DINAMICOS
                  bodyIngreso,
            
                ],

              ),
              
            ),

            //MENU INFERIOR
            Visibility(
              visible: (viewBotton==0) ? true :false,
              child: Positioned(
            
                bottom: 0,
            
                child: FondoMenuPeople(
            
                  padding: EdgeInsets.symmetric(vertical: size.height*0.01),
                  
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [

                      // if(consulta.tipoConsulta == 'INGRESO AUTORIZADO')
                      ButtonMenuPeople(
                        icon: Icons.accessibility_outlined, 
                        text: 'REGISTRAR',
                        onpressed: funtionAccept,
                      ),
                      
                      // if(consulta.tipoConsulta == 'INGRESO AUTORIZADO')
                      SizedBox(width: size.width*0.09),
                        
                      ButtonMenuPeople(
                        icon: Icons.exit_to_app_outlined, 
                        text: 'SALIR',
                        onpressed: ()=> Navigator.pushNamed(context, 'registrar_movimiento_people'),
                      ),
            
                    ],
            
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