import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


// date:April/4/2023
// by: mohamedFouad
// lastUpdate:April/15/2023

// This is a class named CustomSearchFiled which extends the StatelessWidget class.
// The purpose of this class is to create a custom search field widget that can
// be used in a Flutter application. The class takes in several parameters such
// as the hint text, keyboard type, controller, onSaved, onChange, onPressedSearch,
// suffixIcon, hintStyle, and fillColor.
// The build method returns a TextFormField widget wrapped in a Padding and
// SizedBox widgets. The TextFormField widget takes in several parameters such as
// keyboardType, style, controller, onSaved, onChanged, textAlign, cursorColor,
// decoration and more. The decoration parameter is an instance of InputDecoration
// which has several properties such as prefixIcon, suffixIcon, contentPadding,
// fillColor, filled, hintText, hintStyle, border, enabledBorder, and focusedBorder.
// The buildBorder method returns an OutlineInputBorder widget that is used as the
// border for the search field. If a color is provided, it is used as the border
// color, otherwise the color is set to transparent.
// Overall, this class provides a reusable and customizable search field widget
// for Flutter applications.
class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({
    super.key,
    required this.keyBoardType,
    this.onSaved,
    this.controller,
    this.suffixIcon,
    this.onChange,
    this.onPressedSearch,
    this.isCardScreen = false,
  });

  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final void Function()? onPressedSearch;
  final Widget? suffixIcon;
  final TextInputType keyBoardType;
  final bool isCardScreen;

  @override
  Widget build(BuildContext context) {
    
    bool isLandscape =MediaQuery.of(context).orientation == Orientation.landscape;
    bool isTablet = MediaQuery.of(context).size.shortestSide > 600;
    final TextStyle textStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize:18,
            );
    return SizedBox(
      height: 90,
      child: TextFormField(
        enabled: isCardScreen == true ? false : true,
        keyboardType: keyBoardType,
        scrollPadding: EdgeInsets.zero,
        controller: controller,
        onSaved: onSaved,
        showCursor: false,
        style: textStyle.copyWith(
            color: Theme.of(context).colorScheme.onInverseSurface),
        onChanged: onChange,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
            prefixIconConstraints:
                BoxConstraints(maxWidth:120, maxHeight: 70),
            prefixIcon: InkWell(
              onTap: onPressedSearch,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 25,
                    right: 25),
                child: Icon(Icons.search)
              ),
            ),
            suffixIcon: suffixIcon,
            filled: true,
            contentPadding: EdgeInsets.zero,
            hintText: "Search",
            hintStyle: textStyle,
            fillColor: Theme.of(context).colorScheme.onSurface,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(Theme.of(context).colorScheme.primary),
            disabledBorder: buildBorder()),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.transparent));
}
