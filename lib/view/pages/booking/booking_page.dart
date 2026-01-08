import 'package:exportman/Model/booking_model/booking_detail_model.dart';
import 'package:exportman/Model/booking_model/booking_model.dart';
import 'package:exportman/view/pages/booking/booking_detail_page.dart';
import 'package:exportman/view/pages/booking/booking_provider.dart';
import 'package:exportman/theme/colors.dart';
import 'package:exportman/view/pages/booking/edit_service_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingPage extends ConsumerWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    final bookings = ref.watch(bookingProvider);
    final selectedStatus = ref.watch(bookingStatusProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('My Bookings', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// 🔽 DROPDOWN
            Container(
              width: 334,
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(30), // 👈 more round
                border: Border.all(color: const Color(0xFFEBEBEB)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<BookingStatus>(
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(
                    16,
                  ), // 👈 dropdown menu round
                  icon: const Icon(Icons.keyboard_arrow_down),
                  value: selectedStatus,
                  items: BookingStatus.values.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.name.toUpperCase(),
                        style: theme.bodyMedium,
                      ),
                    );
                  }).toList(),
                  onChanged: (v) {
                    ref.read(bookingStatusProvider.notifier).state = v!;
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// 📃 LIST
            Expanded(
              child: ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final b = bookings[index];
                  return GestureDetector(
                    onTap: () {
                      ref.read(selectedBookingIdProvider.notifier).state = b.id;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BookingDetailPage(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFEBEBEB)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// IMAGE + STATUS
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  b.image,
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 16,
                                left: 16,
                                child: _statusBadge(b.status),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          /// TITLE + ID
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(b.serviceName, style: theme.bodyMedium),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    b.id,
                                    style: theme.bodyMedium?.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),

                                  /// ✏️ EDIT ICON (ONLY PENDING)
                                  if (b.status == BookingStatus.pending)
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          barrierColor: Colors.black
                                              .withOpacity(0.5),
                                          builder: (_) =>
                                              EditServiceDialog(booking: b),
                                        );
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 6),
                                        child: Icon(
                                          Icons.edit,
                                          size: 18,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          /// PRICE
                          Text(
                            '\$${b.price}',
                            style: theme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                            ),
                          ),

                          const SizedBox(height: 12),

                          /// INFO BOX
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F7F9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                _infoRow('Date', b.date, theme),
                                _divider(),
                                _infoRow('Time', b.time, theme),
                                _divider(),
                                _infoRow('Provider', b.provider, theme),
                                _divider(),
                                _infoRow('Payment', b.payment, theme),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🏷 STATUS BADGE
  Widget _statusBadge(BookingStatus status) {
    final colors = {
      BookingStatus.pending: const Color(0xFFEA2F2F),
      BookingStatus.inProgress: const Color(0xFFFD6922),
      BookingStatus.completed: const Color(0xFF3CAE5C),
      BookingStatus.rejected: const Color(0xFF400D0A),
      BookingStatus.cancelled: const Color(0xFFFF0303),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colors[status],
        borderRadius: BorderRadius.circular(170),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _infoRow(String title, String value, TextTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.titleSmall?.copyWith(color: AppColors.bodyText),
        ),
        Text(value, style: theme.bodyMedium),
      ],
    );
  }

  Widget _divider() => const Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Divider(height: 1, color: Color(0xFFEBEBEB)),
  );
}
