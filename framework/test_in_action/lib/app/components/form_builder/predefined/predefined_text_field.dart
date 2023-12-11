import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:random_string/random_string.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'widgets/clear_button.dart';

/// todo 防抖
/// https://juejin.cn/post/7071074352837443614
/// https://pub.dev/packages/easy_debounce
class PredefinedTextField extends StatefulWidget {
  const PredefinedTextField({
    Key? key,
    this.formKey,
    this.fieldKey,
    required this.name,
    this.labelText = 'labelText',
    this.validator,
    this.decoration,
  })  : assert(formKey != null || fieldKey != null),
        super(key: key);

  final GlobalKey<FormBuilderState>? formKey;
  final GlobalKey<FormBuilderFieldState>? fieldKey;
  final String name;
  final String labelText;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;

  FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>? get currentFiled {
    return fieldKey?.currentState ?? formKey?.currentState?.fields[name];
  }

  @override
  State<PredefinedTextField> createState() => _PredefinedTextFieldState();
}

class _PredefinedTextFieldState extends State<PredefinedTextField> {
  bool _showClearButton = false;
  bool _showCompleteButton = false;
  final String debounceId = randomString(10);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      key: widget.fieldKey,
      name: widget.name,
      decoration: widget.decoration ??
          InputDecoration(
            labelText: widget.labelText,
            suffixIcon: suffixIcon(),
          ),
      onTap: () {
        setState(() {
          _showCompleteButton = false;
          _showClearButton = valueIsNotEmpty();
        });
      },
      onSaved: (newValue) => LogUtil.d('onSaved: $newValue'),
      onEditingComplete: () => LogUtil.d('onEditingComplete'),
      onSubmitted: (value) => LogUtil.d('onSubmitted: $value'),
      onChanged: (value) => debounceUpdateFieldStatus(),
      onTapOutside: (event) {
        // EasyDebounce.cancel(debounceId);
        // updateFieldStatus();
      },
      autovalidateMode: AutovalidateMode.disabled,
      validator: widget.validator,
    );
  }

  bool valueIsNotEmpty() {
    return widget.currentFiled?.value?.toString().isNotEmpty ?? false;
  }

  Widget? suffixIcon() {
    if (_showClearButton) {
      return ClearButton(fieldState: widget.currentFiled);
    } else if (_showCompleteButton) {
      return const Icon(Icons.check, color: Colors.green);
    }
    return null;
  }

  /// 更新字段状态，根据当前字段内容和验证结果来显示清除按钮或完成按钮
  void updateFieldStatus() {
    bool hasContent = valueIsNotEmpty();
    bool isValid = widget.currentFiled?.validate() ?? false;
    setState(() {
      _showCompleteButton = hasContent && isValid;
      _showClearButton = hasContent && !_showCompleteButton;
    });
  }

  /// 使用防抖函数来延迟更新字段状态，以提高性能
  void debounceUpdateFieldStatus() {
    EasyDebounce.debounce(
      debounceId,
      const Duration(milliseconds: 800),
      () => updateFieldStatus(),
    );
  }
}
