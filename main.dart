import 'package:flutter/material.dart';
import 'package:college_erp/UX.dart';
import 'ERP_Home_Page.dart';

List<College> college_List = [];

void main(){
  runApp(
    MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,),
  );
}

class MyApp extends StatefulWidget{
  State<StatefulWidget> createState(){
    return MyAppState();
  }
}
class MyAppState extends State<MyApp>{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Widget build(BuildContext context){
    var size =MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body:ListView(
          children:[
            Column(
              children:[
                Padding(
                  padding: EdgeInsets.fromLTRB(0,size.size.height*0.2,0,0),
                  child: Text("Login Page",style:TextStyle(fontSize:24,fontWeight:FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,size.size.height*0.1,0,0),
                  child: TextField(
                    controller:email,
                    decoration:InputDecoration(
                      filled:true,
                      fillColor:Color(0xfff2e6ff),
                      labelText:"Email Address",
                      labelStyle:TextStyle(fontSize:20,color:Colors.black),
                      border:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(12)),

                      ),
                      focusedBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(12)),
                        borderSide:BorderSide(
                          color:Color(0xffcc99ff),
                          width:2,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                  child: TextField(
                    controller:password,
                    decoration:InputDecoration(
                      filled:true,
                      fillColor:Color(0xfff2e6ff),
                      labelText:"Password",
                      labelStyle:TextStyle(fontSize:20,color:Colors.black),
                      border:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(12)),

                      ),
                      focusedBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(12)),
                        borderSide:BorderSide(
                          color:Color(0xffcc99ff),
                          width:2,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                  child: SizedBox(
                    child:ElevatedButton(
                      onPressed:(){

                        String? em = email.text.trim().toString();
                        String? ps = password.text.trim().toString();

                        if(em==""||ps==""){
                          return;
                        }

                        for( int i=0;i<college_List.length;i++){
                          if(college_List[i].email==em){
                            if(college_List[i].password==ps){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(college_List[i])));
                              break;
                            }
                            break;
                          }
                        }

                      },
                      child:Text("Login",style:TextStyle(color:Colors.white,fontSize:18)),
                      style:ElevatedButton.styleFrom(
                        backgroundColor:Colors.blueAccent,
                        elevation:5,
                        shape:RoundedRectangleBorder(
                          borderRadius:BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    height:size.size.height*0.06,
                    width:size.size.width*0.8,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                  child: Row(
                    children:[
                      Container(
                        height:1,
                        width:size.size.width*0.4,
                        color:Colors.black,
                      ),
                      Text("OR"),
                      Container(
                        height:1,
                        width:size.size.width*0.4,
                        color:Colors.black,
                      ),
                    ],
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,size.size.height*0.05,0,0),
                  child: InkWell(
                      onTap:(){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>SignUp()));
                      },
                      child: Text("Sign Up",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold),)),
                ),
              ],
            ),
          ]
        ),
        backgroundColor:Colors.white,
      ),
    );
  }
}

class SignUp extends StatefulWidget{
  State<StatefulWidget> createState(){
    return SignUpState();
  }
}
class SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conformpassword = TextEditingController();
  TextEditingController college_Name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController contry = TextEditingController();
  TextEditingController phone = TextEditingController();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.size.height * 0.2, 0, 0),
                    child: Text("Sign Up", style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, size.size.height * 0.1, 0, 0),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xfff2e6ff),
                        labelText: "Create Email",
                        labelStyle: TextStyle(
                            fontSize: 20, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: Color(0xffcc99ff),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.size.height * 0.02, 0, 0),
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xfff2e6ff),
                        labelText: "Create Password",
                        labelStyle: TextStyle(
                            fontSize: 20, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: Color(0xffcc99ff),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, size.size.height * 0.02, 0, 0),
                    child: TextField(
                      controller:conformpassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xfff2e6ff),
                        labelText: "Conform Password",
                        labelStyle: TextStyle(
                            fontSize: 20, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: Color(0xffcc99ff),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, size.size.height * 0.02, 0, 0),
                    child: SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          String? e = email.text.trim().toString();
                          String? p = password.text.trim().toString();
                          String? cp = conformpassword.text.trim().toString();

                          if(e=="" || p=="" || cp==""){
                            return;
                          }
                          if(p!=cp){
                            return;
                          }
                          College ob = new College(e,p);
                          college_List.add(ob);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context)=>create_Account(context,ob)),
                          );
                        },
                        child: Text("Sign Up", style: TextStyle(
                            color: Colors.white, fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      height: size.size.height * 0.06,
                      width: size.size.width * 0.8,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.size.height * 0.06, 0, 0),
                    child: Row(
                      children: [
                        Container(
                          height: 1,
                          width: size.size.width * 0.4,
                          color: Colors.black,
                        ),
                        Text("OR"),
                        Container(
                          height: 1,
                          width: size.size.width * 0.4,
                          color: Colors.black,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.size.height * 0.05, 0, 0),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => MyApp()));
                        },
                        child: Text("Login", style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),)),
                  ),
                ],
              ),
            ]
        ),
        backgroundColor:Colors.white,
      ),
    );
  }

  Widget create_Account(BuildContext context, College ob){
    var size = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body:ListView(
          children:[
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height * 0.1, 0, 0),
                       child: Text("Create Account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height * 0.1, 0, 0),
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
                  child: SizedBox(
                    height:size.size.height*0.06,
                    width:size.size.width*0.5,
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
                        ob.input_Data(cm,ad,cy,st,co,ph);
                        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>HomePage(ob)));
                      },
                      child:Text("Create",style:TextStyle(color:Colors.white,fontSize:18,fontWeight:FontWeight.bold)),
                      style:ElevatedButton.styleFrom(
                       shape:RoundedRectangleBorder(
                         borderRadius:BorderRadius.all(Radius.circular(12)),
                       ),
                        backgroundColor:Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor:Colors.white,
      ),
    );
  }
}

