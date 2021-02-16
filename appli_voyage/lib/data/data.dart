import '../models/activity_model.dart';
import '../models/city_model.dart';

List<CityModel> cities = [
  CityModel(
    name: 'Paris',
    image: 'assets/images/Paris.jpg',
    activities: [
      Activity(
        image: 'assets/images/activities/Louvre.jpg',
        name: 'Le Louvre',
        id: 'a1',
        city: 'Paris',
        price: 12.00,
      ),
      Activity(
        image: 'assets/images/activities/Chaumont.jpg',
        name: 'Les buttes Chaumont',
        id: 'a2',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/Notre-Dame.jpg',
        name: 'Notre Dame',
        id: 'a3',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/Defense.jpg',
        name: 'La Défense',
        id: 'a4',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/Tour-Eiffel.jpg',
        name: 'Tour eiffel',
        id: 'a5',
        city: 'Paris',
        price: 15.00,
      ),
      Activity(
          image: 'assets/images/activities/ChampElyse.jpg',
          name: 'Les Champs Elysés',
          id: 'a6',
          city: 'Paris',
          price: 0.00),
      Activity(
        image: 'assets/images/activities/Catacombe.jpg',
        name: 'les Catacombes',
        id: 'a7',
        city: 'Paris',
        price: 12.00,
      ),
    ],
  ),
  CityModel(
    name: 'Lyon',
    image: 'assets/images/Lyon.jpg',
    activities: [
      Activity(
        image: 'assets/images/activities/BeauArt.jpg',
        name: 'Musée des beaux Art',
        id: 'a8',
        city: 'Lyon',
        price: 25.00,
      ),
      Activity(
        image: 'assets/images/activities/Bellecour.jpg',
        name: 'Place Bellecour',
        id: 'a9',
        city: 'Lyon',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/TeteDor.jpg',
        name: 'Parc de la tête d\'or',
        id: 'a10',
        city: 'Lyon',
        price: 0.00,
      ),
    ],
  ),
  CityModel(
    name: 'Lille',
    image: 'assets/images/Lille.jpg',
    activities: [
      Activity(
        image: 'assets/images/activities/ZooLille.jpg',
        name: 'Zoo de Lille',
        id: 'a11',
        city: 'Lille',
        price: 25.00,
      ),
      Activity(
        image: 'assets/images/activities/Citadelle.jpg',
        name: 'Citadelle',
        id: 'a12',
        city: 'Lille',
        price: 15.00,
      ),
      Activity(
        image: 'assets/images/activities/BeauArtLille.jpg',
        name: 'Palais des Beaux Arts',
        id: 'a13',
        city: 'Lille',
        price: 25.00,
      ),
    ],
  ),
];
