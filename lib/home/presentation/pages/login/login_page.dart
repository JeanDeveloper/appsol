import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solgis/home/presentation/pages/login/widgets/widget.dart';
import 'package:solgis/theme/theme_general.dart';


class LoginPage extends StatelessWidget {
  
  LoginPage({Key? key}) : super(key: key);
  final hideNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppThemeGeneral.lighTheme.backgroundColor,

      body: Stack(
        fit: StackFit.expand,
        children: [
          const LoginBackground(),

          ValueListenableBuilder<bool>(

            valueListenable: hideNotifier,

            builder: (context, value, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 600),
                curve: Curves.fastOutSlowIn,
                top: 0,
                bottom: value ? - 100 : 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn,
                  opacity: value ? 0.0 : 1.0,
                  child: child,
                ),
              );
            },

            child: Center(
              child: SizedBox(
                height: size.height * .75,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Spacer(),
                      const Center(
                        child:Text('SOLMAR') 
                        
                      ),
                      const SizedBox(height: 35),
                      const Spacer(flex: 5),
                      Text(
                        'Bienvenido',
                        style: GoogleFonts.poppins(
                          fontSize: size.height * .040,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(flex: 5),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SnakeButton(
                              onPressed: () => _openPage(context, const LoginAgenteForm()),
                              child: Text(
                                'Agente',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: RectangularButton(
                              onPressed: () =>
                                  _openPage(context, const LoginGeneralForm()),
                              label: 'Usuario',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )

    );
  }

  Future<void> _openPage(BuildContext context, Widget page) async {
    hideNotifier.value = true;
    await Navigator.push(
      context,
      PageRouteBuilder<dynamic>(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation, 
            child: page
          );
        },
      ),
    );
    hideNotifier.value = false;
  }



}



class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .056,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: Colors.black,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color:  Color(0xff6F56FF), width: 3),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

