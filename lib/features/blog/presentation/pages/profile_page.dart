import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ProfilePage());
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AppUserCubit>().state as AppUserLoggedIn).user;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              foregroundImage: CachedNetworkImageProvider(
                user.avatar,
                cacheKey: user.avatar,
              ),
            ),
            const SizedBox(height: 20),
            Text(user.name),
            const SizedBox(height: 20),
            Text(user.email),
          ],
        ),
      ),
    );
  }
}
