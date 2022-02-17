import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderMetricsCard extends StatelessWidget {
  final String orderMetrics;
  final String text;

  const OrderMetricsCard(this.orderMetrics, this.text, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.oswald(textStyle: headline4),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                orderMetrics,
                style: GoogleFonts.lato(color: Colors.black, fontSize: 34.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
