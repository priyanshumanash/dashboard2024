import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppHomePage(),
    );
  }
}

class MyAppHomePage extends StatefulWidget {
  @override
  _MyAppHomePageState createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  String? selectedRechargeBill;
  String? selectedValueAddedService;
  String? selectedOtherService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Green Header
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade800, Colors.blue.shade900],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  // Search bar with logo and notification icon
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.menu, color: Colors.white),
                            SizedBox(width: 8),
                          ],
                        ),
                        Icon(Icons.notifications, color: Colors.white),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Welcome message
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ready to explore!', style: TextStyle(color: Colors.white)),
                        SizedBox(height: 5),
                        Text('Hello, Priyanshu!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.verified, color: Colors.white),
                        SizedBox(width: 8),
                        Text("KYC Verified", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Recharge & Bill Section with Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recharge & Bill',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: selectedRechargeBill,
                    items: <String>['7488700486', '4454154545', 'BCPCL']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedRechargeBill = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildServiceGrid([
              _Service(icon: Icons.phone_android, label: 'Mobile'),
              _Service(icon: Icons.tv, label: 'DTH'),
              _Service(icon: Icons.phone, label: 'Postpaid'),
              _Service(icon: Icons.money, label: 'BBPS'),
              _Service(icon: Icons.credit_card, label: 'Credit Card P'),
            ]),
            const SizedBox(height: 20),
            // Value Added Services Section with Icons (Calendar and Calculator)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Value Added Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 15, color: Colors.black),
                      SizedBox(width: 8),
                      Icon(Icons.calculate, size: 15, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildServiceGrid([
              _Service(icon: Icons.card_giftcard, label: 'Gift Card BS'),
              _Service(icon: Icons.card_giftcard, label: 'Gift Card SF'),
              _Service(icon: Icons.person, label: 'Pancard'),
              _Service(icon: Icons.account_balance_wallet, label: 'E-Collection'),
              _Service(icon: Icons.flight, label: 'Flight'),
              _Service(icon: Icons.account_box, label: 'Axis SIP'),
              _Service(icon: Icons.bus_alert, label: 'Bus'),
            ]),
            const SizedBox(height: 20),
            // Other Services Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Other Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    ],
                  ),
                  Icon(Icons.arrow_drop_down, size: 20, color: Colors.black),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildServiceGrid([
              _Service(icon: Icons.request_page, label: 'Top-up Request'),
              _Service(icon: Icons.history, label: 'Top-up History'),
              _Service(icon: Icons.verified_user, label: 'KYC'),
              _Service(icon: Icons.stars, label: 'Commission'),
              _Service(icon: Icons.payment, label: 'Payment Gateway'),
              _Service(icon: Icons.description, label: 'Payment Page'),
              _Service(icon: Icons.link, label: 'Payment Link'),
              _Service(icon: Icons.check_box, label: 'Settlement'),
              _Service(icon: Icons.transform, label: 'Internal Transfer'),
              _Service(icon: Icons.point_of_sale, label: 'Offline POS'),
              _Service(icon: Icons.edit, label: 'Digital Signature'),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceGrid(List<_Service> services) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Column(
            children: [
              Icon(service.icon, size: 30, color: Colors.green),
              const SizedBox(height: 5),
              Text(service.label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
            ],
          );
        },
      ),
    );
  }
}

class _Service {
  final IconData icon;
  final String label;

  _Service({required this.icon, required this.label});
}
