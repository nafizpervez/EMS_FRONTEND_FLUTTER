import 'package:accordion/accordion.dart';
import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/sales_forcast/sale_forcast_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'personal_funnel.dart';

class SalesForcastIndex extends StatelessWidget {
  const SalesForcastIndex({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SaleForcastController sfC = Get.find<SaleForcastController>();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: ResponsiveUI(
        desktop: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sfC.canAddNew()
                ? ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(
                        Routes.SALESFORCASTCREATE,
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      color: ADNColorConstants.kADNWhite,
                    ),
                    label: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Add New',
                        style: TextStyle(
                          color: ADNColorConstants.kADNWhite,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => ADNColorConstants.kADNLightGreen,
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 10.0,
                  ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: GetX<SaleForcastController>(
                builder: (sFcontroller) {
                  if (sFcontroller.isLoaded) {
                    if (sFcontroller.forcasts.isEmpty) {
                      return const Center(
                        child: Text(
                          'No Funnel Record Found!',
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Accordion(
                        headerBackgroundColor: ADNColorConstants.kADNGreen,
                        maxOpenSections: 2,
                        headerPadding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 15),
                        children: sFcontroller
                            .getGroups()
                            .entries
                            .map(
                              (forcastGroup) => AccordionSection(
                                isOpen: true,
                                leftIcon: const Icon(
                                  Icons.receipt_rounded,
                                  color: Colors.white,
                                ),
                                header: Text(
                                  forcastGroup.key,
                                  style: const TextStyle(
                                      color: ADNColorConstants.kADNWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.30,
                                    child: PersonalFunnel(
                                      forcasts: forcastGroup.value,
                                    ),
                                  ),
                                ),
                                contentHorizontalPadding: 0,
                                contentBorderWidth: 0,
                              ),
                            )
                            .toList(),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ADNColorConstants.kADNLightGreen,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        phoneL: Stack(
          children: [
            GetX<SaleForcastController>(
              builder: (sFcontroller) {
                if (sFcontroller.isLoaded) {
                  if (sFcontroller.forcasts.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Funnel Record Found!',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return Accordion(
                      headerBackgroundColor: ADNColorConstants.kADNGreen,
                      maxOpenSections: 1,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: sFcontroller
                          .getGroups()
                          .entries
                          .map(
                            (forcastGroup) => AccordionSection(
                              isOpen: true,
                              leftIcon: const Icon(
                                Icons.receipt_rounded,
                                color: Colors.white,
                              ),
                              header: Text(
                                forcastGroup.key,
                                style: const TextStyle(
                                    color: ADNColorConstants.kADNWhite,
                                    fontWeight: FontWeight.bold),
                              ),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.70,
                                  child: PersonalFunnel(
                                    forcasts: forcastGroup.value,
                                  ),
                                ),
                              ),
                              contentHorizontalPadding: 0,
                              contentBorderWidth: 0,
                            ),
                          )
                          .toList(),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ADNColorConstants.kADNLightGreen,
                    ),
                  );
                }
              },
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: sfC.canAddNew()
                  ? Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ADNColorConstants.kADNLightGreen,
                            ADNColorConstants.kADNLighterGreen,
                          ],
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.SALESFORCASTCREATE,
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          color: ADNColorConstants.kADNWhite,
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 10.0,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
