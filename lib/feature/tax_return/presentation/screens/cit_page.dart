import 'package:flutter/material.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/bloc/bloc_export.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/constants/constants_export.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitPage extends StatelessWidget {
  final String companyName;
  const CitPage({Key key, this.companyName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: darkColor),
        elevation: 0.0,
        title: Text(
          companyName,
          style: TextStyle(color: darkColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Company Category',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'step 1 0f 2',
                    style: TextStyle(
                        color: Colors.grey[600],
                        letterSpacing: -1.5,
                        fontSize: 14),
                  )
                ],
              ),
              CompanyCategoryDropDown(),
              SizedBox(
                height: 40,
              ),
              IsCompanyYears()
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: customize this drop down very well, the

class CompanyCategoryDropDown extends StatefulWidget {
  @override
  _CompanyCategoryDropDownState createState() =>
      _CompanyCategoryDropDownState();
}

class _CompanyCategoryDropDownState extends State<CompanyCategoryDropDown> {
  String dropdownValue = 'One';
  CompanyCategoriesSelection dropvalue =
      CompanyCategoriesSelection.bankandFinance;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(shape:),
      color: Colors.yellow,
      padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 20.0),
      child: DropdownButton<CompanyCategoriesSelection>(
        isExpanded: true,
        value: dropvalue,
        icon: Icon(Icons.arrow_drop_down_outlined),
        iconSize: 24,
        elevation: 49,
        isDense: true,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (newValue) {
          setState(() {
            dropvalue = newValue;
          });

          final userName = userEntity(context).rebuild((b) => b
            ..citPage = {'company_category': newValue.companyCategory}
                .build()
                .toBuilder());
          return context.bloc<UserBloc>().add(AddUser(userData: userName));
        },
        items: CompanyCategoriesSelection.values
            .map<DropdownMenuItem<CompanyCategoriesSelection>>(
                (CompanyCategoriesSelection value) {
          return DropdownMenuItem<CompanyCategoriesSelection>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                value.companyCategory,
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

enum CompanyCategoriesSelection { bankandFinance, agricAndPlantation }

extension TaxReturnValue on CompanyCategoriesSelection {
  String get companyCategory {
    switch (this) {
      case CompanyCategoriesSelection.agricAndPlantation:
        return 'Agric & Plantation';
      case CompanyCategoriesSelection.bankandFinance:
        return 'Bank and finance';
        break;
      default:
    }
    return '';
  }
}

class IsCompanyYears extends StatefulWidget {
  IsCompanyYears({Key key}) : super(key: key);

  @override
  _IsCompanyYearsState createState() => _IsCompanyYearsState();
}

class _IsCompanyYearsState extends State<IsCompanyYears> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    bool ischecked() {
      return _isChecked;
    }

    ;
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: CheckboxListTile(
        title: const Text('Is your comapny years of operation greater than 4'),
        value: _isChecked,
        onChanged: (bool value) {
          setState(() {
            _isChecked = value;
          });
        },
      ),
    );
  }
}
