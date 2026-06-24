/// Gestor de estado para la suscripción VIP del usuario.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-18
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Estado de la suscripción Premium.
class PremiumState {
  const PremiumState({
    required this.isPremiumActive,
    this.isLoading = false,
  });

  final bool isPremiumActive;
  final bool isLoading;

  PremiumState copyWith({
    bool? isPremiumActive,
    bool? isLoading,
  }) {
    return PremiumState(
      isPremiumActive: isPremiumActive ?? this.isPremiumActive,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Controla la activación y desactivación de la suscripción premium.
class PremiumNotifier extends Notifier<PremiumState> {
  SharedPreferences? _prefs;

  @override
  PremiumState build() {
    _init();
    return const PremiumState(isPremiumActive: false);
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    final isActive = _prefs?.getBool('is_premium_active') ?? false;
    state = PremiumState(isPremiumActive: isActive);
  }

  /// Activa la suscripción Premium (VIP) persistiendo el estado en disco.
  Future<void> activatePremium() async {
    state = state.copyWith(isLoading: true);
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs?.setBool('is_premium_active', true);
    state = const PremiumState(isPremiumActive: true, isLoading: false);
  }

  /// Cancela la suscripción Premium.
  Future<void> cancelPremium() async {
    state = state.copyWith(isLoading: true);
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs?.setBool('is_premium_active', false);
    state = const PremiumState(isPremiumActive: false, isLoading: false);
  }
}

/// Provider de estado de la suscripción VIP.
final premiumSubscriptionProvider =
    NotifierProvider<PremiumNotifier, PremiumState>(
  () => PremiumNotifier(),
);
