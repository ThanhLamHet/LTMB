/*
Chuỗi là một tập hợp ký tự UTF-16
*/

void main(){
  var s1='Min cute';
  var s2 ="Minhaydoi";

  //Chèn giá trị của một biểu thức , biến vào trong một chuỗi: ${....}
  double diemToan = 9.5;
  double diemVan = 9.2;
  var s3 = 'Xin Chào $s1, bạn đã đạt tổng điểm là:${diemToan+diemVan}';
  print(s3);

  //tạo ra chuỗi nằm ở nhiều dòng
  var s4 ='''
      Dòng 1
      Dòng 2
      Dòng 3
  ''';

  var s5 ="""
      Dòng 1
      Dòng 2
      Dòng 3
  """;

  var s6 ='Đây là một đoạn \n văn bản!';
  print(s6);

  var s7 =r'Đây là một đoạn \n văn bản!';//raw
  print(s7);

  var s8 ="chuỗi 1" +"chuỗi 2";
  print(s8);

  var s9 = "Chuỗi"
            "này "
            'là '
            'một chuỗi';
  print(s9);          
}