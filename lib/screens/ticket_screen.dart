import 'package:flutter/material.dart';
import 'package:bus_buddy2/widgets/custom_scaffold.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Image.asset(
              'assets/images/logo_white2.png',
              height: 50.0,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20.0),
          const Center(
            child: Text(
              'Select Your Destination',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'GabrielSans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildTicket(
                  'Dagupan',
                  'Quezon City, Manila',
                  'Bus No: 101',
                  'Seat No: 12A',
                  'Date: 2024-10-01',
                  'Price: PHP 1200',
                  'Regular Aircon',
                  context,
                ),
                _buildTicket(
                  'Dagupan',
                  'Quezon City, Manila',
                  'Bus No: 101',
                  'Seat No: 12A',
                  'Date: 2024-10-01',
                  'Price: PHP 1200',
                  'Regular Aircon',
                  context,
                ),
                _buildTicket(
                  'Dagupan',
                  'Quezon City, Manila',
                  'Bus No: 101',
                  'Seat No: 12A',
                  'Date: 2024-10-01',
                  'Price: PHP 1200',
                  'Regular Aircon',
                  context,
                ),
                _buildTicket(
                  'Dagupan',
                  'Quezon City, Manila',
                  'Bus No: 101',
                  'Seat No: 12A',
                  'Date: 2024-10-01',
                  'Price: PHP 1200',
                  'Regular Aircon',
                  context,
                ),
                _buildTicket(
                  'Dagupan',
                  'Quezon City, Manila',
                  'Bus No: 101',
                  'Seat No: 12A',
                  'Date: 2024-10-01',
                  'Price: PHP 1200',
                  'Regular Aircon',
                  context,
                ),
                _buildTicket(
                  'Dagupan',
                  'Quezon City, Manila',
                  'Bus No: 101',
                  'Seat No: 12A',
                  'Date: 2024-10-01',
                  'Price: PHP 1200',
                  'Regular Aircon',
                  context,
                ),
                _buildTicket(
                  'Dagupan',
                  'Quezon City, Manila',
                  'Bus No: 101',
                  'Seat No: 12A',
                  'Date: 2024-10-01',
                  'Price: PHP 1200',
                  'Regular Aircon',
                  context,
                ),
                // Add more tickets here if needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicket(
    String origin,
    String destination,
    String busNo,
    String seatNo,
    String date,
    String price,
    String busType,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () => _showSeatSelectionBottomSheet(
          context, origin, destination, busNo, seatNo, date, price, busType),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  origin,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4.0),
                const Icon(
                  Icons.arrow_forward,
                  size: 25,
                ),
                const SizedBox(width: 4.0),
                Text(
                  destination,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              thickness: 3,
            ),
            const SizedBox(height: 4.0),
            _buildTwoColumnRow('Bus No.', busNo, 'Departure', '5:00 A.M.'),
            const SizedBox(height: 8.0),
            _buildTwoColumnRow('Service Class', '2', 'Trip Hours', '5 Hours'),
            const SizedBox(height: 8.0),
            _buildTwoColumnRow(
                'Terminal', 'Dagupan, Pangasinan', 'Base Fare', price),
            const SizedBox(height: 8.0),
            _buildTwoColumnRow('Destination', destination),
          ],
        ),
      ),
    );
  }

  void _showSeatSelectionBottomSheet(
      BuildContext context,
      String origin,
      String destination,
      String busNo,
      String seatNo,
      String date,
      String price,
      String busType) {
    int selectedSeats = 1; // Default selected seats
    const double baseFare = 498.00; // Fixed base fare

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                  bottom: Radius.circular(16.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align content to the left
                children: [
                  // First Row: Number of Seats and Base Fare
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Number of Seats
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Number of Seats',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'GabrielSans',
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  if (selectedSeats > 1) {
                                    setState(() {
                                      selectedSeats--;
                                    });
                                  }
                                },
                              ),
                              Text(
                                '$selectedSeats',
                                style: const TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    selectedSeats++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Base Fare (Previously Total Fare)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Base Fare',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'GabrielSans',
                            ),
                          ),
                          Text(
                            'PHP $baseFare',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16.0),

                  // Second Row: Total Fare aligned to the left (Previously Base Fare)
                  Align(
                    alignment: Alignment.centerLeft, // Align to the left
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Fare',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GabrielSans',
                          ),
                        ),
                        Text(
                          'PHP ${selectedSeats * baseFare}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First button (Back)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Go back to ticket list
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 12.0,
                          ),
                          backgroundColor: const Color.fromARGB(
                              217, 168, 167, 167), // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'GabrielSans',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),

                      // Second button (Continue)
                      ElevatedButton(
                        onPressed: () {
                          // Close the current bottom sheet (seat selection)
                          Navigator.pop(context);

                          // Show the confirmation bottom sheet
                          _showConfirmationBottomSheet(
                            context,
                            origin,
                            destination,
                            busNo,
                            seatNo,
                            date,
                            price,
                            selectedSeats,
                            baseFare,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 12.0,
                          ),
                          backgroundColor: const Color.fromARGB(
                              212, 2, 28, 88), // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'GabrielSans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showConfirmationBottomSheet(
      BuildContext context,
      String origin,
      String destination,
      String busNo,
      String seatNo,
      String date,
      String price,
      int selectedSeats,
      double baseFare) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 20.0), // Add left and right margin
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0), bottom: Radius.circular(16.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    origin,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  const Icon(
                    Icons.arrow_forward,
                    size: 25,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    destination,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 3,
              ),
              const SizedBox(height: 16.0),
              _buildTwoColumnRow('Bus No.', busNo, 'Seat No.', seatNo),
              const SizedBox(height: 8.0),
              _buildTwoColumnRow('Date', date),
              const SizedBox(height: 8.0),
              _buildTwoColumnRow('Service Class', 'Regular Aircon'),
              const Divider(
                color: Colors.black,
                thickness: 3,
              ),
              const SizedBox(height: 8.0),
              _buildTwoColumnRow('Selected Seats', '$selectedSeats'),
              _buildTwoColumnRow(
                  'Total Fare', 'PHP ${selectedSeats * baseFare}'),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle confirmation logic here
                    Navigator.pop(context); // Close the confirmation sheet
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(212, 2, 28, 88),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'GabrielSans',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTwoColumnRow(String term1, String definition1,
      [String? term2, String? definition2]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                term1,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                definition1,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 18, 86, 117),
                ),
              ),
            ],
          ),
        ),
        if (term2 != null && definition2 != null)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  term2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  definition2,
                  style: const TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 18, 86, 117)),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
