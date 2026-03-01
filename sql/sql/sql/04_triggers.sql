DELIMITER //
CREATE TRIGGER trg_KurangiStok
AFTER INSERT ON DetailPesanan
FOR EACH ROW
BEGIN
    UPDATE Produk 
    SET Stok = Stok - NEW.Jumlah 
    WHERE IdProduk = NEW.IdProduk;
END //

CREATE TRIGGER trg_KembalikanStok
AFTER UPDATE ON Pesanan
FOR EACH ROW
BEGIN
    IF NEW.StatusPesanan = 'Dibatalkan' AND OLD.StatusPesanan != 'Dibatalkan' THEN
        UPDATE Produk p
        JOIN DetailPesanan dp ON p.IdProduk = dp.IdProduk
        SET p.Stok = p.Stok + dp.Jumlah
        WHERE dp.IdPesanan = NEW.IdPesanan;
    END IF;
END //
DELIMITER ;
