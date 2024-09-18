import 'package:flutter/material.dart';

class ArchetypeDropdown extends StatelessWidget {
  final List<String> archetypes;
  final Function(String) onChanged;

  const ArchetypeDropdown(
      {super.key, required this.archetypes, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text("Select Archetype"),
      items: archetypes.map((String archetype) {
        return DropdownMenuItem<String>(
          value: archetype,
          child: Text(archetype),
        );
      }).toList(),
      onChanged: (value) {
        onChanged(value!);
      },
    );
  }
}
