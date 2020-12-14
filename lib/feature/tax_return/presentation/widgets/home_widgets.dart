import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_return/core/core_export.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/bloc/bloc_export.dart';
import 'package:tax_return/feature/tax_return/presentation/screens/createTaxData.dart';
import 'package:tax_return/feature/tax_return/presentation/screens/taxReturnMonth.dart';
import 'package:tax_return/feature/tax_return/presentation/widgets/taxes_chart.dart';
import 'package:intl/intl.dart';
//TODO: convert the digits to currency 
//TODO: convert the text to text theme
//TODO: use a font package
//TODO: refactory you code to prompte reuse
//TODO: fix the route settings
//current implementation

//TODO: display cit monthly tax in homepepage

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
              child: Stack(
                children: [
                  Padding(
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
                                //FIXME: pull this data for database
                                '',
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
                        BlocBuilder<TaxReturnCubit, TaxReturnState>(
                          builder: (context, state) {
                            if (state is TaxReturnLoading) {
                              return Center(
                                child: CircularLoadingIndactor(),
                              );
                            }
                            if (state is TaxReturnLoaded) {
                              return Container(
                                height: height * 0.4,
                                child: ListView.builder(
                                  itemCount: state.taxReturns.length,
                                  itemBuilder: (context, index) {
                                    final taxDate = state
                                        .taxReturns[index].currentDate
                                        .toDate();
                                    final formatedTaxDate =
                                        DateFormat.yMMMd().format(taxDate);
                                    //FIXME: refactor this code
                                    return RecentTaxReturns(
                                      predictedTaxReturnAmount: state
                                          .taxReturns[index].predictedTax
                                          .toString(),
                                      taxDate: formatedTaxDate.toString(),
                                      key: Key('__recentTaxReturns($index)__'),
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => TaxReturnMonth(
                                            index: index,
                                            date: formatedTaxDate.toString(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                        //animation: the button should remove when user starts to scroll
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: width * 0.33,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CreateTaxReturn(
                                isEditing: false,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.book, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'New Tax',
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.03),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        color: const Color(0xFF707070),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//add an algorithm that will tell if if your tax return is increasing or reducing
class RecentTaxReturns extends StatelessWidget {
  final String taxDate;
  final String predictedTaxReturnAmount;
  final Function() onTap;

  const RecentTaxReturns({
    @required Key key,
    @required this.taxDate,
    @required this.predictedTaxReturnAmount,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //FIXME: convert to list view
    return Ink(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(flex: 1, child: Text(taxDate)),
            Icon(
              Icons.arrow_upward,
              color: Colors.green,
              size: 15,
            ),
            Text('₦ $predictedTaxReturnAmount'),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.edit,
                size: 15,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
