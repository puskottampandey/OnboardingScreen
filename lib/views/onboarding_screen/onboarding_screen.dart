import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/utilis/button_widget.dart';
import 'package:flutter_application_1/views/login_screen/login_screen.dart';
import 'package:flutter_application_1/views/onboarding_screen/onboaring_model.dart';
import 'package:flutter_application_1/views/signup_screen/signup_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0);
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Row(
          children: List.generate(models.length, (int index) {
            return DotIndicator(
              isActive: currentPage == index,
            );
          }),
        ),
        actions: [
          const SizedBox(
            width: 200,
          ),
          TextButton.icon(
            onPressed: () {},
            label: Text(
              currentPage == 2 ? "Later" : "Skip",
              style: const TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    controller: controller,
                    itemCount: models.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            models[index].title.toString(),
                            style: texttheme.titleLarge!.copyWith(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            models[index].description.toString(),
                            style: texttheme.titleSmall!.copyWith(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Image.asset(
                            models[index].image.toString(),
                          ),
                        ],
                      );
                    }),
              ),
              ReuseableButtons(
                title: currentPage == 2 ? "Sign Up" : "Continue",
                onTap: () {
                  if (currentPage == 2) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  }
                  controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              currentPage == 2
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : const Text("")
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.all(3),
      height: 6,
      width: isActive ? 20 : 6,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
