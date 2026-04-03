import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/utils/constants.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

const double descriptionFontSize = 12.0;
const Duration snackBarDuration = Duration(seconds: 2);

class ContactEmailWithCopyOption extends StatelessWidget {
  const ContactEmailWithCopyOption({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final contactEmail = context.local(Translation.contactEmail);
    final emailCopiedToClipboard =
        context.local(Translation.emailCopiedToClipboard);
    final tapToCopyEmail = context.local(Translation.tapToCopyEmail);

    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: contactEmail));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(emailCopiedToClipboard),
            duration: snackBarDuration,
            backgroundColor: colors.primary,
          ),
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Tooltip(
          message: tapToCopyEmail,
          decoration: _tooltipDecoration(colors),
          textStyle: _tooltipTextStyle(colors),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Symbols.email_rounded,
                color: colors.secondary,
                weight: iconWeight,
              ),
              const SizedBox(width: 5.0),
              Text(contactEmail, style: _emailTextStyle(colors)),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _tooltipDecoration(ColorScheme colors) {
    return BoxDecoration(
      color: colors.primary.withOpacity(0.8),
      borderRadius: BorderRadius.circular(25.0),
    );
  }

  TextStyle _tooltipTextStyle(ColorScheme colors) {
    return TextStyle(
      fontSize: descriptionFontSize,
      color: colors.surface,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle _emailTextStyle(ColorScheme colors) {
    return TextStyle(
      fontSize: descriptionFontSize,
      color: colors.secondary,
      fontWeight: FontWeight.w700,
    );
  }
}
