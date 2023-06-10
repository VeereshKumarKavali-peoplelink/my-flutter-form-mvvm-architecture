import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../viewmodel/register_viewmodel.dart';
import 'package:provider/provider.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FormViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Register MVVM Architecture'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'Name',
                    decoration: const InputDecoration(
                        labelText: 'Enter your full name',
                        border: OutlineInputBorder()),
                    validator: viewModel.validateName,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'Email',
                    decoration: const  InputDecoration(
                        labelText: 'Enter your email',
                        border: OutlineInputBorder()),
                    validator: viewModel.validateEmail,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'Password',
                    decoration: InputDecoration(
                        labelText: 'Enter your password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            viewModel.toggle();
                          },
                          icon: viewModel.showPassword
                              ? const  Icon(Icons.visibility_off)
                              : const  Icon(Icons.visibility),
                        )),
                    validator: viewModel.validatePassword,
                    obscureText: viewModel.showPassword,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.submitForm();
                      },
                      child: const Text('Register here'))
                ],
              ),
            ),
          ),
        ));
  }
}
