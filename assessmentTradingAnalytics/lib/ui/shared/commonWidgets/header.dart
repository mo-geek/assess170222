import 'package:flapkap/ui/shared/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final VoidCallback press;
  final EdgeInsetsGeometry edgeInsetsGeometry;

  const Header(
      {Key? key, required this.press, required this.edgeInsetsGeometry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (Responsive.isMobile(context) &&
            !Responsive.isMobileLandscape(context))
          IconButton(
              onPressed: press,
              icon: const Icon(
                Icons.menu,
                size: 29.0,
              )),
        Padding(
          padding: edgeInsetsGeometry,
          child: Text(
            'FlapKap',
            style: GoogleFonts.lato(fontSize: 23.0),
          ),
        ),
      ],
    );
  }
}
