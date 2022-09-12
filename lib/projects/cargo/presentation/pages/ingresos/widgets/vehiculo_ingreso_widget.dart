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
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: size.width*0.5,
                    height: size.height*0.5,
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
            children: const [
              Text('T. CARGA', style: TextStyle(color: Colors.blue)),
            ],
          ),
          SizedBox(height: size.height*0.03),







        ],

      ),
    );
  }
}