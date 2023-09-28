import 'package:hive/hive.dart';
class HiveService {
  isExists({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  addBoxes<T>(List<T> items, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    for (var item in items) {
      openBox.add(item);
    }
  }

  deleteBox(String boxName) async {
    final box = await Hive.box(boxName);
    await box.clear();
    print(box.length);
  }

  onLogout() async {
    if (await isExists(boxName: "UserProfile",)) {
      final box = await Hive.box("UserProfile");
      await box.clear();
    }
    if (await isExists(boxName: "token",)) {
      final box1 = await Hive.box("token");
      await box1.clear();
    }
    if (await isExists(boxName: "numberPlate",)) {
      final box2 = await Hive.box("numberPlate");
      await box2.clear();
    }
  }

  addBox(item, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    openBox.add(item);
  }

  addBoxAndDelete(item, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    if (length == 0) {
      openBox.add(item);
      print(openBox.length.toString());
    } else {
      final box = await Hive.box(boxName);
      await box.clear();
      openBox.add(item);
      print(openBox.length.toString());
    }
  }

  getBoxes<T>(String boxName) async {
    List<T> boxList = <T>[];
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }
    return boxList;
  }

  deleteItem(int index, String boxName) async {
    final box = await Hive.openBox(boxName);
    box.deleteAt(index);
  }

  deleteItemFromProduct(int id, String boxName) async {
    List<dynamic> boxList = [];
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }
    List<dynamic> deleteFav = boxList;
    for (int i = 0; i < deleteFav.length; i++) {
      if (deleteFav[i].id == id) {
        return i;
      }
    }
    return 0;
  }
}