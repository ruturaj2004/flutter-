import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Widget? title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Widget? leading,
    bool automaticallyImplyLeading = true,
    Widget? flexibleSpace,
    double elevation = 4.0,
    Color? shadowColor,
    ShapeBorder? shape,
    bool excludeHeaderSemantics = false,
    double toolbarOpacity = 1.0,
    double bottomOpacity = 1.0,
  }) : super(
          key: key,
          title: title,
          actions: actions,
          bottom: bottom,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          flexibleSpace: flexibleSpace,
          elevation: elevation,
          shadowColor: shadowColor,
          shape: shape,
          excludeHeaderSemantics: excludeHeaderSemantics,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
          backgroundColor: Colors.white, // Customize background color here
        );
}



//AppBarr