import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/get_image.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/data/services/area_service.dart';
import 'package:solgis/projects/people/data/services/autorizante_service.dart';
import 'package:solgis/projects/people/data/services/motivo_service.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/models/area_model.dart';
import 'package:solgis/projects/people/domain/models/autorizante_model.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/models/motivo_model.dart';
import 'package:solgis/projects/people/domain/providers/ingreso_autorizado_provider.dart';
import 'package:solgis/projects/people/domain/utils/dropdown_decorations.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';
import 'package:solgis/projects/people/styles/style.dart';

class IngresoAutorizadoWidget extends StatelessWidget {

  final ConsultaModel consulta;
  const IngresoAutorizadoWidget({required this.consulta});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final ingresoProvider = Provider.of<IngresoAutorizadoProvider>(context, listen: false);
    final gProvider = Provider.of<GlobalProvider>(context);
    final motivoService = MotivoService();
    final autorizanteService = AutorizanteService();
    final areaService = AreaService();
    final documentacion = [
      '28463', //CREC 10
      '22702', //OPORSA
      '00005', //HAYDUK
      '14517', //CENTINELA
      '00013'  //EXALMAR
    ];

    return Container(

      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: size.width*0.072),

      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: ingresoProvider.formKey,
        child: SingleChildScrollView(
          child: Column(

            children: [

              //CAMPO AUTORIZANTE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Autorizante:', style: styleCrearPersonaltextForm()),

                  //VEMOS SI ES UN CLIENTE QUE TIENE MASTER
                  ( documentacion.contains(gProvider.codCliente) &&  consulta.codigoAutorizante != 0 && consulta.codigoAutorizante != -1 )

                    //MOSTRAMOS EL AUTORIZANTE QUE VIENE POR DEFECTO
                    ? DropdownButtonWidget(
                      items: [
                        DropdownMenuItem(
                          value: consulta.codigoAutorizante, 
                          child: Text(consulta.autorizante!.toLowerCase())
                        )
                      ],
                      onchanged: (value) => (consulta.codigoAutorizante== -1) ? null : ingresoProvider.codautorizante=value!,
                      value: consulta.codigoAutorizante,
                    )
                    //REALIZAMOS LA PETICION DE AUTORIZANTES 
                    : FutureBuilder(
                      future: autorizanteService.getAutorizantes(gProvider.codServicio, consulta.codigoTipoPersona.toString()),
                      builder: (BuildContext context,AsyncSnapshot<List<AutorizanteDbModel>> snapshot) {
                        //SI AUN NO HAY DATA
                        if(!snapshot.hasData){
                          return ShimmerWidget(
                            width: size.width*0.57, 
                            height: size.height*0.04
                          );
                        } 
                        //SI NO LLEGA NADA DE NADA, NISIQUIERA VACIO
                        if(snapshot.data!.isEmpty) return Container();
                        final autorizantes = snapshot.data;

                        //SI LLEGA SOLAMENTE UN AUTORIZANTE
                        if( autorizantes!.length == 1){
                          ingresoProvider.codautorizante = int.parse(autorizantes[0].codPersonal!);
                          return  DropdownButtonWidget(
                            items: [DropdownMenuItem(value: int.parse(autorizantes[0].codPersonal!), child: Text(autorizantes[0].nombrePersonal!.toLowerCase()))],
                            onchanged: (value) => ingresoProvider.codautorizante=value!,
                            value:int.parse(autorizantes[0].codPersonal!),
                          );
                        }

                        //SI LLEGAN VARIOS AUTORIZANTES
                        List<DropdownMenuItem<int>> dropdownautorizantes = [];
                        for(final autorizante in autorizantes){
                          final DropdownMenuItem<int> autorizanteTemp = DropdownMenuItem(
                            value: int.parse(autorizante.codPersonal!) , 
                            child: Text(autorizante.nombrePersonal!.toLowerCase())
                          );
                          dropdownautorizantes.add(autorizanteTemp);
                        } 
                        return DropdownButtonWidget(

                          items:dropdownautorizantes, 
                          onchanged: (value) => ingresoProvider.codautorizante = value!,
                          hintText: (autorizantes.isEmpty)?'No hay autorizantes'  :'Seleccione el autorizante',
                        );

                      },
                    ),
                ],
              ),
              SizedBox(height: size.height*0.02),

              //CAMPO MOTIVO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Motivo:  ', style: styleCrearPersonaltextForm()),

                  //VEMOS SI ES UN CLIENTE QUE TIENE MASTER
                  ( documentacion.contains(gProvider.codCliente) && consulta.codigoMotivo != -1  && consulta.codigoMotivo != 0)
                    //MOSTRAMOS EL MOTIVO QUE VIENE POR DEFECTO.
                    ? DropdownButtonWidget(
                      items: [DropdownMenuItem(value: consulta.codigoMotivo, child: Text(consulta.motivo!.toLowerCase()))],
                      onchanged: (value) => (consulta.codigoMotivo == -1) ? null : ingresoProvider.codmotivo=value!,
                      value: consulta.codigoMotivo,
                    )

                    //CONSUMIMOS LA PETICION.
                    : FutureBuilder(
                      future: motivoService.getMotivos(gProvider.codServicio, gProvider.codCliente),
                      builder: (BuildContext context,AsyncSnapshot<List<MotivoDbModel>> snapshot) {
                        
                        //SE MUESTRA MIENTRAS QUE LLEGA LA DATA
                        if(!snapshot.hasData){
                          return ShimmerWidget(
                            width: size.width*0.57, 
                            height: size.height*0.04
                          );
                        } 

                        if(snapshot.data!.isEmpty) return Container();
                        final motivos = snapshot.data;

                        // MOSTRAMOS SI SOLO HAY UN MOTIVO
                        if(motivos!.length == 1) {
                          ingresoProvider.codautorizante = int.parse(motivos[0].codigo!);
                          return DropdownButtonWidget(
                            items: [DropdownMenuItem(value: int.parse(motivos[0].codigo!) , child: Text(motivos[0].tipo!.toLowerCase()))],
                            onchanged: (value) => ingresoProvider.codautorizante = value!,
                            value: int.parse(motivos[0].codigo!),
                          );
                        }

                        //MOSTRAMOS LOS MOTIVOS .
                        List<DropdownMenuItem<int>>dropdownmotivos = [];
                        for(final motivo in motivos){
                          if(motivo.tipo != null){
                            final DropdownMenuItem<int> motivoTemp = DropdownMenuItem(
                              value: int.parse(motivo.codigo!), 
                              child: Text(motivo.tipo!.toLowerCase())
                            );
                            dropdownmotivos.add(motivoTemp);
                          }
                        }

                        ingresoProvider.codmotivo = dropdownmotivos.first.value!;
                        return DropdownButtonWidget(
                          items:dropdownmotivos, 
                          onchanged: (value) => ingresoProvider.codmotivo = value!,
                          hintText: (motivos.isEmpty)?'No hay motivos'  :'Seleccione el motivo',
                          value: dropdownmotivos.first.value!,
                        );

                      },
                    ),

                ],
              ),
              SizedBox(height: size.height*0.02), 

              //CAMPO ACCESO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Acceso:  ', style:styleCrearPersonaltextForm()),
                  
                  //VEMOS SI ES UN CLIENTE QUE TIENE MASTER
                  ( documentacion.contains(gProvider.codCliente) && consulta.codigoAutorizante !=0 && consulta.codigoAutorizante !=-1 )

                    //MOSTRAMOS EL CAMPO QUE VIENE POR DEFECTO
                    ? DropdownButtonWidget(
                      items: [DropdownMenuItem(value: consulta.codigoArea, child: Text(consulta.area!.toLowerCase()))],
                      onchanged: (value) => (consulta.codigoArea== 0) ? null : ingresoProvider.codarea=value!,
                      value: consulta.codigoArea,
                    )

                    : FutureBuilder(
                      future: areaService.getAreas(gProvider.codServicio, gProvider.codCliente),
                      builder: (BuildContext context,AsyncSnapshot<List<AreaDbModel>> snapshot) {

                        //SE MUESTRA MIENTRA CARGA
                        if(!snapshot.hasData){
                          return ShimmerWidget(
                            width: size.width*0.57, 
                            height: size.height*0.04
                          );
                        } 
                        // if(snapshot.data!.isEmpty) return Text('NO EXISTEN AREA DE ACCESO DISPONIBLES');
                        final areas = snapshot.data;

                        //MUESTRA SI SOLO HAY UN AREA
                        if(areas!.length == 1) {
                          ingresoProvider.codarea = int.parse(areas[0].codigo!);
                          return DropdownButtonWidget(
                            items: [DropdownMenuItem(value: int.parse(areas[0].codigo!) , child: Text(areas[0].area!.toLowerCase()))],
                            onchanged: (value) => ingresoProvider.codautorizante = value!,
                            value: int.parse(areas[0].codigo!),
                          );
                        }

                        //MUESTRA LA LISTA DE AREAS
                        List<DropdownMenuItem<int>> dropdownareas = [];
                        for(final area in areas){

                          if(area.area != null){
                            final DropdownMenuItem<int> areaTemp = DropdownMenuItem(
                              value: int.parse(area.codigo!), 
                              child: Text(area.area!.toLowerCase())
                            );
                          dropdownareas.add(areaTemp);
                          }

                        }
                        ingresoProvider.codarea = dropdownareas.first.value!;
                        return DropdownButtonWidget(
                          items:dropdownareas, 
                          onchanged: (value) =>ingresoProvider.codarea = value!,
                          hintText: (areas.isEmpty)?'No hay areas de acceso'  :'Seleccione el area',
                          value: dropdownareas.first.value!,
                        );

                      },
                    ),
                ],
              ),
              SizedBox(height: size.height*0.02), 

              //CAMPO GUIA
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Guia:  ', style: styleCrearPersonaltextForm()),

                  Row(

                    children: [

                      SizedBox(
                        width: size.width*0.43, 
                        // width: size.width*0.57,
                        height: size.height*0.04,
                        child: TextFormField(
                          cursorHeight: 20,
                          onChanged: (value)=>ingresoProvider.guia = value,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          decoration:inputDecorationDatos(),
                        )
                      ),

                      //CAMARA
                      CameraButton(campo: 'guia')

                    ],
                  )

                ]
              ),
              SizedBox(height: size.height*0.02), 

              //CAMPO MATERIAL DE VALOR
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text('Material:  ', style: styleCrearPersonaltextForm(), maxLines: 2),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      SizedBox(
                        width: size.width*0.43, 
                        height: size.height*0.04,

                        child: TextFormField( 
                          cursorHeight: 20,
                          onChanged: (value) =>ingresoProvider.material_valor = value,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          decoration:inputDecorationDatos(),
                        )
                      ),

                      const CameraButton(campo: 'material'),

                    ],
                  )

                ]
              ),

            ],
          ),
        ),
      ),

    );

  }

}

class CameraButton extends StatelessWidget {
  final String campo;
  const CameraButton({
    required this.campo,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final ingresoProvider = Provider.of<IngresoAutorizadoProvider>(context);
    return IconButton(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.camera_alt_outlined, 
        color:(
          (campo == 'guia' ? ingresoProvider.guia : ingresoProvider.material_valor) == '')
          ? Colors.grey 
          : ( campo == 'guia' ? ingresoProvider.fotoGuia : ingresoProvider.fotoMaterialValor ) == null
            ? Colors.black
            : Colors.green
      ),

      onPressed:((campo == 'guia' ? ingresoProvider.guia : ingresoProvider.material_valor) == '')
        ? null

        :((campo == 'guia') ? ingresoProvider.fotoGuia : ingresoProvider.fotoMaterialValor) != null

        ? () async{
          await NDialog(
            dialogStyle: DialogStyle(backgroundColor: const Color(0xFF999999)),
            title: Text(
              (campo=='guia')
                ? 'Foto de Guia'
                : 'Foto de Material',
              style:  const TextStyle( color: Colors.black), 
              maxLines: 1, 
              overflow: TextOverflow.ellipsis
            ),
            content: SizedBox(
              width: size.width*0.5,
              height: size.height*0.5,
              child:Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FutureBuilder(
                        future: getImage((campo == 'guia') ? ingresoProvider.fotoGuia!.path : ingresoProvider.fotoMaterialValor!.path),
                        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) { 
                          if(!snapshot.hasData){
                            return const Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/gifs/loader-gris.gif'),
                            );
                          }
                          return Container(
                            child: snapshot.data!,
                          );
                        }
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text('Eliminar', style: TextStyle(color: Colors.black),),
                    onPressed: (){
                      if(campo == 'guia'){
                        ingresoProvider.fotoGuia = null;
                      }else{
                        ingresoProvider.fotoMaterialValor = null;
                      }
                      Navigator.pop(context);
                    }, 
                  ),
                ],
              )
            )
          ).show(context);
        }

          : () async {
            //inicia camara
            final ImagePicker picker = ImagePicker();

              await NDialog(

                dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
                title:  const Text("Información",  style: TextStyle(color: Colors.black)),
                content:  const Text("Que accion desea hacer?", style: TextStyle(color: Colors.black)),
                
                actions: <Widget>[

                  TextButton(
                    child: const Text("Abrir Camara"),
                    onPressed: ()async{
                      final pickedFile = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 50,
                      );
                      if ( pickedFile == null ){
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        // ignore: use_build_context_synchronously
                        return showSnackBarAwesome(context, '¡Atencion!', 'No se ha capturado imagen', ContentType.failure);
                      }
                      (campo == 'guia' ? ingresoProvider.fotoGuia =pickedFile : ingresoProvider.fotoMaterialValor= pickedFile); 

                      // ignore: use_build_context_synchronously
                      showSnackBarAwesome(context, '¡Atencion!', 'La imagen ha sido guardada', ContentType.success);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
                  ),

                  TextButton(
                    child: const Text("Ir Galeria"),
                    onPressed: ()async{
                      final pickedFile = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 50,
                      );
                      if (pickedFile == null){
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        
                        // ignore: use_build_context_synchronously
                        return showSnackBarAwesome(context, '¡Atencion!', 'No se ha escogido imagen', ContentType.failure);
                      }
                      (campo == 'guia' ? ingresoProvider.fotoGuia =pickedFile : ingresoProvider.fotoMaterialValor= pickedFile); 
                      
                      // ignore: use_build_context_synchronously
                      showSnackBarAwesome(context, '¡Atencion!', 'La imagen ha sido selecionada', ContentType.success);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
                  ),

                ],

              ).show(context);

          },

    );
  
  }
}
