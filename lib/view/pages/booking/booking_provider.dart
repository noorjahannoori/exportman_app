import 'package:exportman/Model/booking_model/booking_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final bookingStatusProvider =
    StateProvider<BookingStatus>((ref) => BookingStatus.all);

final bookingProvider = Provider<List<BookingModel>>((ref) {
  final status = ref.watch(bookingStatusProvider);

  final allBookings = [
    BookingModel(
      id: '#123',
      serviceName: 'Apartment Cleaning',
      image: 'assets/images/service.png',
      price: 120,
      date: '12 Aug 2025',
      time: '10:00 AM',
      provider: 'John',
      payment: 'Cash',
      status: BookingStatus.pending,
    ),
    BookingModel(
      id: '#124',
      serviceName: 'Home Painting',
      image: 'assets/images/service2.png',
      price: 300,
      date: '15 Aug 2025',
      time: '01:00 PM',
      provider: 'Alex',
      payment: 'Card',
      status: BookingStatus.completed,
    ),
     BookingModel(
      id: '#123',
      serviceName: 'Home Painting',
      image: 'assets/images/service.png',
      price: 300,
      date: '15 Aug 2025',
      time: '01:00 PM',
      provider: 'Alex',
      payment: 'Card',
      status: BookingStatus.cancelled,
    ),
     BookingModel(
      id: '#124',
      serviceName: 'Home Painting',
      image: 'assets/images/service3.png',
      price: 300,
      date: '15 Aug 2025',
      time: '01:00 PM',
      provider: 'Alex',
      payment: 'Card',
      status: BookingStatus.rejected,
    ),
     BookingModel(
      id: '#124',
      serviceName: 'Home Painting',
      image: 'assets/images/service2.png',
      price: 300,
      date: '15 Aug 2025',
      time: '01:00 PM',
      provider: 'Alex',
      payment: 'Card',
      status: BookingStatus.inProgress,
    ),
     BookingModel(
      id: '#124',
      serviceName: 'Home Painting',
      image: 'assets/images/service1.png',
      price: 300,
      date: '15 Aug 2025',
      time: '01:00 PM',
      provider: 'Alex',
      payment: 'Card',
      status: BookingStatus.completed,
    ),
  ];

  if (status == BookingStatus.all) return allBookings;
  return allBookings.where((e) => e.status == status).toList();
});
