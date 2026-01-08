import 'package:exportman/view/pages/booking/booking_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:exportman/Model/booking_model/booking_model.dart';

/// Selected Booking ID
final selectedBookingIdProvider = StateProvider<String?>((ref) => null);

/// Single booking provider
final bookingDetailProvider = Provider<BookingModel>((ref) {
  final id = ref.watch(selectedBookingIdProvider);

  final bookings = ref.watch(bookingProvider);

  return bookings.firstWhere((b) => b.id == id);
});
