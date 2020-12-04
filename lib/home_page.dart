import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_return/feature/tax_return/presentation/widgets/widgets_exports.dart';
import 'feature/authentication/presentation/logic/bloc/bloc_export.dart';

//TODO: display firebase error when user goes offline

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    const backgroundColor = Color(0xFFFAFAFA);
    const darkColor = Color(0xFF4B4B4B);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.menu, color: darkColor),
          onPressed: () {},
        ),
        //FIXME: convert this to media query
        title: const Text('TAXLIT',
            style: TextStyle(
                color: darkColor, fontSize: 17.0, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications, color: darkColor),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => context
                  .bloc<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested())),
        ],
      ),
      body: HomeWidget(),
    );
  }
}

// BlocBuilder<UserBloc, UserState>(
//             builder: (context, state) {
//               if (state is UserLoading) {
//                 return Container(
//                   child: Text('LOADING....'),
//                 );
//               }

//               if (state is UserLoaded) {
//                 return Container(
//                   //  child: Text('some data'),
//                   child: Text(state.users[0].cityPage["company category"]),
//                 );
//               }
//               return Container(
//                 child: Text('not loaded'),
//               );
//             },
//           )

// Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Avatar(photo: user.photo),
//             const SizedBox(height: 4.0),
//             Text(user.email, style: textTheme.headline6),
//             const SizedBox(height: 4.0),
//             Text(user.name ?? '', style: textTheme.headline5),

//           ],
//         ),

// IconButton(
//             key: const Key('homePage_logout_iconButton'),
//             icon: const Icon(Icons.exit_to_app),
//             onPressed: () => context
//                 .bloc<AuthenticationBloc>()
//                 .add(AuthenticationLogoutRequested()),
//             //TODO: show dialogue box asking user if he really wants to logou
//           ),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () => context.bloc<UserBloc>().add(AddUser(usersData)),
//           )

const _avatarSize = 48.0;

class Avatar extends StatelessWidget {
  const Avatar({Key key, this.photo}) : super(key: key);

  final String photo;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: _avatarSize,
      backgroundImage: photo != null ? NetworkImage(photo) : null,
      child: photo == null
          ? const Icon(Icons.person_outline, size: _avatarSize)
          : null,
    );
  }
}

class AddTododEditText extends StatelessWidget {
  const AddTododEditText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(),
    );
  }
}
