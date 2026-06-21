import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:test1/features/auth/presentation/cubit/auth_state.dart';
import 'package:test1/features/auth/presentation/screens/home_screen.dart';
import 'package:test1/features/auth/presentation/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController passwordConfirmation;
  bool agreeTerms = false;
  Color mainColor = const Color.fromARGB(255, 80, 52, 1);
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  void initState() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    passwordConfirmation = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    passwordConfirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 100,
                    bottom: 20,
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.app_registration, size: 80, color: mainColor),
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 20),
                      Form(
                        key: formState,
                        child: Column(
                          spacing: 15,
                          children: [
                            CustomTextFormField(
                              controller: username,
                              text: 'username',
                            ),
                            CustomTextFormField(
                              controller: email,
                              text: 'email',
                            ),
                            CustomTextFormField(
                              controller: phone,
                              text: 'phone',
                            ),
                            CustomTextFormField(
                              controller: password,
                              text: 'password',
                            ),
                            CustomTextFormField(
                              controller: passwordConfirmation,
                              text: 'password again',
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: agreeTerms,
                                  activeColor: mainColor,
                                  onChanged: (value) {
                                    setState(() {
                                      agreeTerms = !agreeTerms;
                                    });
                                  },
                                ),
                                Text(
                                  'I agree Terms and Conditions',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formState.currentState!.validate()) {
                                  context.read<AuthCubit>().register(
                                    username: username.text,
                                    email: email.text,
                                    phone: phone.text,
                                    password: password.text,
                                    passwordConfirm: passwordConfirmation.text,
                                    agree: agreeTerms,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 48),
                                backgroundColor: mainColor,
                                foregroundColor: Colors.white,
                              ),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state is AuthLoading)
                Center(child: CircularProgressIndicator(color: mainColor)),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        if (state is AuthLoaded) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(userData: state.entity),
            ),
          );
        }
      },
    );
  }
}
