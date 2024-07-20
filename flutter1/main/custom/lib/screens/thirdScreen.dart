import 'package:custom/constants/app_color.dart';
// import 'package:custom/constants/app_sizebox.dart';
import 'package:custom/constants/app_string.dart';
import 'package:custom/screens/fouthScreen.dart';
// import 'package:custom/screens/secondScreen.dart';
import 'package:flutter/material.dart';

class ThirdSceen extends StatefulWidget {
  const ThirdSceen({super.key});

  @override
  State<ThirdSceen> createState() => _ThirdSceenState();
}

String? selectedRole;
List<String> roles = [
  'Administator',
  'Securty Gurd',
  'cook',
  "IT Staff"
]; // Example roles
Map<String, bool> roleValues = {};

class _ThirdSceenState extends State<ThirdSceen> {
  String? selectedRole;
  bool isChecked = false;
  void initState() {
    super.initState();
    // Initialize role selection status
    for (String role in roles) {
      roleValues[role] = false;
    }
  }

  void _updateSelectedRole(String role) {
    setState(() {
      roleValues.updateAll((key, value) => value = false); // Deselect all roles
      roleValues[role] = true;
      // Select the chosen role
      selectedRole = role; // Update the selectedRole variable
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppString.welcome),
            Text(
              AppString.ownerName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // SizedBox(
            //   height: AppSizebox.top20pxsizebox,
            // ),
            Divider(
              color: const Color.fromARGB(255, 211, 211, 211),
              thickness: 1,
            ),
            Text(AppString.companyname,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            Text("Software Company"),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text("Chooce your role and get a start",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 202, 202, 202),
              thickness: 1,
            ),
            
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: roles.map((role) {
                return GestureDetector(
                  onTap: () {
                    _updateSelectedRole(role);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: roleValues[role],
                          onChanged: (bool? value) {
                            _updateSelectedRole(role);
                          },
                            // controlAffinity: ListTileControlAffinity.leading,
                        materialTapTargetSize: MaterialTapTargetSize
                            .shrinkWrap, // Optional, reduces tap target size
                        visualDensity: VisualDensity
                            .compact, // Optional, reduces checkbox size
                        side: BorderSide.none,
                       
                        activeColor: const Color.fromARGB(255, 22, 22, 22),
                        checkColor: Colors.white,
                        ),
                        Text(
                          role,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                ElevatedButton(
                  onPressed: () {
                    if (selectedRole != null) {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>FouthScreen()));
                      // Do something with the selected role
                      print('Selected Role: $selectedRole');
                    } else {
                      // Show an error message or handle the case when no role is selected
                      print('No role selected');
                    }
                  },
                  child: Text(
                    'Request Access',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical:
                            20), // Increase button size by adjusting padding
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 135,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppString.poweredby,
                    style: TextStyle(
                      fontSize: 14,
                    )),
                Text(AppString.companyname,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
