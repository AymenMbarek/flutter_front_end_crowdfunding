import 'package:flutter/material.dart';
import 'drawer_page.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with AutomaticKeepAliveClientMixin {
  int _currentBottomBarIndex = 0;
  bool _showBottomBar = false;

  final _tabs = [
    Center(child: Text('Bottom Tab 3')),
    Center(child: Text('Bottom Tab 2')),
  ];

  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  bool get wantKeepAlive => true;

  Widget _changeUpperTab(int upperTabIdx) {
    if (_showBottomBar) {
      return Scaffold(
        body: _tabs[_currentBottomBarIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentBottomBarIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.yellow,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentBottomBarIndex = index;
            });
          },
        ),
      );
    } else {
      if (upperTabIdx == 0) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: Image.asset(
                  'assets/img/logoo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Le Crowdfunding, c’est quoi ?',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Le crowdfunding est un mécanisme qui a pour objectif de collecter les apports financiers d’un grand nombre de particuliers au moyen d’une plateforme Internet. L’objectif de cette collecte est, sur GlobeDreamers, le financement de projets sur des voyages engagés.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '« Longue est la route par le précepte, courte et facile par l’exemple. »\n\nSénèque',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Mais GlobeDreamers ce n’est pas qu’un simple outil de financement participatif, c’est aussi un outil de sponsoring, de parrainage médiatique et associatif. Et enfin, c’est l’écosystème le plus complet pour réunir tous les éléments et partenaires nécessaires pour créer, financer et raconter son voyage engagé.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => YourCreateProjectPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                      ),
                      child: Text('Créé ton projet !'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => YourDetermineCagnottePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                      ),
                      child: Text('Détermine ta cagnotte !'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      } else if (upperTabIdx == 1) {
        return CategoriesListView(onOptionsButtonPressed: _handleOptionsButton, options: options);
      } else if (upperTabIdx == 2) {
        return _buildCommentCaFonctionneTab();
      } else {
        return Center(child: Text('Tab ' + upperTabIdx.toString()));
      }
    }
  }

 Widget _buildCommentCaFonctionneTab() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Crowdfunding: Comment Ça Marche',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'Que vous soyez un particulier, un groupe ou une association, Crowdfunding est le meilleur site pour lancer une cagnotte en ligne.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Image.asset(
            'assets/img/1.png', // Replace with the actual image path
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            'Démarrez votre cagnotte',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'Définissez l’objectif de votre cagnotte',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Racontez votre histoire',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Ajoutez une photo ou une vidéo',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'Partagez votre cagnotte avec votre famille et vos amis',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'Envoyez des e-mails',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Envoyez des SMS',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Partagez-la sur les réseaux sociaux',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'Gérez les dons',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'Acceptez des dons',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Remerciez les donateurs',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Retirez les fonds',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add logic for starting the crowdfunding here
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
            child: Text('Démarrer la cagnotte'),
          ),
        ],
      ),
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Crowdfunding Cagnotte',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 226, 113, 7),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  'Welcome',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Catégories',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Comment cela fonctionne',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _navigateToSearchPage(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print('Notification icon clicked');
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            _changeUpperTab(0),
            _changeUpperTab(1),
            _changeUpperTab(2),
          ],
        ),
        drawer: DrawerPage(),
      ),
    );
  }

  void _handleOptionsButton() {
    print('Options button clicked');
  }

  void _navigateToSearchPage(BuildContext context) {
    // Ajoutez ici la logique de navigation vers la page de recherche
  }
}

class CategoriesListView extends StatelessWidget {
  final VoidCallback? onOptionsButtonPressed;
  final List<String> options;

  CategoriesListView({this.onOptionsButtonPressed, required this.options});

  @override
  Widget build(BuildContext context) {
    List<CategoryItem> categories = [
      CategoryItem(
        'Santé',
        'assets/img/sante.png',
        'Des frais médicaux ? Créez une cagnotte ! Lancez une cagnotte et réglez de suite vos dépenses de santé.',
      ),
      CategoryItem(
        'Education',
        'assets/img/education.png',
        'Des études à financer ? Créez une cagnotte !Lancez une cagnotte pour régler rapidement des frais de scolarité.',
      ),
      CategoryItem(
        'Associations',
        'assets/img/associations.png',
        'Changez les choses grâce à une collecte de fonds au profit d\'une association à but non lucratif.',
      ),
      CategoryItem('Idée de Projet', 'assets/img/idee.png', 'Description pour les idées de projet'),
      CategoryItem('Animaux', 'assets/img/animaux.png', 'Découvrez les cagnottes dédiées aux animaux Faites un don ou lancez une cagnotte pour aider un proche.'),
    ];

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            categories[index].name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), // Adjust the font size as needed
          ),
          subtitle: Text(
            categories[index].description,
            style: TextStyle(fontSize: 14), // Adjust the font size as needed
          ),
          leading: CircleAvatar(
            radius: 40, // Adjust the radius to your preference
            backgroundImage: AssetImage(categories[index].imagePath),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YourCreateCagnottePage(category: categories[index])),
              );
            },
            style: ElevatedButton.styleFrom(primary: Colors.orange),
            child: Text('Demarrer ', style: TextStyle(fontSize: 10)), // Change 'Custom Text' to your desired text
          ),
          onTap: () {
            // Add logic when the user taps on a category
          },
        );
      },
    );
  }
}


class CategoryItem {
  final String name;
  final String imagePath;
  final String description;

  CategoryItem(this.name, this.imagePath, this.description);
}

class YourCreateProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Project'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 226, 113, 7),
      ),
      body: Center(
        child: Text('Your Create Project Page Content'),
      ),
    );
  }
}

class YourDetermineCagnottePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Determine Cagnotte'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 226, 113, 7),
      ),
      body: Center(
        child: Text('Your Determine Cagnotte Page Content'),
      ),
    );
  }
}

class YourCreateCagnottePage extends StatelessWidget {
  final CategoryItem category;

  YourCreateCagnottePage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer une cagnotte pour ${category.name}'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 226, 113, 7),
      ),
      body: Center(
        child: Text('Contenu de la page de création de cagnotte pour ${category.name}'),
      ),
    );
  }
}
