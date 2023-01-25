// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  // final TodoModel data;
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  // Stream<List<TodoModel>> getData() async* {
  //   objectBox.getTodoModelCount() >= 1;

  //   yield objectBox.getAllUsingStream();
  // }

  TextEditingController titleController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  // bool isDone = false;
  bool addData() {
    TodoModel data = TodoModel.autoId(
      body: descriptionController.text,
      tittle: titleController.text,
      date: dateController.text,
    );
    objectBox.insertTodoModel(data);
    descriptionController.clear();
    titleController.clear();
    dateController.clear();
    Navigator.pop(context);
    return true;
  }

  // void handleTodoChange() {
  //   setState(() {
  //     isDone = !isDone;
  //   });
  // }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }

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
        // title: Text(
        //   "To-do",
        //   style: TextStyle(
        //       fontSize: 17,
        //       color: Color.fromARGB(255, 120, 148, 226),
        //       fontWeight: FontWeight.bold),
        // ),
        // centerTitle: true,
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              size: 25,
              color: Color.fromARGB(255, 120, 148, 226),
            )),
        actions: [
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                size: 25,
                color: Color.fromARGB(255, 120, 148, 226),
              )),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_rounded,
                size: 25,
                color: Color.fromARGB(255, 120, 148, 226),
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
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
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Color.fromARGB(255, 52, 79, 161),
                    // scrollable: true,
                    content: Container(
                      height: height * 0.25,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              keyboardType: TextInputType.text,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              controller: titleController,
                              maxLines: null,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter tittle";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Tittle",
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 120, 148, 226)),
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
                              textCapitalization: TextCapitalization.sentences,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              maxLines: null,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter description";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Description",
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 120, 148, 226)),
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
                              showCursor: false,
                              keyboardType: TextInputType.none,
                              maxLines: null,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please select date";
                                }
                              },
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.calendar_today_rounded,
                                    size: 25,
                                    color: Color.fromARGB(255, 120, 148, 226),
                                  ),
                                  hintText: "Select Date",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 120, 148, 226)),
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
                          descriptionController.clear();
                          titleController.clear();
                          dateController.clear();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            addData();
                          }
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        backgroundColor: Color.fromARGB(255, 234, 5, 255),
        splashColor: Colors.transparent,
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<List<TodoModel>>(
            stream: objectBox.getAllUsingStream(),
            builder: (BuildContext context,
                AsyncSnapshot<List<TodoModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 234, 5, 255),
                  ),
                );
              } else if (snapshot.hasData) {
                return ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: width * 0.05, top: height * 0.03),
                      child: Text(
                        "My Tasks",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          TodoModel screenData = snapshot.data![index];
                          return Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.05,
                                right: width * 0.05,
                                bottom: height * 0.02),
                            child: ListTile(
                              enableFeedback: true,
                              onLongPress: () {
                                HapticFeedback.vibrate();

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            Color.fromARGB(255, 52, 79, 161),
                                        title: Text("Confirm",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        content: Text(
                                            "Do you want to remove task?",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("cancel",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          TextButton(
                                              onPressed: () {
                                                objectBox.delete(
                                                    screenData.id as int);
                                                Navigator.pop(context);
                                              },
                                              child: Text("Confirm",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)))
                                        ],
                                      );
                                    });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              tileColor: Color.fromARGB(255, 4, 26, 85),
                              contentPadding: EdgeInsets.only(
                                left: width * 0.04,
                              ),
                              leading: Container(
                                margin: EdgeInsets.only(top: height * 0.01),
                                child: Icon(
                                  Icons.circle_outlined,
                                  size: 20,
                                  color: Color.fromARGB(255, 234, 5, 255),
                                ),
                              ),
                              title: Text(
                                screenData.tittle,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    decorationColor:
                                        Color.fromARGB(255, 234, 5, 255),
                                    // decoration: isDone
                                    //     ? null
                                    //     : TextDecoration.lineThrough,
                                    // decorationStyle: TextDecorationStyle.solid,
                                    color: Color.fromARGB(255, 125, 137, 167),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                screenData.date,
                                style: TextStyle(
                                    // decoration: TextDecoration.lineThrough,
                                    color: Color.fromARGB(255, 125, 137, 167),
                                    // fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                  data: screenData,
                                                )));
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                    color: Color.fromARGB(255, 234, 5, 255),
                                  )),
                            ),
                          );
                        }),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Icon(
                    Icons.error_outline_rounded,
                    size: 40,
                    color: Color.fromARGB(255, 234, 5, 255),
                  ),
                );
              }

              return Container();
            }),
      ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     actions: [
    //       TextButton(
    //           onPressed: () {
    //             Navigator.of(context).push(
    //                 MaterialPageRoute(builder: (context) => MainScreen()));
    //           },
    //           child: Text("Next"))
    //     ],
    //   ),
    //   body: FutureBuilder<List<TodoModel>>(
    //       future: getData(),
    //       builder:
    //           (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return Center(
    //             child: CircularProgressIndicator(
    //               color: Colors.green,
    //             ),
    //           );
    //         } else if (snapshot.hasData) {
    //           return ListView.builder(
    //               itemCount: snapshot.data!.length,
    //               shrinkWrap: true,
    //               physics: ScrollPhysics(),
    //               itemBuilder: (BuildContext context, index) {
    //                 TodoModel screenData = objectBox.getAlltodoModel()[index];
    //                 return InkWell(
    //                   onTap: () {
    //                     // objectBox.delete();
    //                   },
    //                   child: Container(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Container(
    //                           child: Text(screenData.tittle),
    //                         ),
    //                         Container(
    //                           child: Text(screenData.body),
    //                         ),
    //                         Container(
    //                           child: Text(screenData.date),
    //                         ),
    //                         Divider(
    //                           thickness: 2,
    //                           height: 2,
    //                           color: Colors.black,
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               });
    //         } else if (snapshot.hasError) {
    //           return Text("Error!!!!!!!!!");
    //         }
    //         return Container();
    //       }),
    // );
  }
}
