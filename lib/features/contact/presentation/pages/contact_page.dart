import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_state.dart';
import 'package:madmudmobile/features/contact/presentation/contact_view/contact_form.dart';
import 'package:madmudmobile/features/contact/presentation/contact_view/photo_and_info.dart';
import 'package:madmudmobile/widgets/footer/footer.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

const double showPhotoBreakpoint = 800.0;

class ContactPage extends StatelessWidget {
  final String? imageFileName;
  const ContactPage({super.key, this.imageFileName});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      pageBody: BlocBuilder<GeneralStateBloc, GeneralState>(
          builder: (BuildContext context, GeneralState state) {
        final width = MediaQuery.of(context).size.width;
        final isHorizontal = width > showPhotoBreakpoint;
        final imageFileName = state.homePageImageFileName;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isHorizontal
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PhotoAndInfo(imageFileName: imageFileName),
                          const SizedBox(width: 50.0),
                          const ContactForm(),
                        ],
                      )
                    : Column(
                        children: [
                          const ContactForm(),
                          const SizedBox(height: 30.0),
                          PhotoAndInfo(imageFileName: imageFileName),
                        ],
                      ),
                const Footer(),
              ]),
        );
      }),
    );
  }
}
