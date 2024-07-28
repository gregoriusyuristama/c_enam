import 'package:flutter/material.dart';

import '../../../Core/Component/shape/round_container.dart';
import '../../../Core/Constant/resource_path.dart';
import '../../../Core/TextStyle/CETextStyle.dart';

class CECardFood extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String time;
  final String distance;
  final String price;

  const CECardFood({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.distance,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return CERoundedContainer(
      radius: 20,
      backgroundColor: Colors.white,
      borderColor: Colors.green,
      showBorder: true,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CETextStyle.textTitleCard,
                ),
                Text(
                  subtitle,
                  style: CETextStyle.textSubTitleCard,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      style: CETextStyle.textInfoCard,
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      distance,
                      style: CETextStyle.textInfoCard,
                    ),
                  ],
                ),
                Text(
                  price,
                  style: CETextStyle.textPrice,
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
