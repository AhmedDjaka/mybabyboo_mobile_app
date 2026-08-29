import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_countries.dart';
import '../../../../shared/models/country.dart';

class PhoneInputField extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;

  const PhoneInputField({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.validator,
  });

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  late Country _selectedCountry;
  late TextEditingController _localNumberCtrl;

  @override
  void initState() {
    super.initState();
    _initFromValue(widget.initialValue);
  }

  void _initFromValue(String value) {
    String cleanVal = value.replaceAll(RegExp(r'\s+'), '');
    Country? matchedCountry;
    String localNum = cleanVal;

    // Try to match the dial code
    for (final c in AppCountries.supportedCountries) {
      if (cleanVal.startsWith(c.dialCode)) {
        matchedCountry = c;
        localNum = cleanVal.substring(c.dialCode.length);
        break;
      }
    }

    _selectedCountry = matchedCountry ?? AppCountries.defaultCountry;

    // If the clean value doesn't start with the dial code, it might be just local or empty
    if (matchedCountry == null && cleanVal.isNotEmpty) {
      // if it started with a '+', but didn't match, we still keep it as localNum for now,
      // but typically it's an error. We will just pass it.
    }

    _localNumberCtrl = TextEditingController(text: localNum);
    _localNumberCtrl.addListener(_emitChange);
  }

  @override
  void didUpdateWidget(covariant PhoneInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Note: in a fully controlled component, we'd update state here if initialValue changed.
    // For V1, the component is mainly uncontrolled after init.
  }

  @override
  void dispose() {
    _localNumberCtrl.removeListener(_emitChange);
    _localNumberCtrl.dispose();
    super.dispose();
  }

  void _emitChange() {
    final localNum = _cleanLocalNumber(_localNumberCtrl.text);
    if (localNum.isEmpty) {
      widget.onChanged('');
    } else {
      widget.onChanged('${_selectedCountry.dialCode}$localNum');
    }
  }

  String _cleanLocalNumber(String input) {
    // Supprimer tout ce qui n'est pas un chiffre
    return input.replaceAll(RegExp(r'[^\d]'), '');
  }

  Future<void> _showCountrySelector() async {
    final selected = await showModalBottomSheet<Country>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Choisissez votre pays',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(height: 1, color: AppColors.borderSoft),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: AppCountries.supportedCountries.length,
                  itemBuilder: (context, index) {
                    final c = AppCountries.supportedCountries[index];
                    final isSelected = c.isoCode == _selectedCountry.isoCode;
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 4,
                      ),
                      leading: Text(
                        c.flag,
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(
                        c.name,
                        style: GoogleFonts.quicksand(
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textPrimary,
                        ),
                      ),
                      trailing: Text(
                        c.dialCode,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      onTap: () => Navigator.of(context).pop(c),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (selected != null && selected.isoCode != _selectedCountry.isoCode) {
      setState(() {
        _selectedCountry = selected;
      });
      _emitChange();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _localNumberCtrl,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: GoogleFonts.quicksand(
            fontSize: 16,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
          validator: (val) {
            if (widget.validator != null) {
              final cleanLocal = _cleanLocalNumber(val ?? '');
              final fullPhone = cleanLocal.isEmpty
                  ? ''
                  : '${_selectedCountry.dialCode}$cleanLocal';
              return widget.validator!(fullPhone);
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Numéro de téléphone',
            hintText: 'ex: ${_selectedCountry.example}',
            labelStyle: GoogleFonts.quicksand(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: AppColors.borderSoft,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: AppColors.borderSoft,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.error, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            filled: true,
            fillColor: AppColors.surfaceSoft,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            prefixIcon: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: _showCountrySelector,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _selectedCountry.flag,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _selectedCountry.dialCode,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: AppColors.textSecondary,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1.5,
                      color: AppColors.borderSoft,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
