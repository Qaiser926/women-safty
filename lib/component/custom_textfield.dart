// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_if_null_operators
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final Function(String?)? onSave;
  final int? maxLines;
  final bool isPassword;
  final bool enable;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? check;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  const CustomTextField({
    Key? key,
    this.hintText,
    this.textInputAction,
    this.check,
    this.controller,
    this.validate,
    this.onSave,
    this.maxLines,
    this.isPassword=false,
    this.enable=true,
     this.keyboardType,
    this.focusNode,
    this.prefix,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines==null?1:maxLines,
      onSaved: onSave,
      focusNode: focusNode,
      enabled: enable==true?true:enable,
      textInputAction: textInputAction,
      obscureText: isPassword==false?false:isPassword,
      validator: validate,
      controller: controller,
      keyboardType: keyboardType,

      decoration: InputDecoration(
        labelText: hintText==null?"hint text...":hintText,
        prefix: prefix,
        suffix: suffix,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
             width: 1
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:  BorderSide(
            color:Theme.of(context).primaryColor,
             width: 1
          ),
        ),
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.red,
             width: 1
          ),
        ),
         focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:  BorderSide(
            color: Theme.of(context).primaryColor,
             width: 1
          ),
        )
      ),
    );
  }
}
