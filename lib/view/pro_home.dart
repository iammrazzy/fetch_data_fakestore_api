import 'package:e_shop/main.dart';
import 'package:e_shop/view/pro_detail.dart';
import 'package:e_shop/view/search_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../controller/app_controller.dart';
import '../controller/product_controller.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  // Get products
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.blue.shade900,
                  highlightColor: Colors.pink,
                  child: Text(
                    'GetX',
                    style: GoogleFonts.kantumruyPro(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Fetch data from API',
                  style: GoogleFonts.kantumruyPro(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    String link = 'https://fakestoreapi.com';
                    final url = Uri.parse(link);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Can not launch this URL: $url';
                    }
                  },
                  child: Text(
                    '👉 URL: fakestoreapi.com',
                    style: GoogleFonts.kantumruyPro(
                      letterSpacing: 2.5,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.blue.shade900,
                  highlightColor: Colors.red,
                  child: Text(
                    'iamrazzy ◉_◉',
                    style: GoogleFonts.kantumruyPro(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // app setting
                const SizedBox(height: 25.0),
                Shimmer.fromColors(
                  baseColor: Colors.blue.shade900,
                  highlightColor: Colors.red,
                  child: Text(
                    'setting'.tr,
                    style: GoogleFonts.kantumruyPro(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                const Divider(),
                GetBuilder<AppController>(builder: (_) {
                  return Shimmer.fromColors(
                    baseColor: Colors.blue.shade900,
                    highlightColor: Colors.red,
                    child: ListTile(
                      onTap: () {
                        // Call the changeTheme method on button press
                        controller.changeTheme(
                          !controller.isDark,
                        );
                      },
                      leading: Icon(
                        controller.isDark ? Icons.dark_mode : Icons.light_mode,
                        size: 25.0,
                      ),
                      title: Text(
                        'appearance'.tr,
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        controller.isDark ? 'dark'.tr : 'light'.tr,
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
                Shimmer.fromColors(
                  baseColor: Colors.blue.shade900,
                  highlightColor: Colors.red,
                  child: ListTile(
                    onTap: () {
                      controller.changeLanguage();
                    },
                    leading: const Icon(
                      Icons.translate,
                      size: 25.0,
                    ),
                    title: Text(
                      'language'.tr,
                      style: GoogleFonts.kantumruyPro(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      controller.isEnglish ? 'khmer'.tr : 'english'.tr,
                      style: GoogleFonts.kantumruyPro(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Shimmer.fromColors(
                  baseColor: Colors.blue.shade900,
                  highlightColor: Colors.red,
                  child: Text(
                    'Click on item to change...!',
                    style: GoogleFonts.kantumruyPro(
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Shimmer.fromColors(
          baseColor: Colors.purple.shade900,
          highlightColor: Colors.cyan,
          child: Text(
            'E-Commerce ◉ API ◉ GetX',
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
              onPressed: () {
                Get.to(
                  () => SearchProduct(proList: productController.productList),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: FutureBuilder(
        future: productController.getProducts(),
        builder: (context, snashot) {
          if (snashot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20.0),
                  Text(
                    'Loading data from API...!',
                    style: GoogleFonts.kantumruyPro(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            );
          } else if (snashot.hasError) {
            return Center(
              child: Text(
                snashot.hasError.toString(),
                style: GoogleFonts.kantumruyPro(
                  fontSize: 15.0,
                  color: Colors.red,
                ),
              ),
            );
          } else {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 2.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: 250.0,
              ),
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                var pro = productController.productList[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProDetail(pro: pro));
                      },
                      child: SizedBox(
                        height: 185.0,
                        child: CachedNetworkImage(
                          imageUrl: pro.image,
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
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              pro.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.kantumruyPro(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Do something here
                            },
                            child: CircleAvatar(
                              radius: 18.0,
                              backgroundColor: Colors.indigo.withOpacity(.2),
                              child: const Icon(
                                Icons.shopping_cart_checkout,
                                color: Colors.indigo,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
