import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/character_provider.dart';
import 'character_image.dart';
import 'character_info_section.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final character = Provider.of<CharacterProvider>(context).selectedCharacter;
    if (character == null) return const SizedBox.shrink();

    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF1F203C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Provider.of<CharacterProvider>(context, listen: false).clearSelectedCharacter(),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: isWideScreen
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CharacterImage(imageUrl: character.image),
                            const SizedBox(width: 30),
                            Expanded(child: CharacterInfoSection(character: character)),
                          ],
                        )
                      : Column(
                          children: [
                            CharacterImage(imageUrl: character.image),
                            const SizedBox(height: 20),
                            CharacterInfoSection(character: character),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
