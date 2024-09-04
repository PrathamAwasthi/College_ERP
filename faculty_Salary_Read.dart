import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'UX.dart';


class Faculty_Salary_Read extends StatefulWidget{
  College? ob;
  Faculty_Salary_Read(this.ob);

  State<StatefulWidget> createState(){
    return Faculty_Salary_State_Read(ob);
  }
}

class Faculty_Salary_State_Read extends State<Faculty_Salary_Read>{
  List<String> months =["January","February","March","April","May","June","July","August","September","October","November","December"];
  TextEditingController salary =TextEditingController();
  College? ob;
  Faculty_Salary_State_Read(this.ob);


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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>select_Months(context, index)));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>read_Salary(context, faculty_Index, index)));
                },
              );
            }
            return Container();
          }
          return ListTile(
            title:Text(months[index],maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>read_Salary(context, faculty_Index, index)));
            },
          );
        },
      ),
    );
  }


  Widget read_Salary(BuildContext context, int i, int month_Index){
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary1!=null?Text("  Rs. ${ob!.faculty_List[i].salary1}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary1!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary2!=null?Text("  Rs. ${ob!.faculty_List[i].salary2}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary2!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary3!=null?Text("  Rs. ${ob!.faculty_List[i].salary3}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary3!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],): Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary4!=null?Text("  Rs. ${ob!.faculty_List[i].salary4}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary4!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary5!=null?Text("  Rs. ${ob!.faculty_List[i].salary5}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary5!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary6!=null?Text("  Rs. ${ob!.faculty_List[i].salary6}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary6!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary7!=null?Text("  Rs. ${ob!.faculty_List[i].salary7}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary7!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary8!=null?Text("  Rs. ${ob!.faculty_List[i].salary8}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary8!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary9!=null?Text("  Rs. ${ob!.faculty_List[i].salary9}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary9!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary10!=null?Text("  Rs. ${ob!.faculty_List[i].salary10}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary10!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary11!=null?Text("  Rs. ${ob!.faculty_List[i].salary11}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary11!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.1,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          ob!.faculty_List[i].salary12!=null?Text("  Rs. ${ob!.faculty_List[i].salary12}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),):Text("  Rs. NULL",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                          Spacer(),
                          ob!.faculty_List[i].salary12!=null?Row(children: [
                            Text("Salary Paid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box),color: Colors.green,)

                          ],):Row(children: [
                            Text("Salary Unpaid",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),),
                            Icon((Icons.check_box_outline_blank),color: Colors.red,)

                          ],),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.05, 0, 0),
                      child: SizedBox(
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
























