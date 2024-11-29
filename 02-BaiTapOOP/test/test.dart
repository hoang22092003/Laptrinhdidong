
import '../HoaDonBanHang/HoaDon.dart';
import '../QuanLy/CuaHang.dart';
import '../SanPham/DienThoai.dart';
void main() {
  List<DienThoai> danhSachDienThoai = [];
  List<HoaDon> danhSachHoaDon = [];

  CuaHang cuaHang = CuaHang( 'Cửa Hàng ABC', '123 Đường A',);
  //1. Tạo và quản lý thông tin điện thoại: 
  print('------------ Quản lý điện thoại -------------');

  DienThoai dienThoai1 = DienThoai( 'DT-001', 'iPhone 14', 'Apple' , 20000000, 25000000, 10, true);
  DienThoai dienThoai2 = DienThoai( 'DT-002', 'Samsung Galaxy S23', 'Samsung', 18000000, 23000000, 15, true);
  cuaHang.themDienThoai(dienThoai1);
  cuaHang.themDienThoai(dienThoai2);

  // Cập nhật thông tin điện thoại
  print('Cập nhật thông tin điện thoại:');
  cuaHang.capNhatThongTinDienThoai('DT-001', DienThoai( 'DT-001', 'iPhone 14 Pro', 'Apple',22000000, 28000000, 12, true ));

  // Kiểm tra validation
  print('Kiểm tra validation (mã không hợp lệ):');
  try {
    cuaHang.themDienThoai(DienThoai( '', 'Xiaomi Mi 13', 'Xiaomi', 15000000, 18000000, 20, true));
  } catch (e) {
    print('Lỗi: $e');
  }

  // Hiển thị tìm kiếm điện thoại 
  cuaHang.timKiemDienThoai().forEach((dt) {
    print('Tên: ${dt.tenDienThoai}, Trạng thái: ${dt.trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}');
  });

  //2. Tạo và quản lý hóa đơn:  
  print('------------- Quản lý hóa đơn ---------------');

  var hoaDon1 = HoaDon('HD-001', DateTime.now(), dienThoai1, 5, 27000000, 'Nguyễn Văn A', '0987654321',);

  cuaHang.themHoaDon(hoaDon1);

  // Kiểm tra tồn kho
  print('Kiểm tra tồn kho:');
  try {
    var hoaDon2 = HoaDon( 'HD-002', DateTime.now(), cuaHang.timKiemDienThoai(maDienThoai: 'DT-001').first, 50, 27000000, 'Nguyễn Văn B', '0912345678');
  } catch (e) {
    print('Lỗi: $e');
  }

  cuaHang.hienThiDanhSachHoaDon();

  // 3. Thống kê báo cáo
  print('--- Thống kê báo cáo ---');

  // Doanh thu theo thời gian
  double doanhThu = cuaHang.tinhTongDoanhThu(
    DateTime(2024, 1, 1),
    DateTime(2024, 12, 31),
  );
  print('Tổng doanh thu: $doanhThu');

  // Lợi nhuận theo thời gian
  double loiNhuan = cuaHang.tinhTongLoiNhuan(
    DateTime(2024, 1, 1),
    DateTime(2024, 12, 31),
  );
  print('Tổng lợi nhuận: $loiNhuan');

  // Top bán chạy
  print('Thống kê top bán chạy:');
  var topBanChay = cuaHang.thongKeTopBanChay();
  for (var dt in topBanChay) {
    print('${dt.tenDienThoai} (${dt.maDienThoai})');
  }

  // Báo cáo tồn kho
  int tongTonKho = cuaHang.thongKeTonKho();
  print('Tổng tồn kho: $tongTonKho');
}