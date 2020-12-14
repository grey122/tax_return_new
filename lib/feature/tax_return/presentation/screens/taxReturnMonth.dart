import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_return/core/core_export.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/bloc/bloc_export.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/constants/colors_constant.dart';

//TODO: implement eneter text screen
//TODO: imlemnet descision so that profile wont be called multiple times(IF DATABASE.USER IS NULL, SHOW PROFILE PAGE )

class TaxReturnMonth extends StatelessWidget {
  //TODO: add date parameter here
  final int index;
  final String date;

  const TaxReturnMonth({
    Key key,
    @required this.index,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: darkColor),
        backgroundColor: backgroundColor,
        title: Text(
          date,
          style: TextStyle(color: darkColor),
        ),
        actions: [
          Icon(
            Icons.delete,
            color: darkColor,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.save,
            color: darkColor,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: BlocBuilder<TaxReturnCubit, TaxReturnState>(
          builder: (context, state) {
        if (state is TaxReturnLoading) {
          return CircularLoadingIndactor();
        } else if (state is TaxReturnLoaded) {
          final taxReturn = state.taxReturns[index];
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.3,
                  width: width,
                  color: darkColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tax Return',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 300, left: 20),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      //TODO: change all these

                      TaxReturnMonthList(
                        onTap: () {},
                        taxReturnFieldName: 'Gross Revenue',
                        taxReturnFieldAmount: taxReturn.grossRevenue.toString(),
                      ),
                      TaxReturnMonthList(
                        taxReturnFieldName: 'Gross Profit',
                        taxReturnFieldAmount:
                            taxReturn.capitalAllowance.toString(),
                      ),
                      TaxReturnMonthList(
                        taxReturnFieldName: 'Net Profit',
                        taxReturnFieldAmount: taxReturn.predictedTax.toString(),
                      ),
                      TaxReturnMonthList(
                        taxReturnFieldName: 'Taxable Profit',
                        taxReturnFieldAmount: taxReturn.grossRevenue.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      }),
    );
  }
}

class TaxReturnMonthList extends StatelessWidget {
  final String taxReturnFieldName;
  final String taxReturnFieldAmount;
  final Function() onTap;
  const TaxReturnMonthList({
    Key key,
    @required this.taxReturnFieldName,
    @required this.taxReturnFieldAmount,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Material(
          elevation: 20,
          child: Container(
            height: height * 0.075,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(taxReturnFieldName),
                Text('₦ $taxReturnFieldAmount')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
