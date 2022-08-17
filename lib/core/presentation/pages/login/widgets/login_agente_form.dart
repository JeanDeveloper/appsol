import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/get_relation_service.dart';
import 'package:solgis/core/domain/helpers/signin_dni.dart';
import 'package:solgis/core/domain/providers/home_provider.dart';
import 'package:solgis/core/presentation/pages/login/widgets/widget.dart';
import 'package:solgis/core/presentation/pages/pages.dart';
import 'package:solgis/core/theme/theme.dart';

class LoginAgenteForm extends StatelessWidget {
  
  const LoginAgenteForm({
    super.key,
  });

  // void _openHomePage(BuildContext context) {
  //   final newRoute = PageRouteBuilder<dynamic>(
  //     transitionDuration: const Duration(milliseconds: 1000),
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return FadeTransition(
  //         opacity: animation,
  //         child: const HomePage(),
  //       );
  //     },
  //   );
  //   Navigator.pushAndRemoveUntil(context, newRoute, ModalRoute.withName(''));
  // }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
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
                              padding:const EdgeInsets.symmetric(horizontal: 40),
                              child: SingleChildScrollView(
                                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const SizedBox(height: 60),
                                    TextInputLoginAgente(
                                      textcontroller: homeProvider.controller,
                                      label: 'DNI',
                                      iconData: Icons.person,
                                      textInputType: TextInputType.number,
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: size.width * .85,
                                      child: TextButton(
                                        onPressed: () async {
                                          // resizeNotifier.value = false;
                                          //VEMOS SI EL USUARIO SOLMAR EXISTE PARA INGRESAR.
                                          await getRelation(context);
                                          await signinWithDNI(context, homeProvider.controller.text);
                                          
                                        },
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          padding: const EdgeInsets.all(12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:BorderRadius.circular(10),
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
