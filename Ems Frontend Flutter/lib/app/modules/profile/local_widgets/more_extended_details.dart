import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/modules/profile/profile_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreExtendedDetails extends StatelessWidget {
  const MoreExtendedDetails({
    Key? key,
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
        child: GetX<ProfileController>(
          builder: (proController) {
            return proController.eDLoaded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Under Construction',
                        style: TextStyle(color: Colors.grey, fontSize: 40.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Extended Details',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Aquire',
                            ),
                          ),
                          ElevatedButton.icon(
                            // onPressed: () => Get.toNamed(Routes.EXTENDEDEDIT),
                            onPressed: () {},
                            label: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Edit'),
                            ),
                            icon: const Icon(Icons.edit),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                (states) => ADNColorConstants.kADNLightGreen,
                              ),
                            ),
                          ),
                        ],
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
                                  data: proController
                                      .extendedDetail.employmentTerm,
                                  title: 'Employment Term',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.bankAccountForSalary,
                                  title: 'Bank Account (Salary)',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.bankName,
                                  title: 'Bank Name',
                                ),
                                IconTextCombo(
                                  data: proController
                                          .extendedDetail.isTwoFactorAuth
                                      ? 'Active'
                                      : 'Inactive',
                                  title: 'Two Factor Authentication',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.insuranceCategory,
                                  title: 'Insurance Category',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.tin
                                      .toString(),
                                  title: 'Tin No.',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.pfCode
                                      .toString(),
                                  title: 'PF Code',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.pfContribution
                                      .toString(),
                                  title: 'PF Contribution',
                                ),
                              ],
                            ),
                          ),
                        ],
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
                                  data:
                                      proController.extendedDetail.dateOfBirth,
                                  title: 'Date of Birth',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.maritalStatus,
                                  title: 'Marital Status',
                                ),
                                IconTextCombo(
                                  data:
                                      proController.extendedDetail.fathersName,
                                  title: 'Fathers Name',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.spouseName,
                                  title: 'Spouse Name',
                                ),
                                IconTextCombo(
                                  data:
                                      proController.extendedDetail.nationality,
                                  title: 'Nationality',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.nid
                                      .toString(),
                                  title: 'NID',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconTextCombo(
                                  data: proController.extendedDetail.supervisor,
                                  title: 'Supervisor',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.religion,
                                  title: 'Religion',
                                ),
                                IconTextCombo(
                                  data:
                                      proController.extendedDetail.mothersName,
                                  title: 'Mothers Name',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.numberOfChild
                                      .toString(),
                                  title: 'Number of Child',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.gender,
                                  title: 'Gender',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.passportNumber,
                                  title: 'Passport No.',
                                ),
                              ],
                            ),
                          ),
                        ],
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
                                  data: proController
                                      .extendedDetail.mailingAddress,
                                  title: 'Mailing Address',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.permanentAddress,
                                  title: 'Permanent Address',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.personalEmail,
                                  title: 'Perosnal Email',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.officialIntercomExtension,
                                  title: 'Official Extension',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.personalContactNumber,
                                  title: 'Personal Contact Number',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.emergencyContactNumber,
                                  title: 'Emergency Contact Number',
                                ),
                              ],
                            ),
                          ),
                        ],
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
                                  data: proController
                                      .extendedDetail.sscEquivalent,
                                  title: 'S.S.C / Equivalent',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.hscEquivalent,
                                  title: 'H.S.C / Equivalent',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.graduation,
                                  title: 'Graduation',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.postGraduation,
                                  title: 'Post Graduation',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.sscFromSchool,
                                  title: 'School',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.hscFromCollege,
                                  title: 'College',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.gradUniversity,
                                  title: 'University (Graduation)',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.postGradUniversity,
                                  title: 'University (Post Grad)',
                                ),
                              ],
                            ),
                          ),
                        ],
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
                                  data: proController
                                      .extendedDetail.professionalCertification,
                                  title: 'Professional Certification',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.professionalAfiliation,
                                  title: 'Professional Affiliation',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.habits,
                                  title: 'Habits',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.awardAchievements,
                                  title: 'Awards / Achievements',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.socialAfiliation,
                                  title: 'Social Affiliation',
                                ),
                                IconTextCombo(
                                  data: proController
                                      .extendedDetail.totalJobExperience,
                                  title: 'Total Job Experience',
                                ),
                              ],
                            ),
                          ),
                        ],
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
                                  data: proController.extendedDetail.skypeId,
                                  title: 'Skype ID',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.facebookId,
                                  title: 'Facebook ID',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconTextCombo(
                                  data: proController.extendedDetail.twitterId,
                                  title: 'Twitter ID',
                                ),
                                IconTextCombo(
                                  data: proController.extendedDetail.linkedinId,
                                  title: 'LinkedIn ID',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
