import 'package:flutter/material.dart';

class UserInputData extends StatelessWidget {
  const UserInputData({
    Key key,
    @required this.hintText,
    this.mainText,
    @required this.onPressed,
  }) : super(key: key);

  final String hintText;
  final String mainText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    // const backgroundColor = Color(0xFFFAFAFA);
    const darkColor = Color(0xFF4B4B4B);
    const hintColor = Color(0xFFCACACA);
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Container(
        height: 60,
        width: width,
        child: ListTile(
          contentPadding: EdgeInsets.only(top: 25, right: 10.0),
          title: Text(
            hintText,
            style: TextStyle(color: hintColor),
          ),
          subtitle: Text(
            mainText ?? '',
            style: TextStyle(color: darkColor),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.edit,
              color: Color(0xFF186AA5),
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
