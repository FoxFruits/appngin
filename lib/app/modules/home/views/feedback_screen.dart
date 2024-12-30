import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  final List<Map<String, String>> feedbackList = [
    {
      "image": "assets/images/image_6.png", 
      "critique": "Kamar nya sangat nyaman apalagi yang ada AC nya bikin nagih !!",
      "suggestion": "Tambahin dong bandwidth wifi nya biar download game bisa cepet >.>"
    },
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA52A2A),
        title: Text("Kritik Dan Saran", style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: feedbackList.length,
        itemBuilder: (context, index) {
          final feedback = feedbackList[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Column(
                children: [
                  Image.asset(feedback["image"]!), // Image asset path
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kritik :",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(height: 5),
                        Text(feedback["critique"]!), // Correct key used here
                        SizedBox(height: 10),
                        Text(
                          "Saran :",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(height: 5),
                        Text(feedback["suggestion"]!), // Correct key used here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
