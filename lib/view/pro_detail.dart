import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../model/product_model.dart';

class ProDetail extends StatefulWidget {
  const ProDetail({super.key, required this.pro});

  final ProductModel pro;

  @override
  State<ProDetail> createState() => _ProDetailState();
}

class _ProDetailState extends State<ProDetail> {
  // Produtc qty
  int qty = 1;

  // Favorite
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Shimmer.fromColors(
          baseColor: Colors.purple.shade900,
          highlightColor: Colors.cyan,
          child: Text(
            widget.pro.title,
            style: GoogleFonts.kantumruyPro(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // Product image
          SizedBox(
            height: 260.0,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.pro.image,
                  imageBuilder: (context, imageProvider) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                        ),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) {
                    return Text(
                      'Error: $error',
                      style: GoogleFonts.kantumruyPro(
                        fontSize: 15.0,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple.withOpacity(.1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isLoved = !isLoved;
                        });
                      },
                      icon: Icon(
                        isLoved ? Icons.favorite : Icons.favorite_border,
                        color: Colors.deepPurple.shade800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Category & rating
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.pro.category.toString(),
                  style: GoogleFonts.kantumruyPro(
                    fontSize: 15.0,
                    color: Colors.cyan.shade800,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.cyan.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        size: 18.0,
                        color: Colors.cyan.shade800,
                      ),
                      const SizedBox(width: 3.0),
                      Text(
                        widget.pro.rating.rate.toString(),
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 15.0,
                          color: Colors.cyan.shade800,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          // Price & add, remove qty
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${widget.pro.price * qty}',
                  style: GoogleFonts.kantumruyPro(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          qty--;
                        });
                      },
                      child: Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      alignment: Alignment.center,
                      height: 35.0,
                      width: 35.0,
                      decoration: BoxDecoration(
                        color: Colors.cyan.withOpacity(.1),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        qty.toString(),
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 20.0,
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          qty++;
                        });
                      },
                      child: Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Description
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(.1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              widget.pro.description,
              textAlign: TextAlign.justify,
              style: GoogleFonts.kantumruyPro(
                fontSize: 18.0,
                color: Colors.deepPurple,
              ),
            ),
          ),

          // Add to cart Button
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                // Do something here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    size: 30.0,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    'add to cart'.tr,
                    style: GoogleFonts.kantumruyPro(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
