import 'package:flutter/material.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/color_resources.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/routes.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:flutter_restaurant/view/base/on_hover.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterView extends StatelessWidget {
  const FooterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _newsLetterController = TextEditingController();
    return Theme(
      data: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: ColorResources.COLOR_WHITE,
          ),
        ),
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: ColorResources.COLOR_WHITE),
        child: Container(
          color: ColorResources.getFooterColor(context),
          width: double.maxFinite,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: Dimensions.WEB_SCREEN_WIDTH,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_LARGE * 2),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    getTranslated('company', context),
                                    style: dancingScriptRegular,
                                  ),
                                  Text(
                                    " __",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize:
                                          Dimensions.FONT_SIZE_OVER_TOO_LARGE,
                                      color: ColorResources.APPBAR_HEADER_COL0R,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_LARGE),
                              OnHover(builder: (hovered) {
                                return InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, Routes.getAboutUsRoute()),
                                    child: Text(
                                        ">   " +
                                            getTranslated('about_us', context),
                                        style: hovered
                                            ? robotoRegular.copyWith(
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.6,
                                              )
                                            : rubikRegular.copyWith(
                                                color:
                                                    ColorResources.COLOR_WHITE,
                                                fontSize: Dimensions
                                                    .FONT_SIZE_DEFAULT)));
                              }),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                              OnHover(builder: (hovered) {
                                return InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.getSupportRoute()),
                                  child: Text(
                                    ">   " +
                                        getTranslated(
                                          'contact_us',
                                          context,
                                        ),
                                    style: hovered
                                        ? robotoRegular.copyWith(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.6,
                                          )
                                        : rubikRegular.copyWith(
                                            color: ColorResources.COLOR_WHITE,
                                            fontSize:
                                                Dimensions.FONT_SIZE_DEFAULT),
                                  ),
                                );
                              }),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                              OnHover(builder: (hovered) {
                                return InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, Routes.getPolicyRoute()),
                                    child: Text(
                                        ">   " +
                                            getTranslated(
                                                'privacy_policy', context),
                                        style: hovered
                                            ? robotoRegular.copyWith(
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.6,
                                              )
                                            : rubikRegular.copyWith(
                                                color:
                                                    ColorResources.COLOR_WHITE,
                                                fontSize: Dimensions
                                                    .FONT_SIZE_DEFAULT)));
                              }),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                              OnHover(builder: (hovered) {
                                return InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, Routes.getTermsRoute()),
                                    child: Text(
                                        ">   " +
                                            getTranslated(
                                              'terms_and_condition',
                                              context,
                                            ),
                                        style: hovered
                                            ? robotoRegular.copyWith(
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.6,
                                              )
                                            : rubikRegular.copyWith(
                                                color:
                                                    ColorResources.COLOR_WHITE,
                                                fontSize: Dimensions
                                                    .FONT_SIZE_DEFAULT)));
                              }),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_LARGE * 2),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    getTranslated('contact', context),
                                    style: dancingScriptRegular,
                                  ),
                                  Text(
                                    " __",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize:
                                          Dimensions.FONT_SIZE_OVER_TOO_LARGE,
                                      color: ColorResources.APPBAR_HEADER_COL0R,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_LARGE),
                              OnHover(builder: (hovered) {
                                return InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.getPolicyRoute()),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: ColorResources.COLOR_WHITE,
                                        size: Dimensions.FONT_SIZE_LARGE,
                                      ),
                                      SizedBox(
                                        width: Dimensions.PADDING_SIZE_SMALL,
                                      ),
                                      Text(
                                        "6 Yukon Drive Raeford, NC 28376",
                                        style: hovered
                                            ? robotoRegular.copyWith(
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.6,
                                              )
                                            : rubikRegular.copyWith(
                                                color:
                                                    ColorResources.COLOR_WHITE,
                                                fontSize: Dimensions
                                                    .FONT_SIZE_DEFAULT),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                              OnHover(builder: (hovered) {
                                return InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.getPolicyRoute()),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.phone_android,
                                        color: ColorResources.COLOR_WHITE,
                                        size: Dimensions.FONT_SIZE_LARGE,
                                      ),
                                      SizedBox(
                                        width: Dimensions.PADDING_SIZE_SMALL,
                                      ),
                                      Text(
                                        "(530) 625-9694",
                                        style: hovered
                                            ? robotoRegular.copyWith(
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.6,
                                              )
                                            : rubikRegular.copyWith(
                                                color:
                                                    ColorResources.COLOR_WHITE,
                                                fontSize: Dimensions
                                                    .FONT_SIZE_DEFAULT),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                              OnHover(builder: (hovered) {
                                return InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.getPolicyRoute()),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: ColorResources.COLOR_WHITE,
                                        size: Dimensions.FONT_SIZE_LARGE,
                                      ),
                                      SizedBox(
                                        width: Dimensions.PADDING_SIZE_SMALL,
                                      ),
                                      Text(
                                        "info@example.com",
                                        style: hovered
                                            ? robotoRegular.copyWith(
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.6,
                                              )
                                            : rubikRegular.copyWith(
                                                color:
                                                    ColorResources.COLOR_WHITE,
                                                fontSize: Dimensions
                                                    .FONT_SIZE_DEFAULT),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [],
                              ),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_LARGE * 2),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    getTranslated('opening', context),
                                    style: dancingScriptRegular,
                                  ),
                                  Text(
                                    " __",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize:
                                          Dimensions.FONT_SIZE_OVER_TOO_LARGE,
                                      color: ColorResources.APPBAR_HEADER_COL0R,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_LARGE),
                              Text(
                                "Monday - Saturday",
                                style: rubikRegular.copyWith(
                                  color: ColorResources.COLOR_WHITE,
                                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                                ),
                              ),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                              Text(
                                "5:00 AM-11:00 PM",
                                style: rubikRegular.copyWith(
                                  color: ColorResources.COLOR_WHITE_GRAY,
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                ),
                              ),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                              Text(
                                getTranslated("download_our_apps", context),
                                style: rubikRegular.copyWith(
                                  color: ColorResources.COLOR_WHITE,
                                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                                ),
                              ),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                              Row(
                                children: [
                                  SizedBox.fromSize(
                                    size:
                                        Size(40, 40), // button width and height
                                    child: ClipOval(
                                      child: Material(
                                        color: Theme.of(context)
                                            .primaryColor, // button color
                                        child: InkWell(
                                          splashColor: ColorResources
                                              .APPBAR_HEADER_COL0R, // splash color
                                          onTap: () {}, // button pressed
                                          child: Icon(
                                            Icons.android_rounded,
                                            color: ColorResources.COLOR_WHITE,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: Dimensions.PADDING_SIZE_DEFAULT),
                                  SizedBox.fromSize(
                                    size:
                                        Size(40, 40), // button width and height
                                    child: ClipOval(
                                      child: Material(
                                        color: Theme.of(context)
                                            .primaryColor, // button color
                                        child: InkWell(
                                          splashColor: ColorResources
                                              .APPBAR_HEADER_COL0R, // splash color
                                          onTap: () {}, // button pressed
                                          child: Icon(
                                            Icons.mobile_screen_share,
                                            color: ColorResources.COLOR_WHITE,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_LARGE * 2),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    getTranslated('newsletter', context),
                                    style: dancingScriptRegular,
                                  ),
                                  Text(
                                    " __",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize:
                                          Dimensions.FONT_SIZE_OVER_TOO_LARGE,
                                      color: ColorResources.APPBAR_HEADER_COL0R,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_LARGE),
                              Text(
                                  getTranslated(
                                      'newsletter_description', context),
                                  style: rubikRegular.copyWith(
                                      color: ColorResources.COLOR_WHITE_GRAY,
                                      fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                              OnHover(builder: (hovered) {
                                return InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, Routes.getSupportRoute()),
                                    child: Text(
                                        ">   " +
                                            getTranslated(
                                                'drive_for_us', context),
                                        style: hovered
                                            ? robotoRegular.copyWith(
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.6,
                                              )
                                            : rubikRegular.copyWith(
                                                color:
                                                    ColorResources.COLOR_WHITE,
                                                fontSize: Dimensions
                                                    .FONT_SIZE_DEFAULT)));
                              }),
                              const SizedBox(
                                  height: Dimensions.PADDING_SIZE_DEFAULT),
                            ],
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child:
                      Divider(thickness: .1, color: ColorResources.COLOR_WHITE),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 500.0,
                      child: Text(
                          "©Copyright 2022 Mings Kitchen- All Right reserved! Developed By DeelComm",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        OnHover(builder: (hovered) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.getProfileRoute());
                            },
                            child: Text(
                              getTranslated('profile', context),
                              style: hovered
                                  ? robotoRegular.copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                    )
                                  : rubikRegular.copyWith(
                                      color: ColorResources.COLOR_WHITE,
                                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                            ),
                          );
                        }),
                        const SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                        OnHover(builder: (hovered) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.getAddressRoute());
                              },
                              child: Text(getTranslated('address', context),
                                  style: hovered
                                      ? robotoRegular.copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                        )
                                      : rubikRegular.copyWith(
                                          color: ColorResources.COLOR_WHITE,
                                          fontSize:
                                              Dimensions.FONT_SIZE_DEFAULT)));
                        }),
                        const SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                        OnHover(builder: (hovered) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    Routes.getChatRoute(orderModel: null));
                              },
                              child: Text(getTranslated('live_chat', context),
                                  style: hovered
                                      ? robotoRegular.copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                        )
                                      : rubikRegular.copyWith(
                                          color: ColorResources.COLOR_WHITE,
                                          fontSize:
                                              Dimensions.FONT_SIZE_DEFAULT)));
                        }),
                        const SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                        OnHover(builder: (hovered) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.getDashboardRoute('order'));
                              },
                              child: Text(getTranslated('my_order', context),
                                  style: hovered
                                      ? robotoRegular.copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                        )
                                      : rubikRegular.copyWith(
                                          color: ColorResources.COLOR_WHITE,
                                          fontSize:
                                              Dimensions.FONT_SIZE_DEFAULT)));
                        }),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
