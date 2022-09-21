import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/sign_out.dart';
import 'package:solgis/core/domain/helpers/text_style_drawer.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/core/domain/providers/home_provider.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';
import 'package:solgis/core/presentation/widgets/widgets.dart';
import 'package:solgis/core/theme/theme.dart';


class DrawerWidget extends StatelessWidget {
  
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final personAuth = Provider.of<PersonAuthProvider>(context);
    final serviceProvider = Provider.of<GlobalProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);

    return ClipRRect(

      borderRadius: const BorderRadius.only(topRight: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
      
      child: Drawer(
        width: size.width*0.6,
        backgroundColor: AppThemeGeneral.lighTheme.backgroundColor,
        child: Stack(
          
          children: [
            
            const BackgroundDrawer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height*0.03),
                const Center(
                    child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundImage: AssetImage('assets/pngs/no-image.png'),
                    radius: 60,
                  ),

                ),
                SizedBox(height: size.height*0.03),
                Center(child: AutoSizeText(serviceProvider.nombreCliente, style: letrasEstilo().copyWith(fontWeight: FontWeight.bold), maxLines: 1)),
                SizedBox(height: size.height*0.03),
                Center(child: AutoSizeText('${personAuth.nombre}  ${personAuth.pApellido}  ${personAuth.sApellido}', style: letrasEstilo(), maxLines: 1)),
                SizedBox(height: size.height*0.01),
                Center(child: AutoSizeText(personAuth.dni, style: letrasEstilo(), maxLines: 1)),
                SizedBox(height: size.height*0.03),
                Container(
                  width:size.width*0.55,
                  height: size.height*0.045,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const ItemWidget(
                    text: 'Apps',
                    icon: FaIcon(FontAwesomeIcons.googlePlay, color: Colors.lightBlueAccent,),
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(height: size.height*0.5),
                // const ItemWidget(
                //   text: 'Acerca de',
                //   icon: FaIcon(FontAwesomeIcons.circleExclamation, color: Colors.white,),
                //   color: Colors.white,
                // ),
                // SizedBox(height: size.height*0.4),

                Center(
                  child: Container(
                    width:size.width*0.40,
                    height: size.height*0.050,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: ()async{
                        await signOut(context);
                      },
                      child: (homeProvider.isLoading)
                        ? const SizedBox(height: 20, width: 20,  child: CircularProgressIndicator())
                        : const ItemWidget(
                          text: 'Cerrar Sesion',
                          icon: FaIcon(
                            FontAwesomeIcons.rightFromBracket, 
                            color: Colors.lightBlueAccent, size: 15
                            ),
                          color: Colors.lightBlueAccent,
                        ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );
  }

}

class BackgroundDrawer extends StatelessWidget {
  const BackgroundDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1A4A7A),
            Color.fromARGB(255, 29, 56, 82),
          ]
        )
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }
}
