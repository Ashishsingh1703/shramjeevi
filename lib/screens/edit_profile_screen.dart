import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController(text: "hgcjhkib");
  final TextEditingController ageController = TextEditingController(text: "35");
  final TextEditingController experienceController = TextEditingController(text: "10");
  final TextEditingController phoneController = TextEditingController(text: "7004102260");
  final TextEditingController addressController = TextEditingController(text: "Mumbai, Maharashtra");
  final TextEditingController wageController = TextEditingController(text: "650");

  String? selectedSkill;
  bool available = true;

  final List<String> skills = [
    "Construction Helper",
    "Mason",
    "Electrician",
    "Plumber",
    "Carpenter",
    "Welder",
    "Painter",
    "Security Guard",
    "Technician",
  ];

  @override
  void initState() {
    super.initState();
    selectedSkill = "Electrician"; // Default skill
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    experienceController.dispose();
    phoneController.dispose();
    addressController.dispose();
    wageController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    // Age validation: 18-65
    final age = int.tryParse(ageController.text);
    if (age == null || age < 18 || age > 65) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Age must be between 18 and 65"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    // Experience validation: less than 50 years
    final experience = int.tryParse(experienceController.text);
    if (experience == null || experience >= 50) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Experience must be less than 50 years"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    // Skill validation: must select one
    if (selectedSkill == null || selectedSkill!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a skill"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1C2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1525),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF16263F),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Personal Information",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _field("Full Name", nameController),
                  _field("Age", ageController, keyboard: TextInputType.number),
                  _field("Phone Number", phoneController,
                      keyboard: TextInputType.phone, readOnly: true),
                  _field("Address", addressController),
                  const SizedBox(height: 12),
                  const Text(
                    "Primary Skill *",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    dropdownColor: const Color(0xFF16263F),
                    value: selectedSkill,
                    icon: const Icon(Icons.arrow_drop_down_circle,
                        color: Color(0xFFFF8C32)),
                    items: skills
                        .map(
                          (skill) => DropdownMenuItem(
                            value: skill,
                            child: Text(
                              skill,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => setState(() => selectedSkill = value),
                    decoration: _inputDecoration("Select your skill"),
                  ),
                  const SizedBox(height: 12),
                  _field("Years of Experience", experienceController,
                      keyboard: TextInputType.number),
                  const SizedBox(height: 12),
                  _field("Expected Daily Wage (₹)", wageController,
                      keyboard: TextInputType.number),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF8C32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        if (_validateForm()) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Profile updated successfully"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    TextInputType keyboard = TextInputType.text,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label *",
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: keyboard,
            readOnly: readOnly,
            style: TextStyle(
              color: readOnly ? Colors.white60 : Colors.white,
              fontSize: 15,
            ),
            decoration: _inputDecoration("Enter $label"),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
      filled: true,
      fillColor: Colors.white.withOpacity(0.08),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: const Color(0xFFFF8C32).withOpacity(0.2),
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFFF8C32),
          width: 2,
        ),
      ),
    );
  }
}
