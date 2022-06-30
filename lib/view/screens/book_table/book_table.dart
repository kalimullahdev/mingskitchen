import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_restaurant/data/model/response/booktable_model.dart';
import 'package:flutter_restaurant/helper/responsive_helper.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/provider/book_table_provider.dart';
import 'package:flutter_restaurant/utill/color_resources.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/view/base/custom_button.dart';
import 'package:flutter_restaurant/view/base/custom_snackbar.dart';
import 'package:flutter_restaurant/view/base/custom_text_field.dart';
import 'package:flutter_restaurant/view/base/web_app_bar.dart';
import 'package:flutter_restaurant/view/base/footer_view.dart';
import 'package:provider/provider.dart';

class BookTableScreen extends StatefulWidget {
  BookTableScreen();

  @override
  _BookTableScreenState createState() => _BookTableScreenState();
}

class _BookTableScreenState extends State<BookTableScreen> {
  final FocusNode _fullNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _dateFocus = FocusNode();
  final FocusNode _timeFocus = FocusNode();
  final FocusNode _noOfPeopleFocus = FocusNode();
  final FocusNode _specialRequestFocus = FocusNode();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _specialRequestController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _noOfPeopleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _specialRequestController.dispose();
    _noOfPeopleController.dispose();
    _dateController.dispose();
    _timeController.dispose();

    super.dispose();
  }

  void setDate(DateTime date) {
    final String month =
        date.month < 10 ? '0' + date.month.toString() : date.month.toString();
    setState(
      () {
        _dateController.text = "${date.year}-$month-${date.day}";
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: ResponsiveHelper.isDesktop(context)
          ? PreferredSize(
              child: WebAppBar(), preferredSize: Size.fromHeight(100))
          : null,
      body: Consumer<BookTableProvider>(
        builder: (context, bookTableProvider, child) => SafeArea(
          child: Scrollbar(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                    child: Center(
                      child: Container(
                        width: _width > 700 ? 700 : _width,
                        padding: _width > 700
                            ? EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT)
                            : null,
                        decoration: _width > 700
                            ? BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 5,
                                      spreadRadius: 1)
                                ],
                              )
                            : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                getTranslated('book_table', context),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(
                                        fontSize: 24,
                                        color:
                                            ColorResources.getGreyBunkerColor(
                                                context)),
                              ),
                            ),
                            SizedBox(height: 20),

                            Text(
                              "Your name",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                      color:
                                          ColorResources.getHintColor(context)),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              hintText: 'John Doe',
                              isShowBorder: true,
                              controller: _fullNameController,
                              focusNode: _fullNameFocus,
                              nextFocus: _emailFocus,
                              inputType: TextInputType.name,
                              capitalization: TextCapitalization.words,
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                            Text(
                              "Your email",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                      color:
                                          ColorResources.getHintColor(context)),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              hintText: 'name12@example.com',
                              isShowBorder: true,
                              controller: _emailController,
                              focusNode: _emailFocus,
                              nextFocus: _phoneFocus,
                              inputType: TextInputType.emailAddress,
                              capitalization: TextCapitalization.words,
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                            Text(
                              "Phone number",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                      color:
                                          ColorResources.getHintColor(context)),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              hintText: '+94 123 4567890',
                              isShowBorder: true,
                              controller: _phoneNumberController,
                              focusNode: _phoneFocus,
                              nextFocus: _dateFocus,
                              inputType: TextInputType.phone,
                              capitalization: TextCapitalization.words,
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                            Text(
                              "Choice date",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                    color: ColorResources.getHintColor(context),
                                  ),
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              onTap: () {
                                DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime(2018, 3, 5),
                                  maxTime: DateTime(2025, 6, 7),
                                  onChanged: (date) {
                                    setDate(date);
                                  },
                                  onConfirm: (date) {
                                    setDate(date);
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en,
                                );
                              },
                              hintText: '04/19/2022',
                              isShowBorder: true,
                              controller: _dateController,
                              focusNode: _dateFocus,
                              nextFocus: _timeFocus,
                              inputType: TextInputType.datetime,
                              capitalization: TextCapitalization.words,
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                            Text(
                              "Choice time",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                    color: ColorResources.getHintColor(context),
                                  ),
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              onTap: () {
                                DatePicker.showTimePicker(
                                  context,
                                  onChanged: (time) {
                                    setTime(time);
                                  },
                                  onConfirm: (time) {
                                    setTime(time);
                                  },
                                );
                              },
                              hintText: '09:34:05',
                              isShowBorder: true,
                              controller: _timeController,
                              focusNode: _timeFocus,
                              nextFocus: _noOfPeopleFocus,
                              inputType: TextInputType.datetime,
                              capitalization: TextCapitalization.words,
                            ),

                            SizedBox(height: 22),

                            Text(
                              "Number of Peoples",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                      color:
                                          ColorResources.getHintColor(context)),
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              hintText: '12',
                              isShowBorder: true,
                              controller: _noOfPeopleController,
                              focusNode: _noOfPeopleFocus,
                              nextFocus: _specialRequestFocus,
                              inputType: TextInputType.number,
                              capitalization: TextCapitalization.words,
                            ),

                            Text(
                              "Special Request",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                      color:
                                          ColorResources.getHintColor(context)),
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              hintText: 'Special Request',
                              isShowBorder: true,
                              controller: _specialRequestController,
                              focusNode: _specialRequestFocus,
                              inputType: TextInputType.text,
                              capitalization: TextCapitalization.words,
                            ),

                            SizedBox(height: 22),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     authProvider.registrationErrorMessage.length > 0
                            //         ? CircleAvatar(
                            //             backgroundColor:
                            //                 Theme.of(context).primaryColor,
                            //             radius: 5)
                            //         : SizedBox.shrink(),
                            //     SizedBox(width: 8),
                            //     Expanded(
                            //       child: Text(
                            //         authProvider.registrationErrorMessage ?? "",
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .headline2
                            //             .copyWith(
                            //               fontSize: Dimensions.FONT_SIZE_SMALL,
                            //               color: Theme.of(context).primaryColor,
                            //             ),
                            //       ),
                            //     )
                            //   ],
                            // ),

                            // for signup button
                            SizedBox(height: 10),
                            CustomButton(
                              btnTxt: "BOOK NOW",
                              onTap: () async {
                                String _fullName =
                                    _fullNameController.text.trim();
                                String _email = _emailController.text.trim();
                                String _date = _dateController.text.trim();
                                String _time = _dateController.text.trim();
                                String _noOfPeople =
                                    _noOfPeopleController.text.trim();
                                String _specialRequest =
                                    _specialRequestController.text.trim();
                                if (_fullName.isEmpty) {
                                  showCustomSnackBar(
                                    "Enter your name",
                                    context,
                                  );
                                } else if (_email.isEmpty) {
                                  showCustomSnackBar(
                                    "Enter your email",
                                    context,
                                  );
                                } else if (_date.isEmpty) {
                                  showCustomSnackBar(
                                    "Select the date",
                                    context,
                                  );
                                } else if (_noOfPeople.isEmpty) {
                                  showCustomSnackBar(
                                      'Enter number of peoples', context);
                                } else if (_specialRequest.length < 6) {
                                  showCustomSnackBar(
                                    'Enter special request',
                                    context,
                                  );
                                } else if (_date.length < 6) {
                                  showCustomSnackBar(
                                    'Choose date',
                                    context,
                                  );
                                } else if (_time.length < 6) {
                                  showCustomSnackBar(
                                    'Choose time',
                                    context,
                                  );
                                } else {
                                  ApiResponse apiResponse =
                                      await bookTableProvider.bookTableRepo
                                          .booktable(
                                    BookTableModel(
                                      name: _fullNameController.text,
                                      email: _emailController.text,
                                      phone: _phoneNumberController.text,
                                      no_of_person: _noOfPeopleController.text,
                                      date: _dateController.text,
                                      time: _timeController.text,
                                      message: _specialRequestController.text,
                                    ),
                                  );

                                  // ResponseModel responseModel;
                                  if (apiResponse.response != null &&
                                      apiResponse.response.statusCode == 200) {
                                    showCustomSnackBar(
                                      'Table booked successful',
                                      context,
                                      isError: false,
                                    );
                                    // Map map = apiResponse.response.data;
                                    // responseModel =
                                    //     ResponseModel(true, 'successful');
                                  } else {
                                    String errorMessage;
                                    if (apiResponse.error is String) {
                                      errorMessage =
                                          apiResponse.error.toString();
                                    } else {
                                      showCustomSnackBar(
                                        'Failed to book a table',
                                        context,
                                      );
                                    }
                                  }

                                  // SignUpModel signUpModel = SignUpModel(
                                  //   fName: _fullName,
                                  //   lName: _email,
                                  //   email: _email,
                                  //   password: _password,
                                  //   phone: '+' + widget.email.trim(),
                                  // );
                                  // authProvider
                                  //     .registration(signUpModel)
                                  //     .then((status) async {
                                  //   if (status.isSuccess) {
                                  //     await Provider.of<
                                  //                 WishListProvider>(
                                  //             context,
                                  //             listen: false)
                                  //         .initWishList(
                                  //       context,
                                  //       Provider.of<LocalizationProvider>(
                                  //               context,
                                  //               listen: false)
                                  //           .locale
                                  //           .languageCode,
                                  //     );
                                  //     Navigator.pushNamedAndRemoveUntil(
                                  //         context,
                                  //         Routes.getMainRoute(),
                                  //         (route) => false);
                                  //   }
                                  // });
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (ResponsiveHelper.isDesktop(context)) FooterView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setTime(DateTime time) {
    setState(() {
      _timeController.text = "${time.hour}:${time.minute}:${time.second}";
    });
  }
}
