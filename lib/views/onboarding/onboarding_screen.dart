
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../../controllers/sign_in_controller.dart';
import '../auth/sign_in_screen.dart';
import '../home_screen.dart';
import 'Components/onboarding_data.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final storage = GetStorage();
  final controller = OnboardingData();
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());

    return Scaffold(
      body: Column(
        children: [
          body(),
          buildDots(),
          button(),
        ],
      ),
    );
  }

  //Body
  Widget body(){
    return Expanded(
      child: Center(
        child: PageView.builder(
            onPageChanged: (value){
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: controller.items.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Images

                    Lottie.asset(
                      (controller.items[currentIndex].image),
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),

                    const SizedBox(height: 15),
                    //Titles
                    SizedBox(height: 150,),
                    Text(controller.items[currentIndex].title,
                      style: const TextStyle(fontSize: 25,color: AppColors.primaryColor,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,),

                    //Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(controller.items[currentIndex].description,
                        style: const TextStyle(color: Colors.grey,fontSize: 16),textAlign: TextAlign.center,),
                    ),

                  ],
                ),
              );
            }),
      ),
    );
  }

  //Dots
  Widget buildDots(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.items.length, (index) => AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration:   BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: currentIndex == index? AppColors.primaryColor : Colors.grey,
          ),
          height: 7,
          width: currentIndex == index? 30 : 7,
          duration: const Duration(milliseconds: 700))),
    );
  }

  //Button
  Widget button(){

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width *.9,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primaryColor
      ),

      child: TextButton  (
        onPressed: ()async {
           if (currentIndex == controller.items.length - 1) {
             if (storage.read("token") != null ) {
               Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder: (context) => HomeScreen()),
               );
             } else {
               Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder: (context) => SignInScreen()),
               );
             }
           }
          setState(() {
            currentIndex != controller.items.length -1? currentIndex++ : null;
          });
        },
        child: Text(currentIndex == controller.items.length -1? "Get started" : "Continue",
          style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
