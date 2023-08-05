import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/logic/app_cubit.dart';
import 'package:iti_final_project/views/register_page.dart';
import '../logic/login_register_cubit.dart';
import '../logic/login_register_states.dart';
import 'widgets/button.dart';
import 'widgets/text_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = 'LoginPage';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginRegisterCubit, LoginRegisterStates>(
        builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: 350,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  customTextFormField(
                    controller: emailController,
                    validate: (String? value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return "enter a valid e-mail";
                      }
                      return null;
                    },
                    label: 'E-mail',
                    prefix: Icons.email,
                    context: context,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customTextFormField(
                    controller: passwordController,
                    isHidden: LoginRegisterCubit.get(context).isHidden,
                    validate: (String? value) {
                      if (value!.isEmpty || value.length < 8) {
                        return 'passwword is too short';
                      }
                      return null;
                    },
                    label: 'Password',
                    prefix: Icons.lock,
                    context: context,
                    color: Colors.black,
                    suffix: IconButton(
                      color: Colors.grey,
                      onPressed: () {
                        LoginRegisterCubit.get(context)
                            .changePasswordVisibilty();
                      },
                      icon: Icon(LoginRegisterCubit.get(context).obsecureIcon),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Forgot Password ? '),
                      InkWell(
                        onTap: () {
                          LoginRegisterCubit.get(context).forgotPassword(
                              context: context,
                              emailController: emailController);
                        },
                        child: const Text(
                          'Tap Me',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        AppCubit.get(context).changeBottomNavIndex(1);
                        LoginRegisterCubit.get(context).signIn(
                            context: context,
                            emailController: emailController,
                            passwordController: passwordController);
                      }
                    },
                    text: 'Login',
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RegisterPage.id);
                    },
                    text: 'No Account ? Sign Up',
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
