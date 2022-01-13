import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import 'propic_replacement.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.find<AuthController>(tag: 'authfirst');
    return Container(
      color: ADNColorConstants.kADNWhite,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Get.currentRoute
                .replaceAll('/', ' ')
                .replaceAll('_', ' ')
                .replaceAll('create', ' ')
                .replaceAll('edit', ' ')
                .toUpperCase()
                .toString(),
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Aquire',
            ),
          ),
          ResponsiveUI(
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  authC.user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: authC.user.avater,
                      fit: BoxFit.cover,
                      height: 30.0,
                      width: 30.0,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return ProPicReplacementText(
                          name: authC.user.name,
                          dimension: 20.0,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            phoneL: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: authC.user.avater,
                  fit: BoxFit.cover,
                  height: 30.0,
                  width: 30.0,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return ProPicReplacementText(
                      name: authC.user.name,
                      dimension: 20.0,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
