import '../HoaDonBanHang/HoaDon.dart';
import '../SanPham/DienThoai.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _dsDienThoai= [];
  List<HoaDon> _dsHoaDon= [];

  //Contructor 
  CuaHang(this._tenCuaHang, this._diaChi);

  //Getters 
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

  //Setters
  set tenCuaHang(String tenCuaHang) {
    if (tenCuaHang.isNotEmpty) {
      _tenCuaHang = tenCuaHang;
    }
  }

  set diaChi(String diaChi) {
    if (diaChi.isNotEmpty) {
      _diaChi = diaChi;
    }
  }

  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    _dsDienThoai.add(dienThoai);
  }

  //Cập nhật thông tin điện thoại 
  void capNhatThongTinDienThoai(String maDienThoai, DienThoai thongTinMoi) {
    for (var dt in _dsDienThoai) {
      if (dt.maDienThoai == maDienThoai) {
        dt.tenDienThoai = thongTinMoi.tenDienThoai;
        dt.giaNhap = thongTinMoi.giaNhap;
        dt.giaBan = thongTinMoi.giaBan;
        dt.slTonKho = thongTinMoi.slTonKho;
        dt.trangThai = thongTinMoi.trangThai;
        return; 
      }
    }
  }

  //Ngừng kinh doanh điện thoại 
  void ngungKinhDoanhDienThoai(String maDienThoai) {
    for (var dt in _dsDienThoai) {
    if (dt.maDienThoai == maDienThoai) {
      dt.trangThai = false;
      print('Điện thoại mã $maDienThoai đã được ngừng kinh doanh.');
      return;
    }
  }
  }

  //Tìm kiếm điện thoại 
  List<DienThoai> timKiemDienThoai({String? maDienThoai, String? tenDienThoai, String? hangSanXuat}) {
    List<DienThoai> ketQua = List.from(_dsDienThoai);
    if (maDienThoai != null) {
      ketQua = ketQua.where((dt) => dt.maDienThoai == maDienThoai).toList();
    }
    if (tenDienThoai != null) {
      ketQua = ketQua.where((dt) => dt.tenDienThoai.toLowerCase().contains(tenDienThoai.toLowerCase())).toList();
    }
    if (hangSanXuat != null) {
      ketQua = ketQua.where((dt) => dt.hangSanXuat.toLowerCase().contains(hangSanXuat.toLowerCase())).toList();
    }
    return ketQua;
  }

  void hienThiDanhSachHoaDon() {
    if (_dsHoaDon.isNotEmpty) {
      print('------- Danh Sách Hóa Đơn ---------');
      for (var hd in _dsHoaDon) {
        print('Mã hóa đơn: ${hd.maHoaDon}, Khách hàng: ${hd.tenKhachHang}, Tổng tiền: ${hd.tinhTongTien()}');
      }
    }
  }

  // Tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double tongDoanhThu = 0;
    for (var hd in _dsHoaDon) {
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        tongDoanhThu += hd.tinhTongTien();
      }
    }
    return tongDoanhThu;
  }

  // Tổng lợi nhuận theo khoảng thời gian 
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double tongLoiNhuan = 0;
    for (var hd in _dsHoaDon) {
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        tongLoiNhuan += hd.tinhLoiNhuanThucTe();
      }
    }
    return tongLoiNhuan;
  }

  // Tổng lợi nhuận theo khoảng thời gian 
  List<DienThoai> thongKeTopBanChay() {
  Map<String, int> soLuongBan = {};

  // Tổng hợp số lượng bán cho mỗi điện thoại
  for (var hd in _dsHoaDon) {
    String maDienThoai = hd.dtDuocBan.maDienThoai;
    int soLuongMua = hd.slMua;
    if (soLuongBan.containsKey(maDienThoai)) {
      soLuongBan[maDienThoai] = soLuongBan[maDienThoai]! + soLuongMua;
    } else {
      soLuongBan[maDienThoai] = soLuongMua;
    }
  }

  // Sắp xếp theo số lượng bán giảm dần
  List<MapEntry<String, int>> danhSachSapXep = soLuongBan.entries.toList();
    danhSachSapXep.sort((a, b) => b.value.compareTo(a.value));
    List<DienThoai> ketQua = [];
    for (var entry in danhSachSapXep) {
      String maDienThoai = entry.key;
      var dienThoai = _dsDienThoai.firstWhere((dt) => dt.maDienThoai == maDienThoai);
      ketQua.add(dienThoai);
    }
    return ketQua;
  }

  //Thống kê tồn kho 
  int thongKeTonKho() {
    int tongSoLuongTon = 0;
    for (var dt in _dsDienThoai) {
      tongSoLuongTon += dt.slTonKho;
    }
    return tongSoLuongTon;
  }

  // Thêm Hóa Đơn
  void themHoaDon(HoaDon hoaDon) {
    if (hoaDon.slMua > hoaDon.dtDuocBan.slTonKho) {
      throw Exception('Không đủ số lượng tồn kho cho sản phẩm ${hoaDon.dtDuocBan.tenDienThoai}');
    }
    for (var dt in _dsDienThoai) {
      if (dt.maDienThoai == hoaDon.dtDuocBan.maDienThoai) {
        dt.slTonKho -= hoaDon.slMua;
        break;
      }
    }
    _dsHoaDon.add(hoaDon);
    print('Thêm hóa đơn thành công với mã: ${hoaDon.maHoaDon}');
  }
}