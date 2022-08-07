import 'package:flutter/material.dart';
import 'package:flutter_restaurant/helper/product_type.dart';
import 'package:flutter_restaurant/helper/responsive_helper.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/provider/auth_provider.dart';
import 'package:flutter_restaurant/provider/banner_provider.dart';
import 'package:flutter_restaurant/provider/cart_provider.dart';
import 'package:flutter_restaurant/provider/category_provider.dart';
import 'package:flutter_restaurant/provider/localization_provider.dart';
import 'package:flutter_restaurant/provider/product_provider.dart';
import 'package:flutter_restaurant/provider/profile_provider.dart';
import 'package:flutter_restaurant/provider/set_menu_provider.dart';
import 'package:flutter_restaurant/provider/splash_provider.dart';
import 'package:flutter_restaurant/provider/theme_provider.dart';
import 'package:flutter_restaurant/utill/app_constants.dart';
import 'package:flutter_restaurant/utill/color_resources.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:flutter_restaurant/utill/routes.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:flutter_restaurant/view/base/footer_view.dart';
import 'package:flutter_restaurant/view/base/on_hover.dart';
import 'package:flutter_restaurant/view/base/pricing_table.dart';
import 'package:flutter_restaurant/view/base/title_widget.dart';
import 'package:flutter_restaurant/view/base/web_app_bar.dart';
import 'package:flutter_restaurant/view/screens/home/web/widget/category_web_view.dart';
import 'package:flutter_restaurant/view/screens/home/web/widget/set_menu_view_web.dart';
import 'package:flutter_restaurant/view/screens/home/widget/all_product_view.dart';
import 'package:flutter_restaurant/view/screens/home/widget/category_view.dart';
import 'package:flutter_restaurant/view/screens/home/widget/main_slider.dart';
import 'package:flutter_restaurant/view/screens/home/widget/product_view.dart';
import 'package:flutter_restaurant/view/screens/home/widget/set_menu_view.dart';
import 'package:flutter_restaurant/view/screens/menu/widget/options_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final bool fromAppBar;
  HomeScreen(this.fromAppBar);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> drawerGlobalKey = GlobalKey();

  Future<void> _loadData(BuildContext context, bool reload) async {
    if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
      Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
    }
    if (reload) {
      print(
          'offset : ${Provider.of<ProductProvider>(context, listen: false).offset}');
      Provider.of<ProductProvider>(context, listen: false).seeMoreReturn();

      Provider.of<CategoryProvider>(context, listen: false).getCategoryList(
        context,
        true,
        Provider.of<LocalizationProvider>(context, listen: false)
            .locale
            .languageCode,
      );
      Provider.of<SetMenuProvider>(context, listen: false).getSetMenuList(
        context,
        reload,
        Provider.of<LocalizationProvider>(context, listen: false)
            .locale
            .languageCode,
      );

      Provider.of<ProductProvider>(context, listen: false)
          .getPopularProductList(
        context,
        reload,
        Provider.of<ProductProvider>(context, listen: false).offset.toString(),
        Provider.of<LocalizationProvider>(context, listen: false)
            .locale
            .languageCode,
      );
      Provider.of<BannerProvider>(context, listen: false)
          .getBannerList(context, reload);
      Provider.of<CategoryProvider>(context, listen: true)
          .getAllCategoryProductList(
        context,
        reload,
        Provider.of<LocalizationProvider>(context, listen: false)
            .locale
            .languageCode,
      );
    } else {
      Provider.of<CategoryProvider>(context, listen: false).getCategoryList(
        context,
        true,
        Provider.of<LocalizationProvider>(context, listen: false)
            .locale
            .languageCode,
      );

      Provider.of<SetMenuProvider>(context, listen: false).getSetMenuList(
        context,
        reload,
        Provider.of<LocalizationProvider>(context, listen: false)
            .locale
            .languageCode,
      );
      Provider.of<BannerProvider>(context, listen: false)
          .getBannerList(context, reload);
      await Future.delayed(Duration(seconds: 5));
      Provider.of<CategoryProvider>(context, listen: false)
          .getAllCategoryProductList(
        context,
        reload,
        Provider.of<LocalizationProvider>(context, listen: false)
            .locale
            .languageCode,
      );
    }
  }

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).seeMoreReturn();
    if (!widget.fromAppBar ||
        Provider.of<CategoryProvider>(context, listen: false).categoryList ==
            null) {
      _loadData(context, false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      key: drawerGlobalKey,
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: ResponsiveHelper.isDesktop(context)
          ? Theme.of(context).cardColor
          : ColorResources.getBackgroundColor(context),
      drawer: ResponsiveHelper.isTab(context)
          ? Drawer(child: OptionsView(onTap: null))
          : SizedBox(),
      appBar: ResponsiveHelper.isDesktop(context)
          ? PreferredSize(
              child: WebAppBar(),
              preferredSize: Size.fromHeight(100),
            )
          : null,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            Provider.of<ProductProvider>(context, listen: false).offset = 1;
            await _loadData(context, true);
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: Scrollbar(
            controller: _scrollController,
            child: CustomScrollView(controller: _scrollController, slivers: [
              // AppBar
              ResponsiveHelper.isDesktop(context)
                  ? SliverToBoxAdapter(child: SizedBox())
                  : SliverAppBar(
                      floating: true,
                      elevation: 0,
                      centerTitle: false,
                      automaticallyImplyLeading: false,
                      backgroundColor: Theme.of(context).cardColor,
                      pinned: ResponsiveHelper.isTab(context) ? true : false,
                      leading: ResponsiveHelper.isTab(context)
                          ? IconButton(
                              onPressed: () =>
                                  drawerGlobalKey.currentState.openDrawer(),
                              icon: Icon(Icons.menu, color: Colors.black),
                            )
                          : null,
                      title: Consumer<SplashProvider>(
                          builder: (context, splash, child) => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ResponsiveHelper.isWeb()
                                      ? FadeInImage.assetNetwork(
                                          placeholder:
                                              Images.placeholder_rectangle,
                                          height: 40,
                                          width: 40,
                                          image: splash.baseUrls != null
                                              ? '${splash.baseUrls.restaurantImageUrl}/${splash.configModel.restaurantLogo}'
                                              : '',
                                          imageErrorBuilder: (c, o, s) =>
                                              Image.asset(
                                                  Images.placeholder_rectangle,
                                                  height: 40,
                                                  width: 40),
                                        )
                                      : Image.asset(Images.logo,
                                          width: 40, height: 40),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      ResponsiveHelper.isWeb()
                                          ? splash.configModel.restaurantName
                                          : AppConstants.APP_NAME,
                                      style: rubikBold.copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              )),
                      actions: [
                        IconButton(
                          onPressed: () => Navigator.pushNamed(
                              context, Routes.getNotificationRoute()),
                          icon: Icon(Icons.notifications,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
                        ),
                        ResponsiveHelper.isTab(context)
                            ? IconButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, Routes.getDashboardRoute('cart')),
                                icon: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Icon(Icons.shopping_cart,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .color),
                                    Positioned(
                                      top: -10,
                                      right: -10,
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red),
                                        child: Center(
                                          child: Text(
                                            Provider.of<CartProvider>(context)
                                                .cartList
                                                .length
                                                .toString(),
                                            style: rubikMedium.copyWith(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),

              // Search Button
              if (!ResponsiveHelper.isWeb())
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverDelegate(
                    child: Center(
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, Routes.getSearchRoute()),
                        child: Container(
                          height: 60,
                          width: 1170,
                          color: Theme.of(context).cardColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_SMALL,
                              vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorResources.getSearchBg(context),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          Dimensions.PADDING_SIZE_SMALL),
                                  child: Icon(Icons.search, size: 25)),
                              Expanded(
                                child: Text(
                                  getTranslated('search_items_here', context),
                                  style: rubikRegular.copyWith(fontSize: 12),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        // width: 1170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainSlider(),
                            ResponsiveHelper.isDesktop(context)
                                ? CategoryViewWeb()
                                : CategoryView(),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            Center(
                              child: SizedBox(
                                width:
                                    Dimensions.getScreeenSize(context).width *
                                        0.86,
                                child: AllProductView(),
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            ResponsiveHelper.isMobile(context)
                                ? SizedBox()
                                : Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height:
                                              Dimensions.PADDING_SIZE_DEFAULT,
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5) *
                                              4,
                                          child: GridView(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal:
                                                  Dimensions.PADDING_SIZE_LARGE,
                                            ),
                                            shrinkWrap: true,
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 300,
                                              mainAxisExtent: 270,
                                              mainAxisSpacing: 20,
                                              crossAxisSpacing: 10,
                                            ),
                                            children: [
                                              ServiceCard(
                                                title: "Master Chefs",
                                                iconData: Icons.person,
                                                description:
                                                    "Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam",
                                              ),
                                              ServiceCard(
                                                title: "Quality Food",
                                                iconData: Icons.fastfood,
                                                description:
                                                    "Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam",
                                              ),
                                              ServiceCard(
                                                title: "Online Order",
                                                iconData: Icons.shopping_cart,
                                                description:
                                                    "Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam",
                                              ),
                                              ServiceCard(
                                                title: "24/7 Service",
                                                iconData: Icons.headphones,
                                                description:
                                                    "Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                            ),

                            ResponsiveHelper.isDesktop(context)
                                ? Center(
                                    child: SizedBox(
                                      width: Dimensions.getScreeenSize(context)
                                              .width *
                                          0.86,
                                      child: SetMenuViewWeb(),
                                    ),
                                  )
                                : SetMenuView(),
                            // ResponsiveHelper.isDesktop(context)
                            //     ? SizedBox()
                            //     : BannerView(),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                            ),
                            PricingTable(),
                            ResponsiveHelper.isDesktop(context)
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 20),
                                        child: Text(
                                          getTranslated(
                                              'popular_item', context),
                                          style: rubikRegular.copyWith(
                                            fontSize:
                                                Dimensions.FONT_SIZE_OVER_LARGE,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 20, 10, 10),
                                    child: TitleWidget(
                                        title: getTranslated(
                                            'popular_item', context)),
                                  ),

                            Center(
                              child: SizedBox(
                                width:
                                    Dimensions.getScreeenSize(context).width *
                                        0.86,
                                child: ProductView(
                                  productType: ProductType.POPULAR_PRODUCT,
                                  scrollController: _scrollController,
                                ),
                              ),
                            ),

                            ResponsiveHelper.isMobile(context)
                                ? SizedBox()
                                : Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: '____   ',
                                            style: TextStyle(
                                              fontSize: Dimensions
                                                  .FONT_SIZE_OVER_TOO_LARGE,
                                              color: ColorResources
                                                  .APPBAR_HEADER_COL0R,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Team Members',
                                                style: dancingScriptRegular,
                                              ),
                                              TextSpan(text: '   _____'),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "Our Master Chefs",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: Dimensions
                                                .FONT_SIZE_OVER_TOO_LARGE,
                                          ),
                                        ),
                                        SizedBox(
                                          height: Dimensions
                                              .PADDING_SIZE_EXTRA_LARGE,
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5) *
                                              4,
                                          child: GridView.builder(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal:
                                                  Dimensions.PADDING_SIZE_LARGE,
                                            ),
                                            shrinkWrap: true,
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 300,
                                              mainAxisExtent: 340,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                            ),
                                            itemCount: 4,
                                            itemBuilder: (context, index) {
                                              return TeamMemberWidget();
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                            height: Dimensions
                                                .PADDING_SIZE_DEFAULT),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      if (ResponsiveHelper.isDesktop(context)) FooterView(),
                    ],
                  ),
                ),
              ),
              //  if(ResponsiveHelper.isDesktop(context)) FooterView(),
            ]),
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData iconData;
  const ServiceCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (bool isHovered) {
        return Card(
          color: isHovered
              ? ColorResources.APPBAR_HEADER_COL0R
              : Provider.of<ThemeProvider>(context).darkTheme
                  ? Color(0xFF494949)
                  : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 60,
                  color: isHovered
                      ? ColorResources.COLOR_WHITE
                      : ColorResources.APPBAR_HEADER_COL0R,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                Text(
                  title,
                  style: rubikRegular.copyWith(
                    color: isHovered
                        ? ColorResources.COLOR_WHITE
                        : ColorResources.COLOR_BLACK,
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                Text(
                  description,
                  style: rubikRegular.copyWith(
                    color: isHovered
                        ? ColorResources.COLOR_WHITE
                        : ColorResources.COLOR_BLACK,
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
//ResponsiveHelper

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 60 ||
        oldDelegate.minExtent != 60 ||
        child != oldDelegate.child;
  }
}

class TeamMemberWidget extends StatefulWidget {
  @override
  _TeamMemberWidgetState createState() => _TeamMemberWidgetState();
}

class _TeamMemberWidgetState extends State<TeamMemberWidget> {
  double elevation = 4.0;
  double scale = 1.0;
  bool isHover = false;
  double opacity = 0.0;
  @override
  Widget build(context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
        if (value) {
          setState(() {
            opacity = 1;
            elevation = 20.0;
            scale = 1.2;
          });
        } else {
          setState(() {
            opacity = 0;
            elevation = 4.0;
            scale = 1;
          });
        }
      },
      child: Card(
        elevation: 1.5,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            SizedBox(
              width: 180,
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: AnimatedScale(
                  scale: scale,
                  duration: Duration(
                    milliseconds: 500,
                  ),
                  child: Material(
                    elevation: elevation,
                    child: Image.network(
                      'https://technext.github.io/restoran/img/team-1.jpg',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            Text(
              "Full Name",
              style: rubikRegular.copyWith(
                fontSize: Dimensions.FONT_SIZE_LARGE,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Text(
              "Designation",
              style: rubikRegular.copyWith(
                fontSize: Dimensions.FONT_SIZE_DEFAULT,
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: opacity,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 28,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.orange,
                          ),
                          child: Icon(
                            FontAwesomeIcons.facebook,
                            size: 18,
                            color: ColorResources.COLOR_WHITE,
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 28,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.orange,
                          ),
                          child: Icon(
                            FontAwesomeIcons.twitter,
                            size: 18,
                            color: ColorResources.COLOR_WHITE,
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        width: 28,
                        height: 37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.orange,
                        ),
                        child: Icon(
                          FontAwesomeIcons.instagram,
                          size: 18,
                          color: ColorResources.COLOR_WHITE,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
