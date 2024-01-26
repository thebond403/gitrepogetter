extension StringChecker on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNullEmptyOrWhiteSpace => isNullOrEmpty || this!.trim().isEmpty;

  bool get isNotNullEmptyOrWhiteSpace => !isNullEmptyOrWhiteSpace;
}
