import 'package:flutter/material.dart';
import 'package:flutter_restaurant/helper/responsive_helper.dart';
import 'package:flutter_restaurant/provider/category_provider.dart';
import 'package:flutter_restaurant/provider/product_provider.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/view/base/product_shimmer.dart';
import 'package:flutter_restaurant/view/base/product_widget.dart';
import 'package:flutter_restaurant/view/screens/home/web/widget/product_web_card_shimmer.dart';
import 'package:flutter_restaurant/view/screens/home/web/widget/product_widget_web.dart';
import 'package:provider/provider.dart';

class AllProductView extends StatefulWidget {
  @override
  State<AllProductView> createState() => _AllProductViewState();
}

class _AllProductViewState extends State<AllProductView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Consumer<CategoryProvider>(
      builder: (context, category, child) {
        return Column(children: [
          category.allcategoryProductList != null
              ? category.allcategoryProductList.length > 0
                  ? GridView.builder(
                      gridDelegate: ResponsiveHelper.isDesktop(context)
                          ? SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              mainAxisExtent: 330,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            )
                          : SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 3.5,
                              crossAxisCount:
                                  ResponsiveHelper.isTab(context) ? 2 : 1,
                            ),
                      itemCount: category.allcategoryProductList.length,
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ResponsiveHelper.isDesktop(context)
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ProductWidgetWeb(
                                    product:
                                        category.allcategoryProductList[index]),
                              )
                            : ProductWidget(
                                product:
                                    category.allcategoryProductList[index]);
                      },
                    )
                  : SizedBox()
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
                          childAspectRatio: 4,
                          crossAxisCount: ResponsiveHelper.isDesktop(context)
                              ? 3
                              : ResponsiveHelper.isTab(context)
                                  ? 2
                                  : 1),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return ResponsiveHelper.isDesktop(context)
                        ? ProductWidgetWebShimmer()
                        : ProductShimmer(
                            isEnabled: category.allcategoryProductList == null,
                          );
                  },
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_SMALL,
                  ),
                ),
          SizedBox(height: 30),
        ]);
      },
    );
  }
}
