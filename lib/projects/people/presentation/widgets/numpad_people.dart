import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/domain/helpers/consultar_doi_people.dart';

import 'package:solgis/projects/people/domain/providers/numpad_provider.dart';

class NumPad extends StatelessWidget {

  final int length;
  // final Function onPressed;
  final bool isDni;

  NumPad({
    required this.length, 
    // required this.onPressed,
    this.isDni = true,
  });

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final numpadProvider= Provider.of<NumPadProvider>(context); 
    final loginProvider = Provider.of<GlobalProvider>(context, listen: false);

    return SizedBox(

      width: size.width,
      height: size.height*0.65,

      child: Column(

        children: <Widget>[

          Preview(text: (isDni)?numpadProvider.dni : numpadProvider.carnet , length: length),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              NumpadButton(
                text: '1',
                onPressed: (){

                  if(isDni){

                    if(numpadProvider.dni.length < 8) numpadProvider.setValueDni('1', length);
                    if(numpadProvider.dni.length == 8) consultarDOI(context, numpadProvider.dni, loginProvider.codServicio);

                  }else{

                    if(numpadProvider.carnet.length < 9 ) numpadProvider.setValueCarnet('1', length);
                    if(numpadProvider.carnet.length == 9) consultarDOI(context, numpadProvider.carnet, loginProvider.codServicio);

                  }   
                },
              ),

              // NumpadButton(
              //   text: '1',
              //   onPressed: ()=>(isDni)?numpadProvider.setValueDni('1', length):numpadProvider.setValueCarnet('1', length),
              // ),

              NumpadButton(
                text: '2',
                onPressed: (){

                  if(isDni){

                    if(numpadProvider.dni.length < 8) numpadProvider.setValueDni('2', length);
                    if(numpadProvider.dni.length == 8) consultarDOI(context, numpadProvider.dni, loginProvider.codServicio);

                  }else{

                    if(numpadProvider.carnet.length < 9 ) numpadProvider.setValueCarnet('2', length);
                    if(numpadProvider.carnet.length == 9) consultarDOI(context, numpadProvider.carnet, loginProvider.codServicio);

                  }   
                },
              ),

              // NumpadButton(
              //   text: '2',
              //   onPressed: ()=>(isDni)?numpadProvider.setValueDni('2', length):numpadProvider.setValueCarnet('2', length),
              // ),

              // NumpadButton(
              //   text: '3',
              //   onPressed: ()=>(isDni)?numpadProvider.setValueDni('3', length):numpadProvider.setValueCarnet('3', length),
              // ),

              NumpadButton(
                text: '3',
                onPressed: (){

                  if(isDni){

                    if(numpadProvider.dni.length < 8) numpadProvider.setValueDni('3', length);
                    if(numpadProvider.dni.length == 8) consultarDOI(context, numpadProvider.dni, loginProvider.codServicio);

                  }else{

                    if(numpadProvider.carnet.length < 9 ) numpadProvider.setValueCarnet('3', length);
                    if(numpadProvider.carnet.length == 9) consultarDOI(context, numpadProvider.carnet, loginProvider.codServicio);

                  }   
                },
              ),


            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              NumpadButton(
                text: '4',
                onPressed: (){

                  if(isDni){
                    if(numpadProvider.dni.length < 8) numpadProvider.setValueDni('4', length);
                    if(numpadProvider.dni.length == 8) consultarDOI(context, numpadProvider.dni, loginProvider.codServicio);
                  }else{
                    if(numpadProvider.carnet.length < 9 ) numpadProvider.setValueCarnet('4', length);
                    if(numpadProvider.carnet.length == 9) consultarDOI(context, numpadProvider.carnet, loginProvider.codServicio);
                  }   

                },

              ),

              // NumpadButton(
              //   text: '4',
              //   onPressed: ()=>(isDni)?numpadProvider.setValueDni('4', length):numpadProvider.setValueCarnet('4', length),
              // ),

              NumpadButton(
                text: '5',
                onPressed: (){

                  if(isDni){

                    if(numpadProvider.dni.length < 8) numpadProvider.setValueDni('5', length);
                    if(numpadProvider.dni.length == 8) consultarDOI(context, numpadProvider.dni, loginProvider.codServicio);

                  }else{

                    if(numpadProvider.carnet.length < 9 ) numpadProvider.setValueCarnet('5', length);
                    if(numpadProvider.carnet.length == 9) consultarDOI(context, numpadProvider.carnet, loginProvider.codServicio);

                  }   
                },
              ),



              // NumpadButton(
              //   text: '5',
              //   onPressed: ()=>(isDni)?numpadProvider.setValueDni('5', length):numpadProvider.setValueCarnet('5', length),
              // ),


              NumpadButton(
                text: '6',
                onPressed: (){

                  if(isDni){

                    if(numpadProvider.dni.length < 8) numpadProvider.setValueDni('6', length);
                    if(numpadProvider.dni.length == 8) consultarDOI(context, numpadProvider.dni, loginProvider.codServicio);

                  }else{

                    if(numpadProvider.carnet.length < 9 ) numpadProvider.setValueCarnet('6', length);
                    if(numpadProvider.carnet.length == 9) consultarDOI(context, numpadProvider.carnet, loginProvider.codServicio);

                  }   
                },
              ),

              // NumpadButton(
              //   text: '6',
              //   onPressed: ()=>(isDni)?numpadProvider.setValueDni('6', length):numpadProvider.setValueCarnet('6', length),
              // ),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              NumpadButton(
                text: '7',
                onPressed: (){

                  if(isDni){

                    if(numpadProvider.dni.length < 8) numpadProvider.setValueDni('7', length);
                    if(numpadProvider.dni.length == 8) consultarDOI(context, numpadProvider.dni, loginProvider.codServicio);

                  }else{

                    if(numpadProvider.carnet.length < 9 ) numpadProvider.setValueCarnet('7', length);
                    if(numpadProvider.carnet.length == 9) consultarDOI(context, numpadProvider.carnet, loginProvider.codServicio);

                  }   
                },
              ),


              // NumpadButton(
              //   text: '7',
              //   onPressed: ()=>(isDni)?numpadProvider.setValueDni('7', length):numpadProvider.setValueCarnet('7', length),
              // ),

              NumpadButton(
                text: '8',
                onPressed: (){

                  if(isDni){

                    if(numpadProvider.dni.length < 8) numpadProvider.setValueDni('8', length);
                    if(numpadProvider.dni.length == 8) consultarDOI(context, numpadProvider.dni, loginProvider.codServicio);

                  }else{

                    if(numpadProvider.carnet.length < 9 ) numpadProvider.setValueCarnet('8', length);
                    if(numpadProvider.carnet.length == 9) consultarDOI(context, numpadProvider.carnet, loginProvider.codServicio);

                  }   
                },
              ),

              // NumpadButton(
              //   text: '8',
              //   onPressed: ()=>(isDni)?numpadProvider.setValueDni('8', length):numpadProvider.setValueCarnet('8', length),
              // ),

              NumpadButton(
                text: '9',
                onPressed: (){

                  if(isDni){

                    if(numpadProvider.dni.length < 8) numpadProvider.setValueDni('9', length);
                    if(numpadProvider.dni.length == 8) consultarDOI(context, numpadProvider.dni, loginProvider.codServicio);

                  }else{

                    if(numpadProvider.carnet.length < 9 ) numpadProvider.setValueCarnet('9', length);
                    if(numpadProvider.carnet.length == 9) consultarDOI(context, numpadProvider.carnet, loginProvider.codServicio);

                  }   
                },
              ),

              // NumpadButton(
              //   text: '9',
              //   onPressed: ()=>(isDni)?numpadProvider.setValueDni('9', length):numpadProvider.setValueCarnet('9', length),
              // ),


            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Container(
                width: 80,
              ),

              // NumpadButton(
              //   haveBorder: false,
              //   icon: Icons.check,
              //   onPressed: (){
              //     onPressed((isDni)?numpadProvider.dni:numpadProvider.carnet);
              //     (isDni)?numpadProvider.dni = '': numpadProvider.carnet = '';
              //   },
              // ),

              NumpadButton(
                text: '0',
                onPressed: (){

                  if(isDni){

                    if(numpadProvider.dni.length < 8) numpadProvider.setValueDni('0', length);
                    if(numpadProvider.dni.length == 8) consultarDOI(context, numpadProvider.dni, loginProvider.codServicio);

                  }else{

                    if(numpadProvider.carnet.length < 9 ) numpadProvider.setValueCarnet('0', length);
                    if(numpadProvider.carnet.length == 9) consultarDOI(context, numpadProvider.carnet, loginProvider.codServicio);

                  }
                },
              ),


              // NumpadButton(
              //   text: '0',
              //   onPressed: ()=>(isDni)?numpadProvider.setValueDni('0', length):numpadProvider.setValueCarnet('0', length),
              // ),

              NumpadButton(
                haveBorder: false,
                icon: Icons.backspace,
                onPressed: ()=>(isDni)?numpadProvider.backspaceDni(numpadProvider.dni):numpadProvider.backspaceCarnet(numpadProvider.carnet),
              ),

            ],
          )

        ],

      ),

    );

  }

}

class Preview extends StatelessWidget {

  final int length;
  final String text;

  const Preview({super.key, required this.length, required this.text});

  @override
  Widget build(BuildContext context) {

    List<Widget> previewLength = [];
    for (var i = 0; i < length; i++) {
      bool valor = text.length >= i+1;
      previewLength.add(Dot(isActive: valor, number: valor? text.substring(i,i+1) : null));
    } 
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Wrap(
        children: previewLength
      )
    );
  }

}

class Dot extends StatelessWidget {
  final bool isActive;
  final String? number;
  const Dot({ this.isActive = false, this.number});

  @override
  Widget build(BuildContext context) {

    return  Container(
      padding: const  EdgeInsets.all(8.0),
      child: isActive
      ? SizedBox(width: 20.0, height: 20.0,child: Text('$number', style: const TextStyle(color: Colors.white, fontSize:20, fontWeight: FontWeight.bold)))      
      : Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Colors.white
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

}

class NumpadButton extends StatelessWidget {

  final String? text;
  final IconData? icon;
  final bool haveBorder;
  final Function()? onPressed;

  const NumpadButton({ 
    this.text, 
    this.icon, 
    this.haveBorder=true,  
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    // final numpadProvider= Provider.of<NumPadProvider>(context); 
    
    final size = MediaQuery.of(context).size;
    TextStyle buttonStyle = const TextStyle(fontSize: 20, color: Colors.black);
    
    Widget label = (icon != null) 
      ? Icon(icon, color: Colors.white, size: 30.0)
      : Text(text ?? '', style: buttonStyle);

    return OutlinedButton(
      onPressed: onPressed,
      // onPressed: (numpadProvider.dni.length == 3)? (){
      //   print(numpadProvider.dni);
      // }: onPressed,
      style: ButtonStyle(
        backgroundColor: haveBorder ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.transparent),
        side: haveBorder ? MaterialStateProperty.all(const BorderSide(color: Colors.grey)) : MaterialStateProperty.all(BorderSide.none),
        padding: MaterialStateProperty.all(EdgeInsets.all(size.width*0.07)),
        shape: MaterialStateProperty.all(const CircleBorder()),
      ),
      child: label,
    );

  }
}
