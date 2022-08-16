import 'package:flutter/material.dart';
import 'package:solgis/core/theme/theme.dart';

class TextInputLoginAgente extends StatelessWidget {

  const TextInputLoginAgente({
    super.key,
    required this.label,
    required this.iconData,
    required this.onchanged,
    this.textInputType,
  });
  final String label;
  final IconData iconData;
  final TextInputType? textInputType;
  final Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    
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
            onChanged: onchanged,
            maxLength: 8,
            keyboardType: textInputType,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder.copyWith(borderSide: BorderSide(color:  AppThemeGeneral.lighTheme.primaryColor, width: 2)),
              counterText: '',
              filled: true,
              fillColor: Colors.white,
              hintText: label,
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: Icon(iconData, color: AppThemeGeneral.lighTheme.primaryColor, size: 18),

            ),
        );
      },
    );

  }
}
