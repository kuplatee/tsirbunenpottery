import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_state.dart';
import 'package:madmudmobile/features/home/presentation/pages/home_page_text_content.dart';
import 'package:madmudmobile/utils/constants.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/photo_with_fallback.dart';

const Size photoSize = Size(275.0, 275.0);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      pageBody: BlocBuilder<GeneralStateBloc, GeneralState>(
          builder: (BuildContext context, GeneralState state) {
        final language = state.language;
        final imageFileName = state.homePageImageFileName;

        return Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 10.0),
                Text(
                  tagline(language),
                  softWrap: true,
                  style: _subTitleStyle(context),
                ),
                const SizedBox(height: 30.0),
                Text(
                  description(language),
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: _mainDescriptionStyle(context),
                ),
                const SizedBox(height: 20.0),
                PhotoWithFallback(
                  photo: _photo(imageFileName),
                  size: photoSize,
                  zoomOnHover: false,
                  isShadeMasked: true,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Photo? _photo(String? fileName) {
    if (fileName == null) return null;
    return Photo(id: homePageImageDocId, url: '$photoBaseUrl$fileName');
  }

  TextStyle _subTitleStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle _mainDescriptionStyle(BuildContext context) {
    // Center the text
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w400);
  }
}
