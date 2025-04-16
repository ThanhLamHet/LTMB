void main(){
  //int : là kiểu số nguyên
  int x = 100;

  //double : Là kiểu số thực
  double y =100.5;

  //num: có thể chứa số nguyên hoặc số thực
  num z =10;
  num t =10.75;

  // Chuyển chuỗi sang số nguyên
  var one = int.parse('1');
  print(one==1?'TRUE':'FALSE');

  // Chuyển chuỗi sang số thực
  var onePointOne = int.parse('1.1');
  print(onePointOne==1.1);

  //Số nguyên => Chuỗi
  String oneAsString =1.toString();
  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString);
}