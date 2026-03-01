DELIMITER //
CREATE PROCEDURE sp_TambahProduk(
    IN p_IdKategori INT,
    IN p_Nama VARCHAR(100),
    IN p_Harga DECIMAL(12,2),
    IN p_Stok INT
)
BEGIN
    INSERT INTO Produk (IdKategori, NamaProduk, Harga, Stok)
    VALUES (p_IdKategori, p_Nama, p_Harga, p_Stok);
END //

CREATE PROCEDURE sp_UpdateStok(
    IN p_IdProduk INT,
    IN p_StokBaru INT
)
BEGIN
    UPDATE Produk SET Stok = p_StokBaru WHERE IdProduk = p_IdProduk;
END //

CREATE PROCEDURE sp_HapusUser(IN p_IdUser INT)
BEGIN
    DELETE FROM Users WHERE IdUser = p_IdUser;
END //
DELIMITER ;
