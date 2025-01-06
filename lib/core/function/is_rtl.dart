bool isRtlText(String text) {
  final rtlRegExp = RegExp(
    r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\u0590-\u05FF]',
  );

  return rtlRegExp.hasMatch(text);
}
