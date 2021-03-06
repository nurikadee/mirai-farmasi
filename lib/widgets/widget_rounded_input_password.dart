import 'package:flutter/material.dart';

class RoundedInputPasswordField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  final Color cursorColor;
  final Color iconColor;
  final Color editTextBackgroundColor;
  final FocusNode focusNode;
  final TextInputType textInput;
  final TextStyle textStyle;
  final bool obscureTextPassword;
  final bool isRequired;
  final Widget sufix;

  const RoundedInputPasswordField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.textEditingController,
      this.cursorColor,
      this.iconColor,
      this.editTextBackgroundColor,
      this.focusNode,
      this.textInput,
      this.textStyle,
      this.obscureTextPassword,
      this.sufix,
      this.isRequired})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: editTextBackgroundColor,
          borderRadius: BorderRadius.circular(29),
        ),
        child: TextFormField(
          validator: (val) {
            if (val.length == 0) {
              return "$hintText can not be empty";
            } else {
              return null;
            }
          },
          enabled: true,
          focusNode: focusNode,
          controller: textEditingController,
          obscureText: obscureTextPassword,
          onChanged: onChanged,
          cursorColor: cursorColor,
          keyboardType: textInput,
          decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
            suffixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                icon,
                color: iconColor,
                size: 15,
              ),
            ),
            suffixIcon: sufix,
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: TextStyle(color: iconColor, fontSize: 14),
          ),
        ));
  }
}
