import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _userProfileId = prefs.getString('ff_userProfileId') ?? _userProfileId;
    _userId = prefs.getString('ff_userId') ?? _userId;
    _userProfileImage =
        prefs.getString('ff_userProfileImage') ?? _userProfileImage;
    _userProfileUsername =
        prefs.getString('ff_userProfileUsername') ?? _userProfileUsername;
    _showComImage = prefs.getBool('ff_showComImage') ?? _showComImage;
    _childImageChange =
        prefs.getBool('ff_childImageChange') ?? _childImageChange;
    _order = prefs.getStringList('ff_order')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _order;
    _chosenTime = prefs.getString('ff_chosenTime') ?? _chosenTime;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userProfileId = '';
  String get userProfileId => _userProfileId;
  set userProfileId(String _value) {
    _userProfileId = _value;
    prefs.setString('ff_userProfileId', _value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String _value) {
    _userId = _value;
    prefs.setString('ff_userId', _value);
  }

  String _userProfileImage = '';
  String get userProfileImage => _userProfileImage;
  set userProfileImage(String _value) {
    _userProfileImage = _value;
    prefs.setString('ff_userProfileImage', _value);
  }

  String _userProfileUsername = '';
  String get userProfileUsername => _userProfileUsername;
  set userProfileUsername(String _value) {
    _userProfileUsername = _value;
    prefs.setString('ff_userProfileUsername', _value);
  }

  bool _showComImage = false;
  bool get showComImage => _showComImage;
  set showComImage(bool _value) {
    _showComImage = _value;
    prefs.setBool('ff_showComImage', _value);
  }

  bool _childImageChange = false;
  bool get childImageChange => _childImageChange;
  set childImageChange(bool _value) {
    _childImageChange = _value;
    prefs.setBool('ff_childImageChange', _value);
  }

  List<dynamic> _order = [];
  List<dynamic> get order => _order;
  set order(List<dynamic> _value) {
    _order = _value;
    prefs.setStringList('ff_order', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToOrder(dynamic _value) {
    _order.add(_value);
    prefs.setStringList('ff_order', _order.map((x) => jsonEncode(x)).toList());
  }

  void removeFromOrder(dynamic _value) {
    _order.remove(_value);
    prefs.setStringList('ff_order', _order.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromOrder(int _index) {
    _order.removeAt(_index);
    prefs.setStringList('ff_order', _order.map((x) => jsonEncode(x)).toList());
  }

  String _chosenTime = '';
  String get chosenTime => _chosenTime;
  set chosenTime(String _value) {
    _chosenTime = _value;
    prefs.setString('ff_chosenTime', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
