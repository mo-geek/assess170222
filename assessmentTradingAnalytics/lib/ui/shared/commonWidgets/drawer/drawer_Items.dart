import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        icon,
        height: 25.0,
      ),
      title: Text(
        title,
        style: GoogleFonts.abel(color: Colors.black, fontSize: 19.0),
      ),
    );
  }
}
