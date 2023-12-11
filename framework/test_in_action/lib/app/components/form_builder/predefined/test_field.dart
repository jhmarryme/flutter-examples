import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TestField extends StatelessWidget {
  const TestField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var options = ["Option 1", "Option 2", "Option 3"];
    return FormBuilderField(
      name: "name",
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      builder: (FormFieldState<dynamic> field) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: "Select option",
            contentPadding: EdgeInsets.only(top: 10.0, bottom: 0.0),
            border: InputBorder.none,
            errorText: field.errorText,
          ),
          child: Container(
            height: 200,
            child: CupertinoPicker(
              itemExtent: 30,
              children: options.map((c) => Text(c)).toList(),
              onSelectedItemChanged: (index) {
                field.didChange(options[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
