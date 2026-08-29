import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';

class BirthDateInputField extends StatefulWidget {
  final DateTime? initialDate;
  final void Function(DateTime? date, bool isValid) onChanged;
  final FocusNode? focusNode;

  const BirthDateInputField({
    super.key,
    this.initialDate,
    required this.onChanged,
    this.focusNode,
  });

  @override
  State<BirthDateInputField> createState() => _BirthDateInputFieldState();
}

class _BirthDateInputFieldState extends State<BirthDateInputField> {
  late TextEditingController _dayCtrl;
  late TextEditingController _monthCtrl;
  late TextEditingController _yearCtrl;

  late FocusNode _dayFocus;
  late FocusNode _monthFocus;
  late FocusNode _yearFocus;

  String? _errorText;

  @override
  void initState() {
    super.initState();
    _dayCtrl = TextEditingController();
    _monthCtrl = TextEditingController();
    _yearCtrl = TextEditingController();

    _dayFocus = FocusNode();
    _monthFocus = FocusNode();
    _yearFocus = FocusNode();

    if (widget.focusNode != null) {
      widget.focusNode!.addListener(_onParentFocusChange);
    }

    if (widget.initialDate != null) {
      _dayCtrl.text = widget.initialDate!.day.toString().padLeft(2, '0');
      _monthCtrl.text = widget.initialDate!.month.toString().padLeft(2, '0');
      _yearCtrl.text = widget.initialDate!.year.toString();
    }
  }

  void _onParentFocusChange() {
    if (widget.focusNode?.hasFocus ?? false) {
      if (!_dayFocus.hasFocus &&
          !_monthFocus.hasFocus &&
          !_yearFocus.hasFocus) {
        _dayFocus.requestFocus();
      }
    }
  }

  @override
  void didUpdateWidget(BirthDateInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode?.removeListener(_onParentFocusChange);
      widget.focusNode?.addListener(_onParentFocusChange);
    }
  }

  @override
  void dispose() {
    _dayCtrl.dispose();
    _monthCtrl.dispose();
    _yearCtrl.dispose();
    _dayFocus.dispose();
    _monthFocus.dispose();
    _yearFocus.dispose();
    widget.focusNode?.removeListener(_onParentFocusChange);
    super.dispose();
  }

  void _validateAndNotify() {
    final d = _dayCtrl.text;
    final m = _monthCtrl.text;
    final y = _yearCtrl.text;

    if (d.isEmpty && m.isEmpty && y.isEmpty) {
      setState(() => _errorText = null);
      widget.onChanged(null, true);
      return;
    }

    if (d.isEmpty || m.isEmpty || y.length < 4) {
      setState(() => _errorText = 'Complétez votre date de naissance.');
      widget.onChanged(null, false);
      return;
    }

    final day = int.tryParse(d);
    final month = int.tryParse(m);
    final year = int.tryParse(y);

    if (day == null || month == null || year == null) {
      setState(() => _errorText = 'Date invalide.');
      widget.onChanged(null, false);
      return;
    }

    if (month < 1 || month > 12) {
      setState(() => _errorText = 'Mois invalide.');
      widget.onChanged(null, false);
      return;
    }

    final maxDays = _daysInMonth(year, month);
    if (day < 1 || day > maxDays) {
      setState(() => _errorText = 'Jour invalide.');
      widget.onChanged(null, false);
      return;
    }

    final date = DateTime(year, month, day);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (date.isAfter(today)) {
      setState(() => _errorText = 'La date ne peut pas être dans le futur.');
      widget.onChanged(null, false);
      return;
    }

    setState(() => _errorText = null);
    widget.onChanged(date, true);
  }

  int _daysInMonth(int year, int month) {
    if (month == 2) {
      final isLeapYear =
          (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
      return isLeapYear ? 29 : 28;
    }
    const days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return days[month - 1];
  }

  void _onDayChanged(String val) {
    if (val.length == 2) {
      _monthFocus.requestFocus();
    }
    _validateAndNotify();
  }

  void _onMonthChanged(String val) {
    if (val.length == 2) {
      _yearFocus.requestFocus();
    }
    if (val.isEmpty) {
      _dayFocus.requestFocus();
    }
    _validateAndNotify();
  }

  void _onYearChanged(String val) {
    if (val.isEmpty) {
      _monthFocus.requestFocus();
    }
    _validateAndNotify();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final currentTextDate = _parseCurrentText();

    final picked = await showDatePicker(
      context: context,
      initialDate: currentTextDate ?? widget.initialDate ?? DateTime(1990),
      firstDate: DateTime(1920),
      lastDate: DateTime(now.year, now.month, now.day),
    );

    if (picked != null) {
      _dayCtrl.text = picked.day.toString().padLeft(2, '0');
      _monthCtrl.text = picked.month.toString().padLeft(2, '0');
      _yearCtrl.text = picked.year.toString();
      _validateAndNotify();
    }
  }

  DateTime? _parseCurrentText() {
    final day = int.tryParse(_dayCtrl.text);
    final month = int.tryParse(_monthCtrl.text);
    final year = int.tryParse(_yearCtrl.text);
    if (day != null && month != null && year != null) {
      if (month >= 1 && month <= 12) {
        if (day >= 1 && day <= _daysInMonth(year, month)) {
          return DateTime(year, month, day);
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final hasError = _errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          focusNode: widget.focusNode,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: hasError ? AppColors.error : AppColors.borderSoft,
                width: hasError ? 1.5 : 1.0,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Semantics(
                    label: 'Jour de naissance',
                    child: TextField(
                      controller: _dayCtrl,
                      focusNode: _dayFocus,
                      onChanged: _onDayChanged,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: 'JJ',
                        hintStyle: GoogleFonts.quicksand(
                          color: AppColors.disabled,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const Text('/', style: TextStyle(color: AppColors.disabled)),
                Expanded(
                  child: Semantics(
                    label: 'Mois de naissance',
                    child: TextField(
                      controller: _monthCtrl,
                      focusNode: _monthFocus,
                      onChanged: _onMonthChanged,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: 'MM',
                        hintStyle: GoogleFonts.quicksand(
                          color: AppColors.disabled,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const Text('/', style: TextStyle(color: AppColors.disabled)),
                Expanded(
                  flex: 2,
                  child: Semantics(
                    label: 'Année de naissance',
                    child: TextField(
                      controller: _yearCtrl,
                      focusNode: _yearFocus,
                      onChanged: _onYearChanged,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: 'AAAA',
                        hintStyle: GoogleFonts.quicksand(
                          color: AppColors.disabled,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(width: 1, height: 32, color: AppColors.borderSoft),
                Semantics(
                  label: 'Ouvrir le calendrier',
                  child: IconButton(
                    onPressed: _pickDate,
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                      color: AppColors.primary,
                    ),
                    tooltip: 'Sélectionner une date',
                  ),
                ),
              ],
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Text(
              _errorText!,
              style: GoogleFonts.quicksand(
                color: AppColors.error,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
