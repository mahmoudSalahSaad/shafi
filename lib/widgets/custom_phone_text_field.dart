import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_text_field/phone_text_field.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/extensions/widget_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/generated/l10n.dart';

class CustomPhoneTextField extends ConsumerStatefulWidget {
  const CustomPhoneTextField(
      {super.key, this.controller, this.initialCountryCode, this.onChanged});

  final TextEditingController? controller;
  final String? initialCountryCode;
  final ValueChanged<PhoneNumber>? onChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends ConsumerState<CustomPhoneTextField> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userControllerProvider).requireValue;
    return Container(
      height: 80.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 54,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ]),
      child: PhoneTextField(
        countries: ["IQ", "DK", "NO", "FR", "FI", "SE"],
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0.h)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0.h)),
            borderSide: BorderSide(color: Colors.white),
          ),
          prefixIcon: Icon(
            Icons.phone,
            color: primaryColorDark,
          ),
          labelText: S().phone,
          labelStyle: TextStyle(color: primaryColorDark),
        ),
        searchFieldInputDecoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(),
          ),
          suffixIcon: Icon(Icons.search),
          hintText: "Search country",
        ),
        initialCountryCode: userState.country?.toUpperCase() ??
            widget.initialCountryCode ??
            "IQ",
        onChanged: widget.onChanged,
      ).ltr(),
    );
  }
}
