import 'package:flutter/material.dart';
import 'package:onboarding/constant/constant.dart';
import 'package:onboarding/screens/signin_up.dart';

// import 'package:onboarding_screen/screens/signup_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnBoardingWidgets(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  demo_data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: DotIndicator(
                      isActive: index == _pageIndex,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_pageIndex != demo_data.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInUp(),
                      ),
                    );
                  }
                },
                // _pageController.nextPage(
                //   duration: const Duration(microseconds: 300),
                //   curve: Curves.ease,
                // );
              
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: primaryColor,
                ),
                child: Text(
                  _pageIndex == demo_data.length - 1 ? 'Get Started' : 'Next',
                  style: ButtonText,
                ),
              ),
            ),
            // Skip button visible on all pages except the last one
            if (_pageIndex != demo_data.length - 1)
              TextButton(
                onPressed: () {
                  // Navigate to HomeScreen when 'Skip' is pressed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInUp()),
                  );
                },
                child: Text("Skip", style: SubText),
              ),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 6,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.redAccent.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/images/pic1.png",
    title: "Find your inspiration",
    description: "Millions of free picture download  available here ",
  ),
  Onboard(
    image: "assets/images/pic2.png",
    title: "Publish your creativity",
    description: "With the ultimate platform to share your wonderful work",
  ),
  Onboard(
    image: "assets/images/pic3.png",
    title: "Connect you to the world",
    description: "Exchange positive feedback among our artist members",
  ),
  Onboard(
    image: "assets/images/pic4.jpg",
    title: "Life is short, art is long",
    description:
        "Your legacy will be appreciated as long as the world exists",
  ),
  // Onboard(
  //   image: "assets/images/on_boarding_page3.png",
  //   title: "Fast and secure \npayment",
  //   description: "There are many payment options for your ease.",
  // ),
];

class OnBoardingWidgets extends StatelessWidget {
  const OnBoardingWidgets({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 280,
        ),
        const Spacer(),
        Text(title, textAlign: TextAlign.center, style: TitleText),
        const SizedBox(
          height: 16,
        ),
        Text(description, textAlign: TextAlign.center, style: DescriptionText),
        const Spacer(),
      ],
    );
  }
}
