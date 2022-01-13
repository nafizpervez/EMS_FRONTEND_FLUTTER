import 'dart:convert';

ExtendedDetail extendedDetailFromJson(String str) =>
    ExtendedDetail.fromJson(json.decode(str));

String extendedDetailToJson(ExtendedDetail data) => json.encode(data.toJson());

class ExtendedDetail {
  ExtendedDetail({
    required this.id,
    required this.employmentTerm,
    required this.bankAccountForSalary,
    required this.bankName,
    required this.isTwoFactorAuth,
    required this.supervisor,
    required this.insuranceCategory,
    required this.tin,
    required this.pfCode,
    required this.pfContribution,
    required this.dateOfBirth,
    required this.maritalStatus,
    required this.fathersName,
    required this.mothersName,
    required this.spouseName,
    required this.nationality,
    required this.nid,
    required this.gender,
    required this.religion,
    required this.numberOfChild,
    required this.passportNumber,
    required this.mailingAddress,
    required this.personalEmail,
    required this.personalContactNumber,
    required this.emergencyContactNumber,
    required this.permanentAddress,
    required this.officialIntercomExtension,
    required this.skypeId,
    required this.facebookId,
    required this.twitterId,
    required this.linkedinId,
    required this.sscEquivalent,
    required this.hscEquivalent,
    required this.graduation,
    required this.postGraduation,
    required this.sscFromSchool,
    required this.hscFromCollege,
    required this.gradUniversity,
    required this.postGradUniversity,
    required this.professionalCertification,
    required this.socialAfiliation,
    required this.professionalAfiliation,
    required this.habits,
    required this.awardAchievements,
    required this.totalJobExperience,
  });

  final String id;
  final String employmentTerm;
  final String bankAccountForSalary;
  final String bankName;
  final bool isTwoFactorAuth;
  final String supervisor;
  final String insuranceCategory;
  final int tin;
  final int pfCode;
  final int pfContribution;
  final String dateOfBirth;
  final String maritalStatus;
  final String fathersName;
  final String mothersName;
  final String spouseName;
  final String nationality;
  final int nid;
  final String gender;
  final String religion;
  final int numberOfChild;
  final String passportNumber;
  final String mailingAddress;
  final String personalEmail;
  final String personalContactNumber;
  final String emergencyContactNumber;
  final String permanentAddress;
  final String officialIntercomExtension;
  final String skypeId;
  final String facebookId;
  final String twitterId;
  final String linkedinId;
  final String sscEquivalent;
  final String hscEquivalent;
  final String graduation;
  final String postGraduation;
  final String sscFromSchool;
  final String hscFromCollege;
  final String gradUniversity;
  final String postGradUniversity;
  final String professionalCertification;
  final String socialAfiliation;
  final String professionalAfiliation;
  final String habits;
  final String awardAchievements;
  final String totalJobExperience;

  factory ExtendedDetail.fromJson(Map<String, dynamic> json) => ExtendedDetail(
        id: json["id"],
        employmentTerm: json["attributes"]["employment_term"] ?? 'No Data',
        bankAccountForSalary:
            json["attributes"]["bank_account_for_salary"] ?? 'No Data',
        bankName: json["attributes"]["bank_name"] ?? 'No Data',
        isTwoFactorAuth: json["attributes"]["is_two_factor_auth"] ?? false,
        supervisor: json["attributes"]["supervisor"] ?? 'No Data',
        insuranceCategory:
            json["attributes"]["insurance_category"] ?? 'No Data',
        tin: json["attributes"]["tin"] ?? 00,
        pfCode: json["attributes"]["pf_code"] ?? 00,
        pfContribution: json["attributes"]["pf_contribution"] ?? 00,
        dateOfBirth: json["attributes"]["date_of_birth"] ?? 'No Data',
        maritalStatus: json["attributes"]["marital_status"] ?? 'No Data',
        fathersName: json["attributes"]["fathers_name"] ?? 'No Data',
        mothersName: json["attributes"]["mothers_name"] ?? 'No Data',
        spouseName: json["attributes"]["spouse_name"] ?? 'No Data',
        nationality: json["attributes"]["nationality"] ?? 'No Data',
        nid: json["attributes"]["nid"] ?? 00,
        gender: json["attributes"]["gender"] ?? 'No Data',
        religion: json["attributes"]["religion"] ?? 'No Data',
        numberOfChild: json["attributes"]["number_of_child"] ?? 00,
        passportNumber: json["attributes"]["passport_number"] ?? 'No Data',
        mailingAddress: json["attributes"]["mailing_address"] ?? 'No Data',
        personalEmail: json["attributes"]["personal_email"] ?? 'No Data',
        personalContactNumber:
            json["attributes"]["personal_contact_number"] ?? 'No Data',
        emergencyContactNumber:
            json["attributes"]["emergency_contact_number"] ?? 'No Data',
        permanentAddress: json["attributes"]["permanent_address"] ?? 'No Data',
        officialIntercomExtension:
            json["attributes"]["official_intercom_extension"] ?? 'No Data',
        skypeId: json["attributes"]["skype_id"] ?? 'No Data',
        facebookId: json["attributes"]["facebook_id"] ?? 'No Data',
        twitterId: json["attributes"]["twitter_id"] ?? 'No Data',
        linkedinId: json["attributes"]["linkedin_id"] ?? 'No Data',
        sscEquivalent: json["attributes"]["ssc_equivalent"] ?? 'No Data',
        hscEquivalent: json["attributes"]["hsc_equivalent"] ?? 'No Data',
        graduation: json["attributes"]["graduation"] ?? 'No Data',
        postGraduation: json["attributes"]["post_graduation"] ?? 'No Data',
        sscFromSchool: json["attributes"]["ssc_from_school"] ?? 'No Data',
        hscFromCollege: json["attributes"]["hsc_from_college"] ?? 'No Data',
        gradUniversity: json["attributes"]["grad_university"] ?? 'No Data',
        postGradUniversity:
            json["attributes"]["post_grad_university"] ?? 'No Data',
        professionalCertification:
            json["attributes"]["professional_certification"] ?? 'No Data',
        socialAfiliation: json["attributes"]["social_afiliation"] ?? 'No Data',
        professionalAfiliation:
            json["attributes"]["professional_afiliation"] ?? 'No Data',
        habits: json["attributes"]["habits"] ?? 'No Data',
        awardAchievements:
            json["attributes"]["award_achievements"] ?? 'No Data',
        totalJobExperience:
            json["attributes"]["total_job_experience"] ?? 'No Data',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employment_term": employmentTerm == 'No Data' ? null : employmentTerm,
        "bank_account_for_salary":
            bankAccountForSalary == 'No Data' ? null : bankAccountForSalary,
        "bank_name": bankName == 'No Data' ? null : bankName,
        "is_two_factor_auth": isTwoFactorAuth,
        "supervisor": supervisor == 'No Data' ? null : supervisor,
        "insurance_category":
            insuranceCategory == 'No Data' ? null : insuranceCategory,
        "tin": tin == 0 ? null : tin,
        "pf_code": pfCode == 0 ? null : pfCode,
        "pf_contribution": pfContribution == 0 ? null : pfContribution,
        "date_of_birth": dateOfBirth == 'No Data' ? null : dateOfBirth,
        "marital_status": maritalStatus == 'No Data' ? null : maritalStatus,
        "fathers_name": fathersName == 'No Data' ? null : fathersName,
        "mothers_name": mothersName == 'No Data' ? null : mothersName,
        "spouse_name": spouseName == 'No Data' ? null : spouseName,
        "nationality": nationality == 'No Data' ? null : nationality,
        "nid": nid == 0 ? null : nid,
        "gender": gender == 'No Data' ? null : gender,
        "religion": religion == 'No Data' ? null : religion,
        "number_of_child": numberOfChild == 0 ? null : numberOfChild,
        "passport_number": passportNumber == 'No Data' ? null : passportNumber,
        "mailing_address": mailingAddress == 'No Data' ? null : mailingAddress,
        "personal_email": personalEmail == 'No Data' ? null : personalEmail,
        "personal_contact_number":
            personalContactNumber == 'No Data' ? null : personalContactNumber,
        "emergency_contact_number":
            emergencyContactNumber == 'No Data' ? null : emergencyContactNumber,
        "permanent_address":
            permanentAddress == 'No Data' ? null : permanentAddress,
        "official_intercom_extension": officialIntercomExtension == 'No Data'
            ? null
            : officialIntercomExtension,
        "skype_id": skypeId == 'No Data' ? null : skypeId,
        "facebook_id": facebookId == 'No Data' ? null : facebookId,
        "twitter_id": twitterId == 'No Data' ? null : twitterId,
        "linkedin_id": linkedinId == 'No Data' ? null : linkedinId,
        "ssc_equivalent": sscEquivalent == 'No Data' ? null : sscEquivalent,
        "hsc_equivalent": hscEquivalent == 'No Data' ? null : hscEquivalent,
        "graduation": graduation == 'No Data' ? null : graduation,
        "post_graduation": postGraduation == 'No Data' ? null : postGraduation,
        "ssc_from_school": sscFromSchool == 'No Data' ? null : sscFromSchool,
        "hsc_from_college": hscFromCollege == 'No Data' ? null : hscFromCollege,
        "grad_university": gradUniversity == 'No Data' ? null : gradUniversity,
        "post_grad_university":
            postGradUniversity == 'No Data' ? null : postGradUniversity,
        "professional_certification": professionalCertification == 'No Data'
            ? null
            : professionalCertification,
        "social_afiliation":
            socialAfiliation == 'No Data' ? null : socialAfiliation,
        "professional_afiliation":
            professionalAfiliation == 'No Data' ? null : professionalAfiliation,
        "habits": habits == 'No Data' ? null : habits,
        "award_achievements":
            awardAchievements == 'No Data' ? null : awardAchievements,
        "total_job_experience":
            totalJobExperience == 'No Data' ? null : totalJobExperience,
      };
}
