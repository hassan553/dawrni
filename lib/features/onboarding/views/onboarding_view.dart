import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
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
      image: 'assets/Group 34209.png', // Replace with your image path
      title: 'Discover, Book, and Enjoy a World of   ',
      title2: 'Services',
    ),
    OnboardingModel(
      image: 'assets/Group 34208.png', // Replace with your image path
      title: 'Welcome to MyApp',
      title2: 'This is the first onboarding screen.',
    ),
    OnboardingModel(
      image: 'assets/Group 34210.png', // Replace with your image path
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
            fit: BoxFit.cover, // How the image should be inscribed into the box
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Opacity(
              opacity: .8,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF262626),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 10,
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
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                const Spacer(
                  flex: 1,
                ),
                if (_currentPage == onboardingData.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      // Handle the action when the user presses the "Get Started" button.
                    },
                    child: const Text('Get Started'),
                  ),
                const Spacer(
                  flex: 1,
                ),
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
  final String title;
  final String title2;

  OnboardingModel({
    required this.image,
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
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 15.0),
            child: Wrap(
              children: [
                ResponsiveText(
                  text: data.title,
                  scaleFactor: .08,
                  color: AppColors.white,
                ),
                const Stack(
                  alignment: Alignment.center,
                  children: [
                    RotatedTrapezoidalContainer(
                      width: 150.0,
                      height: 40.0,
                      color: AppColors.primaryColor,
                      rotationAngle: 180.0,
                    ),
                    FittedBox(
                      child: ResponsiveText(
                        text: 'Services',
                        scaleFactor: .07,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
