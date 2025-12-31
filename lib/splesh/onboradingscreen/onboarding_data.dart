class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardingModel> onboardingList = [
  OnboardingModel(
    image: 'assets/images/1.png',
    title: 'Welcome To Houseman',
    description:
        'Find trusted professionals for all your home services easily.',
  ),
  OnboardingModel(
    image: 'assets/images/2.png',
    title: 'Find Your Service',
    description:
        'Choose services according to your needs and preferences.',
  ),
  OnboardingModel(
    image: 'assets/images/3.png',
    title: 'Book The Appointment',
    description:
        'Schedule your service at a time that works best for you.',
  ),
  OnboardingModel(
    image: 'assets/images/4.png',
    title: 'Payment Gateway',
    description:
        'Pay securely with multiple payment options.',
  ),
];
