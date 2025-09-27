import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.title,
      required this.option1,
      required this.option2,
      required this.displayedDrobDown});

  final String title;
  final String option1;
  final String option2;
  final String displayedDrobDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: REdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Container(
          padding: REdgeInsets.symmetric(vertical: 4, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: ColorsManger.blue, width: 1.w)),
          margin: REdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                option1,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Spacer(),
              DropdownButton<String>(
                items: <String>[option1, option2].map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              )
            ],
          ),
        )
      ],
    );
  }
}
