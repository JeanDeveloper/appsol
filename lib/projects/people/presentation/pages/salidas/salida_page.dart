import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/core/domain/helpers/get_image.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/presentation/pages/salidas/widgets/widgets.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';
import 'package:solgis/projects/people/styles/style.dart';
import 'package:solgis/projects/people/theme/theme.dart';


class SalidaPage extends StatelessWidget {
  
  const SalidaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final consulta = ModalRoute.of(context)!.settings.arguments as ConsultaModel;
    
    return Scaffold(

      appBar: AppBar(

        leading: IconButton(

          onPressed: ()=>Navigator.of(context).pop(), 
          icon: const Icon(Icons.arrow_back_ios)

        ),

        centerTitle: true,
        backgroundColor: const Color(0xffF57E25),//dinamico
        title: const Text('SALIDA AUTORIZADA', style:TextStyle(fontSize: 25, fontWeight: FontWeight.bold)) //dinamico,
      
      ),

      body:  SalidaPageBody(consulta: consulta,),

    );

  }

}

class SalidaPageBody extends StatelessWidget {

  final ConsultaModel consulta;

  const SalidaPageBody({

    required this.consulta,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(

      width: double.infinity,
      height: double.infinity,

      child: Stack(

        children: [

          SalidaPageContent(consulta: consulta,),

          Positioned(

            bottom: 0,

            child: FondoMenuPeople(
              
              padding: EdgeInsets.symmetric(vertical: size.height*0.02),
              
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
            
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.registered, color: Colors.white,size: size.width*0.06),
                        onPressed: ()async{

                        await NDialog(
                          
                          dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.grey),
                          title: const Text("¡Alerta!",),
                          content: const Text("¿Estas seguro que deseas registrar el movimiento?", style: TextStyle(color: Colors.black)),  
                          
                          actions: <Widget>[

                            TextButton(

                              child: const Text("SI"),

                              onPressed: () async {

                                final movimientoProvider = Provider.of<MovimientosProvider>(context, listen: false);
                                CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
                                progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
                                progressDialog.show();

                                final idMovimiento = await movimientoProvider.registerMovimiento(context, consulta);

                                print(idMovimiento);

                                progressDialog.dismiss();

                                // ignore: use_build_context_synchronously
                                showSnackBarAwesome(context, 'EXITO', 'Se registro el movimiento para el personal ${consulta.docPersona} con exito', ContentType.success);

                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacementNamed(context, '/');

                              }

                            ),

                            TextButton(

                              child: const Text("NO"),
                              onPressed: () => Navigator.pop(context)

                            ),

                          ],

                        ).show(context);

                        }, 
                      ),
                      Text('REGISTRAR',  style: textStyleLetter())
                    ],
                  ),
                
                  SizedBox(width: size.width*0.09),
            
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.exit_to_app_outlined, color: Colors.white, size: size.width*0.06),
                        onPressed: (){
                          // Navigator.pushReplacementNamed(context, '');
                          Navigator.pop(context);
                        },
                      ),
                      Text('SALIR',  style: textStyleLetter() ),
                    ],
                  )

                ],

              ),

            ),

          ),

        ],

      ),
    
    );

  }


}

class SalidaPageContent extends StatelessWidget {

  final ConsultaModel consulta;

  const SalidaPageContent({
    required this.consulta,
  });

  @override
  Widget build(BuildContext context) {
    

    final size = MediaQuery.of(context).size;

    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),

      child: Column(

        children: [

          //CAMPO FOTO
          FutureBuilder(

            future: getImage(consulta.img),

            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {

              if(!snapshot.hasData){
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: size.width*0.33,
                    height: size.width*0.33,
                    child: const Image(
                      image: AssetImage('assets/gifs/loader.gif'),
                    ),
                  ),
                );
              }

              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: size.width*0.33,
                  height: size.width*0.33,
                  child: snapshot.data,
                
                ),
              );

            },

          ),

          SizedBox(height: size.height*0.02),

          //CAMPO DNI
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text((consulta.codigoTipoDocumento==1) ? 'DNI:' : (consulta.codigoTipoDocumento==2)? 'PASAPORTE:': 'C.E:' , style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.docPersona,)
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO NOMBRES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('NOMBRES:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.nombresPersona)
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO CARGO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('CARGO:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.cargo,)
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO EMPRESA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EMPRESA:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.empresa)
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO SERIE --> ESTE CAMPO SE OBSERVARÁ SI SE REGISTRÓ EN EL MOVIMIENTO DE ENTRADA

          //TODO: CONDICIONAL - SOLAMENTE

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SERIE:  ', style: styleCrearPersonaltextForm()),
              const InputReadOnlyWidget(initialValue: '')
            ]
          ),
          SizedBox(height: size.height*0.02), 


          SizedBox(height: size.height*0.03), 
      
          //FOTO DE INGRESO Y FOTO DE SALIDA.
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.07 ),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  children: [
                    Text('FOTO DE INGRESO', style: styleCrearPersonaltextForm()),

                    //FOTO DE INGRESO, CARGARÁ SI EXISTE.
                    SizedBox(height: size.height*0.01),

                    //IRA EL FUTURE

                    // FotoMaterialWidget(),

                    const ImageSalidaWidget(urlimage:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1XOvYx-KTCr6ebZCGZvDkkTeqF0_pdmj5PYO1cUYLHfFepVPPIXGtkFX9nXgupBZGzrU&usqp=CAU' ,onlyShow: true)

                  ],
                ),

                Column(
                  children: [
                    Text('FOTO DE SALIDA', style: styleCrearPersonaltextForm()),

                    //FOTO DE INGRESO, CARGARÁ SI EXISTE.
                    SizedBox(height: size.height*0.01),

                    //IRA EL FUTURE
                    // FotoMaterialWidget(),
                    const ImageSalidaWidget(urlimage:null , onlyShow: false)
                    
                  ],
                )
              ],
            ),
          )

        ],

      ),

    );

  }




}


