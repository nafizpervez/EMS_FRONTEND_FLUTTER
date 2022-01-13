import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class PasswordChangeForm extends StatefulWidget {
  const PasswordChangeForm({Key? key}) : super(key: key);

  @override
  State<PasswordChangeForm> createState() => _PasswordChangeFormState();
}

class _PasswordChangeFormState extends State<PasswordChangeForm> {
  final GlobalKey<FormBuilderState> _passwordChangeFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'PasswordChange');

  late AuthController ac;
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    ac = Get.find<AuthController>(tag: 'authfirst');
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: FormBuilder(
          key: _passwordChangeFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBuilderTextField(
                name: 'current_password',
                decoration: inputStyle(
                  'Current Password',
                  null,
                  null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              FormBuilderTextField(
                name: 'new_password',
                decoration: inputStyle(
                  'New Password',
                  null,
                  IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                obscureText: _passwordVisible,
              ),
              const SizedBox(
                height: 20.0,
              ),
              FormBuilderTextField(
                name: 'confirm_password',
                decoration: inputStyle(
                  'Confirm Password',
                  null,
                  null,
                ),
                validator: (String? val) {
                  final String _pass = _passwordChangeFormKey
                      .currentState!.fields['new_password']!.value;
                  if (val == null || val.isEmpty) {
                    return 'Field Empty';
                  } else if (val != _pass) {
                    return 'Confirmation failed';
                  } else {
                    return null;
                  }
                },
                obscureText: _passwordVisible,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_passwordChangeFormKey.currentState!.validate()) {
                    final Map credentials = {
                      'current_password': _passwordChangeFormKey
                          .currentState!.fields['current_password']!.value,
                      'new_password': _passwordChangeFormKey
                          .currentState!.fields['new_password']!.value,
                    };
                    ac.changePassword(credentials);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Text(
                    'Change password',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                  ),
                  primary: ADNColorConstants.kADNLightGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
