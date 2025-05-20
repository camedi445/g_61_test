import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/profile_provider.dart';
import '../../core/widgets/loading_indicator.dart';
import '../../core/widgets/error_message.dart';

class ProfilePage extends ConsumerWidget {
  static const routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);

    if (state.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: const LoadingIndicator(),
      );
    }

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: ErrorMessage(message: state.error!),
      );
    }

    final profile = state.profile!;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profile.avatarUrl),
            ),
            const SizedBox(height: 16),
            Text(profile.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(profile.email),
          ],
        ),
      ),
    );
  }
}
