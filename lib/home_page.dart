import 'package:flutter/material.dart';
import 'package:tax_return/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.bloc<AuthenticationBloc>().state.user;
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
            //TODO: show dialogue box asking user if he really wants to logout
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Avatar(photo: user.photo),
            const SizedBox(height: 4.0),
            Text(user.email, style: textTheme.headline6),
            const SizedBox(height: 4.0),
            Text(user.name ?? '', style: textTheme.headline5),
          ],
        ),
      ),
    );
  }
}

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
