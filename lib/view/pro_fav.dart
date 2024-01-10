import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductFavorite extends StatelessWidget {
  const ProductFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'product favorite'.tr,
          style: GoogleFonts.kantumruyPro(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.deepPurple.withOpacity(.2),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_rounded,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.purple.shade900,
              highlightColor: Colors.cyan,
              child: Text(
                'STAY TUNE GUYYY!',
                style: GoogleFonts.kantumruyPro(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'I\'m working on it.',
              style: GoogleFonts.kantumruyPro(
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
