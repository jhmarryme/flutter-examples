import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/form_builder/default/default_form.dart';

class FormBuilderView extends StatelessWidget {
  const FormBuilderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Row(
          children: <Widget>[
            Spacer(),
            Expanded(flex: 4, child: DefaultForm()),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
