/// Gestor de estado y persistencia de autenticación de usuario con Hive.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_constants.dart';

/// Estado de autenticación.
class AuthState {
  const AuthState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.errorMessage,
    this.username,
  });

  final bool isAuthenticated;
  final bool isLoading;
  final String? errorMessage;
  final String? username;

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? errorMessage,
    String? username,
    bool clearError = false,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      username: username ?? this.username,
    );
  }
}

/// Notifier de autenticación usando SharedPreferences.
class AuthNotifier extends Notifier<AuthState> {
  SharedPreferences? _prefs;

  @override
  AuthState build() {
    _init();
    return const AuthState();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    
    // Limpiamos credenciales anteriores para forzar la adopción de los nuevos defaults 'aaaa'
    await _prefs?.remove('username');
    await _prefs?.remove('password');
    await _prefs?.remove('session_username');
    
    state = const AuthState();
  }

  String get currentUsername {
    return _prefs?.getString('username') ?? AppConstants.defaultUser;
  }

  String get currentPassword {
    return _prefs?.getString('password') ?? AppConstants.defaultPassword;
  }

  Future<bool> login(String username, String password) async {
    state = state.copyWith(isLoading: true, clearError: true);

    // Simulación de delay de red
    await Future.delayed(const Duration(milliseconds: 800));

    if (username == currentUsername &&
        password == currentPassword) {
      // Guardar sesión activa en SharedPreferences
      _prefs ??= await SharedPreferences.getInstance();
      await _prefs?.setString('session_username', username);

      state = state.copyWith(
        isAuthenticated: true,
        isLoading: false,
        username: username,
      );
      return true;
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Usuario o contraseña incorrectos',
      );
      return false;
    }
  }

  Future<void> updateCredentials(String newUsername, String newPassword) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs?.setString('username', newUsername);
    await _prefs?.setString('password', newPassword);

    if (state.isAuthenticated) {
      // Si está autenticado, actualizamos la sesión activa guardada
      await _prefs?.setString('session_username', newUsername);
      state = state.copyWith(username: newUsername);
    }
  }

  Future<void> logout() async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs?.remove('session_username');
    state = const AuthState();
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  () => AuthNotifier(),
);
