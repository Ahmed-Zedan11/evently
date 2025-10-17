import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseService {
  static Future<UserCredential> register(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }

  static Future<UserCredential> login(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }

  static Future<void> addUserToFireBase(UserModel user) {
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(user.id);
    return userDocument.set(user);
  }

  static Future<UserModel> getUserFromFireStore(String uid) async {
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(uid);
    DocumentSnapshot<UserModel> documentSnapshot = await userDocument.get();
    return documentSnapshot.data()!;
  }

  static Future<void> addEventToFireStore(
      EventModel event, BuildContext context) {
    CollectionReference<EventModel> eventsCollection =
        getEventsCollection(context);
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.eventId = eventDocument.id;
    return eventDocument.set(event);
  }

  static Future<List<EventModel>> getEventsFromFireStore(
      BuildContext context, CategoryModel category) async {
    CollectionReference<EventModel> eventsCollection =
        getEventsCollection(context);
    QuerySnapshot<EventModel> querySnapshot = await eventsCollection
        .where("categoryId", isEqualTo: category.id == "0" ? null : category.id)
        .orderBy("date")
        .get();
    return querySnapshot.docs
        .map((documentSnapshot) => documentSnapshot.data())
        .toList();
  }

  static CollectionReference<UserModel> getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection = db
        .collection("Users")
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromjson(snapshot.data()!),
            toFirestore: (user, _) => user.tojson());
    return usersCollection;
  }

  static CollectionReference<EventModel> getEventsCollection(
      BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollections = db
        .collection("Events")
        .withConverter<EventModel>(
            fromFirestore: (snapshot, _) =>
                EventModel.fromjson(snapshot.data()!, context),
            toFirestore: (event, _) => event.tojson());
    return eventsCollections;
  }

  static Future<void> addEventToFavourites(EventModel event) {
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favouriteEventIds.add(event.eventId);
    CollectionReference<UserModel> userCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument =
        userCollection.doc(currentUser.id);
    return userDocument.set(currentUser);
  }

  static Future<void> removeEventFromFavourites(EventModel event) {
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favouriteEventIds.remove(event.eventId);
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument =
        usersCollection.doc(currentUser.id);
    return userDocument.set(currentUser);
  }

  static Future<List<EventModel>> getFavouriteEventsFromFireStore(
      BuildContext context) async {
    CollectionReference<EventModel> eventsCollection =
        getEventsCollection(context);
    QuerySnapshot<EventModel> querySnapshot =
        await eventsCollection.orderBy("date").get();
    List<QueryDocumentSnapshot<EventModel>> documentSnapshots =
        querySnapshot.docs;
    List<EventModel> events = documentSnapshots
        .map((documentsnapshot) => documentsnapshot.data())
        .toList();
    List<EventModel> favouriteEvents = events
        .where((event) =>
            UserModel.currentUser!.favouriteEventIds.contains(event.eventId))
        .toList();
    return favouriteEvents;
  }
}
