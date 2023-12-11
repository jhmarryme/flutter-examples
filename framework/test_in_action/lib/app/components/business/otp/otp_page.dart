part of otp;

class OtpPage<Logic extends OtpLogic> extends GetView<Logic> {
  final OtpType? type;

  const OtpPage({
    Key? key,
    this.type = OtpType.roundedWithShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              OtpHeader(username: controller.username.value),
              getOtpComponent(type),
              const SizedBox(height: 44),
              Text(
                'Didn’t receive code?',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color.fromRGBO(62, 116, 165, 1),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  'Resend',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    color: const Color.fromRGBO(62, 116, 165, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// todo 支持更多样式
  Widget getOtpComponent(OtpType? otpType) {
    switch (otpType) {
      case OtpType.filled:
        return const Filled();
      case OtpType.filledRounded:
        return const FilledRoundedPinPut();
      case OtpType.onlyBottomCursor:
        return const OnlyBottomCursor();
      case OtpType.roundedWithCursor:
        return const RoundedWithCustomCursor();
      case OtpType.roundedWithShadow:
        return RoundedWithShadow<Logic>();
      default:
        return RoundedWithShadow<Logic>(); // 或者返回一个默认的组件
    }
  }
}
