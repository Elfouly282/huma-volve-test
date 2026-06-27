import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/auth/domain/entity/register_entity.dart';
import 'package:test1/features/auth/presntation/cubit/auth_cubit.dart';
import 'package:test1/features/auth/presntation/widget/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  bool agreeTerms = false;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Required field";
    }
    return null;
  }

  void submit() {
    if (!_formKey.currentState!.validate()) return;

    if (!agreeTerms) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("You must agree to terms")));
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    final entity = RegisterRequestEntity(
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text,
      passwordConfirmation: confirmPasswordController.text,
      agreeTerms: 1,
    );

    context.read<AuthCubit>().register(entity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoaded) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Register Success")));

            Navigator.pushReplacementNamed(context, '/login');
          }

          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/images/sign_up.png", height: 100),

                    const SizedBox(height: 20),

                    CustomTextFormFields(
                      icon: Icons.person,
                      title: "Username",
                      hintText: "Enter username",
                      controller: usernameController,
                      validator: requiredValidator,
                    ),

                    const SizedBox(height: 12),

                    CustomTextFormFields(
                      icon: Icons.email,
                      title: "Email",
                      hintText: "Enter email",
                      controller: emailController,
                      validator: requiredValidator,
                    ),

                    const SizedBox(height: 12),

                    CustomTextFormFields(
                      icon: Icons.phone,
                      title: "Phone",
                      hintText: "Enter phone",
                      controller: phoneController,
                      validator: requiredValidator,
                    ),

                    const SizedBox(height: 12),

                    CustomTextFormFields(
                      icon: Icons.lock,
                      title: "Password",
                      hintText: "Enter password",
                      controller: passwordController,
                      validator: requiredValidator,
                      obscureText: true,
                    ),

                    const SizedBox(height: 12),

                    CustomTextFormFields(
                      icon: Icons.lock_outline,
                      title: "Confirm Password",
                      hintText: "Confirm password",
                      controller: confirmPasswordController,
                      validator: requiredValidator,
                      obscureText: true,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Checkbox(
                          value: agreeTerms,
                          onChanged: (value) {
                            setState(() {
                              agreeTerms = value ?? false;
                            });
                          },
                        ),
                        const Text("I agree to terms"),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : submit,
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
