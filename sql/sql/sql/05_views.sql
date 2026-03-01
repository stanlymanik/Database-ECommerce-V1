CREATE VIEW View_LaporanPenjualan AS
SELECT 
    p.IdPesanan, 
    u.NamaLengkap AS Pembeli, 
    p.TanggalPesan, 
    p.TotalBayar, 
    p.StatusPesanan
FROM Pesanan p
JOIN Users u ON p.IdUser = u.IdUser;

CREATE VIEW View_StokHampirHabis AS
SELECT IdProduk, NamaProduk, Stok 
FROM Produk 
WHERE Stok < 5;
