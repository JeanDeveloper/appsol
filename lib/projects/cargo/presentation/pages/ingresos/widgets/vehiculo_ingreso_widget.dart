import 'package:flutter/material.dart';
import 'package:solgis/core/domain/helpers/get_image.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';

class VehiculoIngresoWidget extends StatelessWidget {
  const VehiculoIngresoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(

      padding: EdgeInsets.symmetric(horizontal: size.width*0.1, vertical: size.height*0.02),

      child: Column(

        children: [
          //FOTO
          FutureBuilder(

            future: getImage('https://c0.klipartz.com/pngpicture/252/313/gratis-png-vista-frontal-del-carro-acura.png'),

            builder: ( _ , AsyncSnapshot<Widget>  snapshot) {

              if(!snapshot.hasData){
                return SizedBox(
                  height: size.height* 0.24,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(
                      image: AssetImage('assets/gifs/loader.gif'),
                    ),
                  ),
                );
              }

              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: size.width*0.5,
                  height: size.width*0.5,
                  child: snapshot.data,
                ),
              );

            },

          ),
          SizedBox(height: size.height*0.03),

          //PLACA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [

              Text('PLACA', style: TextStyle(color: Colors.blue)),
              InputReadOnlyWidget(initialValue: 'ABC123'),

            ],
          ),
          SizedBox(height: size.height*0.03),

          //TIPO DE VEHICULO  
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('T. VEHICULO', style: TextStyle(color: Colors.blue)),
              InputReadOnlyWidget(initialValue: 'CAMIONETA'),
            ],
          ),
          SizedBox(height: size.height*0.03),

          //MARCA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('MARCA', style: TextStyle(color: Colors.blue)),
              InputReadOnlyWidget(initialValue: 'SUZUKI'),
            ],
          ),
          SizedBox(height: size.height*0.03),

          //TIPO DE CARGA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text('T. CARGA', style: TextStyle(color: Colors.blue)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.024),
                width: size.width*0.57,
                height: size.height*0.04,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:Border.all(
                    color: Colors.black,
                  )
                ),

                child: DropdownButton(
                  
                  items: const [

                    DropdownMenuItem(
                      value: 'liviano',
                      child: Text('LIVIANO'), 
                    ),

                    DropdownMenuItem(
                      value: 'Pesado',
                      child: Text('PESADO'), 
                    ),

                    DropdownMenuItem(
                      value: 'Harina',
                      child: Text('HARINA'), 
                    ),

                    DropdownMenuItem(
                      value: 'Aceite',
                      child: Text('ACEITE'), 
                    ),

                    DropdownMenuItem(
                      value: 'Contenedor',
                      child: Text('CONTENEDOR'), 
                    ),

                  ],

                  onChanged: (value)=>print(value),

                  style: const TextStyle(color: Colors.black, fontSize:13),

                  isExpanded: true,

                ),

              )

            ],
          ),
          SizedBox(height: size.height*0.03),

        ],

      ),
    );
  }
}