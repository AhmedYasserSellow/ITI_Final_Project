import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/views/widgets/button.dart';
import 'package:iti_final_project/views/widgets/text_form_field.dart';
import '../logic/login_register_cubit.dart';
import '../logic/login_register_states.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

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
                    controller: nameController,
                    validate: (String? value) {
                      if (value!.isEmpty || value.length < 2) {
                        return 'enter a vaild name';
                      }
                      return null;
                    },
                    label: 'Your Name',
                    prefix: Icons.account_circle,
                    context: context,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customTextFormField(
                    controller: emailController,
                    validate: (String? value) {
                      if (value!.isEmpty ||
                          !value.contains('@') ||
                          value.endsWith('@')) {
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
                      icon: Icon(
                        LoginRegisterCubit.get(context).obsecureIcon,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        LoginRegisterCubit.get(context).signUp(
                          context: context,
                          emailController: emailController,
                          passwordController: passwordController,
                          nameController: nameController,
                        );
                      }
                    },
                    text: 'Sign Up',
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, LoginPage.id);
                    },
                    text: 'Already have an account ? Sign In',
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
