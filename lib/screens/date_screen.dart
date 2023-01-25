// import 'package:flutter/material.dart';
// import 'package:flutter_holo_date_picker/date_time_formatter.dart';
// import 'package:intl/intl.dart';
// import 'package:todo_app/main.dart';
// import 'package:todo_app/models/todo_model.dart';

// class DateScreen extends StatefulWidget {
//   const DateScreen({super.key});

//   @override
//   State<DateScreen> createState() => _DateScreenState();
// }

// class _DateScreenState extends State<DateScreen> {
//   TextEditingController dateController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             TextFormField(
//               controller: dateController,
//               keyboardType: TextInputType.none,
//               decoration: InputDecoration(
//                   icon: Icon(
//                     Icons.calendar_today_rounded,
//                     color: Colors.blue,
//                     size: 25,
//                   ),
//                   labelText: "Select Date"),
//               onTap: () async {
//                 DateTime? pickDate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1970),
//                     lastDate: DateTime(2050));
//                 if (pickDate != null) {
//                   setState(() {
//                     dateController.text =
//                         DateFormat("dd-MM-yyyy").format(pickDate);
//                   });
//                 }
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
