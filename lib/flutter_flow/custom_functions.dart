import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String? postsNbOfComments(List<DocumentReference> postCommentsList) {
  dynamic mypost = postCommentsList.length;
  return mypost.length;
}

bool isVerified(String badge) {
  return badge == "verified";
}

String imagePath(String url) {
  return 'https://api.proof.ma$url';
}

double priceForDiscountedProduct(
  double up,
  double discount,
) {
  return up - up * discount / 100;
}

dynamic addProductToCart(
  dynamic product,
  double quantity,
) {
  double myUp = product.discount
      ? product.up - product.up * product.discount / 100
      : product.up;
  return {
    "productId": {"id": product.id},
    "quantity": quantity,
    "up": myUp,
    "subTotal": quantity * myUp,
    "topPhoto": product.topPhoto.url,
    "producer": product.producer,
    "name": product.name
  };
}

bool productExistInCart(
  dynamic productID,
  List<dynamic> cartItems,
) {
  bool exist = false;
  for (var i = 0; i < cartItems.length; i++) {
    if (cartItems[i].productId == productID) {
      exist = true;
    }
  }
  return exist;
}

dynamic localStorageText(List<dynamic> local) {
  return local;
}
