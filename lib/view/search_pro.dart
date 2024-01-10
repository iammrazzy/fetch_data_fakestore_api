import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shop/model/product_model.dart';
import 'package:e_shop/view/pro_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key, required this.proList});

  // list product model
  final List<ProductModel> proList;

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  // List to store after get from todoList
  List<ProductModel> _searchProList = [];

  // search controller
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'search'.tr,
            hintStyle: GoogleFonts.kantumruyPro(
              fontSize: 20.0,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _searchController.clear();
              },
              icon: const Icon(
                Icons.clear,
              ),
            ),
          ),
          onChanged: (query) {
            setState(() {
              final suggestions = widget.proList.where(
                (pro) {
                  final proName = pro.title.toLowerCase();
                  final input = query.toLowerCase();
                  return proName.contains(input);
                },
              ).toList();
              setState(() => _searchProList = suggestions);
            });
          },
        ),
      ),
      body: _searchProList.isEmpty
          ? Center(
              child: Text(
                'no product yet!'.tr,
                style: GoogleFonts.kantumruyPro(
                  fontSize: 15.0,
                  color: Colors.red,
                ),
              ),
            )
          : GridView.builder(
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
              itemCount: _searchProList.length,
              itemBuilder: (context, index) {
                var pro = _searchProList[index];
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
            ),
    );
  }
}
