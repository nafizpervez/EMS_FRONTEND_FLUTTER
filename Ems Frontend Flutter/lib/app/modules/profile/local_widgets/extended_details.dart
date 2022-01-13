import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/user.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:flutter/material.dart';

class ExtendedDetails extends StatelessWidget {
  final User user;
  const ExtendedDetails({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: ADNColorConstants.kADNGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ResponsiveUI(
          desktop: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Details',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Aquire',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconTextCombo(
                          data: user.email,
                          icon: Icons.mail_outline,
                          title: 'Email',
                        ),
                        IconTextCombo(
                          data: user.grade,
                          icon: Icons.grade_outlined,
                          title: 'Grade',
                        ),
                        IconTextCombo(
                          data: user.department,
                          icon: Icons.home_work_outlined,
                          title: 'Department',
                        ),
                        IconTextCombo(
                          data: user.unit,
                          icon: Icons.unarchive_outlined,
                          title: 'Unit',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconTextCombo(
                          data: user.subUnit,
                          icon: Icons.subtitles_outlined,
                          title: 'Sub Unit',
                        ),
                        IconTextCombo(
                          data: user.location,
                          icon: Icons.location_on_outlined,
                          title: 'Location',
                        ),
                        IconTextCombo(
                          data: user.getJoiningDate(),
                          icon: Icons.access_time,
                          title: 'Date of Joining',
                        ),
                        IconTextCombo(
                          data: user.bloodGroup,
                          icon: Icons.bloodtype_outlined,
                          title: 'Blood Type',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          phoneL: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Details',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Aquire',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              IconTextCombo(
                data: user.email,
                icon: Icons.mail_outline,
                title: 'Email',
              ),
              IconTextCombo(
                data: user.grade,
                icon: Icons.grade_outlined,
                title: 'Grade',
              ),
              IconTextCombo(
                data: user.department,
                icon: Icons.home_work_outlined,
                title: 'Department',
              ),
              IconTextCombo(
                data: user.unit,
                icon: Icons.unarchive_outlined,
                title: 'Unit',
              ),
              IconTextCombo(
                data: user.subUnit,
                icon: Icons.subtitles_outlined,
                title: 'Sub Unit',
              ),
              IconTextCombo(
                data: user.location,
                icon: Icons.location_on_outlined,
                title: 'Location',
              ),
              IconTextCombo(
                data: user.getJoiningDate(),
                icon: Icons.access_time,
                title: 'Date of Joining',
              ),
              IconTextCombo(
                data: user.bloodGroup,
                icon: Icons.bloodtype_outlined,
                title: 'Blood Type',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
