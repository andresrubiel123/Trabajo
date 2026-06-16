/// Pantalla de inicio de sesión de la aplicación.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../../../core/widgets/cyber_text_field.dart';
import '../../../../core/widgets/glass_card.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePassword = true;

  late AnimationController _bgController;
  late AnimationController _cardController;
  late Animation<double> _cardFade;
  late Animation<Offset> _cardSlide;

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _cardFade = CurvedAnimation(
      parent: _cardController,
      curve: Curves.easeOut,
    );

    _cardSlide = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _cardController,
      curve: Curves.easeOut,
    ));

    _cardController.forward();
  }

  @override
  void dispose() {
    _bgController.dispose();
    _cardController.dispose();
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final success = await ref
        .read(authProvider.notifier)
        .login(_usernameCtrl.text.trim(), _passwordCtrl.text);
    if (success && mounted) {
      context.go(AppRoutes.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // ── Fondo animado con partículas ──────────────────────────────
          _AnimatedBackground(controller: _bgController),

          // ── Contenido central ─────────────────────────────────────────
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: FadeTransition(
                opacity: _cardFade,
                child: SlideTransition(
                  position: _cardSlide,
                  child: SizedBox(
                    width: min(440, size.width - 48),
                    child: GlassCard(
                      blur: 20,
                      backgroundOpacity: 0.08,
                      borderColor: AppColors.primary.withAlpha(77),
                      glowColor: AppColors.primary,
                      padding: const EdgeInsets.all(40),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Logo
                            _buildLogo(),
                            const SizedBox(height: 32),

                            // Título
                            Text(
                              'ACCESO AL SISTEMA',
                              style: AppTypography.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Ingresa tus credenciales para continuar',
                              style: AppTypography.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),

                            // Error message
                            if (authState.errorMessage != null) ...[
                              _ErrorBanner(message: authState.errorMessage!),
                              const SizedBox(height: 16),
                            ],

                            // Usuario
                            CyberTextField(
                              controller: _usernameCtrl,
                              label: 'Usuario',
                              hint: '@usuario',
                              prefixIcon: Icons.person_outline_rounded,
                              accentColor: AppColors.primary,
                              validator: (v) =>
                                  (v == null || v.isEmpty) ? 'Requerido' : null,
                            ),
                            const SizedBox(height: 16),

                            // Contraseña
                            CyberTextField(
                              controller: _passwordCtrl,
                              label: 'Contraseña',
                              hint: '••••••••',
                              prefixIcon: Icons.lock_outline_rounded,
                              obscureText: _obscurePassword,
                              accentColor: AppColors.primary,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                                onPressed: () => setState(
                                    () => _obscurePassword = !_obscurePassword),
                              ),
                              onSubmitted: (_) => _handleLogin(),
                              validator: (v) =>
                                  (v == null || v.isEmpty) ? 'Requerido' : null,
                            ),
                            const SizedBox(height: 28),

                            // Botón ingresar
                            NeonButton(
                              label: 'INGRESAR',
                              icon: Icons.login_rounded,
                              onPressed: _handleLogin,
                              isLoading: authState.isLoading,
                              width: double.infinity,
                              height: 52,
                            ),
                            const SizedBox(height: 24),

                            // Footer
                            Text(
                              'ApuestasFutbol v1.0',
                              style: AppTypography.labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        shape: BoxShape.circle,
          boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(102),
            blurRadius: 24,
            spreadRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ── Error Banner ─────────────────────────────────────────────────────────────

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.redNeon.withAlpha(26),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.redNeon.withAlpha(77)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded,
              color: AppColors.redNeon, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.redNeon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Animated Background ───────────────────────────────────────────────────────

class _AnimatedBackground extends StatelessWidget {
  const _AnimatedBackground({required this.controller});
  final Animation<double> controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _GridPainter(animation: controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({required this.animation});
  final double animation;

  @override
  void paint(Canvas canvas, Size size) {
    // Fondo gradiente
    final bgPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF0A0C0F), Color(0xFF0F1117)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Grid lines — naranja sutil
    final gridPaint = Paint()
      ..color = AppColors.primary.withAlpha(18)
      ..strokeWidth = 0.5;

    const gridSize = 50.0;
    final offsetX = (animation * gridSize) % gridSize;
    final offsetY = (animation * gridSize * 0.7) % gridSize;

    for (double x = -gridSize + offsetX; x < size.width + gridSize; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = -gridSize + offsetY; y < size.height + gridSize; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Glow orbs naranja
    final glowPaint = Paint()
      ..color = AppColors.primary.withAlpha(20)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);

    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.25),
      140 + sin(animation * 2 * pi) * 20,
      glowPaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.75),
      110 + cos(animation * 2 * pi) * 15,
      glowPaint..color = AppColors.secondary.withAlpha(15),
    );
    // Tercer orb sutil
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.5),
      60 + sin(animation * pi) * 10,
      glowPaint..color = AppColors.amber.withAlpha(10),
    );
  }

  @override
  bool shouldRepaint(_GridPainter oldDelegate) =>
      oldDelegate.animation != animation;
}
