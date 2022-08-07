import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PricingTable extends StatelessWidget {
  const PricingTable({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Container(
            width: 285,
            height: 460,
            color: Color(0xffF1FAEE),
            margin: EdgeInsets.only(top: 20),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Basic",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          height: 1.39,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            r"$49",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 54,
                              height: 1.66,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 14),
                          Text(
                            "/ month",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.66,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(
                        "This plan is the best for individuals who are getting started",
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.65,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 24),
                      _CheckboxWithTitle(title: "15 Files"),
                      SizedBox(height: 26),
                      _CheckboxWithTitle(title: "10 GB Storage"),
                      SizedBox(height: 26),
                      _CheckboxWithTitle(title: " Email Support"),
                      SizedBox(height: 35),
                      Container(
                        width: 220,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xff023047),
                        ),
                        child: Center(
                          child: Text(
                            "Choose Plan",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SvgPicture.asset(
                    "assets/svgs/pricing_table_card.svg",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 285,
            height: 500,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: 285,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        color: Color(0xffEF476F),
                      ),
                      child: Text(
                        "Best Value",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        color: Color(0xff023047),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Professional",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              height: 1.39,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                r"$99",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 54,
                                  height: 1.66,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 14),
                              Text(
                                "/ month",
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.66,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          Text(
                            "This plan is for businesses that are getting started",
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.65,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 24),
                          _CheckboxWithTitle(
                            title: "Unlimited Files",
                            color: Colors.white,
                          ),
                          SizedBox(height: 26),
                          _CheckboxWithTitle(
                            title: "25 GB Storage",
                            color: Colors.white,
                          ),
                          SizedBox(height: 26),
                          _CheckboxWithTitle(
                            title: "Phone Support",
                            color: Colors.white,
                          ),
                          SizedBox(height: 35),
                          Container(
                            width: 220,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xffFFD166),
                            ),
                            child: Center(
                              child: Text(
                                "Choose Plan",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  height: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: SvgPicture.asset(
                    "assets/svgs/pricing_table_card.svg",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 285,
            height: 460,
            color: Color(0xffF1FAEE),
            margin: EdgeInsets.only(top: 20),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Business",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          height: 1.39,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            r"$149",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 54,
                              height: 1.66,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 14),
                          Text(
                            "/ month",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.66,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(
                        "This plan is the best for large businesses",
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.65,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 24),
                      _CheckboxWithTitle(title: "Unlimited Files"),
                      SizedBox(height: 26),
                      _CheckboxWithTitle(title: "Unlimited Storage"),
                      SizedBox(height: 26),
                      _CheckboxWithTitle(title: "Phone Support"),
                      SizedBox(height: 35),
                      Container(
                        width: 220,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xff023047),
                        ),
                        child: Center(
                          child: Text(
                            "Choose Plan",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SvgPicture.asset(
                    "assets/svgs/pricing_table_card.svg",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckboxWithTitle extends StatelessWidget {
  const _CheckboxWithTitle({
    Key key,
    @required this.title,
    this.color,
  }) : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff06D6A0),
          ),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 12,
          ),
        ),
        SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            height: 1.33,
            color: color != null ? color : Colors.black,
          ),
        ),
      ],
    );
  }
}
