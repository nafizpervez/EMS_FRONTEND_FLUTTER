import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/widgets/unordered_list_item.dart';
import 'package:adnems/app/modules/overview/overview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementSection extends StatelessWidget {
  const AnnouncementSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<OverviewController>(
      builder: (oveController) => oveController.announceLoaded.value
          ? oveController.announcements.isEmpty
              ? const Center(
                  child: Text(
                    'No Announcements today!',
                  ),
                )
              : ListView(
                  children: oveController.announcements
                      .map(
                        (element) => UnOrderedListItem(
                          text: element.announcement.toString(),
                        ),
                      )
                      .toList(),
                )
          : const Center(
              child: CircularProgressIndicator(
                color: ADNColorConstants.kADNLightGreen,
              ),
            ),
    );
  }
}
