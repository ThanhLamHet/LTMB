import 'package:flutter/material.dart';

class FormBasicDemo extends StatefulWidget {

  @override

  State<StatefulWidget> createState() => _FormBasicDemoSate();

}

class _FormBasicDemoSate extends State<FormBasicDemo> {

  // Sử dụng Global key để truy cập form

  final _formKey = GlobalKey<FormState>();

  final _fullnameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  String? _name;

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text("Form cơ bản")),

      body: Padding(

        padding: EdgeInsets.all(16.0),

        // Form là widget chứa và quản lý các trường nhập liệu

        // Key: được sử dụng để truy cập vào trạng thái của Form

        // Phương thức validate() kiểm tra tính hợp lệ của tất cả trường

        // Phương thức save() gọi hàm onSaved của mỗi trường

        // Phương thức reset() đặt lại giá trị của tất cả trường

        child: Form(

          key: _formKey,

          child: Column(

            children: [

              // TextFormField là phiên bản mở rộng của TextField tích hợp với Form

              // Validator là hàm kiểm tra tính hợp lệ của dữ liệu

              // Controller cho phép truy cập và điều khiển giá trị

              // obscureText cho phép ẩn văn bản

              // AutovalidateMode điều khiển thời điểm validation được kích hoạt

              TextFormField(

                controller: _fullnameController,

                decoration: InputDecoration(

                  labelText: "Họ và tên",

                  hintText: "Nhập họ và tên của bạn",
                  prefixIcon: Icon(Icons.person),

                  border: OutlineInputBorder(),

                ),

                onSaved: (value) {

                  _name = value;

                },

                autovalidateMode: AutovalidateMode.onUserInteraction,

                validator: (value) {

                  if (value == null || value.isEmpty) {

                    return 'Vui lòng nhập họ và tên';

                  }

                  return null;

                },

              ),

              SizedBox(height: 20),

              // Email field

              TextFormField(

                controller: _emailController,

                decoration: InputDecoration(

                  labelText: 'Email',

                  hintText: 'example@gmail.com',

                  prefixIcon: Icon(Icons.email),

                  border: OutlineInputBorder(),

                ),

                keyboardType: TextInputType.emailAddress,

                validator: (value) {

                  if (value == null || value.isEmpty) {

                    return 'Vui lòng nhập email';

                  }

                  if (!RegExp(

                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',

                  ).hasMatch(value)) {

                    return 'Email không hợp lệ';

                  }

                  return null;

                },

              ),
              SizedBox(height: 30),

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  hintText: "Nhập vào địa chỉ của bạn",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  // Thêm các điều kiện kiểm tra định dạng số điện thoại khác nếu cần
                  // Ví dụ: kiểm tra độ dài, chỉ chứa số, v.v.
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Số điện thoại chỉ được chứa chữ số';
                  }
                  if (value.length < 10 || value.length > 11) {
                    return 'Số điện thoại phải có 10 hoặc 11 chữ số';
                  }
                  return null; // T
                },
              ),

              SizedBox(height: 20),

              // Password field

              TextFormField(

                controller: _passwordController,

                decoration: InputDecoration(

                  labelText: 'Mật khẩu',

                  hintText: 'Nhập mật khẩu',

                  prefixIcon: Icon(Icons.lock),

                  suffixIcon: IconButton(

                    icon: Icon(

                      _obscurePassword

                          ? Icons.visibility

                          : Icons.visibility_off,

                    ),

                    onPressed: () {

                      setState(() {

                        _obscurePassword = !_obscurePassword;

                      });

                    },

                  ),

                  border: OutlineInputBorder(),

                ),

                obscureText: _obscurePassword,

                validator: (value) {

                  if (value == null || value.isEmpty) {

                    return 'Vui lòng nhập mật khẩu';

                  }

                  if (value.length < 6) {

                    return 'Mật khẩu phải có ít nhất 6 ký tự';

                  }

                  return null;

                },

              ),



              Row(

                children: [

                  ElevatedButton(

                    onPressed: () {

                      if (_formKey.currentState!.validate()) {

                        _formKey.currentState!.save();

                        ScaffoldMessenger.of(context).showSnackBar(

                          SnackBar(content: Text("Xin chào $_name")),

                        );

                      }

                    },

                    child: Text("Submit"),

                  ),

                  SizedBox(width: 20),

                  ElevatedButton(

                    onPressed: () {

                      _formKey.currentState!.reset();

                      setState(() {

                        _name = null;

                      });

                    },

                    child: Text("Reset"),

                  ),

                ],

              ),

            ],

          ),

        ),

      ),

    );

  }

}

