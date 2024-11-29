class DienThoai{
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _slTonKho;
  bool trangThai;

  //constructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat, this._giaNhap, this._giaBan, this._slTonKho, this.trangThai);

  //Getters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get slTonKho => _slTonKho;

  //Setters
  set maDienThoai(String maDienThoai){
    if(maDienThoai.isNotEmpty && RegExp(r"^DT-\d{3}$").hasMatch(maDienThoai)){
      _maDienThoai=maDienThoai;
    }
  }

  set tenDienThoai(String tenDienThoai){
    if(tenDienThoai.isNotEmpty){
      _tenDienThoai=tenDienThoai;
    }
  }

  set hangSanXuat(String hangSanXuat){
    if(hangSanXuat.isNotEmpty){
      _hangSanXuat=hangSanXuat;
    }
  }

  set giaNhap(double giaNhap){
    _giaNhap = (giaNhap>0)? giaNhap: _giaNhap;
  }

  set giaBan(double giaBan){
    _giaBan = (giaBan>0 && giaBan>giaNhap)? giaBan: _giaBan;
  }

  set slTonKho(int slTonKho){
    _slTonKho = (slTonKho>=0)? slTonKho: _slTonKho;
  }

  //Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return (giaBan - giaNhap) * slTonKho;
  }

  //Phương thức hiển thị thông tin 
  void hienThiThongTin(){
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print(' Số lượng tồn kho: $_slTonKho');
    print('Trạng thái: ${trangThai ? 'Còn Kinh Doanh': 'Không Con Kinh Doanh'}');
  }

  //Phương thức kiểm tra có thể bán không (còn hàng và đang kinh doanh) 
  bool kiemTraCoTheBan() {
  return slTonKho > 0 && trangThai;
}
}