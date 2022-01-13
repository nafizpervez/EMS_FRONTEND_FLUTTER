import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/overview/local_widgets/announcement_section.dart';
import 'package:flutter/material.dart';
import 'alloted_leave.dart';
import 'conveyance_monthly_chart.dart';
import 'employee_presence_chart.dart';
import 'funnel_chart.dart';
import 'overview_card.dart';

class OverviewIndex extends StatelessWidget {
  const OverviewIndex({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _sController =
        ScrollController(debugLabel: 'overviewList');
    return SingleChildScrollView(
      controller: _sController,
      child: ResponsiveUI(
        desktop: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45 > 400
                  ? MediaQuery.of(context).size.height * 0.45
                  : 400,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: OverviewCard(
                      title: 'Todays Leave Count',
                      child: EmployeePresenceChart(),
                    ),
                  ),
                  Expanded(
                    child: OverviewCard(
                      title: 'Announcements',
                      child: AnnouncementSection(),
                    ),
                  ),
                  Expanded(
                    child: OverviewCard(
                      title: 'My Leave Details',
                      child: AllotedLeave(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45 > 400
                  ? MediaQuery.of(context).size.height * 0.45
                  : 400,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: OverviewCard(
                      title: 'Monthly Conveyance',
                      child: ConveyanceMonthlyChart(),
                    ),
                  ),
                  Expanded(
                    child: OverviewCard(
                      title: 'Funnel',
                      child: FunnelInfoChart(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        tablet: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45 > 400
                  ? MediaQuery.of(context).size.height * 0.45
                  : 400,
              child: const OverviewCard(
                title: 'Announcements',
                child: AnnouncementSection(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45 > 400
                  ? MediaQuery.of(context).size.height * 0.45
                  : 400,
              child: const OverviewCard(
                title: 'Todays Leave Count',
                child: EmployeePresenceChart(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45 > 400
                  ? MediaQuery.of(context).size.height * 0.45
                  : 400,
              child: const OverviewCard(
                title: 'My Leave Details',
                child: AllotedLeave(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45 > 400
                  ? MediaQuery.of(context).size.height * 0.45
                  : 400,
              child: const OverviewCard(
                title: 'Monthly Conveyance',
                child: ConveyanceMonthlyChart(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45 > 400
                  ? MediaQuery.of(context).size.height * 0.45
                  : 400,
              child: const OverviewCard(
                title: 'Funnel',
                child: FunnelInfoChart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
