enum BookingStatus { all, pending, inProgress, completed, rejected, cancelled }

class BookingModel {
  final String id;
  final String serviceName;
  final String image;
  final double price;
  final String date;
  final String time;
  final String provider;
  final String payment;
  final BookingStatus status;

  BookingModel({
    required this.id,
    required this.serviceName,
    required this.image,
    required this.price,
    required this.date,
    required this.time,
    required this.provider,
    required this.payment,
    required this.status,
  });
}
