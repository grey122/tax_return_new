import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/bloc/tax_return_cubit/tax_return_cubit.dart';
import 'feature/authentication/presentation/logic/bloc/bloc_export.dart';
import 'feature/tax_return/domain/entities/user_entity/user_entity_export.dart';
import 'feature/tax_return/presentation/logic/bloc/bloc_export.dart';
import 'package:built_collection/built_collection.dart';

//TODO: tax today create user model
//TODO: covert Tax return bloc to user model to userModel
//TODO: link user name and email address to user model
//TODO: display firebase error when user goes offline
class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  // final taxReturn = TaxReturnBuilt((b) => b
  //   ..taxName = "ass hole"
  //   ..id = "the id");

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    final user = context.bloc<AuthenticationBloc>().state.user;
    final usersData = UserEntity((b) => b
      ..userName = user.name
      ..emailAddress = user.email
      ..userContact = 08033569154
      ..taxReturnType = user.id
      ..cityPage =
          {'company category': 'banking and finace'}.build().toBuilder());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context
                .bloc<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested()),
            //TODO: show dialogue box asking user if he really wants to logou
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => context.bloc<UserBloc>().add(AddUser(usersData)),
          )
        ],
      ),
      body: Align(alignment: const Alignment(0, -1 / 3), child: null),
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
//               //TODO: check when it is user not loaded
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
