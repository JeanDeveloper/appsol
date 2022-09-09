import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
    final ingresoProvider = Provider.of<IngresoAutorizadoProvider>(context);
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
        key: ingresoProvider.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //CAMPO AUTORIZANTE
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text('AUTORIZANTES:', style: styleCrearPersonaltextForm()),

                  ( documentacion.contains(gProvider.codCliente) )
                    ? DropdownButtonWidget(
                      items: (consulta.codigoAutorizante == -1|| consulta.codigoAutorizante == 0)
                        ?[]
                        :[DropdownMenuItem(value: consulta.codigoAutorizante, child: Text(consulta.autorizante!))],
                      onchanged: (value) => (consulta.codigoAutorizante== -1) ? null : ingresoProvider.codautorizante=value!,
                      value: consulta.codigoAutorizante,
                    )
                    : FutureBuilder(
                      future: autorizanteService.getAutorizantes(gProvider.codServicio, consulta.codigoTipoPersona.toString()),
                      builder: (BuildContext context,AsyncSnapshot<List<AutorizanteDbModel>> snapshot) {
                        if(!snapshot.hasData){
                          return ShimmerWidget(
                            width: size.width*0.57, 
                            height: size.height*0.04
                          );
                        } 

                        if(snapshot.data!.isEmpty) return Container();

                        final autorizantes = snapshot.data;
                        List<DropdownMenuItem<int>> dropdownautorizantes = [];
                        for(final autorizante in autorizantes!){
                          final DropdownMenuItem<int> autorizanteTemp = DropdownMenuItem(
                            value: int.parse(autorizante.codigo!) , 
                            child: Text(autorizante.nombrePersonal!)
                          );
                          dropdownautorizantes.add(autorizanteTemp);
                        } 
                        return DropdownButtonWidget(
                          items:dropdownautorizantes, 
                          onchanged: (value) {
                            print(value);
                            ingresoProvider.codautorizante = value!;
                          },
                          hintText: (autorizantes.isEmpty)?'NO HAY AUTORIZANTES'  :'SELECCIONE EL AUTORIZANTE',
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
                  Text('MOTIVO:  ', style: styleCrearPersonaltextForm()),

                  ( documentacion.contains(gProvider.codCliente) )
                    
                    ? DropdownButtonWidget(
                      items: (consulta.codigoMotivo == -1)
                        ?[]
                        :[DropdownMenuItem(value: consulta.codigoMotivo, child: Text(consulta.motivo!))],
                      onchanged: (value) => (consulta.codigoMotivo == -1) ? null : ingresoProvider.codmotivo=value!,
                      value: consulta.codigoMotivo,
                    )

                    : FutureBuilder(
                      future: motivoService.getMotivos(gProvider.codServicio, gProvider.codCliente),
                      builder: (BuildContext context,AsyncSnapshot<List<MotivoDbModel>> snapshot) {
                        if(!snapshot.hasData){
                          return ShimmerWidget(
                            width: size.width*0.57, 
                            height: size.height*0.04
                          );
                        } 
                        if(snapshot.data!.isEmpty) return Container();

                        final motivos = snapshot.data;
                        List<DropdownMenuItem<int>> dropdownmotivos = [];
                        for(final motivo in motivos!){
                          final DropdownMenuItem<int> motivoTemp = DropdownMenuItem(
                            value: int.parse(motivo.codigo!), 
                            child: Text(motivo.tipo!)
                          );
                          dropdownmotivos.add(motivoTemp);
                        }
                        return DropdownButtonWidget(
                          items:dropdownmotivos, 
                          onchanged: (value) {
                            print(value);
                            ingresoProvider.codmotivo = value!;
                          },
                          hintText: (motivos.isEmpty)?'NO HAY MOTIVOS'  :'SELECCIONE EL MOTIVO' ,
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
                  Text('ACCESO:  ', style:styleCrearPersonaltextForm().copyWith(fontSize: 14)),

                  ( documentacion.contains(gProvider.codCliente) )

                    ? DropdownButtonWidget(
                      items: (consulta.codigoArea == 0)
                        ?[]
                        :[DropdownMenuItem(value: consulta.codigoArea, child: Text(consulta.area!))],
                      onchanged: (value) => (consulta.codigoArea== 0) ? null : ingresoProvider.codarea=value!,
                      value: consulta.codigoArea,
                    )
                    
                    : FutureBuilder(
                      future: areaService.getAreas(gProvider.codServicio, gProvider.codCliente),
                      builder: (BuildContext context,AsyncSnapshot<List<AreaDbModel>> snapshot) {
                        if(!snapshot.hasData){
                          return ShimmerWidget(
                            width: size.width*0.57, 
                            height: size.height*0.04
                          );
                        } 
                        // if(snapshot.data!.isEmpty) return Text('NO EXISTEN AREA DE ACCESO DISPONIBLES');
                        final areas = snapshot.data;
                        List<DropdownMenuItem<int>> dropdownareas = [];
                        for(final area in areas!){
                          final DropdownMenuItem<int> areaTemp = DropdownMenuItem(
                            value: int.parse(area.codigo!), 
                            child: Text(area.area!)
                          );
                          dropdownareas.add(areaTemp);
                        }
                        return DropdownButtonWidget(
                          items:dropdownareas, 
                          onchanged: (value) {
                            print(value);
                            ingresoProvider.codarea = value!;
                          },
                          hintText: (areas.isEmpty)?'NO HAY AREAS DE ACCESO'  :'SELECCIONE EL AREA',
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
                  Text('GUIA:  ', style: styleCrearPersonaltextForm()),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width*0.45,
                        height: size.height*0.04,
                        child: TextFormField(
                          cursorHeight: 20,
                          onChanged: (value)=>
                            ingresoProvider.guia = value,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          decoration:inputDecorationDatos() ,
                        )
                      ),
                      IconButton(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),

                        onPressed: ()async{

                          //inicia camara
                          final ImagePicker _picker = ImagePicker();
                          final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

                          if(photo == null) return showSnackBarAwesome(context, '¡Atencion!', 'No se ha capturado ninguna imagen', ContentType.failure);

                          print(photo);
                          showSnackBarAwesome(context, '¡Atencion!', 'La imagen ha sido guardada', ContentType.success);

                        }, 
                      )
                    ],
                  )
                ]
              ),

              SizedBox(height: size.height*0.02), 

              //CAMPO MATERIAL DE VALOR
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text('MATERIAL:  ', style: styleCrearPersonaltextForm(), maxLines: 2),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      SizedBox(

                        width: size.width*0.45,
                        height: size.height*0.04,

                        child: TextFormField(
                          cursorHeight: 20,
                          onChanged: (value) =>ingresoProvider.material_valor = value,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          decoration:inputDecorationDatos(),

                        )

                      ),
                      

                      IconButton(

                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.zero,                         
                        icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
                        onPressed: ()async{

                          //inicia camara
                          final ImagePicker _picker = ImagePicker();
                          final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

                          if(photo == null) {
                            // ignore: use_build_context_synchronously
                            showSnackBarAwesome(context, '¡Atencion!', 'No se ha capturado ninguna imagen', ContentType.failure);
                          }else{
                            print(photo);
                            // ignore: use_build_context_synchronously
                            showSnackBarAwesome(context, '¡Atencion!', 'La imagen ha sido guardada', ContentType.success);
                          }

                        }, 

                      )

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