import 'package:flutter/material.dart';
import 'package:solgis/home/presentation/pages/login/widgets/widget.dart';
import 'package:solgis/home/presentation/pages/pages.dart';
import 'package:solgis/theme/theme_general.dart';

class LoginGeneralForm extends StatelessWidget {
  
  const LoginGeneralForm({
    super.key,
  });

  void _openHomePage(BuildContext context) {
    
    final newRoute = PageRouteBuilder<dynamic>(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: const HomePage(),
        );
      },
    );
    Navigator.pushAndRemoveUntil(context, newRoute, ModalRoute.withName(''));
    // Navigator.pushReplacementNamed(context, newRoute)
  
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final resizeNotifier = ValueNotifier<bool>(false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!resizeNotifier.value) resizeNotifier.value = true;
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 3) {
            resizeNotifier.value = false;
            Navigator.pop(context);
          }
        },
        child: Stack(
          children: <Widget>[
            ValueListenableBuilder<bool>(
              valueListenable: resizeNotifier,
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn,
                  bottom: value ? 0 : -size.height * .5,
                  left: 0,
                  right: 0,
                  child: child!,
                );
              },
              child: SizedBox(
                height: size.height,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * .1),
                    const Center(
                      child: Text('SOLMAR'),
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: _DragDownIndication(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 55),
                          child: ClipPath(
                            clipper: InvertedTopBorderClipper(
                              circularRadius: 40,
                            ),
                            child: Container(
                              height: 340,
                              width: double.infinity,
                              color: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const SizedBox(height: 60),
                                  const TextInputLoginGeneral(
                                    label: 'Nombre de usuario',
                                    iconData: Icons.person,
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 20),
                                  const TextInputLoginGeneral(
                                    label: 'Contraseña',
                                    iconData: Icons.lock_outline,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                  ),
                                  const SizedBox(height: 30),
                                  SizedBox(
                                    width: size.width * .65,
                                    child: TextButton(
                                      onPressed: () {
                                        resizeNotifier.value = false;
                                        _openHomePage(context);
                                      },
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        padding: const EdgeInsets.all(12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: AppThemeGeneral.lighTheme.primaryColor,
                                      ),
                                      child: const Text(
                                        'Iniciar sesion',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DragDownIndication extends StatelessWidget {
  const _DragDownIndication();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Inicia sesión',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Desliza para ir hacia atras',
          style: TextStyle(
            height: 2,
            fontSize: 14,
            color: Colors.black.withOpacity(.9),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black.withOpacity(.8),
          size: 35,
        ),
      ],
    );
  }
}
