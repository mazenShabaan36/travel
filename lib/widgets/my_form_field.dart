
import 'package:flutter/material.dart';


class MyFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isPassword;
  final Function(String)? onSubmit;
  final Function(String)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isAutoFocus;
  final Function()? onTap;
  final bool? readOnly;

  const MyFormField({
    Key? key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword,
    this.onSubmit,
    this.validator,
    this.controller,
    this.keyboardType,
    this.isAutoFocus,
    this.onTap,
    this.readOnly, this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hint!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side:  BorderSide(color: Theme.of(context).primaryColor , width: 0.5),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3.5),
                  child: TextFormField(
                    validator: (value) => validator!(value!),
                    controller: controller,
                    onTap: onTap,
                    readOnly: readOnly ?? false,
                    keyboardType: keyboardType,
                    maxLength: maxLength,
                    autofocus: isAutoFocus ?? false,
                    obscureText: isPassword ?? false,
                    onFieldSubmitted: (value) => onSubmit!(value) ?? "",
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                      hintText: hint,
                      labelText: label,
                      prefixIcon: prefixIcon,
                      suffixIcon: suffixIcon,
                      prefixIconColor: Theme.of(context).primaryColor,
                      suffixIconColor: Theme.of(context).primaryColor,
                      border: InputBorder.none,
                    ),
                  ))),
        ],
      ),
    );
  }
}
