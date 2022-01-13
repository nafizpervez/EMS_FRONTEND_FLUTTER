import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late AuthController ac;

  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    ac = Get.find<AuthController>(tag: 'authfirst');
    _passwordVisible = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _deviceName() {
    return GetPlatform.isAndroid
        ? 'android'
        : GetPlatform.isIOS
            ? 'ios'
            : GetPlatform.isLinux
                ? 'linux'
                : GetPlatform.isWeb
                    ? 'web'
                    : 'windows';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width > 400.0
          ? 350.0
          : MediaQuery.of(context).size.width * 0.95,
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => !(GetUtils.isEmail(value!) ||
                          GetUtils.isPhoneNumber(value) ||
                          GetUtils.isNumericOnly(value)) ||
                      value.isEmpty
                  ? 'Please Provide a valid Email, Phone Number or Employee ID.\nEx. abc@abc.net, 016xxxxxxxx, 10xxx69'
                  : null,
              decoration: inputStyle(
                'Email, Phone Number or Employee ID',
                const Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                null,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: _passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) =>
                  value!.length < 6 ? 'Please Provide a valid Password' : null,
              decoration: inputStyle(
                'Password',
                const Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
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
              height: 10.0,
            ),
            Obx(
              () {
                return Text(
                  ac.error.value,
                  style: const TextStyle(color: Colors.red),
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  final Map credentials = {
                    'auth_id': _emailController.text,
                    'password': _passwordController.text,
                    'device_name': _deviceName(),
                  };
                  ac.login(credentials);
                }
              },
              child: Obx(
                () => ac.authenticating
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: Text(
                          'Login',
                        ),
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
    );
  }
}
