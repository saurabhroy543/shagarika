import 'package:flutter/material.dart';

class PasswordDataField extends StatelessWidget {

  final String? hintText;
  final String? initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onPressed;
  final void Function()? onForgotPasswordChange;
  final TextInputType? textInputType;
  final bool obscure;
  final bool? enabled;

  PasswordDataField({
    @required this.hintText,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.onPressed,
    this.onForgotPasswordChange,
    this.textInputType,
    this.obscure = true,
    this.enabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTap: onPressed,
      obscureText:obscure,
      validator: validator ?? (v) => null,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
          hintText: hintText,
          border: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2
              )
          ),
        suffixIcon: InkWell(
            onTap: onForgotPasswordChange,
            child: Icon(Icons.remove_red_eye_rounded,color: !enabled!?Colors.green:Colors.grey.shade400),
        ),
      ),
      showCursor: true,
    );
  }
}
