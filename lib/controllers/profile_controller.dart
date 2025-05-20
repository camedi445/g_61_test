import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_profile.dart';

class ProfileState {
  final bool isLoading;
  final UserProfile? profile;
  final String? error;

  ProfileState({this.isLoading = false, this.profile, this.error});

  ProfileState copyWith({
    bool? isLoading,
    UserProfile? profile,
    String? error,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
      error: error,
    );
  }
}

class ProfileController extends StateNotifier<ProfileState> {
  ProfileController(this.ref) : super(ProfileState()) {
    loadProfile();
  }

  final Ref ref;

  Future<void> loadProfile() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final profile = UserProfile(
        name: 'Rick Sanchez',
        email: 'rick@morty.com',
        avatarUrl: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
      );
      state = state.copyWith(isLoading: false, profile: profile);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
