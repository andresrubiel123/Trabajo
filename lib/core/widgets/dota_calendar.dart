import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
import 'glass_card.dart';

/// Un calendario interactivo mensual con estética de interfaz de Dota 2.
/// 
/// Presenta bordes finos azules, fondos oscuros y texto en color naranja brand.
class DotaCalendar extends StatelessWidget {
  /// Constructor para [DotaCalendar].
  const DotaCalendar({
    super.key,
    required this.selectedDate,
    required this.currentMonth,
    required this.onDateSelected,
    required this.onMonthChanged,
    this.isFutureDisabled = false,
    this.isPastDisabled = false,
  });

  /// La fecha actualmente seleccionada.
  final DateTime selectedDate;

  /// El mes que se está visualizando en el calendario.
  final DateTime currentMonth;

  /// Callback ejecutado cuando el usuario selecciona un día.
  final ValueChanged<DateTime> onDateSelected;

  /// Callback ejecutado cuando el usuario cambia de mes.
  final ValueChanged<DateTime> onMonthChanged;

  /// Inhabilitar la selección de fechas futuras
  final bool isFutureDisabled;

  /// Inhabilitar la selección de fechas pasadas
  final bool isPastDisabled;

  @override
  Widget build(BuildContext context) {
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDayOfMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    
    // Día de la semana del primer día del mes (1 = Lunes, 7 = Domingo)
    final firstWeekday = firstDayOfMonth.weekday;
    final leadingEmptyDays = firstWeekday - 1; // offset para que el lunes sea la primera columna
    
    final weekdays = ['LUN', 'MAR', 'MIÉ', 'JUE', 'VIE', 'SÁB', 'DOM'];
    
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    
    final showPrevMonth = !isPastDisabled || 
        currentMonth.year > today.year || 
        (currentMonth.year == today.year && currentMonth.month > today.month);

    final showNextMonth = !isFutureDisabled || 
        currentMonth.year < today.year || 
        (currentMonth.year == today.year && currentMonth.month < today.month);
    
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 280),
        child: GlassCard(
          padding: const EdgeInsets.all(10),
          borderColor: AppColors.premiumBlue.withValues(alpha: 0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cabecera con nombre del mes y navegación
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 18,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      color: showPrevMonth ? AppColors.premiumBlue : AppColors.premiumBlue.withValues(alpha: 0.2),
                    ),
                    onPressed: showPrevMonth ? () {
                      onMonthChanged(DateTime(currentMonth.year, currentMonth.month - 1));
                    } : null,
                  ),
                  Text(
                    DateFormat('MMMM yyyy', 'es').format(currentMonth).toUpperCase(),
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.premiumBlue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 10,
                    ),
                  ),
                  IconButton(
                    iconSize: 18,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      Icons.chevron_right_rounded,
                      color: showNextMonth ? AppColors.premiumBlue : AppColors.premiumBlue.withValues(alpha: 0.2),
                    ),
                    onPressed: showNextMonth ? () {
                      onMonthChanged(DateTime(currentMonth.year, currentMonth.month + 1));
                    } : null,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              
              // Iniciales de los días de la semana
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: weekdays.map((day) => Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: AppTypography.labelSmall.copyWith(
                        fontSize: 8.5,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )).toList(),
              ),
              const SizedBox(height: 6),
              
              // Rejilla de días
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1.0,
                ),
                itemCount: leadingEmptyDays + daysInMonth,
                itemBuilder: (context, index) {
                  if (index < leadingEmptyDays) {
                    return const SizedBox();
                  }
                  
                  final dayNumber = index - leadingEmptyDays + 1;
                  final dayDate = DateTime(currentMonth.year, currentMonth.month, dayNumber);
                  
                  final isFuture = dayDate.isAfter(todayDate);
                  final isPast = dayDate.isBefore(todayDate);
                  
                  final isDisabled = (isFutureDisabled && isFuture) || (isPastDisabled && isPast);
                  
                  final isSelected = dayDate.year == selectedDate.year &&
                      dayDate.month == selectedDate.month &&
                      dayDate.day == selectedDate.day;
                      
                  final isToday = dayDate.year == today.year &&
                      dayDate.month == today.month &&
                      dayDate.day == today.day;
                      
                  return GestureDetector(
                    onTap: isDisabled ? null : () => onDateSelected(dayDate),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                        color: isSelected 
                            ? const Color(0xFF040508)
                            : Colors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: isDisabled
                              ? Colors.transparent
                              : isSelected
                                  ? AppColors.premiumBlue
                                  : isToday
                                      ? AppColors.premiumBlue.withValues(alpha: 0.6)
                                      : AppColors.premiumBlue.withValues(alpha: 0.25),
                          width: isSelected ? 1.5 : 0.8,
                        ),
                        boxShadow: isSelected && !isDisabled
                            ? [
                                BoxShadow(
                                  color: AppColors.premiumBlue.withValues(alpha: 0.3),
                                  blurRadius: 4,
                                )
                              ]
                            : null,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            '$dayNumber',
                            style: AppTypography.bodyMedium.copyWith(
                              color: isDisabled
                                  ? AppColors.textSecondary.withValues(alpha: 0.2)
                                  : AppColors.primary,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              fontSize: 11,
                            ),
                          ),
                          if (isToday)
                            Positioned(
                              bottom: 2,
                              child: Container(
                                width: 3,
                                height: 3,
                                decoration: const BoxDecoration(
                                  color: AppColors.premiumBlue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
