import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panakj_app/core/model/drop_down_values/drop_down_values.dart';


class DropDownService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DropDownValues> getDropdownData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('get_dropdown_values')
          .doc('8lIIORu1IgvPuUq0WyMV')
          .get();

      DropDownValues downValues = DropDownValues.fromJson(snapshot.data()!);
      return downValues;
    } catch (e) {
      print('Error retrieving gallery data: $e');
      throw e;
    }
  }



}
