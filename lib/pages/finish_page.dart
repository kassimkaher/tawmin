import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_button.dart';

class FinishPage extends GetView<InformationControler> {
  const FinishPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, offset: Offset(0, -5), blurRadius: 10)
        ],
      ),
      child: ListTile(
        title: const Text("QR الخاص بمعاملتك"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "رب الاسرة",
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(
              height: kDefaultSpacing,
            ),
            Container(
              margin: EdgeInsets.only(left: 50, bottom: 20),
              child: Text(
                "${controller.fnController.text} ${controller.snController.text} ${controller.tnController.text} ${controller.lnController.text} ",
                style: theme.textTheme.titleMedium,
              ),
            ),
            Divider(),
            Container(
              color: theme.scaffoldBackgroundColor,
              child: QrImage(
                data: "1234567890",
                version: QrVersions.auto,
                size: query.size.width,
                padding: const EdgeInsets.all(kDefaultPadding * 2),
              ),
            ),
            const Spacer(),
            FDButton(
              title: "تم",
              onPressed: () => controller.completeSubmit.value = false,
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
