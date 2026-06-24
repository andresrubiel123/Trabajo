import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/neon_button.dart';
import '../providers/premium_provider.dart';

/// Modal interactivo de pasarela de pago que soporta Visa (Tarjeta 3D) y Google Play billing.
class PaymentGatewayDialog extends ConsumerStatefulWidget {
  const PaymentGatewayDialog({super.key});

  @override
  ConsumerState<PaymentGatewayDialog> createState() => _PaymentGatewayDialogState();
}

class _PaymentGatewayDialogState extends ConsumerState<PaymentGatewayDialog>
    with TickerProviderStateMixin {
  int _selectedMethod = 0; // 0 = Tarjeta, 1 = Google Play
  bool _isProcessing = false;
  bool _isSuccess = false;
  String _processingStep = '';

  // Controladores de formulario
  final _cardNumCtrl = TextEditingController();
  final _cardHolderCtrl = TextEditingController();
  final _expiryCtrl = TextEditingController();
  final _cvvCtrl = TextEditingController();

  final _cardNumFocus = FocusNode();
  final _cardHolderFocus = FocusNode();
  final _expiryFocus = FocusNode();
  final _cvvFocus = FocusNode();

  // Controladores de animación para rotar la tarjeta 3D
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  bool _showBack = false;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: pi).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeOutBack),
    )..addListener(() {
        setState(() {
          // Cambia la cara de la tarjeta a mitad del giro
          _showBack = _rotationAnimation.value > pi / 2;
        });
      });

    // Detecta el foco del CVV para girar la tarjeta
    _cvvFocus.addListener(() {
      if (_cvvFocus.hasFocus) {
        _rotationController.forward();
      } else {
        _rotationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _cardNumCtrl.dispose();
    _cardHolderCtrl.dispose();
    _expiryCtrl.dispose();
    _cvvCtrl.dispose();
    _cardNumFocus.dispose();
    _cardHolderFocus.dispose();
    _expiryFocus.dispose();
    _cvvFocus.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  Future<void> _processPayment() async {
    // Si es tarjeta, validar mínimamente los campos
    if (_selectedMethod == 0) {
      if (_cardNumCtrl.text.length < 19 ||
          _cardHolderCtrl.text.isEmpty ||
          _expiryCtrl.text.length < 5 ||
          _cvvCtrl.text.length < 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Por favor completa todos los campos de la tarjeta'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }
    }

    setState(() {
      _isProcessing = true;
      _processingStep = 'Conectando con servidor de pagos seguro...';
    });

    final steps = _selectedMethod == 0
        ? [
            'Verificando credenciales Visa Secure...',
            'Autorizando transacción con el banco emisor...',
            'Procesando cobro de \$4.99 USD...',
            'Confirmación recibida con éxito.',
          ]
        : [
            'Conectando con Google Play Billing API...',
            'Autenticando credenciales de Google...',
            'Verificando saldo/método de pago Play Store...',
            'Aprobando suscripción mensual...',
          ];

    for (final step in steps) {
      await Future.delayed(const Duration(milliseconds: 900));
      if (!mounted) return;
      setState(() {
        _processingStep = step;
      });
    }

    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;

    setState(() {
      _isProcessing = false;
      _isSuccess = true;
    });
  }

  void _finishPayment() {
    ref.read(premiumSubscriptionProvider.notifier).activatePremium();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: GlassCard(
        padding: const EdgeInsets.all(24),
        glowColor: _isSuccess
            ? const Color(0xFF39FF14)
            : (_selectedMethod == 0 ? AppColors.premiumBlue : const Color(0xFFFFD700)),
        child: SizedBox(
          width: 480,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isProcessing)
                _buildProcessingView()
              else if (_isSuccess)
                _buildSuccessView()
              else
                _buildGatewayView(),
            ],
          ),
        ),
      ),
    );
  }

  // ── Vista de procesamiento de pago ─────────────────────────────────────────
  Widget _buildProcessingView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          const SizedBox(
            width: 56,
            height: 56,
            child: CircularProgressIndicator(
              color: AppColors.premiumBlue,
              strokeWidth: 4.5,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'PROCESANDO PAGO',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              _processingStep,
              key: ValueKey(_processingStep),
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // ── Vista de Éxito de pago ──────────────────────────────────────────────────
  Widget _buildSuccessView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF39FF14).withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF39FF14).withValues(alpha: 0.4),
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.check_circle_outline_rounded,
              size: 72,
              color: Color(0xFF39FF14),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '¡PAGO APROBADO!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF39FF14),
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Bienvenido a la experiencia Gol Saint VIP. Todas las restricciones de combinaciones y análisis avanzado se han desactivado.',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textPrimary,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          NeonButton(
            label: 'COMENZAR EXPERIENCIA VIP',
            icon: Icons.flash_on_rounded,
            onPressed: _finishPayment,
            width: double.infinity,
            height: 48,
          ),
        ],
      ),
    );
  }

  // ── Vista Principal de la Pasarela ─────────────────────────────────────────
  Widget _buildGatewayView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'PASARELA DE PAGO',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: AppColors.premiumBlue,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Selector de método
        _buildMethodSelector(),
        const SizedBox(height: 24),

        // Formularios condicionales
        if (_selectedMethod == 0) _buildCardFormView() else _buildPlayStoreView(),
      ],
    );
  }

  Widget _buildMethodSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildMethodTab(
              index: 0,
              label: 'Visa / Card',
              icon: Icons.credit_card_rounded,
            ),
          ),
          Expanded(
            child: _buildMethodTab(
              index: 1,
              label: 'Google Play',
              icon: Icons.shop_two_rounded,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodTab({required int index, required String label, required IconData icon}) {
    final isSelected = _selectedMethod == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.premiumBlue.withValues(alpha: 0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.premiumBlue : Colors.transparent,
            width: 0.8,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? AppColors.premiumBlue : AppColors.textSecondary,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.premiumBlue : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Formulario de Tarjeta de Crédito ───────────────────────────────────────
  Widget _buildCardFormView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Tarjeta de crédito interactiva en 3D
        _buildCard3D(),
        const SizedBox(height: 24),

        // Input Número Tarjeta
        TextField(
          controller: _cardNumCtrl,
          focusNode: _cardNumFocus,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
            _CardNumberFormatter(),
          ],
          decoration: const InputDecoration(
            labelText: 'Número de Tarjeta',
            prefixIcon: Icon(Icons.credit_card, size: 20),
          ),
          onChanged: (val) => setState(() {}),
        ),
        const SizedBox(height: 12),

        // Input Nombre Titular
        TextField(
          controller: _cardHolderCtrl,
          focusNode: _cardHolderFocus,
          textCapitalization: TextCapitalization.characters,
          decoration: const InputDecoration(
            labelText: 'Nombre del Titular',
            prefixIcon: Icon(Icons.person, size: 20),
          ),
          onChanged: (val) => setState(() {}),
        ),
        const SizedBox(height: 12),

        // Inputs Expiración y CVV
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TextField(
                controller: _expiryCtrl,
                focusNode: _expiryFocus,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                  _CardExpiryFormatter(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Vence (MM/AA)',
                  prefixIcon: Icon(Icons.date_range, size: 20),
                ),
                onChanged: (val) => setState(() {}),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: TextField(
                controller: _cvvCtrl,
                focusNode: _cvvFocus,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                decoration: const InputDecoration(
                  labelText: 'CVV',
                  prefixIcon: Icon(Icons.lock, size: 20),
                ),
                onChanged: (val) => setState(() {}),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),

        NeonButton(
          label: 'PAGAR DE FORMA SEGURA',
          icon: Icons.security_rounded,
          onPressed: _processPayment,
          width: double.infinity,
          height: 48,
        ),
      ],
    );
  }

  // Widget para renderizar la tarjeta en 3D
  Widget _buildCard3D() {
    return AnimatedBuilder(
      animation: _rotationAnimation,
      builder: (context, child) {
        // Aplica matriz de transformación para perspectiva 3D
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.0015) // perspectiva
          ..rotateY(_rotationAnimation.value);

        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: _showBack ? _buildCardBack() : _buildCardFront(),
        );
      },
    );
  }

  Widget _buildCardFront() {
    final num = _cardNumCtrl.text.isEmpty ? '•••• •••• •••• ••••' : _cardNumCtrl.text;
    final name = _cardHolderCtrl.text.isEmpty ? 'NOMBRE APELLIDO' : _cardHolderCtrl.text.toUpperCase();
    final exp = _expiryCtrl.text.isEmpty ? 'MM/AA' : _expiryCtrl.text;

    return Container(
      width: double.infinity,
      height: 190,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0F2027),
            Color(0xFF203A43),
            Color(0xFF2C5364),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.premiumBlue.withValues(alpha: 0.15),
            blurRadius: 16,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fila 1: Chip y Logo VISA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Chip
              Container(
                width: 44,
                height: 32,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFD4AF37), Color(0xFFFFDF00)],
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              // Visa Logo
              const Text(
                'VISA',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Fila 2: Número de Tarjeta
          Text(
            num,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 2,
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          // Fila 3: Titular y Expiración
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('TITULAR', style: TextStyle(color: Colors.white60, fontSize: 8)),
                    const SizedBox(height: 2),
                    Text(
                      name,
                      style: const TextStyle(color: Colors.white, fontSize: 13, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('VENCE', style: TextStyle(color: Colors.white60, fontSize: 8)),
                  const SizedBox(height: 2),
                  Text(
                    exp,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardBack() {
    // Al girar, la tarjeta se vería al revés horizontalmente, aplicamos otra transformación
    // para corregir la lectura del CVV.
    final cvv = _cvvCtrl.text.isEmpty ? '•••' : _cvvCtrl.text;

    return Transform(
      transform: Matrix4.identity()..rotateY(pi),
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 190,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF2C5364),
              Color(0xFF203A43),
              Color(0xFF0F2027),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.4), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            // Banda magnética negra
            Container(
              height: 40,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            // Panel de Firma y CVV
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 32,
                      color: Colors.white70,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8),
                      child: const Text(
                        'Gol Saint VIP Member Signature',
                        style: TextStyle(color: Colors.black54, fontSize: 10, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 32,
                    color: const Color(0xFFFFD700),
                    alignment: Alignment.center,
                    child: Text(
                      cvv,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 16, bottom: 12),
              child: Text(
                'Visa Secure Authorized',
                style: TextStyle(color: Colors.white38, fontSize: 8),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Vista de Google Play Billing ───────────────────────────────────────────
  Widget _buildPlayStoreView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Caja de suscripción de Play Store
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFFFD700).withValues(alpha: 0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.shop_two_rounded, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Google Play Suscripciones',
                    style: AppTypography.labelLarge.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Plan VIP Mensual',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFFFFD700)),
              ),
              const SizedBox(height: 4),
              const Text(
                'Acceso ilimitado a todas las combinaciones y analíticas avanzadas sin límites locales.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Precio:', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                  Text(
                    '\$4.99 USD / mes',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Botón de pago simulando bottom sheet de Play Store
        NeonButton(
          label: 'PAGAR CON GOOGLE PLAY',
          icon: Icons.shopping_bag_rounded,
          onPressed: () => _showPlayStoreBottomSheet(context),
          width: double.infinity,
          height: 48,
        ),
      ],
    );
  }

  void _showPlayStoreBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1F1F1F),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cabecera Play Store
              Row(
                children: [
                  const Icon(Icons.shop_two_rounded, color: Colors.white, size: 24),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Google Play', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('apuestas_futbol.premium_vip', style: TextStyle(color: Colors.white54, fontSize: 11)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white54),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              const Divider(color: Colors.white24, height: 24),
              
              // Detalles del Producto
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gol Saint VIP (Mensual)', style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 14, fontWeight: FontWeight.bold)),
                  const Text('\$4.99 + Imp.', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'Suscripción auto-renovable. Cancela cuando quieras.',
                style: TextStyle(color: Colors.white54, fontSize: 11),
              ),
              const Divider(color: Colors.white24, height: 24),

              // Cuenta y método
              const Row(
                children: [
                  Icon(Icons.account_circle, color: Colors.white60, size: 20),
                  SizedBox(width: 12),
                  Text('andres.ganador@gmail.com', style: TextStyle(color: Colors.white, fontSize: 13)),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Icon(Icons.payment, color: Color(0xFF39FF14), size: 20),
                  SizedBox(width: 12),
                  Text('Visa •••• 4022', style: TextStyle(color: Colors.white, fontSize: 13)),
                  Spacer(),
                  Icon(Icons.chevron_right, color: Colors.white30),
                ],
              ),
              const SizedBox(height: 28),

              // Botón Comprar
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra bottom sheet
                  _processPayment(); // Inicia simulación de pago
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A25B), // Verde Google Play
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Suscribirse', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}

// ── Formatters auxiliares para el TextField de Tarjeta ──────────────────────

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class _CardExpiryFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex == 2 && nonZeroIndex != text.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
