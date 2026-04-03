import 'package:flutter/material.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/translation.dart';

const double borderRadius = 25.0;
const SizedBox largeSpacer = SizedBox(height: 50.0);
const double maxWidth = 350.0;
const Color inputBackgroundPale = Color.fromARGB(255, 235, 234, 232);

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final titleController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final contactUsLabel = context.local(Translation.contactUs);
    final titlePlaceholder = context.local(Translation.contactTitlePlaceholder);
    final messagePlaceholder =
        context.local(Translation.contactMessagePlaceholder);
    final submitLabel = context.local(Translation.submitLabel);

    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            largeSpacer,
            Text(contactUsLabel, style: _titleStyle(textTheme, colors)),
            _buildTextField(
              colors,
              titleController,
              titlePlaceholder,
              2,
              textTheme,
            ),
            _buildTextField(
              colors,
              messageController,
              messagePlaceholder,
              8,
              textTheme,
            ),
            largeSpacer,
            SizedBox(
              width: 150.0,
              height: 50,
              child: ElevatedButton(
                onPressed: _onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                child: Text(submitLabel, style: _textStyle(textTheme, colors)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    ColorScheme colors,
    TextEditingController controller,
    String hintText,
    int maxLines,
    TextTheme textTheme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: inputBackgroundPale,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: controller,
            decoration: _inputDecoration(hintText),
            maxLines: maxLines,
            style: _inputTextStyle(textTheme, colors),
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    // FIXME: Implement handle form submission
    debugPrint("Title: ${titleController.text}");
    debugPrint("Message: ${messageController.text}");
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: inputBackgroundPale,
      border: _inputBorder(),
      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide.none,
    );
  }

  TextStyle _titleStyle(TextTheme textTheme, ColorScheme colors) {
    return textTheme.headlineMedium!.copyWith(
      fontSize: 20.0,
      color: colors.primary,
    );
  }

  TextStyle _inputTextStyle(TextTheme textTheme, ColorScheme colors) {
    return textTheme.bodyMedium!.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: colors.primary,
    );
  }

  TextStyle _textStyle(TextTheme textTheme, ColorScheme colors) {
    return textTheme.titleMedium!.copyWith(
      fontSize: 18.0,
      color: colors.surface,
    );
  }
}
