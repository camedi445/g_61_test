import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  final VoidCallback onBack;
  const CharacterDetailScreen({required this.character, required this.onBack, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back), 
                    onPressed: onBack,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Detalle del Personaje',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Imagen y nombvre con fondo
            Center(
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Hero(
                        tag: 'character-${character.id}',
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(character.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        character.name,
                        style: const TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Info en tarjetas individuales
            _buildInfoCard('Estado', character.status, 
              character.status.toLowerCase() == 'alive' ? Colors.green : 
              character.status.toLowerCase() == 'dead' ? Colors.red : Colors.grey),
            _buildInfoCard('Especie', character.species, Colors.purple),
            _buildInfoCard('Género', character.gender, Colors.blue),
            _buildInfoCard('Origen', character.origin, Colors.orange),
            _buildInfoCard('Ubicación', character.location, Colors.teal),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInfoCard(String title, String value, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getIconForTitle(title),
                color: color,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
  
  IconData _getIconForTitle(String title) {
    switch (title.toLowerCase()) {
      case 'estado': return Icons.favorite;
      case 'especie': return Icons.category;
      case 'género': return Icons.person;
      case 'origen': return Icons.public;
      case 'ubicación': return Icons.location_on;
      default: return Icons.info;
    }
  }
}
