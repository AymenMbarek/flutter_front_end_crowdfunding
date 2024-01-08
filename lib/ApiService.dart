import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw HttpException('Erreur de chargement des données : ${response.statusCode}');
    }
  }

  Future<List<Map<String, dynamic>>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      // Convertit la liste JSON en une liste de Map<String, dynamic>
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Map<String, dynamic>> listOfMaps = jsonResponse.cast<Map<String, dynamic>>();
      return listOfMaps;
    } else {
      throw Exception('Erreur de chargement des données');
    }
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, String> body) async {
    final response = await http.post(Uri.parse('$baseUrl/$endpoint'), body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw HttpException('Erreur de connexion : ${response.statusCode}');
    }
  }

Future<void> createCagnotte(
  String title,
  String description,
  double amount,
  String photoUrlCagnotte,
  DateTime dataCreationCagnotte,
  int idUtilisateurCagnotte,
  int idCategoriesCagnotte,
) async {
  final response = await http.post(
    Uri.parse('$baseUrl/api/cagnotte'),  // Utilisez l'URL principale avec la route '/api/cagnotte'
    headers: {
      'Content-Type': 'application/json',  // Ajoutez l'en-tête Content-Type
    },
    body: jsonEncode({
      'nom': title,
      'description': description,
      'prix': amount,
      'photo_url': photoUrlCagnotte,
      'data_de_creation': dataCreationCagnotte.toIso8601String(),
      'idutilisateur': idUtilisateurCagnotte,
      'idcategories': idCategoriesCagnotte,
    }),
  );

  if (response.statusCode != 200) {
    throw HttpException('Erreur lors de la création de la cagnotte : ${response.statusCode}');
  }
}
Future<void> createPaiement(double montant, String description, String numero_carte, int idCagnotte) async {
  final response = await http.post(
    Uri.parse('$baseUrl/api/paiement'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'montant': montant,
      'description': description,
      'numero_carte': numero_carte,
      'idcagnotte': idCagnotte,
    }),
  );

  if (response.statusCode != 200) {
    throw HttpException('Erreur lors de la création du paiement : ${response.statusCode}');
  }
}
Future<void> inscrireUtilisateur(String cin, String Nom, String prenom, String mot_de_passe) async {
  final Uri uri = Uri.parse('$baseUrl/api/utilisateur');

  final response = await http.post(
    uri,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'cin': cin,
      'Nom': Nom,
      'prenom': prenom,
      'mot_de_passe': mot_de_passe,
    }),
  );

  if (response.statusCode == 200) {
    // Inscription réussie
    print('Inscription réussie');
    // Ajouter ici la logique pour afficher un message de succès
  } else {
    // Erreur lors de l'inscription
    print('Erreur lors de l\'inscription');
    // Ajouter ici la logique pour afficher un message d'erreur
  }
}
Future<void> connecterUtilisateur(String cin, String motDePasse) async {
  final Uri uri = Uri.parse('$baseUrl/api/utilisateur?cin=$cin&motDePasse=$motDePasse');

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // Convertir la réponse JSON en une liste d'utilisateurs
    List<dynamic> utilisateurs = jsonDecode(response.body);

    // Vérifier si la liste d'utilisateurs n'est pas vide
    if (utilisateurs.isNotEmpty) {
      // Parcourir la liste d'utilisateurs pour trouver une correspondance
      bool connexionReussie = false;
      for (var utilisateur in utilisateurs) {
        if (utilisateur['cin'] == cin && utilisateur['mot_de_passe'] == motDePasse) {
          // Connexion réussie
          connexionReussie = true;
          break;
        }
      }

      if (connexionReussie) {
        print('Connexion réussie');
        // Ajouter ici la logique pour gérer la réussite de la connexion
      } else {
        // Les informations de connexion ne correspondent à aucun utilisateur
        print('Les informations de connexion ne correspondent à aucun utilisateur');
        // Ajouter ici la logique pour gérer l'échec de connexion
      }
    } else {
      // Aucun utilisateur trouvé avec les informations fournies
      print('Aucun utilisateur trouvé avec les informations fournies');
      // Ajouter ici la logique pour gérer l'échec de connexion
    }
  } else {
    // Connexion échouée
    print('Erreur de connexion');
    // Ajouter ici la logique pour gérer l'échec de connexion
  }
}



  Future<void> createCategories(String name) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/categories'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'nom': name,
      }),
    );

    if (response.statusCode != 200) {
      throw HttpException('Erreur lors de la création de la catégorie : ${response.statusCode}');
    }
  }
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() => message;
}
