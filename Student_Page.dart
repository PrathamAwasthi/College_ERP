import 'dart:async';
import 'dart:io';
import 'package:college_erp/Home_Povider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'UX.dart';

class StudentPage extends StatefulWidget{
  College? ob;
  StudentPage(this.ob);
  State<StatefulWidget> createState(){
    return StudentPageState(ob);
  }
}

class StudentPageState extends State<StudentPage>{
  College? ob;
  File? image;
  final pick_image =ImagePicker();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController mobile = TextEditingController();
  State_Provider? pro;

  StudentPageState(this.ob);


  Future getImager(State_Provider provider) async{
    final picked_image = await pick_image.pickImage(source: ImageSource.gallery);
    if(picked_image!=null){
      image = File(picked_image.path);
      provider.change_State();
    }
  }

  Widget build(BuildContext context){
    var size = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("Student List"),
        backgroundColor: Color(0xffffa64d),
        toolbarHeight: size.size.height*0.12,
      ),
      body: ListView.builder(
              itemCount: ob!.student_List.length,
              itemBuilder: (context,int index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing:IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>edit_Student_Detail(context, index)));
                    },
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>student_Detail(context,index)));
                  },
                );
              },
            ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(size.size.height*0.02),
        child: FloatingActionButton(
          child: Icon(Icons.person_add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>add_Student(context,)));
          },
        ),
      ),
    );
  }

  Widget add_Student(BuildContext context){
    var size = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                ChangeNotifierProvider<State_Provider>(
                    create:(context)=>State_Provider(),
                    child:Consumer<State_Provider>(
                      builder: (context,provider,child){
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                          child: InkWell(
                            child: CircleAvatar(
                              radius: size.size.width*0.15,
                              backgroundImage:image!=null?FileImage(image!):NetworkImage(''),
                            ),
                            onTap: (){
                              getImager(provider);
                            },
                          ),
                        );
                    },
                    ),
                ),
                Text("Select Student Image*"),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height*0.04, 0, 0),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: "Student Name*",
                      labelStyle: TextStyle(fontSize: size.size.width*0.05),
                      filled: true,
                      fillColor: Color(0xffe6ffe6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffff8080),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                  child: TextField(
                    controller: address,
                    decoration: InputDecoration(
                      labelText: "Address*",
                      labelStyle: TextStyle(fontSize: size.size.width*0.05),
                      filled: true,
                      fillColor: Color(0xffe6ffe6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffff8080),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                  child: TextField(
                    controller: id,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "ID*",
                      labelStyle: TextStyle(fontSize: size.size.width*0.05),
                      filled: true,
                      fillColor: Color(0xffe6ffe6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffff8080),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                  child: Text("Select Course*",style: TextStyle(fontSize: size.size.width*0.05),),
                ),
                ChangeNotifierProvider<State_Provider>(
                  create: (context)=>State_Provider(),
                  child: Consumer<State_Provider>(
                    builder: (context,provider,child){
                      pro=provider;
                      return Padding(
                          padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                          child:Row(
                            children: [
                              IndexedStack(
                                index:provider.bca,
                                children: [
                                  InkWell(
                                    child: SizedBox(
                                      child: Card(
                                        color: Colors.grey,
                                        child: Center(child: Text("BCA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.white),)),
                                      ),
                                      height: size.size.height*0.07,
                                      width: size.size.width*0.25,
                                    ),
                                    onTap: (){
                                      provider.bca=1;
                                      provider.bba=0;
                                      provider.mca=0;
                                      provider.mba=0;
                                      provider.change_State();
                                    },
                                  ),
                                  InkWell(
                                    child: SizedBox(
                                      child: Card(
                                        color: Colors.cyanAccent,
                                        child: Center(child: Text("BCA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.deepOrange),)),
                                      ),
                                      height: size.size.height*0.07,
                                      width: size.size.width*0.25,
                                    ),
                                    onTap: (){
                                      provider.bca=0;
                                      provider.bba=0;
                                      provider.mca=0;
                                      provider.mba=0;
                                      provider.change_State();
                                    },
                                  ),
                                ],
                              ),
                              IndexedStack(
                                index: provider.bba,
                                children: [
                                  InkWell(
                                    child: SizedBox(
                                      child: Card(
                                        color: Colors.grey,
                                        child: Center(child: Text("BBA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.white),)),
                                      ),
                                      height: size.size.height*0.07,
                                      width: size.size.width*0.25,
                                    ),
                                    onTap: (){
                                      provider.bca=0;
                                      provider.bba=1;
                                      provider.mca=0;
                                      provider.mba=0;
                                      provider.change_State();
                                    },
                                  ),
                                  InkWell(
                                    child: SizedBox(
                                      child: Card(
                                        color: Colors.cyanAccent,
                                        child: Center(child: Text("BBA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.deepOrange),)),
                                      ),
                                      height: size.size.height*0.07,
                                      width: size.size.width*0.25,
                                    ),
                                    onTap: (){
                                      provider.bca=0;
                                      provider.bba=0;
                                      provider.mca=0;
                                      provider.mba=0;
                                      provider.change_State();
                                    },
                                  ),
                                ],
                              ),
                              IndexedStack(
                                index: provider.mca,
                                children: [
                                  InkWell(
                                    child: SizedBox(
                                      child: Card(
                                        color: Colors.grey,
                                        child: Center(child: Text("MCA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.white),)),
                                      ),
                                      height: size.size.height*0.07,
                                      width: size.size.width*0.25,
                                    ),
                                    onTap: (){
                                      provider.bca=0;
                                      provider.bba=0;
                                      provider.mca=1;
                                      provider.mba=0;
                                      provider.change_State();
                                    },
                                  ),
                                  InkWell(
                                    child: SizedBox(
                                      child: Card(
                                        color: Colors.cyanAccent,
                                        child: Center(child: Text("MCA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.deepOrange),)),
                                      ),
                                      height: size.size.height*0.07,
                                      width: size.size.width*0.25,
                                    ),
                                    onTap: (){
                                      provider.bca=0;
                                      provider.bba=0;
                                      provider.mca=0;
                                      provider.mba=0;
                                      provider.change_State();
                                    },
                                  ),
                                ],
                              ),
                              IndexedStack(
                                index: provider.mba,
                                children: [
                                  InkWell(
                                    child: SizedBox(
                                      child: Card(
                                        color: Colors.grey,
                                        child: Center(child: Text("MBA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.white),)),
                                      ),
                                      height: size.size.height*0.07,
                                      width: size.size.width*0.25,
                                    ),
                                    onTap: (){
                                      provider.bca=0;
                                      provider.bba=0;
                                      provider.mca=0;
                                      provider.mba=1;
                                      provider.change_State();
                                    },
                                  ),
                                  InkWell(
                                    child: SizedBox(
                                      child: Card(
                                        color: Colors.cyanAccent,
                                        child: Center(child: Text("MBA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.deepOrange),)),
                                      ),
                                      height: size.size.height*0.07,
                                      width: size.size.width*0.25,
                                    ),
                                    onTap: (){
                                      provider.bca=0;
                                      provider.bba=0;
                                      provider.mca=0;
                                      provider.mba=0;
                                      provider.change_State();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                  child: TextField(
                    controller: mobile,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Mobile No.*",
                      labelStyle: TextStyle(fontSize: size.size.width*0.05),
                      filled: true,
                      fillColor: Color(0xffe6ffe6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffff8080),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: size.size.height*0.05,
                        width: size.size.width*0.25,
                        child: ElevatedButton(
                          child: Text("Cancel",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          onPressed: (){
                            name = TextEditingController();
                            address = TextEditingController();
                            id = TextEditingController();
                            mobile = TextEditingController();
                            image=null;
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.size.height*0.05,
                        width: size.size.width*0.25,
                        child: ElevatedButton(
                          child: Text("Ok",style: TextStyle(fontSize: size.size.width*0.045,color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          onPressed: (){
                            String nm = name.text.trim().toString();
                            String ad = address.text.trim().toString();
                            String i = id.text.trim().toString();
                            String mo = mobile.text.trim().toString();
                            String? course;

                            if(nm==""||ad==""||i==""||mo==""||image==null||pro!.bca==0&&pro!.bba==0&&pro!.mca==0&&pro!.mba==0){
                              return;
                            }
                            if(pro!.bca==1){
                              course="BCA";
                            }else if(pro!.bba==1){
                              course="BBA";
                            }else if(pro!.mca==1){
                              course="MCA";
                            }else if(pro!.mba==1){
                              course="MBA";
                            }

                            Student obj = new Student(nm, ad, i, mo, course, image);
                            ob!.student_List.add(obj);
                            name = TextEditingController();
                            address = TextEditingController();
                            id = TextEditingController();
                            mobile = TextEditingController();
                            image=null;
                            pro=null;
                            setState(() {
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget student_Detail(BuildContext context,int i){
    var size = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(0, size.size.height*0.08, 0, 0),
                  child: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[i].student_Image!),
                    radius: size.size.height*0.08,
                  ),
                ),
                Divider(height: 0,),
                Container(
                  color: Colors.white,
                  height: size.size.height*0.1,
                  width: size.size.width*1,
                  child: Row(
                    children: [
                      Text(" Student Name :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.student_List[i].name!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                    ],
                  ),
                ),
                Divider(height: 0,),
                Container(
                  color: Colors.white,
                  height: size.size.height*0.1,
                  width: size.size.width*1,
                  child: Row(
                    children: [
                      Text(" Address :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.student_List[i].address!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                    ],
                  ),
                ),
                Divider(height: 0,),
                Container(
                  color: Colors.white,
                  height: size.size.height*0.1,
                  width: size.size.width*1,
                  child: Row(
                    children: [
                      Text(" College ID :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.student_List[i].id!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                    ],
                  ),
                ),
                Divider(height: 0,),
                Container(
                  color: Colors.white,
                  height: size.size.height*0.1,
                  width: size.size.width*1,
                  child: Row(
                    children: [
                      Text(" Course :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.student_List[i].course!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                    ],
                  ),
                ),
                Divider(height: 0,),
                Container(
                  color: Colors.white,
                  height: size.size.height*0.1,
                  width: size.size.width*1,
                  child: Row(
                    children: [
                      Text(" Mobile No. :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.student_List[i].mobile!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                    ],
                  ),
                ),
                Divider(height: 0,),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                  child: SizedBox(
                    height: size.size.height*0.06,
                    width: size.size.width*0.3,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back,color: Colors.white,),
                          Text("Back",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffe6ffff),
    );
  }

  Widget edit_Student_Detail(BuildContext,int i){
  var size = MediaQuery.of(context);
  name.text = ob!.student_List[i].name!;
  address.text = ob!.student_List[i].address!;
  id.text = ob!.student_List[i].id!;
  mobile.text = ob!.student_List[i].mobile!;
  image = ob!.student_List[i].student_Image!;

  return Scaffold(
    body: SafeArea(
      child: ListView(
        children: [
          Column(
            children: [
              ChangeNotifierProvider<State_Provider>(
                create:(context)=>State_Provider(),
                child:Consumer<State_Provider>(
                  builder: (context,provider,child){
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: InkWell(
                        child: CircleAvatar(
                          radius: size.size.width*0.15,
                          backgroundImage:image!=null?FileImage(image!):NetworkImage(''),
                        ),
                        onTap: (){
                          getImager(provider);
                        },
                      ),
                    );
                  },
                ),
              ),
              Text("Student Image"),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Student Name",
                    labelStyle: TextStyle(fontSize: size.size.width*0.05),
                    filled: true,
                    fillColor: Color(0xffe6ffe6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Color(0xffff8080),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                child: TextField(
                  controller: address,
                  decoration: InputDecoration(
                    labelText: "Address",
                    labelStyle: TextStyle(fontSize: size.size.width*0.05),
                    filled: true,
                    fillColor: Color(0xffe6ffe6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Color(0xffff8080),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                child: TextField(
                  controller: id,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "ID",
                    labelStyle: TextStyle(fontSize: size.size.width*0.05),
                    filled: true,
                    fillColor: Color(0xffe6ffe6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Color(0xffff8080),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                child: Text("Select Course*",style: TextStyle(fontSize: size.size.width*0.05),),
              ),
              ChangeNotifierProvider<State_Provider>(
                create: (context)=>State_Provider(),
                child: Consumer<State_Provider>(
                  builder: (context,provider,child){

                    if(provider.update_Course==0){
                      if(ob!.student_List[i].course=="BCA"){
                        provider.bca=1;
                      }else if(ob!.student_List[i].course=="BBA"){
                        provider.bba=1;
                      }else if(ob!.student_List[i].course=="MCA"){
                        provider.mca=1;
                      }else if(ob!.student_List[i].course=="MBA"){
                        provider.mba=1;
                      }
                      provider.update_Course=1;
                    }
                    pro=provider;

                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child:Row(
                        children: [
                          IndexedStack(
                            index:provider.bca,
                            children: [
                              InkWell(
                                child: SizedBox(
                                  child: Card(
                                    color: Colors.grey,
                                    child: Center(child: Text("BCA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.white),)),
                                  ),
                                  height: size.size.height*0.07,
                                  width: size.size.width*0.25,
                                ),
                                onTap: (){
                                  provider.bca=1;
                                  provider.bba=0;
                                  provider.mca=0;
                                  provider.mba=0;
                                  provider.change_State();
                                },
                              ),
                              InkWell(
                                child: SizedBox(
                                  child: Card(
                                    color: Colors.cyanAccent,
                                    child: Center(child: Text("BCA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.deepOrange),)),
                                  ),
                                  height: size.size.height*0.07,
                                  width: size.size.width*0.25,
                                ),
                                onTap: (){
                                  provider.bca=0;
                                  provider.bba=0;
                                  provider.mca=0;
                                  provider.mba=0;
                                  provider.change_State();
                                },
                              ),
                            ],
                          ),
                          IndexedStack(
                            index: provider.bba,
                            children: [
                              InkWell(
                                child: SizedBox(
                                  child: Card(
                                    color: Colors.grey,
                                    child: Center(child: Text("BBA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.white),)),
                                  ),
                                  height: size.size.height*0.07,
                                  width: size.size.width*0.25,
                                ),
                                onTap: (){
                                  provider.bca=0;
                                  provider.bba=1;
                                  provider.mca=0;
                                  provider.mba=0;
                                  provider.change_State();
                                },
                              ),
                              InkWell(
                                child: SizedBox(
                                  child: Card(
                                    color: Colors.cyanAccent,
                                    child: Center(child: Text("BBA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.deepOrange),)),
                                  ),
                                  height: size.size.height*0.07,
                                  width: size.size.width*0.25,
                                ),
                                onTap: (){
                                  provider.bca=0;
                                  provider.bba=0;
                                  provider.mca=0;
                                  provider.mba=0;
                                  provider.change_State();
                                },
                              ),
                            ],
                          ),
                          IndexedStack(
                            index: provider.mca,
                            children: [
                              InkWell(
                                child: SizedBox(
                                  child: Card(
                                    color: Colors.grey,
                                    child: Center(child: Text("MCA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.white),)),
                                  ),
                                  height: size.size.height*0.07,
                                  width: size.size.width*0.25,
                                ),
                                onTap: (){
                                  provider.bca=0;
                                  provider.bba=0;
                                  provider.mca=1;
                                  provider.mba=0;
                                  provider.change_State();
                                },
                              ),
                              InkWell(
                                child: SizedBox(
                                  child: Card(
                                    color: Colors.cyanAccent,
                                    child: Center(child: Text("MCA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.deepOrange),)),
                                  ),
                                  height: size.size.height*0.07,
                                  width: size.size.width*0.25,
                                ),
                                onTap: (){
                                  provider.bca=0;
                                  provider.bba=0;
                                  provider.mca=0;
                                  provider.mba=0;
                                  provider.change_State();
                                },
                              ),
                            ],
                          ),
                          IndexedStack(
                            index: provider.mba,
                            children: [
                              InkWell(
                                child: SizedBox(
                                  child: Card(
                                    color: Colors.grey,
                                    child: Center(child: Text("MBA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.white),)),
                                  ),
                                  height: size.size.height*0.07,
                                  width: size.size.width*0.25,
                                ),
                                onTap: (){
                                  provider.bca=0;
                                  provider.bba=0;
                                  provider.mca=0;
                                  provider.mba=1;
                                  provider.change_State();
                                },
                              ),
                              InkWell(
                                child: SizedBox(
                                  child: Card(
                                    color: Colors.cyanAccent,
                                    child: Center(child: Text("MBA",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.deepOrange),)),
                                  ),
                                  height: size.size.height*0.07,
                                  width: size.size.width*0.25,
                                ),
                                onTap: (){
                                  provider.bca=0;
                                  provider.bba=0;
                                  provider.mca=0;
                                  provider.mba=0;
                                  provider.change_State();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                child: TextField(
                  controller: mobile,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Mobile No.",
                    labelStyle: TextStyle(fontSize: size.size.width*0.05),
                    filled: true,
                    fillColor: Color(0xffe6ffe6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Color(0xffff8080),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                child: Row(
                  children: [
                    SizedBox(
                      height: size.size.height*0.05,
                      width: size.size.width*0.25,
                      child: ElevatedButton(
                        child: Text("Cancel",style: TextStyle(fontSize: size.size.width*0.04,color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                        ),
                        onPressed: (){
                          name = TextEditingController();
                          address = TextEditingController();
                          id = TextEditingController();
                          mobile = TextEditingController();
                          image=null;
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.size.height*0.05,
                      width: size.size.width*0.25,
                      child: ElevatedButton(
                        child: Text("Ok",style: TextStyle(fontSize: size.size.width*0.045,color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                        ),
                        onPressed: (){
                          String nm = name.text.trim().toString();
                          String ad = address.text.trim().toString();
                          String idd = id.text.trim().toString();
                          String mo = mobile.text.trim().toString();
                          String? course;

                          if(nm==""||ad==""||i==""||mo==""||image==null||pro!.bca==0&&pro!.bba==0&&pro!.mca==0&&pro!.mba==0){
                            return;
                          }
                          if(pro!.bca==1){
                            course="BCA";
                          }else if(pro!.bba==1){
                            course="BBA";
                          }else if(pro!.mca==1){
                            course="MCA";
                          }else if(pro!.mba==1){
                            course="MBA";
                          }

                          ob!.student_List[i].update(nm, ad, idd, mo,course!,image!);

                          name = TextEditingController();
                          address = TextEditingController();
                          id = TextEditingController();
                          mobile = TextEditingController();
                          image=null;
                          pro=null;
                          setState(() {
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                child: Builder(
                  builder: (context){
                    return IconButton(
                      icon:Icon(Icons.delete),
                      iconSize: size.size.width*0.1,
                      onPressed: (){
                        final message = SnackBar(
                          content: Row(
                            children: [
                            Text("Do You want to Delete this Account"),
                          ],
                          ),
                          action: SnackBarAction(
                              label: "Ok",
                              onPressed: (){
                                ob!.student_List.removeAt(i);
                                name = TextEditingController();
                                address = TextEditingController();
                                id = TextEditingController();
                                mobile = TextEditingController();
                                image=null;
                                setState(() {
                                });
                                Navigator.pop(context);
                              },
                          ),
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(message);
                      },
                    );
                  },
                ),
              ),
              Text("Delete")
            ],
          ),
        ],
      ),
    ),
  );
}

}



















