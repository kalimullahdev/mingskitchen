import 'package:flutter/material.dart';
import 'package:flutter_restaurant/data/model/response/product_model.dart';
import 'package:flutter_restaurant/helper/product_type.dart';
import 'package:flutter_restaurant/helper/responsive_helper.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/provider/localization_provider.dart';
import 'package:flutter_restaurant/provider/product_provider.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:flutter_restaurant/view/base/no_data_screen.dart';
import 'package:flutter_restaurant/view/base/product_shimmer.dart';
import 'package:flutter_restaurant/view/base/product_widget.dart';
import 'package:flutter_restaurant/view/screens/home/web/widget/product_web_card_shimmer.dart';
import 'package:flutter_restaurant/view/screens/home/web/widget/product_widget_web.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  final ProductType productType;
  final ScrollController scrollController;
  ProductView({@required this.productType, this.scrollController});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.productType == ProductType.POPULAR_PRODUCT) {
      Provider.of<ProductProvider>(context, listen: false)
          .getPopularProductList(
        context,
        true,
        '1',
        Provider.of<LocalizationProvider>(context, listen: false)
            .locale
            .languageCode,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    if (!ResponsiveHelper.isDesktop(context)) {
      widget.scrollController?.addListener(() {
        if (widget.scrollController.position.pixels ==
                widget.scrollController.position.maxScrollExtent &&
            Provider.of<ProductProvider>(context, listen: false)
                    .popularProductList !=
                null &&
            !Provider.of<ProductProvider>(context, listen: false).isLoading) {
          int pageSize;
          if (widget.productType == ProductType.POPULAR_PRODUCT) {
            pageSize = (Provider.of<ProductProvider>(context, listen: false)
                        .popularPageSize /
                    10)
                .ceil();
          }
          if (Provider.of<ProductProvider>(context, listen: false).offset <
              pageSize) {
            Provider.of<ProductProvider>(context, listen: false).offset++;
            Provider.of<ProductProvider>(context, listen: false)
                .showBottomLoader();
            Provider.of<ProductProvider>(context, listen: false)
                .getPopularProductList(
              context,
              false,
              Provider.of<ProductProvider>(context, listen: false)
                  .offset
                  .toString(),
              Provider.of<LocalizationProvider>(context, listen: false)
                  .locale
                  .languageCode,
            );
          }
        }
      });
    }
    return Consumer<ProductProvider>(
      builder: (context, prodProvider, child) {
        List<Product> productList;
        if (widget.productType == ProductType.POPULAR_PRODUCT) {
          productList = prodProvider.popularProductList;
        }

        return Column(children: [
          productList != null
              ? productList.length > 0
                  ? GridView.builder(
                      gridDelegate: ResponsiveHelper.isDesktop(context)
                          ? SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              mainAxisExtent: 330,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                            )
                          : SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 3.5,
                              crossAxisCount:
                                  ResponsiveHelper.isTab(context) ? 2 : 1,
                            ),
                      itemCount: productList.length,
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        // return Padding(
                        //   padding: const EdgeInsets.all(5.0),
                        //   child: ProductWidgetWeb(product: productList[index]),
                        // );
                        return ResponsiveHelper.isDesktop(context)
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ProductWidgetWeb(
                                    product: productList[index]),
                              )
                            : ProductWidget(product: productList[index]);
                      },
                    )
                  : NoDataScreen()
              : GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: ResponsiveHelper.isDesktop(context)
                      ? SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          mainAxisExtent: 330,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        )
                      : SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 3.5,
                          crossAxisCount:
                              ResponsiveHelper.isTab(context) ? 2 : 1,
                        ),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    // return ProductWidgetWebShimmer();
                    return ResponsiveHelper.isDesktop(context)
                        ? ProductWidgetWebShimmer()
                        : ProductShimmer(isEnabled: productList == null);
                  },
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_SMALL)),
          SizedBox(height: 30),
          productList != null
              ? Padding(
                  padding: ResponsiveHelper.isDesktop(context)
                      ? const EdgeInsets.only(top: 40, bottom: 70)
                      : const EdgeInsets.all(0),
                  child: ResponsiveHelper.isDesktop(context)
                      ? prodProvider.isLoading
                          ? Center(
                              child: Padding(
                              padding:
                                  EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor)),
                            ))
                          : (_productProvider.offset ==
                                  (Provider.of<ProductProvider>(context,
                                                  listen: false)
                                              .popularPageSize /
                                          10)
                                      .ceil())
                              ? SizedBox()
                              : SizedBox(
                                  width: 500,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    onPressed: () {
                                      _productProvider.moreProduct(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                          getTranslated('see_more', context),
                                          style: poppinsRegular.copyWith(
                                              fontSize: Dimensions
                                                  .FONT_SIZE_OVER_LARGE)),
                                    ),
                                  ),
                                )
                      : prodProvider.isLoading
                          ? Center(
                              child: Padding(
                              padding:
                                  EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor)),
                            ))
                          : SizedBox.shrink(),
                )
              : SizedBox.shrink(),
        ]);
      },
    );
  }
}
