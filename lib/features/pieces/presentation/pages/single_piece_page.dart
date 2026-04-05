import 'package:flutter/material.dart';
import 'package:madmudmobile/features/pieces/presentation/single_piece_view/single_piece_view.dart';

class SinglePiecePage extends StatelessWidget {
  final String id;
  const SinglePiecePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SinglePieceView(id: id);
  }
}
