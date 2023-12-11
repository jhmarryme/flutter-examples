import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SampleCheckBoxWidget extends StatelessWidget {
  const SampleCheckBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: "name",
      onChanged: (value) {},
      title: RichText(
        text: const TextSpan(children: [
          TextSpan(
            text: 'I have read and agree to the ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(color: Colors.blue),
          ),
        ]),
      ),
      validator: FormBuilderValidators.equal(
        true,
        errorText: 'You must accept terms and conditions to continue',
      ),
    );
  }
}
