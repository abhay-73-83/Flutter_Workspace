import 'package:flutter/material.dart';

class Task3 extends StatefulWidget {
  const Task3({super.key});

  @override
  State<Task3> createState() => _Task3State();
}

class _Task3State extends State<Task3> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedRating;
  bool _service = false;
  bool _quality = false;
  bool _support = false;

  final TextEditingController _commentsController = TextEditingController();

  final List<String> _ratings = [
    "Excellent",
    "Good",
    "Average",
    "Poor",
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!_service && !_quality && !_support) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select at least one feedback category")),
        );
        return;
      }

      // Collect form data
      Map<String, dynamic> feedbackData = {
        "rating": _selectedRating,
        "service": _service,
        "quality": _quality,
        "support": _support,
        "comments": _commentsController.text.trim(),
      };

      print(feedbackData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Feedback Submitted Successfully")),
      );

      _formKey.currentState!.reset();
      setState(() {
        _selectedRating = null;
        _service = false;
        _quality = false;
        _support = false;
        _commentsController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback Form")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Dropdown Rating
              Text("Rate Our Service"),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedRating,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: _ratings
                    .map((rating) => DropdownMenuItem(
                  value: rating,
                  child: Text(rating),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRating = value;
                  });
                },
                validator: (value) =>
                value == null ? "Please select a rating" : null,
              ),

              SizedBox(height: 20),

              // Checkboxes
              Text("What would you like to give feedback on?"),
              CheckboxListTile(
                title: Text("Service"),
                value: _service,
                onChanged: (value) {
                  setState(() {
                    _service = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Product Quality"),
                value: _quality,
                onChanged: (value) {
                  setState(() {
                    _quality = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Customer Support"),
                value: _support,
                onChanged: (value) {
                  setState(() {
                    _support = value!;
                  });
                },
              ),

              SizedBox(height: 20),

              // Comments Field
              Text("Additional Comments"),
              SizedBox(height: 8),
              TextFormField(
                controller: _commentsController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Write your feedback here...",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your comments";
                  }
                  if (value.trim().length < 10) {
                    return "Comment must be at least 10 characters";
                  }
                  return null;
                },
              ),

              SizedBox(height: 24),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text("Submit Feedback"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
