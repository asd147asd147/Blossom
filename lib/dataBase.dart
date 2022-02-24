import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class FileIO {
    String fileName = '';
    FileIO(this.fileName);

    Future<String> get _localPath async {
        final directory = await getApplicationDocumentsDirectory();

        return directory.path;
    }

    Future<File> get _localFile async {
        final path = await _localPath;
        return File('$path/$fileName');
    }

    Future<File> writeJson(json) async {
        final file = await _localFile;

        print('Save Path : $file');
        return file.writeAsString('$json');
    }

    Future<String> readJson() async {
        try {
            final file = await _localFile;

            print('Read Path : $file');
            String json = await file.readAsString();
            return json;
        } catch (e) {
            this.writeJson('');
            return '';
        }
    }
}
class Database with ChangeNotifier {
    Map<String,Subject> data = {};
    FileIO fileIO = FileIO('data.txt');

    Database() {
        fileIO.readJson().then((String jsonString) {
            if(jsonString != '') this.fromJson(jsonDecode(jsonString));
        });
    }

    void add(String date, Item item){
        if(data[date] == null) {
            data[date] = Subject([item]);
        }
        else{
            data[date]!.add(item);
        }
        fileIO.writeJson(jsonEncode(this.toJson()));
        notifyListeners();
    }

    void fromJson(Map<String, dynamic> json) {
        data = new Map<String, Subject>();
        for(var v in json.entries) {
            data[v.key] = new Subject.fromJson(v.value);
        }
        notifyListeners();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> d = new Map<String, dynamic>();
        for(var v in this.data.entries) {
            d[v.key] = v.value.toJson();
        }
        return d;
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

    Subject.fromJson(Map<String, dynamic> json) {
        json['itemList'].forEach((v) {
            itemList.add(new Item.fromJson(v));
        });
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> d = new Map<String, dynamic>();
        d['itemList'] = this.itemList.map((v) => v.toJson()).toList();
        return d;
    }
}

class Item {
    Item(
        this.subject,
        this.time,
        this.iconData,
        this.total,
        this.type,
        this.detail,
    );

    String subject;
    String time;
    String total;
    String type;
    int iconData;
    List<Map<String,String>> detail;

    Item.fromJson(Map<String, dynamic> json):
        subject = json['subject'],
        time = json['time'],
        iconData = json['iconData'],
        total = json['total'],
        type = json['type'],
        detail = []
    {
        json['detail'].forEach((v) {
            detail.add({'detail': v['detail'], 'cost': v['cost']});
        });
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> d = new Map<String, dynamic>();
        d['subject'] = this.subject;
        d['time'] = this.time;
        d['iconData'] = this.iconData;
        d['total'] = this.total;
        d['type'] = this.type;
        d['detail'] = this.detail.map((value) {
            final Map<String, String> dd = new Map<String, String>();
            for(var v in value.entries) {
                dd[v.key] = v.value;
            }
            return dd;
        }).toList();
        return d;
    }
}
