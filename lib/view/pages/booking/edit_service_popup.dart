import 'package:exportman/Model/booking_model/booking_model.dart';
import 'package:exportman/theme/colors.dart';
import 'package:flutter/material.dart';

class EditServiceDialog extends StatefulWidget {
  final BookingModel booking;
  const EditServiceDialog({super.key, required this.booking});

  @override
  State<EditServiceDialog> createState() => _EditServiceDialogState();
}

class _EditServiceDialogState extends State<EditServiceDialog> {
  String selectedDate = '12 Aug 2025';
  String selectedTime = '10:00 AM';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 335,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 🔵 HEADER
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edit Service',
                    style: theme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// BOOKING ID
                  Text(
                    widget.booking.id,
                    style: theme.bodyMedium?.copyWith(color: AppColors.primary),
                  ),

                  const SizedBox(height: 4),

                  /// SERVICE NAME
                  Text(widget.booking.serviceName, style: theme.bodyMedium),

                  const SizedBox(height: 16),

                  /// 📦 DATE & TIME BOX
                  Container(
                    width: 295,
                    height: 120,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F7F9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoRow(
                          'Date',
                          selectedDate,
                          theme,
                          onTap: () {
                            // 🔜 Date picker later
                          },
                        ),
                        const Divider(color: Color(0xFFEBEBEB)),
                        _infoRow(
                          'Time',
                          selectedTime,
                          theme,
                          onTap: () {
                            // 🔜 Time picker later
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.main,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            // 🔜 API integration later
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(
    String title,
    String value,
    TextTheme theme, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.titleSmall?.copyWith(color: AppColors.bodyText),
          ),
          Row(
            children: [
              Text(value, style: theme.bodyMedium),
              const SizedBox(width: 6),
              const Icon(Icons.edit, size: 16),
            ],
          ),
        ],
      ),
    );
  }
}
