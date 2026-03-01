INSERT INTO Users (NamaLengkap, Email, Password, Role, Telepon, Alamat) VALUES
('Budi Santoso', 'budi@gmail.com', 'pass123', 'Customer', '08123456789', 'Jl. Merdeka No. 1'),
('Siti Aminah', 'siti@gmail.com', 'pass456', 'Customer', '08122233344', 'Jl. Mawar No. 12'),
('Admin George', 'admin@unai.edu', 'admin789', 'Admin', '08112233445', 'Kampus UNAI');

INSERT INTO KategoriProduk (NamaKategori) VALUES
('Elektronik'), ('Fashion'), ('Kesehatan'), ('Olahraga');

INSERT INTO Produk (IdKategori, NamaProduk, Deskripsi, Harga, Stok, Gambar) VALUES
(1, 'Laptop Lenovo', 'Ryzen 5, 8GB RAM', 8500000, 10, 'laptop.jpg'),
(2, 'Kaos Polos', 'Bahan Cotton Combed', 55000, 50, 'kaos.jpg'),
(1, 'Mouse Wireless', 'Silent click 2.4Ghz', 120000, 25, 'mouse.jpg');

INSERT INTO Kurir (NamaKurir) VALUES
('JNE'), ('J&T'), ('SiCepat'), ('GoSend');

INSERT INTO Supplier (NamaSupplier, Kontak) VALUES
('PT. Maju Jaya', '021-555666'),
('CV. Sumber Makmur', '0812-999-000');
