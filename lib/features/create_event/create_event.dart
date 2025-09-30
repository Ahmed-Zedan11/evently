import 'package:evently/core/resources/Assets_Manger.dart';
import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/widgets/clickable_button.dart';
import 'package:evently/core/widgets/clickable_text.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/core/widgets/custom_text_field.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late final TextEditingController descriptionController;
  late final TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    titleController = TextEditingController();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).create_event,
          style: GoogleFonts.inter(fontSize: 22.sp, color: ColorsManger.blue),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 361.w,
                height: 203.h,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(AssetsManger.sports)),
                    borderRadius: BorderRadius.circular(16.r)),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTabBar(
                  selectedTabBGColor: ColorsManger.blue,
                  selectedTabFGColor: ColorsManger.white,
                  unSelectedTabBGColor: Colors.transparent,
                  unSelectedTabFGColor: ColorsManger.blue,
                  categoryType: CategoryModel.categoriesWithoutAll(context)),
              SizedBox(
                height: 16.h,
              ),
              Text(
                AppLocalizations.of(context).title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomTextField(
                  prefixIconType: Icons.edit_note,
                  hintText: AppLocalizations.of(context).event_title,
                  validator: (_) {},
                  controller: titleController),
              SizedBox(
                height: 16.h,
              ),
              Text(
                AppLocalizations.of(context).description,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                maxLines: 4,
                validator: (_) {},
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).event_description,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(AppLocalizations.of(context).event_date,
                      style: Theme.of(context).textTheme.displayMedium),
                  Spacer(),
                  ClickableText(
                      title: AppLocalizations.of(context).choose_date,
                      onClick: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2040),
                        );
                      })
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timelapse,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(AppLocalizations.of(context).event_time,
                      style: Theme.of(context).textTheme.displayMedium),
                  Spacer(),
                  ClickableText(
                      title: AppLocalizations.of(context).choose_time,
                      onClick: () {
                        showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                      })
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                AppLocalizations.of(context).location,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 8.h,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r)),
                      side: BorderSide(color: ColorsManger.blue),
                      padding: EdgeInsets.zero),
                  onPressed: () {},
                  child: Padding(
                    padding: REdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          padding: REdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: ColorsManger.blue,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Icon(
                            Icons.location_searching_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          AppLocalizations.of(context).choose_event_location,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorsManger.blue,
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 16.h,
              ),
              ClickableButton(
                  text: AppLocalizations.of(context).add_event,
                  onClick: () {},
                  color: ColorsManger.blue)
            ],
          ),
        ),
      ),
    );
  }
}
