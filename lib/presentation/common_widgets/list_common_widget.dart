import 'package:flutter/material.dart';
import '../../util/colors.dart';

@immutable
class ListCommonWidget extends StatelessWidget {
  final String? description;
  final String? supTitle;

  const ListCommonWidget({
    Key? key,
    this.description,
    this.supTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "$description",
        style: Theme.of(context).textTheme.caption!.copyWith(
            color: ConstColors.borderColor,
            fontSize: 15,
            fontWeight: FontWeight.bold),
        maxLines: 2,
      ),
      subtitle: Text(
        "$supTitle",
        style: Theme.of(context).textTheme.caption!.copyWith(
            color: ConstColors.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
