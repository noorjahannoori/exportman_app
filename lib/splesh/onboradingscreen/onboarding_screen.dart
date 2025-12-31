// import 'package:exportman/splesh/onboradingscreen/onboarding_data.dart';
// import 'package:exportman/theme/colors.dart';
// import 'package:exportman/widgets/onboarding_dots.dart';
// import 'package:flutter/material.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _controller = PageController();
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: Stack(
//         children: [
//           // 🔹 TOP RIGHT DECOR IMAGE (Figma style)
//           Positioned(
//             top: -304,
//             right: -348,
//             child: Image.asset(
//               'assets/images/Circle.png', // decorative image
//               width: 982,
//               height: 882,
//             ),
//           ),

//           Column(
//             children: [
//               Expanded(
//                 child: PageView.builder(
//                   controller: _controller,
//                   itemCount: onboardingList.length,
//                   onPageChanged: (index) {
//                     setState(() => currentIndex = index);
//                   },
//                   itemBuilder: (context, index) {
//                     final item = onboardingList[index];

//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         children: [
//                           const Spacer(),

//                           // 🔹 MAIN ILLUSTRATION
//                           Image.asset(item.image, height: 260),

//                           const SizedBox(height: 40),

//                           // 🔹 TEXT BLOCK (Exact spacing)
//                           SizedBox(
//                             width: 327,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   item.title,

//                                   style: Theme.of(
//                                     context,
//                                   ).textTheme.headlineMedium,
//                                 ),
//                                 const SizedBox(height: 16),
//                                 Text(
//                                   item.description,

//                                   style: Theme.of(context).textTheme.bodyMedium,
//                                 ),
//                               ],
//                             ),
//                           ),

//                           const Spacer(),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // 🔹 BUTTONS
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Row(
//                   children: [
//                     // 🔹 DOTS LEFT
//                     OnboardingDots(
//                       count: onboardingList.length,
//                       index: currentIndex,
//                     ),

//                     const Spacer(),

//                     // 🔹 RIGHT SIDE TEXT (Next / Get Started)
//                     GestureDetector(
//                       onTap: () {
//                         if (currentIndex == 0) {
//                           // 👉 First screen → go next
//                           _controller.nextPage(
//                             duration: const Duration(milliseconds: 300),
//                             curve: Curves.easeInOut,
//                           );
//                         } else {
//                           // 👉 Skip → jump to last page or navigate
//                           _controller.animateToPage(
//                             onboardingList.length - 1,
//                             duration: const Duration(milliseconds: 300),
//                             curve: Curves.easeInOut,
//                           );
//                           // OR navigate directly
//                           // Navigator.pushReplacement(...)
//                         }
//                       },
//                       child: SizedBox(
//                         width: 92,
//                         height: 19,
//                         child: Text(
//                           currentIndex == 0 ? 'Get Started' : 'Skip',
//                           textAlign: TextAlign.right,
//                           style: Theme.of(context).textTheme.bodyMedium
//                               ?.copyWith(
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.primary,
//                               ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 32),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:exportman/app/app_flow_provider.dart';
import 'package:exportman/splesh/onboradingscreen/onboarding_data.dart';
import 'package:exportman/splesh/onboradingscreen/provider/onboarding_provider.dart';
import 'package:exportman/theme/colors.dart';
import 'package:exportman/widgets/onboarding_dots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(onboardingIndexProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // 🔹 TOP RIGHT DECOR IMAGE (same as old)
          Positioned(
            top: -304,
            right: -348,
            child: Image.asset(
              'assets/images/Circle.png',
              width: 982,
              height: 882,
            ),
          ),

          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingList.length,
                  onPageChanged: (i) {
                    ref.read(onboardingIndexProvider.notifier).state = i;
                  },
                  itemBuilder: (context, i) {
                    final item = onboardingList[i];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Spacer(),

                          // 🔹 IMAGE
                          Image.asset(item.image, height: 260),

                          const SizedBox(height: 40),

                          // 🔹 TEXT BLOCK (FIXED)
                          SizedBox(
                            width: 327,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  item.description,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // 🔹 DOTS + TEXT BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    OnboardingDots(count: onboardingList.length, index: index),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (index == onboardingList.length - 1) {
                          ref.read(appFlowProvider.notifier).finishOnboarding();
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: SizedBox(
                        width: 92,
                        height: 19,
                        child: Text(
                          index == onboardingList.length - 1
                              ? 'Get Started'
                              : 'Next',
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ],
      ),
    );
  }
}
