import 'package:flutter/material.dart';
import 'package:onboarding/constant/constant.dart';

class SignInUp extends StatelessWidget {
  const SignInUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background2.jpg', 
              fit: BoxFit.cover, 
            ),
          ),

         
          Positioned(
            top: MediaQuery.of(context).size.height /
                2, 
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height /
                2, 
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor, // Fully opaque
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ), 
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), 
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.png', scale: 6, color: Colors.white,),
                    const Spacer(),
                    Text(
                      'Explore the best of ideas',
                      style: Head, 
                    ),
                    SizedBox(height: 20),
                    Text(
                      'A place of endless possibilities to explore new ideas, shop new trends, and try out',
                      style: SubHead,
                      textAlign: TextAlign.center, 
                    ),
                    const Spacer(), 
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          'Register',
                          style: ButtonText2 
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(
                            color: Colors.white, // White border color
                            width:
                                2, 
                          ),
                        ),
                        child: Text(
                          'Log in',
                          style: ButtonText.copyWith(
                              color: Colors.white), 
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
