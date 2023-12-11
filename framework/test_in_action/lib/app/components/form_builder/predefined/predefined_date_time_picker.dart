import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'widgets/clear_button.dart';
import 'widgets/predefined_field_base.dart';

class PredefinedDateTimePicker extends PredefinedFieldBase {
  const PredefinedDateTimePicker({
    super.key,
    super.formKey,
    super.fieldKey,
    super.name,
    super.decoration,
    super.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      key: fieldKey,
      name: name,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialValue: DateTime.now(),
      inputType: InputType.both,
      decoration: InputDecoration(
        labelText: decoration,
        suffixIcon: ClearButton(fieldState: currentFiled),
      ),
      initialTime: TimeOfDay.now(),
    );
  }
}
