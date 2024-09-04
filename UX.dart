import 'dart:ffi';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Student_Marks {
  String? sub1;
  String? sub2;
  String? sub3;
  String? sub4;
  String? sub5;
  String? sub6;
  int? numsub1;
  int? numsub2;
  int? numsub3;
  int? numsub4;
  int? numsub5;
  int? numsub6;
  int? totalNum;
  double? percentage;

  Student_Marks({this.sub1,this.sub2,this.sub3,this.sub4,this.sub5,this.sub6});

  void get_Marks({String? num1,String? num2,String? num3,String? num4,String? num5,String? num6}){
    numsub1 = int.parse(num1!);
    numsub2 = int.parse(num2!);
    numsub3 = int.parse(num3!);
    numsub4 = int.parse(num4!);
    numsub5 = int.parse(num5!);
    numsub6 = int.parse(num6!);
   totalNum=numsub1!+numsub2!+numsub3!+numsub4!+numsub5!+numsub6!;
  }
  void get_Marks5({String? num1,String? num2,String? num3,String? num4,String? num5,String? num6}){
    numsub1 = int.parse(num1!);
    numsub2 = int.parse(num2!);
    numsub3 = int.parse(num3!);
    numsub4 = int.parse(num4!);
    numsub5 = int.parse(num5!);
    totalNum=numsub1!+numsub2!+numsub3!+numsub4!+numsub5!;
  }

}

class Student {
  String? name;
  String? address;
  String? id;
  String? mobile;
  String? course;
  File? student_Image;

  //BCA Objects
  Student_Marks bcasemester1 = new Student_Marks(
    sub1: "Fundamentals of IT & Computers",
    sub2: "C Programming",
    sub3: "Digital Electronics",
    sub4: "Basic Mathematics",
    sub5: "Business Communication",
    sub6: "C Language Lab",
  );
  Student_Marks bcasemester2 = new Student_Marks(
    sub1: "C++ Programming",
    sub2: "Digital Electronics",
    sub3: "Organizational Behavior",
    sub4: "Financial Accounting and Management",
    sub5: "Mathematics",
    sub6: "C++ Language Lab",
  );
  Student_Marks bcasemester3 = new Student_Marks(
    sub1: "OOPs",
    sub2: "DS Using C and C++",
    sub3: "Computer Architecture",
    sub4: "Business Economics",
    sub5: "Elements of Statistics",
    sub6: "DS Using C and C++ Language Lab",
  );
  Student_Marks bcasemester4 = new Student_Marks(
    sub1: "Computer Graphics",
    sub2: "Operating System",
    sub3: "Software Engineering",
    sub4: "Optimization techniques",
    sub5: "Mathematics 3",
    sub6: "Computer Graphics Lab",
  );
  Student_Marks bcasemester5 = new Student_Marks(
    sub1: "Introduction to DBMS",
    sub2: "Java Programming",
    sub3: "Computer Network",
    sub4: "Numerical Methods",
    sub5: "DBMS Lab",
  );
  Student_Marks bcasemester6 = new Student_Marks(
    sub1: "Computer Network Security",
    sub2: "E-Commerce",
    sub3: "Knowledge Management",
    sub4: "Information System",
    sub5: "Project Lab",
  );
  //BBA Objects
  Student_Marks bbasemester1 = new Student_Marks(
    sub1: "Financial management",
    sub2: "Accounting",
    sub3: "Business law",
    sub4: "Principles of management",
    sub5: "Essentials of marketing",
  );
  Student_Marks bbasemester2 = new Student_Marks(
    sub1: "Organisational Behaviour",
    sub2: "Business Environment",
    sub3: "Business Mathematics",
    sub4: "Environmental Management",
    sub5: "Management Accounting",
  );
  Student_Marks bbasemester3 = new Student_Marks(
    sub1: "Production Methods",
    sub2: "Manpower Management ",
    sub3: "Marketing Concepts",
    sub4: "Business Finance - I",
    sub5: "Business Statistics",
  );
  Student_Marks bbasemester4= new Student_Marks(
    sub1: "Operations Research",
    sub2: "Industrial Law ",
    sub3: "Banking Law & Practice",
    sub4: "Advertising & Public Relations",
    sub5: "Summer Training Report",
  );
  Student_Marks bbasemester5= new Student_Marks(
    sub1: "Management Information System ",
    sub2: "Indian Economy",
    sub3: "Banking Law & Practice",
    sub4: "Advertising & Public Relations",
    sub5: "Summer Training Report",
  );
  Student_Marks bbasemester6= new Student_Marks(
    sub1: "International Marketing",
    sub2: "Marketing of Services",
    sub3: "Financial Institutions and Market",
    sub4: "Entrepreneurial Development",
    sub5: "Comprehensive viva-voce",
  );


  Student(this.name,this.address,this.id,this.mobile,this.course,this.student_Image);

  void update(String name, String address, String id, String mobile, String course,File image){
    this.name=name;
    this.address=address;
    this.id=id;
    this.mobile=mobile;
    this.course=course;
    this.student_Image=image;
  }

}

class Faculty{
  String? name;
  String? address;
  String? id;
  String? month;
  File? image;
  String? salary1;
  String? salary2;
  String? salary3;
  String? salary4;
  String? salary5;
  String? salary6;
  String? salary7;
  String? salary8;
  String? salary9;
  String? salary10;
  String? salary11;
  String? salary12;

  Faculty(this.name,this.address,this.id,this.month,this.image);
}

class College {
  String? email;
  String? password;
  String? college_Name;
  String? address;
  String? city;
  String? state;
  String? contry;
  String? phone;
  File? college_Image;
  List<Student> student_List = [];
  List<Faculty> faculty_List =[];
  final picker = ImagePicker();

  College(this.email,this.password);

  void input_Data(String cm,String ad,String cy,String st,String co,String ph){
    college_Name = cm;
    address = ad;
    city = cy;
    state = st;
    contry = co;
    phone = ph;
  }

}



