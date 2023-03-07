import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/ui/main/cubit/main_state.dart';
import 'package:test_project/ui/main/widgets/rating_widget.dart';
import 'package:test_project/utils/colors.dart';
import '../../../data/models/api/response/Products/Products.dart';
import '../../../utils/widgets/app_alert_dialog.dart';

class ProductList extends StatefulWidget {
  final MainState state;
  const ProductList(this.state, {Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 74),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          itemCount: widget.state.allProducts!.length,
          itemBuilder: (BuildContext context, int index) {
            return product(index, widget.state);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3.0 / 4.0,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 65,
              color: AppColors.backgroundColorApp,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Special offers', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18)),
                    Text('The best prices', style: GoogleFonts.poppins(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget product(int index, MainState state) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26.withOpacity(0.08),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 6)),
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: Material(
          // color: Colors.transparent,
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () =>
                ///TODO: Go to product information by index
                Navigator.of(context).push(PageRouteBuilder(
                    barrierColor: Colors.black.withOpacity(0.6),
                    opaque: false,
                    pageBuilder: (context, _, __) => AppAlertDialog(
                        context,
                        'Sorry',
                        'but this feature is currently unavailable!'))),
            child: Stack(
              children: [
                ///TODO
                Center(
                    child: Container(
                  padding: const EdgeInsets.only(bottom: 68),
                  child: Image.network(
                    state.allProducts![index].image!,
                  ),
                )),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.allProducts![index].title!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                            ),
                            ratingWidget(index, state)!,
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$ ${state.allProducts![index].price!}',
                                  style: const TextStyle(color: Colors.black)),
                              const SizedBox(width: 42),
                              Material(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  onTap: () {
                                    favoriteStatus(state.allProducts![index]);
                                  },
                                  child: state.allProducts![index].status ==
                                          FavoriteStatus.none
                                      ? const Icon(
                                          Icons.favorite_border,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  favoriteStatus(Products products) {
    if (products.status == FavoriteStatus.none) {
      setState(() {
        products.status = FavoriteStatus.favorite;
      });
      return null;
    } else if (products.status == FavoriteStatus.favorite) {
      setState(() {
        products.status = FavoriteStatus.none;
      });
      return null;
    }
  }
}
