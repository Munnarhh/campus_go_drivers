import 'dart:async';

import 'package:campus_go_drivers/features/home/data/models/driver_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

import '../features/home/data/models/user_model.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
User? currentUser;

StreamSubscription<Position>? streamSubscriptionPosition;
StreamSubscription<Position>? streamSubscriptionDriverLivePosition;

UserModel? userModelCurrentInfo;
Position? driverCurrentPosition;

DriverData onlineDriverData = DriverData();

String? driverVehicleType = '';
