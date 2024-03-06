// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';
// import 'package:panakj_app/core/db/boxes/achievment_box.dart';
// import 'package:panakj_app/ui/view_model/acadmicdetails/academic_bloc.dart';

// class TrancateScreen extends StatefulWidget {
//   const TrancateScreen({super.key});

//   @override
//   State<TrancateScreen> createState() => _TrancateScreenState();
// }

// class _TrancateScreenState extends State<TrancateScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     Timer.periodic(Duration(seconds: 2), (timer) {
//       print(achievmentBox.length);
//       _printValuesWithKeys();
//     });

//     super.initState();
//   }

//   void _printValuesWithKeys() {
//     final box = Hive.box<AchievmentDB>('achievmentBox');
//     final List<int> keys = box.keys.cast<int>().toList();
//     for (int key in keys) {
//       final achievment = box.get(key);
//       if (achievment != null) {
//         print('ID: $key, Achievement: ${achievment.achievmentController}');
//         print('ID: $key, category: ${achievment.category}');
//         print('ID: $key, uploadfile: ${achievment.uploadfile}');
//       } else {
//         print('ID: $key, Achievement: No Achievement');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   final box = Hive.box<AchievmentDB>('achievmentBox');
//                   final List<int> keys = box.keys.cast<int>().toList();
//                   for (int key in keys) {
//                     final achievment = box.get(key);
//                     if (achievment != null) {
//                       print(
//                           'ID: $key, Achievement: ${achievment.achievmentController}');
//                       print('ID: $key, category: ${achievment.category}');
//                       print('ID: $key, uploadfile: ${achievment.uploadfile}');
//                       context.read<AcademicBloc>().add(
//                        AcademicEvent.postAchievmentInfo(
//                           student_id: key,
//                           title: achievment.category,
//                           description: achievment.achievmentController));
//                     } else {
//                       print('ID: $key, Achievement: No Achievement');
//                     }
//                   }

//                 },
//                 child: const Text('call api'))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/ui/view_model/field_verification/field_verification_bloc.dart';

class FieldVerificationScreen extends StatelessWidget {
  const FieldVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            ElevatedButton(onPressed: () async{
              context.read<FieldVerificationBloc>().add(FieldVerificationEvent.postfieldverification());
            }, child: const Text('post data'))
          ],
        ),
      ),
    );
  }
}
