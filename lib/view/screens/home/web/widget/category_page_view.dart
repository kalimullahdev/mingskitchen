import 'package:flutter/material.dart';
import 'package:flutter_restaurant/provider/category_provider.dart';
import 'package:flutter_restaurant/provider/localization_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/splash_provider.dart';
import '../../../../../utill/color_resources.dart';
import '../../../../../utill/dimensions.dart';
import '../../../../../utill/images.dart';
import '../../../../../utill/styles.dart';

class CategoryPageView extends StatelessWidget {
  final CategoryProvider categoryProvider;
  final PageController pageController;
  const CategoryPageView(
      {Key key, @required this.categoryProvider, @required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _totalPage = (categoryProvider.categoryList.length / 7).ceil();

    return PageView.builder(
      controller: pageController,
      itemCount: _totalPage,
      onPageChanged: (index) {
        categoryProvider.updateProductCurrentIndex(index, _totalPage);
      },
      itemBuilder: (context, index) {
        int _initialLength = 7;
        int currentIndex = 7 * index;

        // ignore: unnecessary_statements
        (index + 1 == _totalPage)
            ? _initialLength =
                categoryProvider.categoryList.length - (index * 7)
            : 7;
        return Center(
          child: ListView.builder(
            itemCount: _initialLength,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, item) {
              int _currentIndex = item + currentIndex;
              String _name = '';
              categoryProvider.categoryList[_currentIndex].name.length > 20
                  ? _name = categoryProvider.categoryList[_currentIndex].name
                          .substring(0, 20) +
                      ' ...'
                  : _name = categoryProvider.categoryList[_currentIndex].name;

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                child: InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Provider.of<CategoryProvider>(context, listen: false)
                        .getAllCategoryProductList(
                      context,
                      true,
                      Provider.of<LocalizationProvider>(context, listen: false)
                          .locale
                          .languageCode,
                      categoryProvider.categoryList[_currentIndex].id
                          .toString(),
                    );
                  },
                  child: Column(children: [
                    ClipOval(
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder_image,
                        width: 125,
                        height: 125,
                        fit: BoxFit.cover,
                        image: Provider.of<SplashProvider>(context,
                                        listen: false)
                                    .baseUrls !=
                                null
                            ? '${Provider.of<SplashProvider>(context, listen: false).baseUrls.categoryImageUrl}/${categoryProvider.categoryList[_currentIndex].image}'
                            : '',
                        imageErrorBuilder: (c, o, s) => Image.asset(
                            Images.placeholder_image,
                            width: 125,
                            height: 125,
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          child: Text(_name,
                              style: rubikMedium.copyWith(
                                color: ColorResources.getWhiteAndBlack(context),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
