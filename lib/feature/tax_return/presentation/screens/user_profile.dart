import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_return/core/core_export.dart';
import 'package:tax_return/feature/authentication/presentation/logic/logic_export.dart';
import 'package:tax_return/feature/tax_return/domain/entities/user_entity/user_entity.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/bloc/bloc_export.dart';

import 'package:tax_return/feature/tax_return/presentation/widgets/widgets_exports.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/constants/constants_export.dart';

//TODO: cretae dialogue and put the remaining details
//TODO: when user choose {TaxReturnType.value} the label in the text should change

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFFAFAFA);
    const darkColor = Color(0xFF4B4B4B);
    const hintColor = Color(0xFFCACACA);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

//FIXME: remove this code later
//FIXME: conver this to a class

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: darkColor,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: darkColor),
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoading) {
          return Container(
            child: CircularLoadingIndactor(),
          );
        }
        //TODO: check when it is user not loaded
        if (state is UserLoaded) {
          final user = context.bloc<AuthenticationBloc>().state.user;

          final userData = state.users.isEmpty ? user : state.users[0];

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(19, 25, 1, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.32,
                        height: height * 0.19,
                        color: Color(0xFFD1E4F3),
                        child: Stack(
                          children: [
                            Positioned(
                              top: -2.0,
                              left: -2.0,
                              child: Icon(
                                Icons.person,
                                size: 140,
                                color: Color(0xFFF2F2F2),
                              ),
                            ),
                            Positioned(
                              top: 90.0,
                              left: 90.0,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFDBDBDB),
                                radius: 15.0,
                                child: Icon(
                                  Icons.photo_camera,
                                  size: 14,
                                  color: Color(0xFFF2F2F2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: width * 0.6,
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          title: Text(
                            'User Name',
                            style: TextStyle(color: hintColor),
                          ),
                          subtitle: Text(
                            (userData is UserEntity)
                                ? state.users[0].userName
                                : user.name,
                            style: TextStyle(color: darkColor),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Color(0xFF186AA5),
                            ),
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                String userDataString;
                                return UserDataEditDialogue(
                                  onChanged: (value) {
                                    userDataString = userData;
                                  },
                                  onSubmit: (userData) {
                                    Navigator.of(context).pop();
                                    final userName = userEntity(context)
                                        .rebuild((b) => b..userName = userData);
                                    return context
                                        .bloc<UserBloc>()
                                        .add(AddUser(userData: userName));
                                  },
                                  onPressed: (value) {
                                    print(userDataString);
                                  },
                                  labelText: 'User Name',
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  UserInputData(
                    hintText: 'Email Address',
                    mainText: (userData is UserEntity)
                        ? state.users[0].emailAddress
                        : user.email,
                    onPressed: () {
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) => UserDataEditDialogue(
                          onSubmit: (userData) {
                            Navigator.of(context).pop();
                            final userName = userEntity(context)
                                .rebuild((b) => b..emailAddress = userData);
                            return context
                                .bloc<UserBloc>()
                                .add(AddUser(userData: userName));
                          },
                          labelText: 'Email Address',
                        ),
                      );
                    },
                  ),
                  UserInputData(
                    hintText: 'Phone Number',
                    mainText: state.users.isEmpty
                        ? '000 - 00000 - 000'
                        : state.users[0].userContact,
                    onPressed: () {
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) => UserDataEditDialogue(
                          onSubmit: (userData) {
                            Navigator.of(context).pop();
                            final userName = userEntity(context)
                                .rebuild((b) => b..userContact = userData);
                            return context
                                .bloc<UserBloc>()
                                .add(AddUser(userData: userName));
                          },
                          labelText: 'Phone number',
                        ),
                      );
                    },
                  ),
                  UserInputData(
                    hintText: 'Tax_type',
                    onPressed: () {
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              UserTaxReturnDialog());
                    },
                  ),
                ],
              ),
            ),
          );
          //child: Text(state.users[0].cityPage["company category"]),

        }
        if (state is UserDataNotLoaded) {
          //TODO: display Toast aller that user not loaded (check if its network problem)
          //remove this code when done
          return Center(
            child: Text(
              'USER NOT LOADED',
              style: TextStyle(fontSize: 30),
            ),
          );
        }
        return Container(
          child: Text('not loaded'),
        );
      }),
    );
  }
}
