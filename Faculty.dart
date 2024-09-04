import 'dart:io';

import 'package:college_erp/UX.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'Home_Povider.dart';

class Faculty_Page extends StatefulWidget {
  College? ob;
  Faculty_Page(this.ob);

  State<StatefulWidget> createState(){
    return Faculty_Page_State(ob);
  }
}

class Faculty_Page_State extends State<Faculty_Page>{
  College? ob;
  File? image;
  final pick_image =ImagePicker();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController id = TextEditingController();
  String? month;
  int n=1;

  Faculty_Page_State(this.ob);

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
        title:Text("Faculty List"),
        backgroundColor: Color(0xffffa64d),
        toolbarHeight: size.size.height*0.12,
      ),
      body: ListView.builder(
        itemCount: ob!.faculty_List.length,
        itemBuilder: (context,int index){
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(ob!.faculty_List[index].image!),
              radius: size.size.height*0.03,
            ),
            title:Text(ob!.faculty_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
            subtitle: Text(ob!.faculty_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
            tileColor: Colors.white,
            trailing:IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>edit_Faculty_Detail(context, index)));
              },
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>faculty_Detail(context, index)));
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(size.size.height*0.02),
        child: FloatingActionButton(
          child: Icon(Icons.person_add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>add_Faculty(context)));
          },
        ),
      ),
    );
  }

  Widget add_Faculty(BuildContext context){
    var size = MediaQuery.of(context);
    State_Provider? pro1;
    State_Provider? pro2;

    return Scaffold(
      body: ListView(
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
              Text("Select Faculty Image*"),
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
              ChangeNotifierProvider<State_Provider>(
                create: (context)=>State_Provider(),
                child: Consumer<State_Provider>(
                  builder: (context, provider, child){
                    pro1=provider;
                    return month==null?Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: SizedBox(
                        height: size.size.height*0.06,
                        width: size.size.width*0.5,
                        child: ElevatedButton(
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Column(
                                children: [
                                  Text("Select"),
                                  Text("Joining Month"),
                                ],
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              ),
                              n==0?Icon(Icons.keyboard_arrow_up_outlined):Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                          onPressed: (){
                            n=0;
                            pro2!.change_State();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            elevation: 8,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                    ): Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: SizedBox(
                        height: size.size.height*0.06,
                        width: size.size.width*0.5,
                        child: ElevatedButton(
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Column(
                                children: [
                                  Text(month!),
                                  Text("Joining Month"),
                                ],
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                          onPressed: (){
                            n=0;
                            pro2!.change_State();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            elevation: 8,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ChangeNotifierProvider<State_Provider>(
                create: (context)=>State_Provider(),
                child: Consumer<State_Provider>(
                  builder: (context, provider, child){
                    pro2=provider;
                    return IndexedStack(
                      index: n,
                      children: [
                        Align(
                          child: Container(
                            height: size.size.height*0.3,
                            width: size.size.width*0.5,
                            color: Colors.white,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Divider(height: 2,),
                                  ListTile(
                                    leading: Text("January",style: TextStyle(fontSize: size.size.width*0.06),),
                                    title: Text(""),
                                    onTap: (){
                                      month="January";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("February",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="February";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("March",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="March";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("April",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="April";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("May",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="May";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("June",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="June";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("July",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="July";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("August",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="August";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("September",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="September";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("October",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="October";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("November",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="November";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                  ListTile(
                                    leading: Text("December",style: TextStyle(fontSize: size.size.width*0.06),),
                                    onTap: (){
                                      month="December";
                                      pro1!.change_State();
                                      n=1;
                                      provider.change_State();
                                    },
                                  ),
                                  Divider(height: 0,),
                                ],
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
                                    image=null;
                                    month=null;
                                    pro1=null;
                                    pro2=null;
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

                                    if(nm==""||ad==""||i==""||month==null||image==null){
                                      return;
                                    }

                                    Faculty obj = Faculty(nm, ad, i, month, image);
                                    ob!.faculty_List.add(obj);

                                    name = TextEditingController();
                                    address = TextEditingController();
                                    id = TextEditingController();
                                    image=null;
                                    month=null;
                                    pro1=null;
                                    pro2=null;
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
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget faculty_Detail(BuildContext context,int i){
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
                    backgroundImage: FileImage(ob!.faculty_List[i].image!),
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
                      Text(" Faculty Name :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.faculty_List[i].name!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
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
                      Text(ob!.faculty_List[i].address!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
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
                      Text(" Faculty ID :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.faculty_List[i].id!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
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
                      Text(" Joining Month :- ",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                      Text(ob!.faculty_List[i].month!,style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
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

  Widget edit_Faculty_Detail(BuildContext context,int i){
    var size = MediaQuery.of(context);
    name.text = ob!.faculty_List[i].name!;
    address.text = ob!.faculty_List[i].address!;
    id.text = ob!.faculty_List[i].id!;
    month=ob!.faculty_List[i].month;
    image = ob!.faculty_List[i].image!;
    State_Provider? pro1;
    State_Provider? pro2;

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
                        padding: EdgeInsets.fromLTRB(0, size.size.height*0.1, 0, 0),
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
                Text("Faculty Image"),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: "Faculty Name",
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
                      labelText: "Faculty ID",
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
                ChangeNotifierProvider<State_Provider>(
                  create: (context)=>State_Provider(),
                  child: Consumer<State_Provider>(
                    builder: (context, provider, child){
                      pro1=provider;
                      return month==null?Padding(
                        padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                        child: SizedBox(
                          height: size.size.height*0.06,
                          width: size.size.width*0.5,
                          child: ElevatedButton(
                            child: Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Column(
                                  children: [
                                    Text("Select"),
                                    Text("Joining Month"),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                ),
                                n==0?Icon(Icons.keyboard_arrow_up_outlined):Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                            onPressed: (){
                              n=0;
                              pro2!.change_State();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              elevation: 8,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        ),
                      ): Padding(
                        padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                        child: SizedBox(
                          height: size.size.height*0.06,
                          width: size.size.width*0.5,
                          child: ElevatedButton(
                            child: Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Column(
                                  children: [
                                    Text(month!),
                                    Text("Joining Month"),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                ),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                            onPressed: (){
                              n=0;
                              pro2!.change_State();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              elevation: 8,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ChangeNotifierProvider<State_Provider>(
                  create: (context)=>State_Provider(),
                  child: Consumer<State_Provider>(
                    builder: (context, provider, child){
                      pro2=provider;
                      return IndexedStack(
                        index: n,
                        children: [
                          Align(
                            child: Container(
                              height: size.size.height*0.3,
                              width: size.size.width*0.5,
                              color: Colors.white,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Divider(height: 2,),
                                    ListTile(
                                      leading: Text("January",style: TextStyle(fontSize: size.size.width*0.06),),
                                      title: Text(""),
                                      onTap: (){
                                        month="January";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("February",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="February";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("March",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="March";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("April",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="April";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("May",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="May";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("June",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="June";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("July",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="July";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("August",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="August";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("September",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="September";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("October",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="October";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("November",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="November";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                    ListTile(
                                      leading: Text("December",style: TextStyle(fontSize: size.size.width*0.06),),
                                      onTap: (){
                                        month="December";
                                        pro1!.change_State();
                                        n=1;
                                        provider.change_State();
                                      },
                                    ),
                                    Divider(height: 0,),
                                  ],
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
                                      image=null;
                                      month=null;
                                      pro1=null;
                                      pro2=null;
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
                                      String i1 = id.text.trim().toString();

                                      if(nm==""||ad==""||i1==""||month==null||image==null){
                                        return;
                                      }

                                      ob!.faculty_List[i].name=nm;
                                      ob!.faculty_List[i].address=ad;
                                      ob!.faculty_List[i].id=i1;
                                      ob!.faculty_List[i].month=month;
                                      ob!.faculty_List[i].image=image;

                                      name = TextEditingController();
                                      address = TextEditingController();
                                      id = TextEditingController();
                                      image=null;
                                      month=null;
                                      pro1=null;
                                      pro2=null;
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
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.size.height*0, 0, 0),
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
                                ob!.faculty_List.removeAt(i);
                                name = TextEditingController();
                                address = TextEditingController();
                                id = TextEditingController();
                                month=null;
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

