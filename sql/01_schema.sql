CREATE TABLE Users (
    IdUser INT AUTO_INCREMENT PRIMARY KEY,
    NamaLengkap VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(255),
    Role ENUM('Admin','Customer') DEFAULT 'Customer',
    Telepon VARCHAR(20),
    Alamat VARCHAR(255)
);

CREATE TABLE KategoriProduk (
    IdKategori INT AUTO_INCREMENT PRIMARY KEY,
    NamaKategori VARCHAR(100)
);

CREATE TABLE Produk (
    IdProduk INT AUTO_INCREMENT PRIMARY KEY,
    IdKategori INT,
    NamaProduk VARCHAR(100),
    Deskripsi TEXT,
    Harga DECIMAL(12,2),
    Stok INT,
    Gambar VARCHAR(255),
    FOREIGN KEY (IdKategori) REFERENCES KategoriProduk(IdKategori)
);

CREATE TABLE Pesanan (
    IdPesanan INT AUTO_INCREMENT PRIMARY KEY,
    IdUser INT,
    TanggalPesan DATE,
    StatusPesanan ENUM('Menunggu Pembayaran','Dikemas','Dikirim','Selesai','Dibatalkan'),
    TotalBayar DECIMAL(12,2),
    AlamatPengiriman VARCHAR(255),
    FOREIGN KEY (IdUser) REFERENCES Users(IdUser)
);

CREATE TABLE DetailPesanan (
    IdDetail INT AUTO_INCREMENT PRIMARY KEY,
    IdPesanan INT,
    IdProduk INT,
    Jumlah INT,
    Harga DECIMAL(12,2),
    FOREIGN KEY (IdPesanan) REFERENCES Pesanan(IdPesanan),
    FOREIGN KEY (IdProduk) REFERENCES Produk(IdProduk)
);

CREATE TABLE Pembayaran (
    IdPembayaran INT AUTO_INCREMENT PRIMARY KEY,
    IdPesanan INT,
    MetodePembayaran VARCHAR(50),
    JumlahBayar DECIMAL(12,2),
    TanggalBayar DATE,
    StatusPembayaran ENUM('Lunas','Belum Bayar'),
    FOREIGN KEY (IdPesanan) REFERENCES Pesanan(IdPesanan)
);

CREATE TABLE Kurir (
    IdKurir INT AUTO_INCREMENT PRIMARY KEY,
    NamaKurir VARCHAR(100)
);

CREATE TABLE Pengiriman (
    IdPengiriman INT AUTO_INCREMENT PRIMARY KEY,
    IdPesanan INT,
    IdKurir INT,
    NoResi VARCHAR(50),
    StatusPengiriman ENUM('Dalam Perjalanan','Terkirim','Gagal'),
    FOREIGN KEY (IdPesanan) REFERENCES Pesanan(IdPesanan),
    FOREIGN KEY (IdKurir) REFERENCES Kurir(IdKurir)
);

CREATE TABLE Keranjang (
    IdKeranjang INT AUTO_INCREMENT PRIMARY KEY,
    IdUser INT,
    TanggalDibuat DATE,
    FOREIGN KEY (IdUser) REFERENCES Users(IdUser)
);

CREATE TABLE DetailKeranjang (
    IdDetailKeranjang INT AUTO_INCREMENT PRIMARY KEY,
    IdKeranjang INT,
    IdProduk INT,
    Jumlah INT,
    Subtotal DECIMAL(12,2),
    FOREIGN KEY (IdKeranjang) REFERENCES Keranjang(IdKeranjang),
    FOREIGN KEY (IdProduk) REFERENCES Produk(IdProduk)
);

CREATE TABLE Ulasan (
    IdUlasan INT AUTO_INCREMENT PRIMARY KEY,
    IdUser INT,
    IdProduk INT,
    Rating INT,
    Komentar TEXT,
    TanggalUlasan DATE,
    FOREIGN KEY (IdUser) REFERENCES Users(IdUser),
    FOREIGN KEY (IdProduk) REFERENCES Produk(IdProduk)
);

CREATE TABLE Wishlist (
    IdWishlist INT AUTO_INCREMENT PRIMARY KEY,
    IdUser INT,
    IdProduk INT,
    FOREIGN KEY (IdUser) REFERENCES Users(IdUser),
    FOREIGN KEY (IdProduk) REFERENCES Produk(IdProduk)
);

CREATE TABLE Supplier (
    IdSupplier INT AUTO_INCREMENT PRIMARY KEY,
    NamaSupplier VARCHAR(100),
    Kontak VARCHAR(50)
);

CREATE TABLE RiwayatLogin (
    IdLog INT AUTO_INCREMENT PRIMARY KEY,
    IdUser INT,
    WaktuLogin DATETIME,
    IPAddress VARCHAR(50),
    FOREIGN KEY (IdUser) REFERENCES Users(IdUser)
);
