import 'package:flutter/material.dart';
import 'package:madmudmobile/features/pieces/presentation/single_piece_view/photo_carousel_indicator.dart';
import 'package:madmudmobile/utils/constants.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/photo_with_fallback.dart';

const double photoMinWidth = 300.0;
const Size photoSize = Size(photoMinWidth, photoMinWidth);

class PiecePhotos extends StatefulWidget {
  final List<String> photoNames;

  const PiecePhotos({super.key, required this.photoNames});

  @override
  State<PiecePhotos> createState() => _PiecePhotosState();
}

class _PiecePhotosState extends State<PiecePhotos> {
  late final List<Photo> photos;
  late final PageController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    photos = _photos(widget.photoNames);
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: photoSize.height + 10.0,
          width: photoSize.width + 10.0,
          child: PageView.builder(
            controller: _controller,
            physics: const ClampingScrollPhysics(),
            itemCount: photos.length,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: PhotoWithFallback(
                  photo: photos[index],
                  size: photoSize,
                  zoomOnHover: false,
                ),
              );
            },
          ),
        ),
        if (photos.length > 1)
          PhotoCarouselIndicator(
            currentIndex: currentIndex,
            photosCount: photos.length,
          ),
      ],
    );
  }

  List<Photo> _photos(List<String> photoNames) {
    return photoNames.map((photoName) {
      final url = '$photoBaseUrl$photoName';
      return Photo(id: photoName, url: url);
    }).toList();
  }
}
