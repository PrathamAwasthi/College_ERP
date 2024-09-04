import 'package:college_erp/Home_Povider.dart';
import 'package:college_erp/UX.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BcaMarks extends StatefulWidget{
  College? ob;

  BcaMarks(this.ob);

  State<StatefulWidget> createState(){
    return BcaMarksState(ob);
  }
}

class BcaMarksState extends State<BcaMarks>{
  College? ob;
  TextEditingController sub1 =TextEditingController();
  TextEditingController sub2 =TextEditingController();
  TextEditingController sub3 =TextEditingController();
  TextEditingController sub4 =TextEditingController();
  TextEditingController sub5 =TextEditingController();
  TextEditingController sub6 =TextEditingController();

  BcaMarksState(this.ob);

  Widget build(BuildContext context){
    var size = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Semester"),
        backgroundColor: Color(0xffffff99),
        toolbarHeight: size.size.height*0.12,
        actions: [
          Padding(
            padding: EdgeInsets.all(size.size.width*0.05),
            child: Text("BCA",style: TextStyle(fontSize: size.size.width*0.06),),
          ),
        ],
      ),
      body: ListView(
        children: [
          Divider(),
          ListTile(
            leading: Icon(Icons.subject),
            title: Text("Semester 1",style: TextStyle(fontSize: size.size.width*0.06),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>select_Marks(context,0)));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.subject),
            title: Text("Semester 2",style: TextStyle(fontSize: size.size.width*0.06),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>select_Marks(context,1)));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.subject),
            title: Text("Semester 3",style: TextStyle(fontSize: size.size.width*0.06),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>select_Marks(context,2)));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.subject),
            title: Text("Semester 4",style: TextStyle(fontSize: size.size.width*0.06),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>select_Marks(context,3)));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.subject),
            title: Text("Semester 5",style: TextStyle(fontSize: size.size.width*0.06),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>select_Marks(context,4)));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.subject),
            title: Text("Semester 6",style: TextStyle(fontSize: size.size.width*0.06),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>select_Marks(context,5)));
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget select_Marks(BuildContext context,int i){
    var size = MediaQuery.of(context);

    return Scaffold(
      appBar:AppBar(
        title:Text("Select Option"),
        backgroundColor: Color(0xffff9933),
        toolbarHeight: size.size.height*0.12,
        actions: [
          Padding(
            padding: EdgeInsets.all(size.size.width*0.05),
            child: Text("BCA",style: TextStyle(fontSize: size.size.width*0.06),),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Row(
          children: [
            SizedBox(
              height: size.size.height*0.35,
              width: size.size.width*0.4,
              child: InkWell(
                child: Card(
                  color: Color(0xffff9999),
                  elevation: 12,
                  child: Column(
                    children: [
                      Image.asset('assets/image/—Pngtree—realistic 3d question mark_9109364.png'),
                      Text("Enter Marks",style: TextStyle(fontSize: size.size.width*0.05,color: Colors.white),),
                      Text("BCA",style: TextStyle(fontSize: size.size.width*0.06,color: Colors.white),),
                      Text("Students",style: TextStyle(fontSize: size.size.width*0.06,color: Colors.white),),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>enter_Marks(context,i)));
                },
              ),
            ),
            SizedBox(
              height: size.size.height*0.35,
              width: size.size.width*0.4,
              child: InkWell(
                child: Card(
                  color: Color(0xff99ff99),
                  elevation: 12,
                  child: Column(
                    children: [
                      Image.asset('assets/image/—Pngtree—3d green check mark icon_8926829.png'),
                      Text("Read Marks",style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black),),
                      Text("BCA",style: TextStyle(fontSize: size.size.width*0.06,color: Colors.black),),
                      Text("Students",style: TextStyle(fontSize: size.size.width*0.06,color: Colors.black),),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>read_Marks(context, i)));
                },
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
    );
  }

  Widget enter_Marks(BuildContext context , int sem){
    var size = MediaQuery.of(context);
    State_Provider? pro;
    State_Provider? pro1;


    return Scaffold(
      appBar: AppBar(
        title: Text("Select Student"),
        backgroundColor: Color(0xff1aff8c),
        toolbarHeight: size.size.height*0.12,
        actions: [
          Padding(
            padding: EdgeInsets.all(size.size.width*0.05),
            child: Text("BCA",style: TextStyle(fontSize: size.size.width*0.06),),
          ),
        ],
      ),
      body: IndexedStack(
        index: sem,
        children: [
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ChangeNotifierProvider<State_Provider>(
                    create: (context)=>State_Provider(),
                    child: Consumer<State_Provider>(
                      builder: (context,provider,child){
                        pro=provider;
                        return ob!.student_List[index].bcasemester1.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank);
                      },
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>input_Marks(context, sem, index,pro!)));
                  },
                );
              }
              return Column();
            },

          ),
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ChangeNotifierProvider<State_Provider>(
                    create: (context)=>State_Provider(),
                    child: Consumer<State_Provider>(
                      builder: (context,provider,child){
                        pro=provider;
                        return ob!.student_List[index].bcasemester2.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank);
                      },
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>input_Marks(context, sem, index,pro!)));
                  },
                );
              }
              return Column();
            },

          ),
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ChangeNotifierProvider<State_Provider>(
                    create: (context)=>State_Provider(),
                    child: Consumer<State_Provider>(
                      builder: (context,provider,child){
                        pro=provider;
                        return ob!.student_List[index].bcasemester3.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank);
                      },
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>input_Marks(context, sem, index,pro!)));
                  },
                );
              }
              return Column();
            },

          ),
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ChangeNotifierProvider<State_Provider>(
                    create: (context)=>State_Provider(),
                    child: Consumer<State_Provider>(
                      builder: (context,provider,child){
                        pro=provider;
                        return ob!.student_List[index].bcasemester4.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank);
                      },
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>input_Marks(context, sem, index,pro!)));
                  },
                );
              }
              return Column();
            },

          ),
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ChangeNotifierProvider<State_Provider>(
                    create: (context)=>State_Provider(),
                    child: Consumer<State_Provider>(
                      builder: (context,provider,child){
                        pro1=provider;
                        return ob!.student_List[index].bcasemester5.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank);
                      },
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>input_Marks(context, sem, index,pro1!)));
                  },
                );
              }
              return Column();
            },

          ),
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ChangeNotifierProvider<State_Provider>(
                    create: (context)=>State_Provider(),
                    child: Consumer<State_Provider>(
                      builder: (context,provider,child){
                        pro=provider;
                        return ob!.student_List[index].bcasemester6.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank);
                      },
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>input_Marks(context, sem, index,pro!)));
                  },
                );
              }
              return Column();
            },

          ),
        ],
      ),
    );
  }

  Widget input_Marks(BuildContext context, int sem, int index,State_Provider pro){
    var size = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: sem,
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Text("Enter Number*",style: TextStyle(fontSize: size.size.width*0.06),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child: TextField(
                        controller: sub1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester1.sub1!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester1.sub2!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester1.sub3!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester1.sub4!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub5,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester1.sub5!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub6,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester1.sub6!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                sub6=TextEditingController();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("OK",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                String s1 = sub1.text.trim().toString();
                                String s2 = sub2.text.trim().toString();
                                String s3 = sub3.text.trim().toString();
                                String s4 = sub4.text.trim().toString();
                                String s5 = sub5.text.trim().toString();
                                String s6 = sub6.text.trim().toString();
                                if(s1==""||s2==""||s3==""||s4==""||s5==""||s6==""){
                                  return;
                                }
                                ob!.student_List[index].bcasemester1.get_Marks(num1: s1, num2: s2, num3: s3, num4: s4, num5: s5, num6: s6);
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                sub6=TextEditingController();
                                pro.change_State();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Text("Enter Number*",style: TextStyle(fontSize: size.size.width*0.06),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child: TextField(
                        controller: sub1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester2.sub1!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester2.sub2!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester2.sub3!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester2.sub4!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub5,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester2.sub5!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub6,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester2.sub6!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                sub6=TextEditingController();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("OK",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                String s1 = sub1.text.trim().toString();
                                String s2 = sub2.text.trim().toString();
                                String s3 = sub3.text.trim().toString();
                                String s4 = sub4.text.trim().toString();
                                String s5 = sub5.text.trim().toString();
                                String s6 = sub6.text.trim().toString();
                                if(s1==""||s2==""||s3==""||s4==""||s5==""||s6==""){
                                  return;
                                }
                                ob!.student_List[index].bcasemester2.get_Marks(num1: s1, num2: s2, num3: s3, num4: s4, num5: s5, num6: s6);
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                sub6=TextEditingController();
                                pro.change_State();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Text("Enter Number*",style: TextStyle(fontSize: size.size.width*0.06),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child: TextField(
                        controller: sub1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester3.sub1!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester3.sub2!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester3.sub3!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester3.sub4!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub5,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester3.sub5!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub6,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester3.sub6!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                sub6=TextEditingController();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("OK",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                String s1 = sub1.text.trim().toString();
                                String s2 = sub2.text.trim().toString();
                                String s3 = sub3.text.trim().toString();
                                String s4 = sub4.text.trim().toString();
                                String s5 = sub5.text.trim().toString();
                                String s6 = sub6.text.trim().toString();
                                if(s1==""||s2==""||s3==""||s4==""||s5==""||s6==""){
                                  return;
                                }
                                ob!.student_List[index].bcasemester3.get_Marks(num1: s1, num2: s2, num3: s3, num4: s4, num5: s5, num6: s6);
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                sub6=TextEditingController();
                                pro.change_State();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Text("Enter Number*",style: TextStyle(fontSize: size.size.width*0.06),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child: TextField(
                        controller: sub1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester4.sub1!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester4.sub2!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester4.sub3!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester4.sub4!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub5,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester4.sub5!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub6,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester4.sub6!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                sub6=TextEditingController();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("OK",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                String s1 = sub1.text.trim().toString();
                                String s2 = sub2.text.trim().toString();
                                String s3 = sub3.text.trim().toString();
                                String s4 = sub4.text.trim().toString();
                                String s5 = sub5.text.trim().toString();
                                String s6 = sub6.text.trim().toString();
                                if(s1==""||s2==""||s3==""||s4==""||s5==""||s6==""){
                                  return;
                                }
                                ob!.student_List[index].bcasemester4.get_Marks(num1: s1, num2: s2, num3: s3, num4: s4, num5: s5, num6: s6);
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                sub6=TextEditingController();
                                pro.change_State();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Text("Enter Number*",style: TextStyle(fontSize: size.size.width*0.06),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child: TextField(
                        controller: sub1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester5.sub1!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester5.sub2!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester5.sub3!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester5.sub4!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub5,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester5.sub5!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                sub6=TextEditingController();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("OK",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                String s1 = sub1.text.trim().toString();
                                String s2 = sub2.text.trim().toString();
                                String s3 = sub3.text.trim().toString();
                                String s4 = sub4.text.trim().toString();
                                String s5 = sub5.text.trim().toString();
                                if(s1==""||s2==""||s3==""||s4==""||s5==""){
                                  return;
                                }
                                ob!.student_List[index].bcasemester5.get_Marks5(num1: s1, num2: s2, num3: s3, num4: s4, num5: s5);
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                pro.change_State();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Text("Enter Number*",style: TextStyle(fontSize: size.size.width*0.06),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child: TextField(
                        controller: sub1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester6.sub1!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester6.sub2!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester6.sub3!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester6.sub4!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: TextField(
                        controller: sub5,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(ob!.student_List[index].bcasemester6.sub5!,style: TextStyle(fontSize: size.size.width*0.05),overflow: TextOverflow.ellipsis,),
                          filled: true,
                          fillColor: Color(0xffccffcc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.02,0,0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                sub6=TextEditingController();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              child: Text("OK",style: TextStyle(color: Colors.white),),
                              onPressed: (){
                                String s1 = sub1.text.trim().toString();
                                String s2 = sub2.text.trim().toString();
                                String s3 = sub3.text.trim().toString();
                                String s4 = sub4.text.trim().toString();
                                String s5 = sub5.text.trim().toString();
                                if(s1==""||s2==""||s3==""||s4==""||s5==""){
                                  return;
                                }
                                ob!.student_List[index].bcasemester6.get_Marks5(num1: s1, num2: s2, num3: s3, num4: s4, num5: s5);
                                sub1=TextEditingController();
                                sub2=TextEditingController();
                                sub3=TextEditingController();
                                sub4=TextEditingController();
                                sub5=TextEditingController();
                                pro.change_State();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue
                              ),
                            ),
                            height: size.size.height*0.06,
                            width: size.size.width*0.3,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

  Widget read_Marks(BuildContext context, int sem){
    var size = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Read Marks"),
        backgroundColor: Color(0xff1aff8c),
        toolbarHeight: size.size.height*0.12,
        actions: [
          Padding(
            padding: EdgeInsets.all(size.size.width*0.05),
            child: Text("BCA",style: TextStyle(fontSize: size.size.width*0.06),),
          ),
        ],
      ),
      body: IndexedStack(
        index: sem,
        children: [
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ob!.student_List[index].bcasemester1.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>output_Marks(context, sem, index)));
                  },
                );
              }
              return Column();
            },
          ),
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ob!.student_List[index].bcasemester2.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>output_Marks(context, sem, index)));
                  },
                );
              }
              return Column();
            },
          ),
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ob!.student_List[index].bcasemester3.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>output_Marks(context, sem, index)));
                  },
                );
              }
              return Column();
            },
          ),
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ob!.student_List[index].bcasemester4.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>output_Marks(context, sem, index)));
                  },
                );
              }
              return Column();
            },
          ),
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ob!.student_List[index].bcasemester5.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>output_Marks(context, sem, index)));
                  },
                );
              }
              return Column();
            },
          ),
          ListView.builder(
            itemCount: ob!.student_List.length,
            itemBuilder: (context, int index){
              if(ob!.student_List[index].course=="BCA"){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                    radius: size.size.height*0.03,
                  ),
                  title:Text(ob!.student_List[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: size.size.width*0.05,color: Colors.black87),),
                  subtitle: Text(ob!.student_List[index].address!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  tileColor: Colors.white,
                  trailing: ob!.student_List[index].bcasemester6.numsub1!=null?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>output_Marks(context, sem, index)));
                  },
                );
              }
              return Column();
            },
          ),
        ],
      )
    );
  }

  Widget output_Marks(BuildContext context, int sem, int index){
    var size = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: sem,
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester1.sub1!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester1.numsub1}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester1.sub2!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester1.numsub2}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester1.sub3!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester1.numsub3}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester1.sub4!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester1.numsub4}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester1.sub5!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester1.numsub5}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester1.sub6!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester1.numsub6}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Total Marks :- 1000",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child:Row(
                        children: [
                          Text("  Obtained Marks :- ${ob!.student_List[index].bcasemester1.totalNum}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
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
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester2.sub1!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester2.numsub1}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester2.sub2!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester2.numsub2}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester2.sub3!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester2.numsub3}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester2.sub4!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester2.numsub4}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester2.sub5!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester2.numsub5}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester2.sub6!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester2.numsub6}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Total Marks :- 1000",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Obtained Marks :- ${ob!.student_List[index].bcasemester2.totalNum}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
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
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester3.sub1!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester3.numsub1}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester3.sub2!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester3.numsub2}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester3.sub3!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester3.numsub3}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester3.sub4!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester3.numsub4}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester3.sub5!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester3.numsub5}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester3.sub6!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester3.numsub6}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Total Marks :- 1000",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Obtained Marks :- ${ob!.student_List[index].bcasemester3.totalNum}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),softWrap: true,),
                                           ],
                      ),
                    ),
                    Divider(height: 0,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
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
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester4.sub1!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester4.numsub1}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester4.sub2!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester4.numsub2}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester4.sub3!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester4.numsub3}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester4.sub4!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester4.numsub4}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester4.sub5!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester4.numsub5}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester4.sub6!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester4.numsub6}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Total Marks :- 1000",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                                              ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Obtained Marks :- ${ob!.student_List[index].bcasemester4.totalNum}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
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
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester5.sub1!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester5.numsub1}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester5.sub2!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester5.numsub2}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester5.sub3!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester5.numsub3}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester5.sub4!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester5.numsub4}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Total Marks :- 1000",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                              ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Obtained Marks :- ${ob!.student_List[index].bcasemester5.totalNum}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
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
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,size.size.height*0.06,0,0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.size.height*0.06, 0, 0),
                            child: Container(
                              color: Colors.white,
                              height: size.size.height*0.15,
                              width: size.size.width*1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(size.size.width*0.1,size.size.height*0.05,0,0),
                                child: Column(
                                  children: [
                                    Text("Name :- ${ob!.student_List[index].name}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("ID :- ${ob!.student_List[index].id}",style:TextStyle(fontSize: size.size.width*0.04)),
                                    Text("Semester :- $sem",style:TextStyle(fontSize: size.size.width*0.04)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.size.width*0.1,0, 0, 0),
                            child: CircleAvatar(
                              radius: size.size.width*0.1,
                              backgroundImage: FileImage(ob!.student_List[index].student_Image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester6.sub1!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester6.numsub1}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester6.sub2!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester6.numsub2}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester6.sub3!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester6.numsub3}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester6.sub4!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester6.numsub4}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  ${ob!.student_List[index].bcasemester6.sub5!}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                          Text(" :- ${ob!.student_List[index].bcasemester6.numsub5}",style: TextStyle(fontSize: size.size.height*0.02),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Total Marks :- 1000",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                             ],
                      ),
                    ),
                    Divider(height: 0,),
                    Container(
                      color: Colors.white,
                      height: size.size.height*0.08,
                      width: size.size.width*1,
                      child: Row(
                        children: [
                          Text("  Obtained Marks :- ${ob!.student_List[index].bcasemester6.totalNum}",style: TextStyle(fontSize: size.size.height*0.02,fontWeight: FontWeight.bold),softWrap: true,),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.size.height*0.02, 0, 0),
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
          ],
        )
      ),
      backgroundColor: Color(0xffe6ffff),
    );
  }

}

