import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/home_provider.dart';
import 'package:solgis/core/presentation/pages/login/widgets/widget.dart';
import 'package:solgis/core/theme/theme.dart';


class LoginPage extends StatelessWidget {
  
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: AppThemeGeneral.lighTheme.backgroundColor,

      body: Stack(

        fit: StackFit.expand,
        children: [

          const LoginBackground(),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.fastOutSlowIn,
            top: 0,
            bottom: homeProvider.isdragged ? - 100 : 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 600),
              curve: Curves.fastOutSlowIn,
              opacity: homeProvider.isdragged ? 0.0 : 1.0,
              child: Center(
                child: SizedBox(
                  height: size.height * .9,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Center(
                          child: Image(
                            width: size.width*0.6,
                            height: size.height*0.15,
                            image: const AssetImage('assets/pngs/SOLMAR.png'),
                          ),
                        ),
                        const Spacer(flex: 8),
                        Text(
                          'Bienvenido',
                          style: GoogleFonts.poppins(
                            fontSize: size.height * .04,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffffffff)
                          ),
                        ),
                        const Spacer(flex: 5),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SnakeButton(
                                onPressed: () => _openPage(context, const LoginAgenteForm()),
                                child: Text(
                                  'DNI',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: const Color(0xffffffff)
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: RectangularButton(
                                onPressed: () => _openPage(context, const LoginGeneralForm()),
                                label: 'USUARIO',
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      )

    );
  }

  Future<void> _openPage(BuildContext context, Widget page) async {
    final homeProvider = Provider.of<HomeProvider>(context, listen:false);

    homeProvider.isdragged = true;
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
    homeProvider.isdragged = false;
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
          primary: Colors.white,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color:  Colors.white, width: 3),
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

