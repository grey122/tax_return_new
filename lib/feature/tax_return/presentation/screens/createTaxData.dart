import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/bloc/bloc_export.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/constants/constants_export.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/constants/tax_return_value_description.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_return/home_page.dart';

//TODO: after create tax, then edit tax
//TODO: remove one of this stateful widget
class CreateTaxReturn extends StatefulWidget {
  final bool isEditing;

  CreateTaxReturn({Key key, this.isEditing}) : super(key: key);

  @override
  _CreateTaxReturnState createState() => _CreateTaxReturnState();
}

class _CreateTaxReturnState extends State<CreateTaxReturn> {
  String grossRevenue;
  String costOfSales;
  String generalAdminExpenses;
  String dissallowedExpenses;
  String nonTaxableExpenses;
  String balanceAdjustment;
  String capitalAllowance;
  String paidCapital;

//automaticaly gives focus to the next widget
  final FocusNode _grossRevenueNode = FocusNode();
  final FocusNode _grossProfitNode = FocusNode();
  final FocusNode _netProfitBeforeTaxNode = FocusNode();
  final FocusNode _lossBroughtFowardNode = FocusNode();
  final FocusNode _taxableIncomeNode = FocusNode();

  final _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _grossProfitNode.dispose();
    _grossRevenueNode.dispose();
    _netProfitBeforeTaxNode.dispose();
    _lossBroughtFowardNode.dispose();
    _taxableIncomeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: darkColor),
        backgroundColor: backgroundColor,
        title: Text(
          widget.isEditing == true ? 'Edit Tax Return' : 'Create Tax Return',
          style: TextStyle(color: darkColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                allowImplicitScrolling: true,
                children: [
                  TaxReturnTypeDescription(
                    textDescription: GROSS_REVENUE,
                    taxValue: 'Gross Revenue',
                    onPressedNext: () {
                      FocusScope.of(context).requestFocus(_grossProfitNode);
                      _controller.jumpToPage(1);
                    },
                    inputTaxAmount: [
                      InputTaxReturnAmount(
                        myFocusNode: _grossRevenueNode,
                        taxTypeHint: 'Enter Gross revenue',
                        onSubmited: (value) {
                          grossRevenue = value;
                        },
                      )
                    ],
                  ),
                  TaxReturnTypeDescription(
                    onPressedNext: () {
                      FocusScope.of(context)
                          .requestFocus(_netProfitBeforeTaxNode);
                      _controller.jumpToPage(2);
                    },
                    onPressedBack: () {
                      FocusScope.of(context).requestFocus(_grossRevenueNode);
                      _controller.jumpToPage(0);
                    },
                    textDescription: GROSS_PROFIT,
                    taxValue: "Gross profit",
                    inputTaxAmount: [
                      InputTaxReturnAmount(
                        myFocusNode: _grossProfitNode,
                        taxTypeHint: 'Enter Cost of Sales',
                        onSubmited: (value) {
                          costOfSales = value;
                        },
                      )
                    ],
                  ),
                  TaxReturnTypeDescription(
                    onPressedNext: () {
                      FocusScope.of(context)
                          .requestFocus(_lossBroughtFowardNode);
                      _controller.jumpToPage(3);
                    },
                    onPressedBack: () {
                      FocusScope.of(context).requestFocus(_grossProfitNode);
                      _controller.jumpToPage(1);
                    },
                    textDescription: NET_PROFIT,
                    taxValue: 'Net Profit(befor tax)',
                    inputTaxAmount: [
                      InputTaxReturnAmount(
                          myFocusNode: _netProfitBeforeTaxNode,
                          onSubmited: (value) {
                            generalAdminExpenses = value;
                          },
                          taxTypeHint: 'Enter General Admin Expenses')
                    ],
                  ),
                  TaxReturnTypeDescription(
                    onPressedNext: () {
                      FocusScope.of(context).requestFocus(_taxableIncomeNode);
                      _controller.jumpToPage(4);
                    },
                    onPressedBack: () {
                      FocusScope.of(context)
                          .requestFocus(_netProfitBeforeTaxNode);
                      _controller.jumpToPage(2);
                    },
                    textDescription: LOSS_BROUGHT_FOWARD,
                    taxValue: 'Loss Brought Foward',
                    inputTaxAmount: [
                      InputTaxReturnAmount(
                          myFocusNode: _lossBroughtFowardNode,
                          onSubmited: (value) {
                            dissallowedExpenses = value;
                          },
                          taxTypeHint: 'Enter Dissallowed Expenses'),
                      InputTaxReturnAmount(
                          onSubmited: (value) {
                            nonTaxableExpenses = value;
                          },
                          taxTypeHint: 'Enter Non taxable Profit'),
                    ],
                  ),
                  TaxReturnTypeDescription(
                    onPressedBack: () {
                      FocusScope.of(context)
                          .requestFocus(_lossBroughtFowardNode);
                      _controller.jumpToPage(3);
                    },
                    textDescription: LOSS_BROUGHT_FOWARD,
                    taxValue: 'Taxable Income',
                    inputTaxAmount: [
                      InputTaxReturnAmount(
                          myFocusNode: _taxableIncomeNode,
                          onSubmited: (value) {
                            balanceAdjustment = value;
                          },
                          taxTypeHint: 'Enter Balance Adjustment'),
                      InputTaxReturnAmount(
                          onSubmited: (value) {
                            capitalAllowance = value;
                          },
                          taxTypeHint: 'Enter Capitlal Allownace'),
                      InputTaxReturnAmount(
                        taxTypeHint: 'Enter Paid Capital',
                        onSubmited: (value) {
                          paidCapital = value;
                        },
                      ),
                    ],
                    onPressedNext: () {
                      //!FIXME: refactory this monstrocity 😥
                      DateTime currentPhoneDate = DateTime.now();
                      //TODO: write a funtion here for predicted date
                      //TODO: write a funtion that will predict if the green icon arror up or arrow down based on predicted tax
                      //TODO: the calculation should be done in the a bloc
                      final grosProfit =
                          int.parse(grossRevenue) - int.parse(costOfSales);
                      final netProfit =
                          grosProfit - int.parse(generalAdminExpenses);
                      final pridectedIncome = netProfit -
                          (int.parse(dissallowedExpenses) +
                              int.parse(nonTaxableExpenses)) +
                          (int.parse(balanceAdjustment) +
                              int.parse(capitalAllowance) +
                              int.parse(paidCapital));
                      Timestamp myTimeStamp =
                          Timestamp.fromDate(currentPhoneDate);
                      TaxReturnBuilt taxes = TaxReturnBuilt((b) => b
                        ..balanceAdjustment = int.parse(balanceAdjustment)
                        ..capitalAllowance = int.parse(capitalAllowance)
                        ..dissallowedExpenses = int.parse(dissallowedExpenses)
                        ..generalAdminExpenses = netProfit
                        ..grossProfit = grosProfit
                        ..grossRevenue = int.parse(grossRevenue)
                        ..noTaxableProfit = int.parse(nonTaxableExpenses)
                        ..paidCapital = int.parse(paidCapital)
                        //! this should be reoved for a better funtion in the future
                        ..predictedTax = pridectedIncome
                        ..currentDate = myTimeStamp);
                      context.bloc<TaxReturnCubit>().addTaxReturn(taxes);
                      return Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class TaxReturnTypeDescription extends StatefulWidget {
  final Function() onPressedNext;
  final String taxValue;
  final List<InputTaxReturnAmount> inputTaxAmount;
  final String textDescription;
  final Function() onPressedBack;
  const TaxReturnTypeDescription({
    Key key,
    @required this.onPressedNext,
    this.taxValue,
    @required this.inputTaxAmount,
    @required this.textDescription,
    this.onPressedBack,
  }) : super(key: key);

  @override
  _TaxReturnTypeDescriptionState createState() =>
      _TaxReturnTypeDescriptionState();
}

class _TaxReturnTypeDescriptionState extends State<TaxReturnTypeDescription> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.taxValue,
            style: TextStyle(
              color: darkColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          RichText(
            text: TextSpan(
                text: widget.textDescription,
                style: TextStyle(color: darkColor),
                children: <TextSpan>[
                  TextSpan(
                    //FIXME: fix this line of code
                    //  recognizer: GestureDetector(),
                    text: 'read more...',
                    style: TextStyle(color: Colors.red),
                  )
                ]),
          ),
          Column(children: widget.inputTaxAmount),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Container(
              width: width,
              height: 40,
              child: RaisedButton(
                onPressed: widget.onPressedNext,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Next'),
                      Icon(Icons.navigate_next_rounded)
                    ]),
                color: Color(0xFFD8D8D8),
              ),
            ),
          ),
          Container(
            width: width,
            height: 40,
            child: RaisedButton(
              onPressed: widget.onPressedBack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.navigate_before),
                  Text('back'),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              color: Color(0xFFD9D9D9),
            ),
          ),
        ],
      ),
    );
  }
}

class InputTaxReturnAmount extends StatefulWidget {
  final String taxTypeHint;
  final void Function(String value) onSubmited;
  final FocusNode myFocusNode;
  const InputTaxReturnAmount({
    Key key,
    @required this.taxTypeHint,
    @required this.onSubmited,
    @required this.myFocusNode,
  }) : super(key: key);

  @override
  _InputTaxReturnAmountState createState() => _InputTaxReturnAmountState();
}

class _InputTaxReturnAmountState extends State<InputTaxReturnAmount> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextField(
        autofocus: true,
        onChanged: widget.onSubmited,
        // controller: _controller,
        focusNode: widget.myFocusNode,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: widget.taxTypeHint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//TODO: when number is inputed keypad should go to the next key
