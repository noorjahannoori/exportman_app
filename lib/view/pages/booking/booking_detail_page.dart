import 'package:exportman/Model/booking_model/booking_detail_model.dart';
import 'package:exportman/view/pages/booking/rate_popup.dart';

import 'package:exportman/view/pages/review/review_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:exportman/theme/colors.dart';

class BookingDetailPage extends ConsumerWidget {
  const BookingDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booking = ref.watch(bookingDetailProvider);
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Booking Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// SUB BOOKING + ID
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sub Booking', style: theme.bodyMedium),
                Text(
                  booking.id,
                  style: theme.bodyMedium?.copyWith(color: AppColors.primary),
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Divider(color: Color(0xFFEBEBEB)),
            const SizedBox(height: 12),

            /// SERVICE + DATE + IMAGE
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(booking.serviceName, style: theme.bodyMedium),
                      const SizedBox(height: 6),
                      Text(booking.date, style: theme.bodyMedium),
                      Text(booking.time, style: theme.bodyMedium),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    booking.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// DURATION BOX
            Container(
              width: 335,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFEBEBEB)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Service Taken Time', style: theme.bodyMedium),
                  Text('60 Min', style: theme.bodyMedium),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ABOUT HOUSEMAN
            Text('About Houseman', style: theme.bodyMedium),
            const SizedBox(height: 12),

            /// PROVIDER BOX
            Container(
              width: 336,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F7F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/images/boy.png'),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(booking.provider, style: theme.bodyMedium),
                          Text(booking.serviceName, style: theme.bodySmall),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4),
                              Text('4.5 (120 reviews)', style: theme.bodySmall),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.call, color: Colors.white),
                          label: const Text(
                            'Call',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.chat, color: Colors.black),
                          label: Text('Chat', style: theme.bodyMedium),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Center(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierColor: Colors.black.withOpacity(
                            0.5,
                          ), // dark background
                          builder: (_) => const RateReviewDialog(),
                        );
                      },
                      child: Text(
                        'Rate Now',
                        style: theme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// CANCEL BUTTON
            SizedBox(
              width: 335,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Cancel Booking',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// 💰 PRICE DETAIL BOX
            Container(
              width: 335,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F7F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    'Price Detail',
                    style: theme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 12),

                  _infoRow('Price', '₹120', theme),
                  const Divider(color: Color(0xFFEBEBEB)),

                  _infoRow('Sub Total', '₹120 × 2 = ₹240', theme),
                  const Divider(color: Color(0xFFEBEBEB)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount (5% off)',
                        style: theme.titleSmall?.copyWith(color: Colors.green),
                      ),
                      Text(
                        '- ₹15.12',
                        style: theme.bodyMedium?.copyWith(color: Colors.green),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xFFEBEBEB)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax',
                        style: theme.titleSmall?.copyWith(
                          color: AppColors.bodyText,
                        ),
                      ),
                      Text(
                        '₹15.12',
                        style: theme.bodyMedium?.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xFFEBEBEB)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Coupon (AB45789A)',
                        style: theme.titleSmall?.copyWith(
                          color: const Color(0xFFFFA726),
                        ),
                      ),
                      Text(
                        '- ₹10',
                        style: theme.bodyMedium?.copyWith(color: Colors.green),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  const Divider(color: Color(0xFFEBEBEB)),
                  const SizedBox(height: 8),

                  /// TOTAL
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: theme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '₹255.12',
                        style: theme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const ReviewsSection(),
          ],
        ),
      ),
    );
  }
}

Widget _infoRow(String title, String value, TextTheme theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: theme.titleSmall?.copyWith(color: AppColors.bodyText)),
      Text(value, style: theme.bodyMedium),
    ],
  );
}
