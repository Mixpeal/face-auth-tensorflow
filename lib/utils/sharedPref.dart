import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  readAll(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  Future<bool> append(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    var curItem = prefs.getString(key) != null ? prefs.getString(key) : '';
    List allItems = curItem.isNotEmpty ? json.decode(curItem) : [];
    List getItems =
        allItems.where((item) => item['name'] == value['name']).toList();
    if (getItems != null && getItems.length > 0) {
      int getIndex =
          allItems.lastIndexWhere((item) => item['name'] == value['name']);
      //allItems[getIndex]['qty'] += 1;
      return false;
    } else {
      allItems.add(value);
    }
    prefs.setString(key, json.encode(allItems));
    return true;
  }

  Future<List> readByName(String key, String name) async {
    final prefs = await SharedPreferences.getInstance();
    var curItem = prefs.getString(key) != null ? prefs.getString(key) : '';
    List getItems = [];
    List allItems = curItem.isNotEmpty ? json.decode(curItem) : [];
    getItems = allItems.where((item) => item['name'] == name).toList();
    //print(getItems);
    // if (getItems != null && getItems.length > 0) {
    //   return getItems[0];
    // }
    return getItems;
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  toggleSave(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    var curItem = prefs.getString(key) != null ? prefs.getString(key) : '';
    List allItems = curItem.isNotEmpty ? json.decode(curItem) : [];
    List getItems =
        allItems.where((item) => item['id'] == value['id']).toList();
    if (getItems != null && getItems.length > 0) {
      int getIndex =
          allItems.lastIndexWhere((item) => item['id'] == value['id']);
      allItems.remove(allItems[getIndex]);
    } else {
      allItems.add(value);
    }
    prefs.setString(key, json.encode(allItems));
  }

  Future<bool> readById(String key, id) async {
    final prefs = await SharedPreferences.getInstance();
    var curItem = prefs.getString(key) != null ? prefs.getString(key) : '';
    List allItems = curItem.isNotEmpty ? json.decode(curItem) : [];
    List getItems = allItems.where((item) => item['id'] == id).toList();
    if (getItems != null && getItems.length > 0) {
      return true;
    }
    return false;
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
