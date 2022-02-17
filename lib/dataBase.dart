import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class Database with ChangeNotifier {
    Map<String,Subject> data = {};

    void add(String date, Item item){
        if(data[date] == null) {
            data[date] = Subject([item]);
        }
        else{
            data[date]!.add(item);
        }
        notifyListeners();
    }
}

class Subject {
    Subject(
        this.itemList,
    );

    List<Item> itemList = [];

    void add(Item item) {
        itemList.add(item);
        itemList.sort((a, b) => a.time.compareTo(b.time));
    }
}

class Item {
    Item(
        this.subject,
        this.time,
        this.iconData,
        this.total,
        this.detail,
    );

    String subject;
    String time;
    String total;
    IconData iconData;
    List<Map<String,String>> detail;
}
