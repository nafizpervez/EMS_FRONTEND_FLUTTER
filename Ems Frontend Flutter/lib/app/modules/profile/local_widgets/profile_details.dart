import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/user.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/widgets/propic_replacement.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetail extends StatelessWidget {
  final User user;
  final bool showEdit;
  const ProfileDetail({
    Key? key,
    required this.user,
    this.showEdit = true,
  }) : super(key: key);

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
          desktop: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100.0,
                child: ClipOval(
                  child: Image.network(
                    user.avater,
                    fit: BoxFit.cover,
                    width: 200.0,
                    height: 200.0,
                    errorBuilder: (context, error, stackTrace) {
                      return ProPicReplacementText(
                        name: user.name,
                        dimension: 100.0,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 30.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Aquire',
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    IconTextCombo(
                      data: user.employeeId,
                      title: 'Employee ID',
                      icon: Icons.confirmation_number_outlined,
                    ),
                    IconTextCombo(
                      data: user.contactNumber,
                      icon: Icons.phone_enabled_outlined,
                      title: 'Phone Number',
                    ),
                    IconTextCombo(
                      data: user.designation,
                      title: 'Designation',
                      icon: Icons.design_services_sharp,
                    ),
                    IconTextCombo(
                      data: user.division,
                      title: 'Division',
                      icon: Icons.home_work_outlined,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 30.0,
              ),
              showEdit
                  ? Container(
                      alignment: AlignmentDirectional.topEnd,
                      child: ElevatedButton.icon(
                        onPressed: () => Get.toNamed(Routes.PROFILEEDIT),
                        label: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Edit'),
                        ),
                        icon: const Icon(Icons.edit),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => ADNColorConstants.kADNLightGreen,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 10.0,
                    ),
            ],
          ),
          phoneL: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                right: 5,
                top: 5,
                child: showEdit
                    ? IconButton(
                        onPressed: () => Get.toNamed(Routes.PROFILEEDIT),
                        icon: const Icon(Icons.edit),
                      )
                    : const SizedBox(
                        height: 10.0,
                      ),
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 100.0,
                    child: ClipOval(
                      child: Image.network(
                        user.avater,
                        fit: BoxFit.cover,
                        width: 200.0,
                        height: 200.0,
                        errorBuilder: (context, error, stackTrace) {
                          return ProPicReplacementText(
                            name: user.name,
                            dimension: 100.0,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    user.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Aquire',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  IconTextCombo(
                    data: user.employeeId,
                    title: 'Employee ID',
                    icon: Icons.confirmation_number_outlined,
                  ),
                  IconTextCombo(
                    data: user.contactNumber,
                    icon: Icons.phone_enabled_outlined,
                    title: 'Phone Number',
                  ),
                  IconTextCombo(
                    data: user.designation,
                    title: 'Designation',
                    icon: Icons.design_services_sharp,
                  ),
                  IconTextCombo(
                    data: user.division,
                    title: 'Division',
                    icon: Icons.home_work_outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
