class OnboardingScreen {
  final String? title;
  final String? description;
  final String? image;
  OnboardingScreen({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnboardingScreen> models = [
  OnboardingScreen(
      title: "Shop with our single-use cards",
      description:
          "Buy from new online stores with extra,single-use card numbers that won't work twice,keeping your details safe even it they get exposed,",
      image: "assets/images/F1.png"),
  OnboardingScreen(
      title: "Starting saving the easy way",
      description:
          "Set money aside wtihout thinking about it include your spare change and regular transfers",
      image: "assets/images/second.png"),
  OnboardingScreen(
      title: "keep your budget on track with smart analytics",
      description:
          "Get a clear views of your spendings,knoe exactly where your money is going",
      image: "assets/images/third.png")
];
