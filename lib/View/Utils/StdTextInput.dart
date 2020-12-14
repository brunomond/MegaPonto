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
  final bool isTime;
  final bool isDate;
  final bool isCpf;
  final EdgeInsets iconsPadding;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final bool done;
  final Function(String) onChanged;
  final bool enabled;
  final TextEditingController controller;
  final String initualValue;
  final FocusNode focusNode;
  final String erroTexto;

  StdTextInput(
      {this.keyboardType,
      this.textInputAction,
      this.hintText,
      this.padding,
      this.prefixIcon,
      this.obscureText,
      this.suffixIcon,
      this.isPhone = false,
      this.isTime = false,
      this.isDate = false,
      this.isCpf = false,
      this.iconsPadding,
      this.validator,
      this.onSaved,
      this.done = false,
      this.onChanged,
      this.enabled = true,
      this.initualValue,
      this.controller,
      this.focusNode,
      this.erroTexto});

  final phoneMask = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});

  final timeMask = new MaskTextInputFormatter(
      mask: '##:##:##', filter: {'#': RegExp(r'[0-9]')});

  final dateMask = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {'#': RegExp(r'[0-9]')});
 
  final cpfMask = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        initialValue: initualValue,
        focusNode: focusNode,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Globals.theme.primaryColor,
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: textInputAction ?? !done
            ? TextInputAction.next
            : TextInputAction.done,
        onEditingComplete: () => !done
            ? FocusScope.of(context).nextFocus()
            : FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          errorText: erroTexto,
          hintText: null,
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
        inputFormatters: isPhone
            ? [phoneMask]
            : isTime
                ? [timeMask]
                : isDate
                  ? [dateMask]
                  : isCpf
                    ? [cpfMask]
                    : null,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        enabled: enabled,
      ),
    );
  }
}
