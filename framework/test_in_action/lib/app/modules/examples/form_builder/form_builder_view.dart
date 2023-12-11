import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/form_builder/default/default_form.dart';

class FormBuilderView extends StatelessWidget {
  const FormBuilderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => null,
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Spacer(),
            Expanded(
              child: DefaultForm(),
              flex: 2,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
