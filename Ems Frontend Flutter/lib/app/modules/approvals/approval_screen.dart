import 'package:accordion/accordion.dart';
import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/modules/conveyence/local_widgets/conveyance_index.dart';
import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:adnems/app/modules/leave/local_widgets/leave_index.dart';
import 'package:adnems/app/modules/pr/local_widgets/pr_index.dart';
import 'package:flutter/material.dart';

class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({Key? key}) : super(key: key);

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      const LeaveIndex();
      const PRIndex();
      const ConveyanceIndex();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      subScreen: Container(
        padding: const EdgeInsets.all(15.0),
        child: Accordion(
          headerBackgroundColor: ADNColorConstants.kADNGreen,
          contentBackgroundColor: Colors.transparent,
          contentBorderColor: Colors.transparent,
          maxOpenSections: 1,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          children: [
            AccordionSection(
              isOpen: true,
              leftIcon: const Icon(Icons.sick_outlined, color: Colors.white),
              header: const Text(
                'Leave Applications',
                style: TextStyle(
                    color: ADNColorConstants.kADNWhite,
                    fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: const LeaveIndex(),
              ),
              contentHorizontalPadding: 0,
              contentBorderWidth: 0,
            ),
            AccordionSection(
              leftIcon:
                  const Icon(Icons.shopping_bag_outlined, color: Colors.white),
              header: const Text(
                'PR Applications',
                style: TextStyle(
                    color: ADNColorConstants.kADNWhite,
                    fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: const PRIndex(),
              ),
              contentHorizontalPadding: 0,
              contentBorderWidth: 0,
            ),
            AccordionSection(
              leftIcon: const Icon(Icons.monetization_on_outlined,
                  color: Colors.white),
              header: const Text(
                'Conveyance Applications',
                style: TextStyle(
                    color: ADNColorConstants.kADNWhite,
                    fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: const ConveyanceIndex(),
              ),
              contentHorizontalPadding: 0,
              contentBorderWidth: 0,
            ),
          ],
        ),
      ),
    );
  }
}
