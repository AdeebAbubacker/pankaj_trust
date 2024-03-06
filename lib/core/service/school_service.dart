import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panakj_app/core/model/searchschool/school.dart';
import 'package:panakj_app/core/model/searchschool/searchschool.dart';
import '../model/search_bank/search_bank.dart';

class SchoolDropDownService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Searchschool> getSearchBank({String? searchKeyword}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> document = await _firestore
          .collection('get_SchoolDetails')
          .doc('ZYDRJvBACCLDFu276cVr') // Assuming this is your document ID
          .get();

      if (document.exists) {
        print('haaaai');
        // Assuming 'data' is an array in your structure
        dynamic banksData = document.data()?['data'];

        // Ensure that banksData is a List<Map<String, dynamic>>
        if (banksData is List &&
            banksData.every((item) => item is Map<String, dynamic>)) {
          List<Map<String, dynamic>> typedBanksData =
              banksData.cast<Map<String, dynamic>>();

          // Filter banks based on searchKeyword
          List<Map<String, dynamic>> filteredBanks = typedBanksData
              .where((bank) =>
                  bank['name'] != null &&
                  bank['name']
                      .toString()
                      .toLowerCase()
                      .contains(searchKeyword?.toLowerCase() ?? ''))
              .toList();

          // Convert maps to School objects
          List<School> schools =
              filteredBanks.map((school) => School.fromJson(school)).toList();

          // Create a Searchschool instance using the named constructor
          Searchschool searchSchoolData = Searchschool(
            count: schools.length,
            data: schools,
            message: 'Fetched Successfully!',
          );

          // Return the Searchschool instance
          return searchSchoolData;
        } else {
          // Handle the case when the 'data' field is not in the expected format
          return Searchschool(); // Adjust this based on your model
        }
      } else {
        print('deey');
        // Handle the case when the document doesn't exist
        return Searchschool(); // Adjust this based on your model
      }
    } catch (e) {
      print('Error retrieving school data: $e');
      throw e;
    }
  }
}








///-------------------------------------------------------------------------
















// class SchoolDropDownService2 {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<Searchschool> getSearchBank() async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> snapshot;

//       snapshot = await _firestore.collection('edu_1_schools').get();
//       print('response from service ${snapshot.toString()}');

//       List<Map<String, dynamic>> typedBanksData = snapshot.docs
//           .map((doc) => doc.data() as Map<String, dynamic>)
//           .toList();

//       return Searchschool();
//     } catch (e) {
//       print('failure $e');
//       print('Error retrieving bank data: $e');
//       throw e;
//     }
//   }
// }
