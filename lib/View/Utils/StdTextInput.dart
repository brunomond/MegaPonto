import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

import 'StdPrefixIcon.dart';

class StdTextInput extends StatelessWidget {
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String hintText;
  final IconData prefixIcon;
  final EdgeInsets padding;
  final bool obscureText;
  final IconButton suffixIcon;
  final bool isPhone;
  final EdgeInsets iconsPadding;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final bool done;

  StdTextInput(
      {this.keyboardType,
      this.textInputAction,
      this.hintText,
      this.padding,
      this.prefixIcon,
      this.obscureText,
      this.suffixIcon,
      this.isPhone = false,
      this.iconsPadding,
      this.validator,
      this.onSaved,
      this.done = false});

  final phoneMask = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(8),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Globals.theme.primaryColor,
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: textInputAction ?? !done ? TextInputAction.next : TextInputAction.done,
        onEditingComplete: () => !done ? FocusScope.of(context).nextFocus() : FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintText: hintText != null && hintText.isNotEmpty ? hintText : null,
          labelText: hintText != null && hintText.isNotEmpty ? hintText : null,
          prefixIcon: prefixIcon != null
              ? StdPrefixIcon(
                  iconData: prefixIcon,
                  padding: iconsPadding,
                )
              : null,
          suffixIcon: suffixIcon,
        ).applyDefaults(Globals.inputTheme),
        obscureText: obscureText ?? false,
        inputFormatters: isPhone ? [phoneMask] : null,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
