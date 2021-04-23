import 'package:cocheskm/utils/ColorsConstants.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecoration() {
  return InputDecoration(
    contentPadding: EdgeInsets.all(8.0),
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: PrimaryColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: ErrorColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: PrimaryColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: ErrorColor,
      ),
    ),
  );
}
InputDecoration inputDecorationDropDown() {
  return InputDecoration(
    contentPadding: EdgeInsets.all(8.0),
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: PrimaryColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: ErrorColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: PrimaryColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: ErrorColor,
      ),
    ),
  );
}

