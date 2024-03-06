import 'package:panakj_app/core/model/search_course/datum.dart';
import 'package:panakj_app/core/model/search_course/search_course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CourseDropdownService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SearchCourse> getSearchBank({String? searchKeyword}) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> document = await _firestore
        .collection('get_Course')
        .doc('ExylFG3DQ63KSAj6rKFy') // Assuming this is your document ID
        .get();

    if (document.exists) {
      print('haaaai');
      // Assuming 'data' is an array in your structure
      dynamic banksData = document.data()?['data'];

      // Ensure that banksData is a List<Map<String, dynamic>>
      if (banksData is List && banksData.every((item) => item is Map<String, dynamic>)) {
        List<Map<String, dynamic>> typedBanksData = banksData.cast<Map<String, dynamic>>();

        // Filter banks based on searchKeyword
        List<Map<String, dynamic>> filteredBanks = typedBanksData
            .where((bank) =>
                bank['name'] != null &&
                bank['name']
                    .toString()
                    .toLowerCase()
                    .contains(searchKeyword?.toLowerCase() ?? ''))
            .toList();

        // Convert maps to Bank objects
        List<Course> banks = filteredBanks.map((bank) => Course.fromJson(bank)).toList();

        // Create a BankData instance using the named constructor
        SearchCourse bankData = SearchCourse(
          count: banks.length,
          data: banks,
          message: 'Fetched Successfully!',
        );

        // Return the BankData instance
        return bankData;
      } else {
        // Handle the case when the 'data' field is not in the expected format
        return SearchCourse(); // Adjust this based on your model
      }
    } else {
      print('deey');
      // Handle the case when the document doesn't exist
      return SearchCourse(); // Adjust this based on your model
    }
  } catch (e) {
    print('Error retrieving bank data: $e');
    throw e;
  }
}

}

