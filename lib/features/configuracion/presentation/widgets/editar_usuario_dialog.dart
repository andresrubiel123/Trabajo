/// Diálogo para editar las credenciales de inicio de sesión.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

/// Diálogo premium para editar el nombre de usuario y contraseña.
class EditarUsuarioDialog extends ConsumerStatefulWidget {
  const EditarUsuarioDialog({super.key});

  @override
  ConsumerState<EditarUsuarioDialog> createState() => _EditarUsuarioDialogState();
}

class _EditarUsuarioDialogState extends ConsumerState<EditarUsuarioDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usuarioCtrl;
  late TextEditingController _contrasenaCtrl;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    final authNotifier = ref.read(authProvider.notifier);
    _usuarioCtrl = TextEditingController(text: authNotifier.currentUsername);
    _contrasenaCtrl = TextEditingController(text: authNotifier.currentPassword);
  }

  @override
  void dispose() {
    _usuarioCtrl.dispose();
    _contrasenaCtrl.dispose();
    super.dispose();
  }

  void _guardar() async {
    if (!_formKey.currentState!.validate()) return;

    await ref.read(authProvider.notifier).updateCredentials(
          _usuarioCtrl.text.trim(),
          _contrasenaCtrl.text.trim(),
        );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Credenciales actualizadas correctamente'),
        backgroundColor: AppColors.cyanNeon,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.cyanNeon.withAlpha(100), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: AppColors.cyanNeon.withAlpha(51),
              blurRadius: 24,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título
                Row(
                  children: [
                    const Icon(Icons.manage_accounts_rounded, color: AppColors.cyanNeon, size: 28),
                    const SizedBox(width: 12),
                    Text('Editar Usuario', style: AppTypography.headlineMedium),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Modifica tus credenciales de inicio de sesión.',
                  style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
                const Divider(height: 24, color: AppColors.border),

                // Campo Usuario
                Text('Nombre de usuario', style: AppTypography.labelLarge.copyWith(color: AppColors.cyanNeon)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _usuarioCtrl,
                  style: AppTypography.bodyMedium,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_rounded, color: AppColors.cyanNeon, size: 20),
                    hintText: 'Ej: @usuario',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'El usuario no puede estar vacío';
                    }
                    if (value.trim().length < 3) {
                      return 'Mínimo 3 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Campo Contraseña
                Text('Nueva Contraseña', style: AppTypography.labelLarge.copyWith(color: AppColors.cyanNeon)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _contrasenaCtrl,
                  style: AppTypography.bodyMedium,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppColors.cyanNeon, size: 20),
                    hintText: 'Contraseña de seguridad',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'La contraseña no puede estar vacía';
                    }
                    if (value.trim().length < 4) {
                      return 'Mínimo 4 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // Botones de Acción
                Row(
                  children: [
                    Expanded(
                      child: NeonButton(
                        label: 'CANCELAR',
                        isOutlined: true,
                        color: AppColors.textSecondary,
                        onPressed: () => Navigator.of(context).pop(),
                        height: 46,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: NeonButton(
                        label: 'GUARDAR',
                        onPressed: _guardar,
                        height: 46,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
