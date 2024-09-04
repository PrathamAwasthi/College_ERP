import 'dart:io';
import 'package:college_erp/BBA_marks.dart';
import 'package:college_erp/BCA_marks.dart';
import 'package:college_erp/Faculty.dart';
import 'package:college_erp/Faculty_Salary.dart';
import 'package:college_erp/Student_Page.dart';
import 'package:college_erp/faculty_Salary_Read.dart';
import 'package:college_erp/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'Home_Povider.dart';
import 'UX.dart';


class HomePage extends StatefulWidget{
  College? ob;
  HomePage(this.ob);
  State<StatefulWidget> createState(){
    return HomePageState(ob);
  }
}

class HomePageState extends State<HomePage>{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conformpassword = TextEditingController();
  TextEditingController college_Name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController contry = TextEditingController();
  TextEditingController phone = TextEditingController();

  final pick_image =ImagePicker();
  College? ob;
  HomePageState(this.ob){
    college_Name.text=ob!.college_Name!;
    address.text=ob!.address!;
    city.text=ob!.city!;
    state.text=ob!.state!;
    contry.text=ob!.contry!;
    phone.text=ob!.phone!;
  }

  Future getImager(State_Provider provider) async{
    final picked_image = await pick_image.pickImage(source: ImageSource.gallery);
    if(picked_image!=null){
      ob!.college_Image = File(picked_image.path);
      provider.change_State();
    }
  }

  Widget build(BuildContext context){
    var size = MediaQuery.of(context);

    return Scaffold(
      appBar:AppBar(
        title:Text("College ERP"),
        backgroundColor:Color(0xffF9E795),
        toolbarHeight:size.size.height*0.12,
      ),
      body:ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  child: InkWell(
                    child: Card(
                      color:Color(0xff99ff99),
                      elevation: 12,
                      child: Column(
                        children: [
                          Image.asset('assets/image/—Pngtree—cartoon school season happy pupils_4575715.png',height:size.size.height*0.18),
                          Text("Student",style: TextStyle(fontSize: size.size.height*0.024,color:Color(0xffff9900)),),
                          Text("Registration",style: TextStyle(fontSize: size.size.height*0.024,color:Color(0xff9966ff)),),
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>StudentPage(ob)));
                    },
                  ),
                  height: size.size.height*0.3,
                  width: size.size.width*0.4,
                ),
                SizedBox(
                  child: InkWell(
                    child: Card(
                      color:Color(0xff99ffcc),
                      elevation: 12,
                      child: Column(
                        children: [
                          Image.asset('assets/image/1725075965714.png',height:size.size.height*0.18),
                          Text("Faculty",style: TextStyle(fontSize: size.size.height*0.024,color:Color(0xffff5050)),),
                          Text("Registration",style: TextStyle(fontSize: size.size.height*0.024,color:Color(0xff9966ff)),),
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Faculty_Page(ob)));
                    },
                  ),
                  height: size.size.height*0.3,
                  width: size.size.width*0.4,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            SizedBox(
              height: size.size.height*0.13,
              child: InkWell(
                child: Card(
                  color: Color(0xffccffcc),
                  child: Row(
                    children: [
                      Image.asset('assets/image/1725115887833.png',height: size.size.height*0.1,),
                      Text("BCA Students Marks",style: TextStyle(fontSize: size.size.width*0.05,color: Color(0xff009933)),),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BcaMarks(ob)));
                },
              ),
            ),
            SizedBox(
              height: size.size.height*0.13,
              child: InkWell(
                child: Card(
                  color: Color(0xffccffcc),
                  child: Row(
                    children: [
                      Image.asset('assets/image/1725354545621.png',height: size.size.height*0.1,),
                      Text("BBA Students Marks",style: TextStyle(fontSize: size.size.width*0.05,color: Color(0xff009933)),),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BbaMarks(ob)));
                },
              ),
            ),
            SizedBox(
              height: size.size.height*0.13,
              child: InkWell(
                child: Card(
                  color: Color(0xffccffcc),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(size.size.width*0.06, 0, 0, 0),
                        child: Image.asset('assets/image/—Pngtree—business finance salary_5424419.png',height: size.size.height*0.1,),
                      ),
                      Text("  Enter Faculty Salary",style: TextStyle(fontSize: size.size.width*0.05,color: Color(0xff009933)),),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Faculty_Salary(ob)));
                },
              ),
            ),
            SizedBox(
              height: size.size.height*0.13,
              child: InkWell(
                child: Card(
                  color: Color(0xffccffcc),
                  child: Row(
                    children: [
                      Image.asset('assets/image/1725354521424.png',height: size.size.height*0.1,),
                      Text(" Read Faculty Salary",style: TextStyle(fontSize: size.size.width*0.05,color: Color(0xff009933)),),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Faculty_Salary_Read(ob)));
                },
              ),
            ),
          ],
        ),
      drawer:Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
                  children: [
                    ChangeNotifierProvider<State_Provider>(
                      create:(context)=>State_Provider(),
                      child:Consumer<State_Provider>(
                        builder: (context,provider,child){
                          return Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.01, size.size.height*0.2, 0),
                            child: InkWell(
                              child: CircleAvatar(
                                radius: size.size.width*0.08,
                                backgroundImage:ob!.college_Image!=null?FileImage(ob!.college_Image!):NetworkImage(''),
                              ),
                              onTap: (){
                                getImager(provider);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.width*0.02, size.size.width*0.2, 0),
                      child: Text("College Name :- ${ob!.college_Name}",overflow: TextOverflow.ellipsis,),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.width*0.02, size.size.width*0.2, 0,),
                      child: Text("College Email :- ${ob!.email}",overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.width*0.02,0, 0,),
                child: InkWell(
                  child: Text("Account Details",style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>college_Detail(context)));
                  },
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.width*0.02,0, 0,),
                child: InkWell(
                  child: Text("Edit Account Details",style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>edit_College_Detail(context)));
                  },
                ),
              ),
            ),
            Divider(),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.width*0.02,0, 0,),
                child: InkWell(
                  child: Text("LogOut",style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black,fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget college_Detail(BuildContext context){
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
                    backgroundImage: ob!.college_Image != null ? FileImage(ob!.college_Image!) : NetworkImage(""),
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
                      Text(" College Name :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.college_Name!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
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
                      Text(" College Address :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.address!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
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
                      Text(" City :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.city!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
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
                      Text(" State :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.state!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
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
                      Text(" Contry :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.contry!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
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
                      Text(" Phone No. :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.phone!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
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

  Widget edit_College_Detail(BuildContext context){
    var size = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit College Detail's"),
        backgroundColor: Color(0xffffff99),
        toolbarHeight: size.size.height*0.1,
        actions: [
          Padding(
            padding: EdgeInsets.all(size.size.width*0.05),
            child: Text("BCA",style: TextStyle(fontSize: size.size.width*0.06),),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ChangeNotifierProvider<State_Provider>(
                create:(context)=>State_Provider(),
                child:Consumer<State_Provider>(
                  builder: (context,provider,child){
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.01, 0, 0),
                      child: InkWell(
                        child: CircleAvatar(
                          radius: size.size.width*0.15,
                          backgroundImage:ob!.college_Image!=null?FileImage(ob!.college_Image!):NetworkImage(''),
                        ),
                        onTap: (){
                          getImager(provider);
                        },
                      ),
                    );
                  },
                ),
              ),
              Text("College Image"),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height * 0.04, 0, 0),
                child: TextField(
                  controller:college_Name,
                  decoration:InputDecoration(
                    label:Text("Collage Name"),
                    labelStyle:TextStyle(fontSize:18,color:Colors.black),
                    filled:true,
                    fillColor:Color(0xfff2e6ff),
                    border:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(12)),
                      borderSide:BorderSide(
                        color:Colors.purple,
                        width:2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height * 0.02, 0, 0),
                child: TextField(
                  controller:address,
                  decoration:InputDecoration(
                    label:Text("Address"),
                    labelStyle:TextStyle(fontSize:18,color:Colors.black),
                    filled:true,
                    fillColor:Color(0xfff2e6ff),
                    border:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(12)),
                      borderSide:BorderSide(
                        color:Colors.purple,
                        width:2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height * 0.02, 0, 0),
                child: TextField(
                  controller:city,
                  decoration:InputDecoration(
                    label:Text("City"),
                    labelStyle:TextStyle(fontSize:18,color:Colors.black),
                    filled:true,
                    fillColor:Color(0xfff2e6ff),
                    border:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(12)),
                      borderSide:BorderSide(
                        color:Colors.purple,
                        width:2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height * 0.02, 0, 0),
                child: TextField(
                  controller:state,
                  decoration:InputDecoration(
                    label:Text("State"),
                    labelStyle:TextStyle(fontSize:18,color:Colors.black),
                    filled:true,
                    fillColor:Color(0xfff2e6ff),
                    border:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(12)),
                      borderSide:BorderSide(
                        color:Colors.purple,
                        width:2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height * 0.02, 0, 0),
                child: TextField(
                  controller:contry,
                  decoration:InputDecoration(
                    label:Text("Contry"),
                    labelStyle:TextStyle(fontSize:18,color:Colors.black),
                    filled:true,
                    fillColor:Color(0xfff2e6ff),
                    border:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(12)),
                      borderSide:BorderSide(
                        color:Colors.purple,
                        width:2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height * 0.02, 0, 0),
                child: TextField(
                  controller:phone,
                  decoration:InputDecoration(
                    label:Text("Phone No."),
                    labelStyle:TextStyle(fontSize:18,color:Colors.black),
                    filled:true,
                    fillColor:Color(0xfff2e6ff),
                    border:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(12)),
                      borderSide:BorderSide(
                        color:Colors.purple,
                        width:2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.size.height * 0.02, 0, 0),
                child: Row(
                  children: [
                    SizedBox(
                      height:size.size.height*0.06,
                      width:size.size.width*0.3,
                      child: ElevatedButton(
                        onPressed:(){
                          Navigator.pop(context);
                        },
                        child:Text("Cancel",style:TextStyle(color:Colors.white,fontSize:18,fontWeight:FontWeight.bold)),
                        style:ElevatedButton.styleFrom(
                          shape:RoundedRectangleBorder(
                            borderRadius:BorderRadius.all(Radius.circular(12)),
                          ),
                          backgroundColor:Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:size.size.height*0.06,
                      width:size.size.width*0.3,
                      child: ElevatedButton(
                        onPressed:(){
                          String cm = college_Name.text.trim().toString();
                          String ad = address.text.trim().toString();
                          String cy = city.text.trim().toString();
                          String st = state.text.trim().toString();
                          String co = contry.text.trim().toString();
                          String ph = phone.text.trim().toString();
                          if(cm=="" || ad=="" || cy=="" || st=="" || co=="" || ph==""){
                            return;
                          }
                          ob!.input_Data(cm,ad,cy,st,co,ph);
                          setState(() {
                          });
                          Navigator.pop(context);
                        },
                        child:Text("Edit",style:TextStyle(color:Colors.white,fontSize:18,fontWeight:FontWeight.bold)),
                        style:ElevatedButton.styleFrom(
                          shape:RoundedRectangleBorder(
                            borderRadius:BorderRadius.all(Radius.circular(12)),
                          ),
                          backgroundColor:Colors.blue,
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )
              ),
            ],
          )
        ],
      ),
    );
  }

}














