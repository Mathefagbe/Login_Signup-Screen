import 'package:flutter/material.dart';

InputDecoration resuableDecoration = InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(10)),
    fillColor: Colors.grey.withOpacity(0.1),
    filled: true,
    enabled: true,
    enabledBorder: InputBorder.none,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
