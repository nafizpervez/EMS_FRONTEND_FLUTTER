import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/modules/overview/overview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllotedLeave extends StatelessWidget {
  const AllotedLeave({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController alsCon =
        ScrollController(debugLabel: 'AllotedLeaveScroll');
    return GetX<OverviewController>(
      builder: (oveController) => oveController.leaveLoaded.value
          ? Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Leave Type',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Enjoyed',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Sick'),
                    ),
                    Expanded(
                      child: Text(
                        oveController.allotedLeave == null
                            ? '#'
                            : '${oveController.allotedLeave!.sickLeave} Days',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Annual'),
                    ),
                    Expanded(
                      child: Text(
                        oveController.allotedLeave == null
                            ? '#'
                            : '${oveController.allotedLeave!.annualLeave} Days',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Maternity'),
                    ),
                    Expanded(
                      child: Text(
                        oveController.allotedLeave == null
                            ? '#'
                            : '${oveController.allotedLeave!.maternityLeave} Days',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Unpaid'),
                    ),
                    Expanded(
                      child: Text(
                        oveController.allotedLeave == null
                            ? '#'
                            : '${oveController.allotedLeave!.unpaidLeave} Days',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Total Leave Enjoyed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        oveController.allotedLeave == null
                            ? '#'
                            : '${oveController.allotedLeave!.enjoyedTotalLeaveCount} Days',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Total Leave Allocated',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        oveController.allotedLeave == null
                            ? '#'
                            : '${oveController.allotedLeave!.totalAllotedLeaves} Days',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Remaining Leave',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        oveController.allotedLeave == null
                            ? '#'
                            : '${oveController.allotedLeave!.remainingLeaveCount} Days',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(
                color: ADNColorConstants.kADNLightGreen,
              ),
            ),
    );
  }
}
