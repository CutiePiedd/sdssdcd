import 'package:flutter/material.dart';
import 'package:bus_buddy2/screens/bus_seats_screen.dart'; // Adjust path if necessary
import 'package:bus_buddy2/widgets/custom_scaffold.dart'; // Import the CustomScaffold

class BusChoiceScreen extends StatelessWidget {
  const BusChoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const SizedBox(height: 20), // Adjust as needed
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Show 2 images per row
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildBusOption(
                    context, 'Bus 101', 'assets/images/bus_101.png'),
                _buildBusOption(
                    context, 'Bus 202', 'assets/images/bus_202.png'),
                _buildBusOption(
                    context, 'Bus 303', 'assets/images/bus_303.png'),
                _buildBusOption(
                    context, 'Bus 404', 'assets/images/bus_404.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusOption(
      BuildContext context, String busName, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigate to a seat availability screen
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BusSeatsScreen(busName: busName)),
        );
      },
      child: Card(
        elevation: 5.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 100.0, // Adjust image size
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10.0),
            Text(
              busName,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
