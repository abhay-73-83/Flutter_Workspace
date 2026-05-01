import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload image to Firebase Storage and save URL to Firestore
  Future<String?> uploadImage(File imageFile) async {
    try {
      // 1. Create a unique file name using current timestamp
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      
      // 2. Create a reference to 'gallery_images' folder in Storage
      Reference ref = _storage.ref().child('gallery_images').child('$fileName.jpg');

      // 3. Upload the file to Firebase Storage
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      // 4. Get the download URL for the uploaded image
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // 5. Save the download URL and timestamp to Firestore database
      await _firestore.collection('gallery').add({
        'url': downloadUrl,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return downloadUrl; // Return the URL if successful
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  // Fetch images from Firestore in real-time
  // Returns a Stream that updates automatically when data changes
  Stream<QuerySnapshot> getImagesStream() {
    return _firestore
        .collection('gallery')
        .orderBy('createdAt', descending: true) // Newest images first
        .snapshots();
  }
  
  // Delete image from both Firestore and Storage
  Future<bool> deleteImage(String docId, String imageUrl) async {
    try {
      // 1. Delete the document from Firestore
      await _firestore.collection('gallery').doc(docId).delete();
      
      // 2. Create a reference from the image URL
      Reference ref = _storage.refFromURL(imageUrl);
      
      // 3. Delete the file from Storage
      await ref.delete();
      
      return true; // Success
    } catch (e) {
      print('Error deleting image: $e');
      return false; // Failure
    }
  }
}
