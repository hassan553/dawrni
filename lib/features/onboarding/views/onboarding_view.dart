import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_slide_button.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/auth/client/views/login_client_view.dart';
import 'package:flutter/material.dart';

import '../../../core/contants/painter.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/Vector.jpg'), // Replace with your image asset path
            fit: BoxFit.fill, // How the image should be inscribed into the box
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Opacity(
              opacity: .83,
              child: Container(
                color: const Color(0xFF262626),
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 13,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingData.length,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                       
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnboardingPage(
                        data: onboardingData[index],
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _buildPageIndicator(),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 25),
                  child: BookBotton(
                    title: 'Next',
                    function: () {
                      if (_currentPage == onboardingData.length - 1) {
                        navigateOff(const LoginClientView());
                      } else {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.bounceInOut);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 25),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {
                        if (_currentPage == onboardingData.length - 1) {
                          navigateOff(const LoginClientView());
                        } else {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.bounceInOut);
                        }
                      },
                      child: const Text(
                        'Skip >',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < onboardingData.length; i++) {
      indicators.add(
        i == _currentPage ? _buildIndicator(true) : _buildIndicator(false),
      );
    }
    return indicators;
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 5.0,
      width: isActive ? 30.0 : 20.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

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

class OnboardingPage extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40.0),
          Image.asset(
            data.image,
            fit: BoxFit.fill,
            height: screenSize(context).height * .4,
          ),
          const SizedBox(height: 20),
          Image.asset(
            data.image2,
            fit: BoxFit.fill,
            height: 120,
          ),
        ],
      ),
    );
  }
}
