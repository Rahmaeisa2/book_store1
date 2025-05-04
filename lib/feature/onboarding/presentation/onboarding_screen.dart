 import 'package:book_store/core/services/local/shared_pref/shared_pref.dart';
import 'package:book_store/core/services/local/shared_pref/shared_pref_key.dart';
import 'package:book_store/feature/onboarding/presentation/widget/page_view.dart';
import 'package:book_store/feature/splash/presentation/splash.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
    OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   PageController pageController=PageController(initialPage: 0);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Padding(
         padding: const EdgeInsets.symmetric(
           horizontal: 17,
           vertical: 30,
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end ,
           children: [
             TextButton(onPressed: (){
               SharedPref.saveData(key: prefsKey.onBoardingIsOpen, value: true);
               Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));

             }, child: const Text(
               "Skip",style: TextStyle(
               fontSize: 17,
               fontWeight: FontWeight.bold),
             )),
             const SizedBox(
               height: 190,
             ),
             Expanded(child: PageView(
               controller: pageController,
               children: const [
                 PageViewItem(imageUrl: "https://img.freepik.com/free-vector/lagom-life-flat-composition-room-interior-with-flowers-window-cat-reading-woman-sofa-vector-illustration_1284-77989.jpg?t=st=1743112688~exp=1743116288~hmac=5934123c2815e8b86ef8de0386ad7984b50fe1c2c6772e04b42ca662dffb56cc&w=900"
               , text: 'Reading is conversation \n All books talk . But a good book listen as weel',

                 ),
                 PageViewItem(imageUrl: "https://img.freepik.com/free-vector/lagom-life-flat-composition-room-interior-with-flowers-window-cat-reading-woman-sofa-vector-illustration_1284-77989.jpg?t=st=1743112688~exp=1743116288~hmac=5934123c2815e8b86ef8de0386ad7984b50fe1c2c6772e04b42ca662dffb56cc&w=900"
                ,   text: 'Read the best book frist , or you may not have chance to read them at all.',),

                 PageViewItem(imageUrl: "https://img.freepik.com/free-vector/lagom-life-flat-composition-room-interior-with-flowers-window-cat-reading-woman-sofa-vector-illustration_1284-77989.jpg?t=st=1743112688~exp=1743116288~hmac=5934123c2815e8b86ef8de0386ad7984b50fe1c2c6772e04b42ca662dffb56cc&w=900"

                 ,  text: 'Reading give us someplace to go when we have to stay where we are',

                 ),
               ],
             )),
             Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SmoothPageIndicator(
                     controller: pageController,  // PageController
                     count:  3,
                     effect: const ExpandingDotsEffect(
                       dotHeight: 10,
                       activeDotColor: Colors.black,
                     ),
                     // your preferred effect
                     onDotClicked: (index){
                     }
                 ),
                 InkWell(
                   onTap: () {
                     if (pageController.page?.toInt() == 2) {
                       SharedPref.saveData(key: prefsKey.onBoardingIsOpen, value: true);
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                     }else{
                       pageController.nextPage(
                           duration: Duration(milliseconds: 600),
                           curve: Curves.easeIn);
                     }
                   },
                   child: const CircleAvatar(
                     backgroundColor: Colors.black,
                     radius: 30,
                     child: Icon(Icons.arrow_forward ,
                     size: 20,
                     color: Colors.white),
                   ),
                 )

               ],
             )

           ],
         ),
       ),
     );
   }
}
