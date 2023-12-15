import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExpansionPanelItem {
  String title;
  bool isExpanded;

  ExpansionPanelItem(this.title, {this.isExpanded = false});
}
