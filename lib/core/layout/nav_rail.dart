import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_typography.dart';
import '../routes/app_routes.dart';
import '../widgets/gradient_text.dart';
import 'nav_item_model.dart';

/// Panel de navegación izquierdo con diseño negro premium y bordes azules.
class AppNavRail extends StatefulWidget {
  const AppNavRail({super.key, this.forceCollapsed = false});

  final bool forceCollapsed;

  @override
  State<AppNavRail> createState() => _AppNavRailState();
}

class _AppNavRailState extends State<AppNavRail> {
  bool _isExpanded = true;

  bool get _effectivelyExpanded =>
      widget.forceCollapsed ? false : _isExpanded;

  static final List<NavItemModel> _items = [
    NavItemModel(
      label: 'Dashboard',
      icon: Icons.dashboard_outlined,
      activeIcon: Icons.dashboard_rounded,
      route: AppRoutes.dashboard,
    ),
    NavItemModel(
      label: 'Predicciones',
      icon: Icons.bolt_outlined,
      activeIcon: Icons.bolt_rounded,
      route: AppRoutes.predicciones,
    ),
    NavItemModel(
      label: 'Generar Combinaciones',
      icon: Icons.auto_awesome_outlined,
      activeIcon: Icons.auto_awesome_rounded,
      route: AppRoutes.combinaciones,
      accentColor: AppColors.premiumBlue,
    ),
    NavItemModel(
      label: 'Historial',
      icon: Icons.history_outlined,
      activeIcon: Icons.history_rounded,
      route: AppRoutes.historial,
    ),
    NavItemModel(
      label: 'Resultados',
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart_rounded,
      route: AppRoutes.estadisticas,
    ),
    NavItemModel(
      label: 'Configuración',
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings_rounded,
      route: AppRoutes.configuracion,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).matchedLocation;
    final width = _effectivelyExpanded
        ? AppConstants.navRailWidth
        : AppConstants.navRailCollapsedWidth;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.black, // Fondo negro sólido para el sidebar
        border: Border(
          right: BorderSide(color: AppColors.premiumBlue, width: 0.8), // Borde derecho azul premium
        ),
      ),
      child: Column(
        children: [
          // Logo / Header
          _buildHeader(),

          const SizedBox(height: 8),

          // Divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 1, color: AppColors.premiumBlue),
          ),

          const SizedBox(height: 16),

          // Nav Items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                final isActive = currentRoute == item.route;
                return _NavItemTile(
                  item: item,
                  isActive: isActive,
                  isExpanded: _effectivelyExpanded,
                  onTap: () => context.go(item.route),
                );
              },
            ),
          ),

          // Toggle / Footer
          if (!widget.forceCollapsed) _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final isExpanded = _effectivelyExpanded;
    final double logoSize = isExpanded ? 152.0 : 38.0;
    final double headerHeight = isExpanded ? 240.0 : 80.0;
    final double borderRadius = isExpanded ? 24.0 : 10.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: headerHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: isExpanded
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: logoSize,
                  height: logoSize,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(color: AppColors.premiumBlue, width: 0.8),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.premiumBlue.withValues(alpha: 0.3),
                        blurRadius: 24,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const GradientText(
                  'APUESTAS FÚTBOL',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
              ],
            )
          : Center(
              child: Container(
                width: logoSize,
                height: logoSize,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: AppColors.premiumBlue, width: 0.8),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.premiumBlue.withValues(alpha: 0.3),
                      blurRadius: 12,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Divider(color: AppColors.premiumBlue, height: 1),
          const SizedBox(height: 8),
          _NavFooterButton(
            icon: _effectivelyExpanded
                ? Icons.chevron_left_rounded
                : Icons.chevron_right_rounded,
            label: 'Colapsar',
            isExpanded: _effectivelyExpanded,
            onTap: () => setState(() => _isExpanded = !_isExpanded),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

// ── Nav Item Tile con animación shimmer en hover ─────────────────────────────

class _NavItemTile extends StatefulWidget {
  const _NavItemTile({
    required this.item,
    required this.isActive,
    required this.isExpanded,
    required this.onTap,
  });

  final NavItemModel item;
  final bool isActive;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  State<_NavItemTile> createState() => _NavItemTileState();
}

class _NavItemTileState extends State<_NavItemTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmerAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _shimmerAnimation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHoverEnter() {
    setState(() {
      _isHovered = true;
    });
    _controller.forward(from: 0.0);
  }

  void _onHoverExit() {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.premiumBlue;
    final isActive = widget.isActive;

    return MouseRegion(
      onEnter: (_) => _onHoverEnter(),
      onExit: (_) => _onHoverExit(),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            color: Colors.black, // Fondo negro para todos los botones
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isActive 
                  ? activeColor 
                  : (_isHovered ? activeColor.withValues(alpha: 0.6) : Colors.transparent),
              width: 0.8,
            ),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: activeColor.withValues(alpha: 0.2),
                      blurRadius: 8,
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                // Contenido principal de la celda
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      // Barra indicadora activa
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        width: 3,
                        height: 22,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: isActive ? activeColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      
                      // Ícono (con ShaderMask si está activo)
                      if (isActive)
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: Icon(
                            widget.item.activeIcon,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      else
                        Icon(
                          widget.item.icon,
                          size: 20,
                          color: _isHovered ? AppColors.textPrimary : AppColors.navInactive,
                        ),

                      if (widget.isExpanded) ...[
                        const SizedBox(width: 12),
                        Expanded(
                          child: isActive
                              ? GradientText(
                                  widget.item.label,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                )
                              : Text(
                                  widget.item.label,
                                  style: AppTypography.bodyMedium.copyWith(
                                    color: _isHovered ? AppColors.textPrimary : AppColors.navInactive,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                        ),
                      ],
                    ],
                  ),
                ),
                // Destello Shimmer horizontal en hover
                Positioned.fill(
                  child: IgnorePointer(
                    child: AnimatedBuilder(
                      animation: _shimmerAnimation,
                      builder: (context, child) {
                        if (!_isHovered && _controller.isDismissed) {
                          return const SizedBox.shrink();
                        }
                        return FractionallySizedBox(
                          widthFactor: 0.4,
                          alignment: Alignment(_shimmerAnimation.value, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withValues(alpha: 0.0),
                                  Colors.white.withValues(alpha: 0.12),
                                  Colors.white.withValues(alpha: 0.0),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Footer Button con diseño estándar ────────────────────────────────────────

class _NavFooterButton extends StatefulWidget {
  const _NavFooterButton({
    required this.icon,
    required this.label,
    required this.isExpanded,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  State<_NavFooterButton> createState() => _NavFooterButtonState();
}

class _NavFooterButtonState extends State<_NavFooterButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isHovered ? AppColors.premiumBlue : AppColors.premiumBlue.withValues(alpha: 0.4),
              width: 0.8,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.premiumBlue.withValues(alpha: 0.2),
                      blurRadius: 6,
                    )
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: widget.isExpanded
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 18, color: _isHovered ? AppColors.premiumBlue : AppColors.textSecondary),
              if (widget.isExpanded) ...[
                const SizedBox(width: 10),
                Text(
                  widget.label,
                  style: AppTypography.labelMedium.copyWith(
                    color: _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
