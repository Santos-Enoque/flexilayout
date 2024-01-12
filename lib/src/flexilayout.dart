// ignore_for_file: public_member_api_docs, must_be_immutable

import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template flexilayout}
/// A Flutter modern admin panel that can easily added to your app
/// {@endtemplate}
class FlexiLayout extends StatelessWidget {
  const FlexiLayout({
    super.key, required this.layout,

  });

  final LayoutType layout;


  @override
  Widget build(BuildContext context) {
    return layout as Widget;
  }
}
