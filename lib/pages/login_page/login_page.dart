import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:test_flutter_login/shared/validations/password_validation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _showPassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/shared/assets/login_page/login-bgc.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
              child: Container(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 90),
            width: double.infinity,
            child: FormBuilder(
                key: _formKey,
                child: Column(children: [
                  const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40.0),
                  FormBuilderTextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: theme.primaryColor,
                      contentPadding: const EdgeInsets.all(10.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: theme.colorScheme.primary, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.focusColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    name: 'email',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 20.0),
                  FormBuilderTextField(
                    name: 'password',
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: theme.primaryColor,
                      contentPadding: const EdgeInsets.all(10.0),
                      suffixIcon: IconButton(
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: _togglePasswordVisibility),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: theme.colorScheme.primary, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.focusColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    obscureText: !_showPassword,
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(), passwordValidator]),
                  ),
                  Container(
                    height: 48.0,
                    width: 240.0,
                    margin: const EdgeInsets.only(top: 40.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(colors: [
                          theme.colorScheme.secondary,
                          theme.colorScheme.tertiary
                        ])),
                    child: TextButton(
                      onPressed: () {
                        // Validate and save the form values
                        _formKey.currentState?.saveAndValidate();
                        debugPrint(_formKey.currentState?.value.toString());

                        // On another side, can access all field values without saving form with instantValues
                        _formKey.currentState?.validate();
                        debugPrint(
                            _formKey.currentState?.instantValue.toString());
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              theme.colorScheme.primary),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor),
                      ),
                    ),
                  ),
                ])),
          )),
        ));
  }
}
