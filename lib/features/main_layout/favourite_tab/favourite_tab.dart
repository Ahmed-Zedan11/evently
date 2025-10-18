import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/widgets/event_item.dart';
import 'package:evently/firebase_service/firebase_service.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Container(
            margin: REdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 24.sp,
                  color: ColorsManger.blue,
                ),
                hintText: AppLocalizations.of(context).search_for_event,
                hintStyle: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManger.blue,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManger.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManger.blue),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: FireBaseService.getFavouriteEventsFromFireStore(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              List<EventModel> favouriteEvents = snapshot.data ?? [];
              return Expanded(
                child: Container(
                  margin: REdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemBuilder: (context, index) => favouriteEvents.isEmpty
                        ? Center(
                            child: Text(
                              AppLocalizations.of(context).no_favourites,
                              style: GoogleFonts.inter(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsManger.blue),
                            ),
                          )
                        : EventItem(
                            favouriteEvent: true,
                            event: favouriteEvents[index],
                          ),
                    itemCount: favouriteEvents.length,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
