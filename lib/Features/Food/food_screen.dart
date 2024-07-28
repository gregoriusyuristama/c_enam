import 'package:c_enam/Core/Component/AppBar/appbar.dart';
import 'package:c_enam/Core/Component/Icon/circular_icon.dart';
import 'package:c_enam/Core/Component/Image/vertical_image.dart';
import 'package:c_enam/Core/Constant/resource_path.dart';
import 'package:c_enam/Features/Chat/View/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Core/TextStyle/CETextStyle.dart';
import 'Components/badge_service.dart';
import 'Components/grid_layout.dart';

// Dummy data
final List<String> imagePaths = [
  ResourcePath.imageCircle1,
  ResourcePath.imageCircle2,
  ResourcePath.imageCircle3,
  ResourcePath.imageCircle4,
  ResourcePath.imageCircle5,
];
final List<String> imagesBanner = [
  ResourcePath.imageBanner1,
  ResourcePath.imageBanner2,
  ResourcePath.imageBanner3,
  ResourcePath.imageBanner4,
];
final List<String> imagesBigBanner = [
  ResourcePath.imageBigBanner1,
  ResourcePath.imageBigBanner2,
  ResourcePath.imageBigBanner3,
];
final List<String> textTitleBanner = [
  "Diskon up to 600%",
  "Buy 1 Get 1",
  "Paling murah",
];

final List<String> titles = [
  'Chicken',
  'Rice',
  'Indonesian',
  'Snack',
  'Fast Food',
];

class FoodScreen extends StatelessWidget {
  static const id = "/food";
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SingleChildScrollView with padding to avoid being overlapped by search field
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top +
                  kToolbarHeight +
                  60, // Extra space for search field
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      BadgeService(
                        text: "Delivery",
                        icon: Icons.electric_scooter_rounded,
                        isActive: true,
                      ),
                      SizedBox(width: 8),
                      BadgeService(
                        text: "Dine Out Deals",
                        icon: Icons.electric_scooter_rounded,
                        isActive: false,
                      ),
                      SizedBox(width: 8),
                      BadgeService(
                        text: "Pickup",
                        icon: Icons.electric_scooter_rounded,
                        isActive: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // LIST FOOD TYPE
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: imagePaths.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return CEVerticalImageText(
                          image: imagePaths[index],
                          title: titles[index],
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ),
                //LIST CARD BANNER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridLayout(
                    itemCount: imagesBanner.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      return Image.asset(imagesBanner[index]);
                    },
                  ),
                ),
                //HEADING
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Text(
                        "Beli Sekarang",
                        style: CETextStyle.headingSection,
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                //BANNER HORIZONTAL SCROLL
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: imagesBigBanner.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 300,
                                child: Image.asset(
                                  imagesBigBanner[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                textTitleBanner[index],
                                style: CETextStyle.titleBanner,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Ad.",
                                    style: CETextStyle.subTitleBannerBold,
                                  ),
                                  const SizedBox(width: 8),
                                  Text("Grab Food",
                                      style: CETextStyle.subTitleBanner),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // AppBar
          SizedBox(
            height: 150,
            child: CEAppBar(
              title: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DELIVER TO",
                      style: CETextStyle.titleCsAppBar,
                    ),
                    Text(
                      "Enter an address",
                      style: CETextStyle.titleStyle,
                    )
                  ],
                ),
              ),
              action: const [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      CECircularIcon(
                        icon: Icons.favorite_border,
                        color: Colors.white,
                        width: 40,
                        height: 40,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      CECircularIcon(
                        icon: Icons.receipt,
                        color: Colors.white,
                        width: 40,
                        height: 40,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Search Field with offset
          Positioned(
            top: MediaQuery.of(context).padding.top + kToolbarHeight + 5,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(29, 81, 75, 75),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What shall we deliver?",
                        hintStyle: CETextStyle.hintTextStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ChatScreen.id);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 40,
                      width: 65,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              ResourcePath.sparkleIcon,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "AI",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
