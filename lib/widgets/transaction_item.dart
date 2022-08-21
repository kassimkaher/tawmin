import 'package:tamine/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: const Color(0xFFF3F5F7),
                        ),
                        child: Icon(
                          FeatherIcons.arrowUpCircle,
                          color: theme.colorScheme.outline,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: kDefaultSpacing / 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Top Up",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.textTheme.bodyLarge?.color,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "#12314ADS234",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: const Color(0xFF97A0AA),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "22 Jan 2022",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF97A0AA),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kDefaultSpacing),
              Text(
                "+ 16,000 IQD",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
