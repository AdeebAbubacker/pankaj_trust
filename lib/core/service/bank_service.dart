import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/search_bank/search_bank.dart';

class BankDropdownService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<BankData> getSearchBank({String? searchKeyword}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> document = await _firestore
          .collection('get_bank')
          .doc('kXZs6BZq5P10L8WLLpMk')
          .get();

      if (document.exists) {
        print('haaaai');

        dynamic banksData = document.data()?['data'];

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

          // Convert maps to Bank objects
          List<Bank> banks =
              filteredBanks.map((bank) => Bank.fromJson(bank)).toList();

          // Create a BankData instance using the named constructor
          BankData bankData = BankData(
            count: banks.length,
            data: banks,
            message: 'Fetched Successfully!',
          );

          // Return the BankData instance
          return bankData;
        } else {
          // Handle the case when the 'data' field is not in the expected format
          return BankData(); // Adjust this based on your model
        }
      } else {
        print('deey');
        // Handle the case when the document doesn't exist
        return BankData(); // Adjust this based on your model
      }
    } catch (e) {
      print('Error retrieving bank data: $e');
      throw e;
    }
  }
}




// class BankDropdownService {
//   final SupabaseClient _supabaseClient = Supabase.instance.client;

//   Future<BankData> getSearchBank({String? searchKeyword}) async {
//     final query = _supabaseClient.from('ref_banks').select();

//     if (searchKeyword != null && searchKeyword.isNotEmpty) {
//       query.filter('name', 'ilike', '%$searchKeyword%');
//     }

//     final response = await query.execute();
//     if (response.data == null || response.status != 200) {
//       print('Error fetching banks: ${response.data}');
//       throw Exception('Failed to fetch banks');
//     }

//     final List<Bank> data = response.data ?? [];
//     print(data.length);
//     if (data.isNotEmpty) {
//       // If there is data, return the first item as BankData
//       print('searched bank length ------------------ ${data.length}');
//       return BankData.fromJson(data[0] as Map<String, dynamic>);
//     } else {
//       print('nooooooooooooooooooooooooooooooo');
//       // If no data is found, return an empty BankData instance
//       return BankData();
//     }
//   }
// }