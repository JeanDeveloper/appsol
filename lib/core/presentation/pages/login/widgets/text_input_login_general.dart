import 'package:flutter/material.dart';
import 'package:solgis/core/theme/theme.dart';

class TextInputLoginGeneral extends StatelessWidget {
  const TextInputLoginGeneral({
    super.key,
    required this.label,
    required this.iconData,
    this.textInputType,
  });
  final String label;
  final IconData iconData;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {

    final isPassword = textInputType == TextInputType.visiblePassword; 

    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Colors.grey[100]!,
        width: 2,
      ),
    );

    final hidePasswordNotifier = ValueNotifier(true);

    return ValueListenableBuilder<bool>(

      valueListenable: hidePasswordNotifier,
      builder: (context, value, child) {

        return TextField(
          keyboardType: textInputType,
          obscureText: (isPassword) ? hidePasswordNotifier.value : false,

          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: isPassword
              ? IconButton(
                  onPressed: () => hidePasswordNotifier.value = !hidePasswordNotifier.value,
                  icon: Icon(
                    value ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey[700],
                  ),
                )
              : null,

            enabledBorder: outlineInputBorder,
            hintText: label,

            focusedBorder: outlineInputBorder.copyWith(
              borderSide: BorderSide(color:  AppThemeGeneral.lighTheme.primaryColor, width: 2),
            ),

            errorBorder: outlineInputBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red, width: 2)
            ),

            focusedErrorBorder: outlineInputBorder.copyWith(
              borderSide: const  BorderSide(color: Colors.red, width:2)
            ),

            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(iconData, color: AppThemeGeneral.lighTheme.primaryColor, size: 18),
          ),
        );
      },
    );
  }
}
