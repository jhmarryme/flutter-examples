import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SampleSwitchWidget extends StatelessWidget {
  const SampleSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      title: const Text('I Accept the terms and conditions'),
      name: 'accept_terms_switch',
      initialValue: true,
      onChanged: (value) {},
    );
  }
}
