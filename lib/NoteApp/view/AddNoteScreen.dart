import '../api/NoteAPIService.dart';
import '../model/Note.dart';
import 'NoteForm.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteForm(
      onSave: (Note note) async {
        try {
          await NoteAPIService.instance.createNote(note);
          Navigator.pop(context, note); // Return the created note
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Thêm ghi chú thành công'),
              backgroundColor: Colors.green,
            ),
          );
        } catch (e) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi khi thêm ghi chú: $e'),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context, null); // Return null to indicate failure
        }
      },
    );
  }
}