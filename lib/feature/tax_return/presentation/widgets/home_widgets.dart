import 'package:flutter/material.dart';
import 'package:tax_return/feature/tax_return/presentation/screens/screens_export.dart';
import 'package:tax_return/feature/tax_return/presentation/widgets/taxes_chart.dart';

//TODO: convert the text to text theme
//TODO: use a font package
//TODO: refactory you code to prompte reuse
//TODO: fix the route settings
class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Container(
              height: height * 0.32,
              width: width,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: TaxesChart(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: height * 0.5,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Tax Return',
                          style: TextStyle(
                            color: const Color(0xFF202020),
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Text(
                            //add taxreturn value here
                            '₦50,000',
                            style: TextStyle(
                              color: const Color(0xFF202020),
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 39),
                      child: Divider(
                        height: 30,
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: Text('July 18th 2020')),
                            Icon(
                              Icons.arrow_upward,
                              color: Colors.green,
                              size: 15,
                            ),
                            Text('₦50,000'),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.edit,
                                size: 15,
                              ),
                            )
                          ]),
                    ),
                    //animation: the button should remove when user starts to scroll
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 120, right: 120, top: 150),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UserProfile()));
                        },
                        child: Row(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        color: const Color(0xFF707070),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
