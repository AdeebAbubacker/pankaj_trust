import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panakj_app/core/model/event_gallery/event_gallery.dart';


class GalleryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<EventGallery> getGalleryData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('get_Event Gallery')
          .doc('eB09BZTOGDYZjg0G9WzS')
          .get();

      EventGallery eventGallery = EventGallery.fromJson(snapshot.data()!);
      return eventGallery;
    } catch (e) {
      print('Error retrieving gallery data: $e');
      throw e;
    }
  }
}
