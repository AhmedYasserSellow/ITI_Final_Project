import 'package:flutter/material.dart';

String imageUrl = 'imageUrl';
String title = 'title';

List<Map<String, String>> data = [
  {
    imageUrl:
        'https://w7.pngwing.com/pngs/1008/186/png-transparent-gemstone-jewellery-diamond-logo-gemstone-gemstone-blue-angle-thumbnail.png',
    title: 'Jewellery',
  },
  {
    imageUrl: 'https://static.thenounproject.com/png/860317-200.png',
    title: 'Men Fashion',
  },
  {
    imageUrl:
        'https://e7.pngegg.com/pngimages/763/532/png-clipart-electronic-engineering-computer-icons-electronics-computer-software-electronic-arts-engineering-black-thumbnail.png',
    title: 'Electronics',
  },
  {
    imageUrl:
        'https://w7.pngwing.com/pngs/578/636/png-transparent-carpet-cleaning-furniture-couch-pet-cleaning-logo-furniture-couch-vacuum-cleaner-thumbnail.png',
    title: 'Furniture ',
  },
  {
    imageUrl:
        'https://www.freepnglogos.com/uploads/games-png/games-controller-game-icon-17.png',
    title: 'Games',
  },
  {
    imageUrl:
        'https://w7.pngwing.com/pngs/303/549/png-transparent-sport-logo-football-sports-logos-text-sport-logo.png',
    title: 'Sports'
  },
  {
    imageUrl:
        'https://e7.pngegg.com/pngimages/1019/620/png-clipart-electricity-computer-icons-electrical-wires-cable-ac-power-plugs-and-sockets-electric-power-conductive-miscellaneous-electrical-wires-cable.png',
    title: 'Electrical Devices'
  }
];

class CatogriesPage extends StatelessWidget {
  const CatogriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  )),
              child: ListTile(
                leading: Image.network(
                  data[index][imageUrl]!,
                  height: 50,
                  width: 50,
                ),
                title: Center(
                  child: Text(
                    data[index][title]!,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
