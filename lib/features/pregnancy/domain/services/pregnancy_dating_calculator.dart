class PregnancyDatingCalculator {
  /// Calculate the Due Date (DPA) from the Last Menstrual Period (LMP).
  /// LMP + 280 days.
  static DateTime calculateDueDateFromLmp(DateTime lmp) {
    // Normalise to start of day to avoid timezone/DST shifts causing issues
    final normalizedLmp = DateTime(lmp.year, lmp.month, lmp.day);
    return normalizedLmp.add(const Duration(days: 280));
  }

  /// Calculate Gestational Age based on Due Date.
  /// If today is not provided, defaults to DateTime.now().
  /// referenceDate = dueDate - 280 days
  /// gestationalDays = today - referenceDate
  static Map<String, int>? calculateGestationalAge(
    DateTime? dueDate, {
    DateTime? today,
  }) {
    if (dueDate == null) return null;

    final normalizedDueDate = DateTime(
      dueDate.year,
      dueDate.month,
      dueDate.day,
    );
    final referenceDate = normalizedDueDate.subtract(const Duration(days: 280));

    final actualToday = today ?? DateTime.now();
    final normalizedToday = DateTime(
      actualToday.year,
      actualToday.month,
      actualToday.day,
    );

    final gestationalDays = normalizedToday.difference(referenceDate).inDays;

    final clampedDays = gestationalDays < 0 ? 0 : gestationalDays;

    return {
      'total_days': clampedDays,
      'weeks': clampedDays ~/ 7,
      'days': clampedDays % 7,
    };
  }
}
