import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'UX.dart';


class Faculty_Salary extends StatefulWidget{
  College? ob;
  Faculty_Salary(this.ob);

  State<StatefulWidget> createState(){
    return Faculty_Salary_State(ob);
  }
}

class Faculty_Salary_State extends State<Faculty_Salary>{
  List<String> months =["January","February","March","April","May","June","July","August","September","October","November","December"];
  TextEditingController salary =TextEditingController();
  College? ob;
  Faculty_Salary_State(this.ob);


  Widget build(BuildContext context){
    var size = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("Select Faculty"),
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
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>select_Months(context,index)));
            },
          );
        },
      ),
    );
  }

  Widget select_Months(BuildContext context, int faculty_Index){
    var size = MediaQuery.of(context);
    int i=0;
    int check=0;
    return Scaffold(
      appBar: AppBar(
        title:Text("Select Faculty"),
        backgroundColor: Color(0xffffa64d),
        toolbarHeight: size.size.height*0.12,
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context,int index){
          if(check==0){
            if(ob!.faculty_List[faculty_Index].month==months[index]){
              check=1;
              return ListTile(
                title:Text(months[index],maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>enter_Salary(context, faculty_Index, index)));
                },
              );
            }
            return Container();
          }
          return ListTile(
            title:Text(months[index],maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>enter_Salary(context, faculty_Index, index)));
            },
          );
        },
      ),
    );
  }

  Widget enter_Salary(BuildContext context, int i, int month_Index){
    var size = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: month_Index,
          children: [
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary1=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary2=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary3=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary4=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary5=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary6=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary7=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary8=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary9=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary10=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary11=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
            ListView(
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
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
                      child: TextField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter Salary*",
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
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: size.size.height*0.06,
                              width: size.size.width*0.3,
                              child: ElevatedButton(
                                onPressed: (){
                                  String sala = salary.text.trim().toString();
                                  if(sala==""){
                                    return;
                                  }
                                  ob!.faculty_List[i].salary12=sala;
                                  salary=TextEditingController();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                child: Text("OK",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}






















