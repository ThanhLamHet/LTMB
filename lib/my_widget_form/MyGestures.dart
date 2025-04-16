import "package:flutter/material.dart";

class MyGestures extends StatelessWidget {
  const MyGestures({super.key});

  @override
  Widget build(BuildContext context) {
    // Tra ve Scaffold - widget cung cap bo cuc Material Design co ban
    // Man hinh
    return Scaffold(
      // Tiêu đề của ứng dụng
      appBar: AppBar(
        title: Text("App 02"),
      ),
      backgroundColor: Colors.white,

      body: Center(child: Column(
        children: [
          SizedBox(height: 50,),

          GestureDetector(
            onTap: (){
              print('widget đã đc chạm');
            },
            onDoubleTap: (){
              print('double click');
            },
            onLongPress: (){
              print ('widget dc an giữ');
            },
            onPanUpdate: (details){
              print('Kéo - Di chuyển:  S${details.delta}');
            },
            child: Container(
              
              width: 100,
              height: 100,
              color: Colors.cyan,
              child: Center(child: Text('Chạm vào me!!'),),
            ),
          ),



          SizedBox( height: 20,),
          FloatingActionButton(
            onPressed: null,

            child: const Icon(Icons.add),

          ),



        ],
      )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){print("pressed");},
        child: const Icon(Icons.add_ic_call),
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
      ]),
    );
  }
}
