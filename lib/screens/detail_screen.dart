// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/models/todo_model.dart';

class DetailScreen extends StatefulWidget {
  final TodoModel data;
  const DetailScreen({super.key, required this.data});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.data.tittle;
    descriptionController.text = widget.data.body;
    dateController.text = widget.data.date;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 52, 79, 161),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 52, 79, 161),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Color.fromARGB(255, 52, 79, 161),
        elevation: 0,
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color.fromARGB(255, 234, 5, 255),
              size: 25,
            )),
        actions: [
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Form(
                        key: _formKey,
                        child: AlertDialog(
                          title: Text(
                            "Add Task",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Color.fromARGB(255, 52, 79, 161),
                          // scrollable: true,
                          content: Container(
                            height: height * 0.25,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextFormField(
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    keyboardType: TextInputType.text,
                                    controller: titleController,
                                    maxLines: null,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter tittle";
                                      }
                                    },
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    decoration: InputDecoration(

                                        // labelText: "Tittle",
                                        // labelStyle: TextStyle(
                                        //     color:
                                        //         Color.fromARGB(255, 120, 148, 226)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 120, 148, 226))),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 120, 148, 226)))),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: descriptionController,
                                    maxLines: null,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter description";
                                      }
                                    },
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    decoration: InputDecoration(
                                        // labelText: "Description",
                                        // labelStyle: TextStyle(
                                        //     color:
                                        //         Color.fromARGB(255, 120, 148, 226)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 120, 148, 226))),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 120, 148, 226)))),
                                  ),
                                  TextFormField(
                                    controller: dateController,
                                    keyboardType: TextInputType.none,
                                    maxLines: null,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please select date";
                                      }
                                    },
                                    showCursor: false,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.calendar_today_rounded,
                                          size: 25,
                                          color: Color.fromARGB(
                                              255, 120, 148, 226),
                                        ),
                                        hintText: "Select Date",
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 120, 148, 226)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 120, 148, 226))),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 120, 148, 226)))),
                                    onTap: () async {
                                      var pickDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1970),
                                          lastDate: DateTime(2050));

                                      if (pickDate != null) {
                                        setState(() {
                                          dateController.text =
                                              DateFormat("dd-MM-yyyy")
                                                  .format(pickDate);
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // descriptionController.clear();
                                // titleController.clear();
                                // dateController.clear();
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  TodoModel editData = TodoModel.autoId(
                                      body: descriptionController.text,
                                      tittle: titleController.text,
                                      date: dateController.text);
                                  objectBox.editTodo(
                                      editData, widget.data.id as int);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              icon: Icon(
                Icons.create_rounded,
                size: 25,
                color: Color.fromARGB(255, 234, 5, 255),
              ))
        ],
      ),
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width / 2,
                  margin: EdgeInsets.only(
                      left: width * 0.05,
                      // right: width * 0.05,
                      top: height * 0.03),
                  child: Text(
                    widget.data.tittle,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: width * 0.05,
                      // left: width * 0.05,
                      top: height * 0.03),
                  child: Text(
                    widget.data.date,
                    style: TextStyle(
                        // fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  right: width * 0.05, left: width * 0.05, top: height * 0.03),
              child: Text(
                widget.data.body,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
