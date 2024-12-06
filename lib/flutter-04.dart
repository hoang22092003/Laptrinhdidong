import 'package:flutter/material.dart';

class BMIPage extends StatelessWidget {
  BMIPage({super.key});

  static final TextEditingController _weightController = TextEditingController();
  static final TextEditingController _heightController = TextEditingController();
  static final TextEditingController _bmiController = TextEditingController();
  static final TextEditingController _classificationController = TextEditingController();
  static final TextEditingController _genderController = TextEditingController();

  // Hàm tính BMI và phân loại
  void _calculateBMI() {
    if (_weightController.text.isNotEmpty && _heightController.text.isNotEmpty) {
      try {
        double weight = double.parse(_weightController.text); // Cân nặng (kg)
        double height = double.parse(_heightController.text); // Chiều cao (cm)

        // Chuyển chiều cao từ cm sang m
        double heightInMeters = height / 100;

        // Công thức tính BMI
        double bmi = weight / (heightInMeters * heightInMeters);

        // Cập nhật kết quả BMI
        _bmiController.text = bmi.toStringAsFixed(2);

        // Phân loại BMI
        String classification;
        if (bmi < 18.5) {
          classification = "Cân nặng thấp (gầy)";
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          classification = "Bình thường";
        } else if (bmi >= 25 && bmi <= 29.9) {
          classification = "Thừa cân";
        } else if (bmi >= 30 && bmi <= 34.9) {
          classification = "Béo phì độ I";
        } else if (bmi >= 35 && bmi <= 39.9) {
          classification = "Béo phì độ II";
        } else {
          classification = "Béo phì độ III";
        }

        // Cập nhật phân loại
        _classificationController.text = classification;

        // Kiểm tra giới tính và hiển thị BMI cho nam/nữ
        String gender = _genderController.text.toLowerCase();
        if (gender == 'male') {
          print('BMI của nam: ${bmi.toStringAsFixed(2)}');
        } else if (gender == 'female') {
          print('BMI của nữ: ${bmi.toStringAsFixed(2)}');
        } else {
          print('Giới tính không hợp lệ!');
        }
      } catch (e) {
        _bmiController.text = 'Lỗi: Vui lòng nhập số hợp lệ';
        _classificationController.text = '';
      }
    } else {
      _bmiController.text = '';
      _classificationController.text = '';
    }
  }

  // Hàm xóa giá trị
  void _clearAll() {
    _weightController.clear();
    _heightController.clear();
    _bmiController.clear();
    _classificationController.clear();
    _genderController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tính chỉ số BMI'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input cân nặng
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Cân nặng (kg)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
              onChanged: (value) => _calculateBMI(),
            ),

            SizedBox(height: 20),

            // Input chiều cao
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Chiều cao (cm)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
              onChanged: (value) => _calculateBMI(),
            ),

            SizedBox(height: 20),

            // Input giới tính
            TextField(
              controller: _genderController,
              decoration: InputDecoration(
                labelText: 'Giới tính (nam/nữ)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _calculateBMI(),
            ),

            SizedBox(height: 20),

            // Kết quả BMI
            TextField(
              controller: _bmiController,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Chỉ số BMI',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // Phân loại BMI
            TextField(
              controller: _classificationController,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Phân loại BMI',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),

            // Nút tính BMI
            ElevatedButton.icon(
              onPressed: _calculateBMI,
              icon: Icon(Icons.calculate),
              label: Text('Tính BMI'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),

            SizedBox(height: 20),

            // Nút xóa tất cả
            ElevatedButton.icon(
              onPressed: _clearAll,
              icon: Icon(Icons.refresh),
              label: Text('Xóa tất cả'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),

            SizedBox(height: 30),

            // Container hiển thị công thức
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Công thức tính BMI:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('BMI = Cân nặng (kg) / (Chiều cao (m) * Chiều cao (m))'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
