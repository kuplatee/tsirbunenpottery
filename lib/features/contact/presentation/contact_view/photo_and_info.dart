import 'package:flutter/material.dart';
import 'package:madmudmobile/features/contact/presentation/contact_view/contact_email_with_copy_option.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/utils/constants.dart';
import 'package:madmudmobile/widgets/company/company.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/photo_with_fallback.dart';

const Size photoSize = Size(275.0, 275.0);

class PhotoAndInfo extends StatelessWidget {
  final String? imageFileName;
  const PhotoAndInfo({super.key, this.imageFileName});

  @override
  Widget build(BuildContext context) {
    final storyOnContactPage = context.local(Translation.storyOnContactPage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PhotoWithFallback(
          photo: _photo(imageFileName),
          size: photoSize,
          zoomOnHover: false,
          isShadeMasked: true,
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          width: photoSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Company(isDark: false),
              const SizedBox(height: 10.0),
              Text(
                storyOnContactPage,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                softWrap: true,
                style: _storyStyle(context),
              ),
              const SizedBox(height: 20.0),
              const ContactEmailWithCopyOption()
            ],
          ),
        ),
      ],
    );
  }

  Photo? _photo(String? fileName) {
    if (fileName == null) return null;
    return Photo(id: homePageImageDocId, url: '$photoBaseUrl$fileName');
  }

  TextStyle _storyStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
        overflow: TextOverflow.ellipsis,
        color: Theme.of(context).colorScheme.secondary);
  }
}
