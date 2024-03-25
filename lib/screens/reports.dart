import 'package:flutter/material.dart';
import 'package:pccoe_hackathon/providers/model_data_provider.dart';
import 'package:pccoe_hackathon/screens/appointment.dart';
import 'package:pccoe_hackathon/screens/community.dart';
import 'package:provider/provider.dart';

class DownSyndromeReport extends StatelessWidget {
  static const routeName = '/report';
  @override
  Widget build(BuildContext context) {
    final dataProviderf = Provider.of<TFLiteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Down Syndrome Detection Report'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Examinee Information'),
              SizedBox(height: 8.0),
              _buildCustomText('Name', 'Sandra Doe'),
              _buildCustomText('Age', '30'),
              _buildCustomText('Gender', 'Female'),
              _buildCustomText('Weight', '70 kg'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Test Performed'),
              SizedBox(height: 8.0),
              _buildInfoText('Second Trimester Combined Screening'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Ultrasound Image(s)'),
              SizedBox(height: 8.0),
              // Placeholder for ultrasound images
              Container(
                height: 200,
                decoration: BoxDecoration(
                    // color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(dataProviderf.image!))),
                // child: Center(
                //   child: Text('Ultrasound Image(s)'),
                // ),
              ),
              SizedBox(height: 20.0),
              _buildSectionTitle('Findings of the Test'),
              SizedBox(height: 8.0),
              _buildInfoText(
                  '- Nuchel Translucency (NT) measurement: Increased'),
              _buildInfoText('- Absent cernial bone: Present'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Risk Level'),
              SizedBox(height: 8.0),
              _buildCustomText('Risk Level', 'High'),
              SizedBox(height: 4.0),
              _buildInfoText(
                  'Comments: The patient has multiple markers associated with Down syndrome.'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Symptoms'),
              SizedBox(height: 8.0),
              _buildInfoText(
                  '-  Enlargement of the lateral ventricles in the fetal brain - Ventriculomegaly'),
              _buildInfoText(
                  '- Underdevelopment or smaller size of the cerebellum - Cerebellar Hypoplasmia'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Further Advice'),
              SizedBox(height: 8.0),
              _buildInfoText(
                  'Consult with a genetic counselor for further evaluation.'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Conclusion of Report'),
              SizedBox(height: 8.0),
              _buildCustomText('Conclusion', 'Down Syndrome Detected'),
              SizedBox(height: 4.0),
              _buildInfoText(
                'Probabilities: The patient has a high likelihood of having a baby with Down syndrome.',
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Appointment(),
                  ));
                },
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Book an Appointment",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DoctorCommunityPage(),
          ));
        },
        child: Container(
          width: 150,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.health_and_safety),
                Text(
                  "Ask Commun..",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildCustomText(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label + ':',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
    );
  }
}
