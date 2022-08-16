import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:solgis/projects/people/data/services/personal_service.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/models/response_persona_model.dart';
import 'package:solgis/projects/people/theme/theme.dart';

void guardarPersonal(BuildContext context )async{


    await NDialog(

      dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
      title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
      content:  const Text("¿Estas seguro que deseas registar al personal?", style: TextStyle(color: Colors.black)),  
      
      actions: <Widget>[

        TextButton(

          child: const Text("Si"),

          onPressed: ()async{

            CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
            progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
            progressDialog.show();

            ResponsePersonalModel response = await PersonalProvider().procesarRegistroPersonal(context);

            progressDialog.dismiss();

            if (response != null){

              if(response.personal_maestro !=-1){

                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'home_people');

                // ignore: use_build_context_synchronously
                showSnackBarAwesome(context, 'Exito', "${response.message} ", ContentType.success);

              }else{

                Navigator.pop(context);
                 // ignore: use_build_context_synchronously
                showSnackBarAwesome(context, 'Error', "${response.message}", ContentType.failure);

              }

            }else{
              
                Navigator.pop(context);
              // ignore: use_build_context_synchronously
              showSnackBarAwesome(context, 'Error', 'Hubo un problema al registrar el personal', ContentType.failure);

            }

          }, 

        ),

        TextButton(

          child: const Text("No"),
          onPressed: ()=> Navigator.pop(context)

        ),

      ],
    
    ).show(context);









}