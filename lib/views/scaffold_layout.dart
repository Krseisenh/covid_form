import 'package:covid_form/components/loader_overlay.dart';
import 'package:flutter/material.dart';

class ScaffoldLayout extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? bottom;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? location;

  const ScaffoldLayout({
    Key? key,
    this.title,
    required this.body,
    this.bottom,
    this.floatingActionButton,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        key: key ?? Key("scaffold-page-tag"), // added key t
        appBar: AppBar(
          title: Text(title ?? ''),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: body,
            ),
          ),
        ),
        bottomNavigationBar: bottom,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: location,
      ),
    );
  }
}
