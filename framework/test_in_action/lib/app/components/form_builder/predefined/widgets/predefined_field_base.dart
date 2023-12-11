import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// todo 防抖
/// https://juejin.cn/post/7071074352837443614
/// https://pub.dev/packages/easy_debounce
abstract class PredefinedFieldBase extends StatelessWidget {
  const PredefinedFieldBase({
    Key? key,
    this.formKey,
    this.fieldKey,
    this.name = 'name',
    this.decoration = 'decoration',
    this.validator,
  })  : assert(formKey != null || fieldKey != null),
        super(key: key);

  final GlobalKey<FormBuilderState>? formKey;
  final GlobalKey<FormBuilderFieldState>? fieldKey;
  final String name;
  final String decoration;
  final String? Function(String?)? validator;

  FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>? get currentFiled {
    return fieldKey?.currentState ?? formKey?.currentState?.fields[name];
  }
}
