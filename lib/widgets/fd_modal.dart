import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class FDModal extends StatelessWidget {
  const FDModal(
      {Key? key,
      required this.title,
      required this.body,
      this.tringleView,
      this.bottomChild})
      : super(key: key);

  final String title;
  final Widget body;
  final Widget? tringleView;
  final Widget? bottomChild;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24).copyWith(bottom: 0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              tringleView ?? const SizedBox(),
              Text(
                title,
                style: theme.textTheme.bodyLarge,
              ),
              const Spacer(),
              SimpleButton(
                onPressed: () {
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                },
                child: Icon(
                  FeatherIcons.x,
                  color: theme.disabledColor,
                  size: 20,
                ),
              ),
            ]),
          ),
          const SizedBox(height: kDefaultPadding),
          const Divider(
            indent: kDefaultPadding,
            endIndent: kDefaultPadding,
            height: 1,
          ),
          Expanded(
            child: body,
          ),
          bottomChild ?? SizedBox()
        ],
      ),
    );
  }
}
