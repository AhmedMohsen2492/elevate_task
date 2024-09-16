import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_task/data/models/ProductsResponse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class ProductWidget extends StatelessWidget {
  int index;
  List<Product> products;

  ProductWidget(this.products, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.only(
        top: 8
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.6),
          ),
          color: AppColors.white),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 50,
                child: CachedNetworkImage(
                  imageUrl: products[index].image ?? "",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                flex: 50,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "${products?[index].title}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            color: AppColors.primary, fontSize: 16,),
                      ),
                      Text(
                        "${products?[index].description}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            color: AppColors.primary, fontSize: 16),
                      ),
                      Text(
                        "EGP ${products![index].price!}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: AppColors.primary, fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text(
                            "Review (${products![index].rating?.rate})",
                            style: GoogleFonts.poppins(
                                color: AppColors.primary, fontSize: 14),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(AppAssets.star),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {},
              icon: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6000),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset:  Offset(1, 2)
                      )
                    ],
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: AppColors.white,
                  size: 25.0,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5000),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    offset:  Offset(1, 2)
                  )
                ]
              ),
              child: Image.asset(
                AppAssets.favourite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
