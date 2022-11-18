import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/helpers/validar_consulta.dart';

class NumpadV2 extends StatefulWidget {

  final int length;
  final bool isDni;

  const NumpadV2({
    super.key, 
    required this.length, 
    this.isDni=true,
  });

  @override
  _NumpadV2 createState() => _NumpadV2();
}

class _NumpadV2 extends State<NumpadV2> {

  String number = '';

  setValue(String val){
    if(number.length < widget.length){
      setState(() => number += val );
    }
  }

  backspace(String text){
    if(text.isNotEmpty){
      setState(()=>number = text.split('').sublist(0,text.length-1).join(''));
    }
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<GlobalProvider>(context, listen: false);

    return SizedBox(

      width: size.width,
      height: size.height*0.65,

      child: Column( 

        children: <Widget>[

          Preview(text: number, length: widget.length),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[

              NumpadButton(
                text: '1',
                // onPressed: ()=>setValue('1'),
                onPressed: (){

                  if(number.length < widget.length) setValue('1');

                  if(widget.isDni){
                    if(number.length == widget.length){
                      validarConsulta(context, number, loginProvider.codServicio);
                      number = '';
                    } 
                  }

                },
              ),
              NumpadButton(
                text: '2',
                onPressed: (){
                  if(number.length < widget.length) setValue('2');
                  if(widget.isDni){
                    if(number.length == widget.length) {
                      validarConsulta(context, number, loginProvider.codServicio);
                      number = '';
                    }
                  }
                },
                // onPressed: ()=>setValue('2'),
              ),
              NumpadButton(
                text: '3',
                // onPressed: ()=>setValue('3'),
                onPressed: (){
                  if(number.length < widget.length) setValue('3');

                  if(widget.isDni){
                    if(number.length == widget.length) {
                      validarConsulta(context, number, loginProvider.codServicio);
                      number='';
                    }
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
                // onPressed: ()=>setValue('4'),
                onPressed: (){
                  if(number.length < widget.length) setValue('4');

                  if(widget.isDni){
                    if(number.length == widget.length) {
                      validarConsulta(context, number, loginProvider.codServicio);
                      number='';
                    }
                  }

                },
              ),
              NumpadButton(
                text: '5',
                // onPressed: ()=>setValue('5'),
                onPressed: (){
                  if(number.length < widget.length) setValue('5');

                  if(widget.isDni){
                    if(number.length == widget.length) {
                      validarConsulta(context, number, loginProvider.codServicio);
                      number='';
                    }
                  }
                },
              ),
              NumpadButton(
                text: '6',
                // onPressed: ()=>setValue('6'),
                onPressed: (){
                  if(number.length < widget.length) setValue('6');
                  if(number.length == widget.length) {
                    validarConsulta(context, number, loginProvider.codServicio);
                    number= '';
                  }
                },
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '7',
                // onPressed: ()=>setValue('7'),
                onPressed: (){
                  if(number.length < widget.length) setValue('7');
                  if(number.length == widget.length) {
                    validarConsulta(context, number, loginProvider.codServicio);
                    number = '';
                  }
                },
              ),
              NumpadButton(
                text: '8',
                // onPressed: ()=>setValue('8'),
                onPressed: (){
                  if(number.length < widget.length) setValue('8');
                  if(number.length == widget.length) {
                    validarConsulta(context, number, loginProvider.codServicio);
                    number = '';
                  }
                },
              ),
              NumpadButton(
                text: '9',
                // onPressed: ()=>setValue('9'),
                onPressed: (){
                  if(number.length < widget.length) setValue('9');
                  if(number.length == widget.length) {
                    validarConsulta(context, number, loginProvider.codServicio);
                    number = '';
                  }
                  // if(number.length == widget.length) validarConsulta(context, number, loginProvider.codServicio);
                },
              ),
            ],
          ),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[

              if(widget.isDni)
                Container(
                  width: size.width*0.23,
              ),

              if(!widget.isDni)
                NumpadButton(
                  haveBorder: false,
                  icon: Icons.check,
                  onPressed: (){
                    if( number == '' || number.length<widget.length ){
                      showSnackBarAwesome(context, 'Error', 'Ingrese un Pasaporte valido', ContentType.failure);
                    }else{
                      validarConsulta(context, number, loginProvider.codServicio);
                      number='';
                      setState(() {
                        
                      });
                    }
                  },
                ),

              // Container(
              //   width: 80,
              // ),

              NumpadButton(
                text: '0',
                // onPressed: ()=>setValue('0'),
                onPressed: (){
                  if(number.length < widget.length) setValue('0');
                  if(widget.isDni){
                    if(number.length == widget.length) {
                      validarConsulta(context, number, loginProvider.codServicio);
                      number = '';
                    }
                  }
                  // if(number.length == widget.length) validarConsulta(context, number, loginProvider.codServicio);
                },
              ),
              NumpadButton(
                haveBorder: false,
                icon: Icons.backspace,
                onPressed: ()=>backspace(number),
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
      child: Wrap(children: previewLength)
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
  const NumpadButton({ this.text, this.icon, this.haveBorder=true,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextStyle buttonStyle = const TextStyle(fontSize: 20, color: Colors.black);
    Widget label = icon != null ? Icon(icon, color: Colors.white, size: 30.0)
      : Text(text ?? '', style: buttonStyle);

    return OutlinedButton(
      onPressed: onPressed, 
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
