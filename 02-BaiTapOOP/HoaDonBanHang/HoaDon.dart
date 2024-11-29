import '../SanPham/DienThoai.dart';

class HoaDon{
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dtDuocBan;
  int _slMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _sdtKhach;

  //Constructor
  HoaDon(this._maHoaDon,this._ngayBan,this._dtDuocBan, this._slMua, this._giaBanThucTe, this._tenKhachHang, this._sdtKhach) ;

  //Getters
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dtDuocBan => _dtDuocBan;
  int get slMua => _slMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get sdtKhach => _sdtKhach;

  //Setters
  set maHoaDon(String maHoaDon){
    if(maHoaDon.isNotEmpty && RegExp(r"^HD-\d{3}$").hasMatch(maHoaDon)){
      _maHoaDon=maHoaDon;
    }
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isBefore(DateTime.now()) || ngayBan.isAtSameMomentAs(DateTime.now())) {
      _ngayBan = ngayBan;
    }
  }

  set slMua(int slMua) {
    if (slMua > 0 && slMua <= _dtDuocBan.slTonKho) {
      _slMua = slMua;
    }
  }

  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe > 0) {
      _giaBanThucTe = giaBanThucTe;
    }
  }

  set tenKhachHang(String tenKhachHang) {
    if (tenKhachHang.isNotEmpty) {
      _tenKhachHang = tenKhachHang;
    }
  }

  set sdtKhach(String sdtKhach) {
    if (RegExp(r"^\d{10}$").hasMatch(sdtKhach)) {
      _sdtKhach = sdtKhach;
    }
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return giaBanThucTe * slMua;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    return (giaBanThucTe - dtDuocBan.giaNhap) * slMua;
  }

  void hienThiThongTin() {
    print('--- Thông Tin Hóa Đơn ---');
    print('Mã hóa đơn: $maHoaDon');
    print('Ngày bán: ${ngayBan.toIso8601String()}');
    print('Tên khách hàng: $tenKhachHang');
    print('Số điện thoại khách: $sdtKhach');
    print('Sản phẩm: $dtDuocBan');
    print('Số lượng mua: $slMua');
    print('Giá bán thực tế: $giaBanThucTe');
    print('Tổng tiền: ${tinhTongTien()}');
    print('Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}');
  }
}