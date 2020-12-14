import 'package:flutter/material.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/bloc/bloc_export.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/logic_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/constants/constants_export.dart';
import 'package:tax_return/feature/tax_return/presentation/screens/cit_page.dart';

//TODO: fix the dialogu : it dosent remove when sumbit is clickdd
class UserDataEditDialogue extends StatelessWidget {
  final String labelText;
  final void Function(String value) onSubmit;
  final void Function(String value) onPressed;
  final void Function(String value) onChanged;

  const UserDataEditDialogue({
    Key key,
    @required this.labelText,
    @required this.onSubmit,
    @required this.onPressed,
    @required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void onPressed(String value) => onSubmit;
    return Dialog(
      //  insetPadding: EdgeInsets.only(bottom: 500),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                textInputAction: TextInputAction.done,

                //FIXME: why is this user not adding
                //TODO: write decission here
                onChanged: onChanged,
                onSubmitted: onSubmit,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the $labelText',
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            Container(
              width: 200,
              child: RaisedButton(
                  color: Colors.grey,
                  onPressed: () => onPressed,
                  child: Text(
                    'Got It!',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class UserTaxReturnDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaxReturnType comapnyIcomeTax = TaxReturnType.companyIncomeTax;
    TaxReturnType personalIncomeTax = TaxReturnType.personalIcomeTax;
    return Dialog(
      //  insetPadding: EdgeInsets.only(bottom: 500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tax Return Types',
              style: TextStyle(fontSize: 17),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'choose what tax type you will mainly use for this account',
                style: TextStyle(color: Color(0xFFB1B1B1)),
                textAlign: TextAlign.center,
              ),
            ),
            TaxTypeValue(
              taxReurnValue: personalIncomeTax,
              avatarColor: Colors.brown,
              webLink: 'www.valueaddedtax.com',
              ontap: () {},
            ),
            TaxTypeValue(
              taxReurnValue: comapnyIcomeTax,
              avatarColor: Colors.blueGrey[700],
              webLink: 'www.companytax.com',
              ontap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => UserDataEditDialogue(
                          labelText: 'Company name',
                          onSubmit: (userData) {
                            final userName = userEntity(context)
                                .rebuild((b) => b..userName = userData);
                            //TODO conver the user name to company nam when user name is declared
                            context
                                .bloc<UserBloc>()
                                .add(AddUser(userData: userName));
                            //TODO: user cant go back when the citypage is returned
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CitPage(companyName: userData)));
                          },
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TaxTypeValue extends StatelessWidget {
  const TaxTypeValue({
    Key key,
    @required this.taxReurnValue,
    @required this.avatarColor,
    @required this.webLink,
    @required this.ontap,
  }) : super(key: key);

  final TaxReturnType taxReurnValue;
  final Color avatarColor;
  final String webLink;
  final GestureTapCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(20),
        radius: 20,
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: avatarColor,
          ),

          title: Text('${taxReurnValue.taxValue}'),
          //TODO: conver this into an web link
          subtitle: Text(
            webLink,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
