import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/user.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/propic_replacement.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/employees/employee_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'employee_card.dart';
import 'employee_card.dart';
import 'employee_details_popup.dart';

class EmployeeIndex extends StatefulWidget {
  const EmployeeIndex({Key? key}) : super(key: key);

  @override
  _EmployeeIndexState createState() => _EmployeeIndexState();
}

class _EmployeeIndexState extends State<EmployeeIndex> {
  late ScrollController _empSController;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _empSController = ScrollController(debugLabel: 'employeeGrid');
  }

  @override
  void dispose() {
    super.dispose();
    _empSController.dispose();
  }

  void _handleKeyEvent(RawKeyEvent event) {
    var offset = _empSController.offset;

    if (event.runtimeType == RawKeyDownEvent) {
      if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
        setState(
          () {
            if (kReleaseMode) {
              _empSController.animateTo(offset + 200,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.ease);
            } else {
              _empSController.animateTo(offset + 200,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.ease);
            }
          },
        );
      } else if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
        setState(
          () {
            if (kReleaseMode) {
              _empSController.animateTo(offset - 200,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.ease);
            } else {
              _empSController.animateTo(offset - 200,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.ease);
            }
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: RawKeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKey: _handleKeyEvent,
        child: GetX<EmployeeController>(
          builder: (empController) => empController.isloaded
              ? Column(
                  children: [
                    ResponsiveUI(
                      desktop: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FormBuilderDropdown(
                                name: 'search_type',
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                focusColor: Colors.transparent,
                                decoration: inputStyle(
                                  'Search By',
                                  null,
                                  null,
                                ),
                                initialValue: 'name',
                                items: empController.searchTypes
                                    .map(
                                      (type) => DropdownMenuItem(
                                        child: Text(
                                          type.capitalize.toString(),
                                        ),
                                        value: type,
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) =>
                                    empController.setSearchBy(value),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                decoration: inputStyle(
                                  'Search',
                                  null,
                                  const Icon(
                                    Icons.search,
                                  ),
                                ),
                                onChanged: (value) =>
                                    empController.setSearchTerm(value),
                              ),
                            ),
                          ),
                        ],
                      ),
                      phoneL: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FormBuilderDropdown(
                              name: 'search_type',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              focusColor: Colors.transparent,
                              decoration: inputStyle(
                                'Search By',
                                null,
                                null,
                              ),
                              initialValue: 'name',
                              items: empController.searchTypes
                                  .map(
                                    (type) => DropdownMenuItem(
                                      child: Text(
                                        type.capitalize.toString(),
                                      ),
                                      value: type,
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) =>
                                  empController.setSearchBy(value),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              decoration: inputStyle(
                                'Search',
                                null,
                                const Icon(
                                  Icons.search,
                                ),
                              ),
                              onChanged: (value) =>
                                  empController.setSearchTerm(value),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: empController.employees.isEmpty
                          ? const Center(
                              child: Text(
                                'No Leave Record Found!',
                                style: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Scrollbar(
                              controller: _empSController,
                              isAlwaysShown: true,
                              thickness: 3.0,
                              hoverThickness: 3.0,
                              child: ListView(
                                controller: _empSController,
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                children: empController
                                    .searchedEmployee()
                                    .map(
                                      (emp) => EmployeeCard(
                                        employee: emp,
                                        empController: empController,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: ADNColorConstants.kADNLightGreen,
                  ),
                ),
        ),
      ),
    );
  }
}
