

class OnboardingModel {
  final String image;
  final String image2;
  final String title;
  final String title2;

  OnboardingModel({
    required this.image,
    required this.image2,
    required this.title,
    required this.title2,
  });
}

final List<OnboardingModel> onboardingData = [
    OnboardingModel(
      image: 'assets/Group 34209.png',
      image2: 'assets/Group 79.png', // Replace with your image path
      title: 'Discover, Book, and Enjoy a World of   ',
      title2: 'Services',
    ),
    OnboardingModel(
      image: 'assets/Group 34208.png',
      image2: 'assets/Group 80.png', // Replace with your image path
      title: 'Welcome to MyApp',
      title2: 'This is the first onboarding screen.',
    ),
    OnboardingModel(
      image: 'assets/Group 34210.png',
      image2: 'assets/Group 81.png', // Replace with your image path
      title: 'Getting Started',
      title2: 'Swipe to the right to see the second screen.',
    ),
  ];