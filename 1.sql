SOAL 1
-[Tabel Kamar]-

CREATE TABLE kamar (
    id_kamar INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    no_kamar VARCHAR(10) NOT NULL UNIQUE,
    daya_va INT UNSIGNED NOT NULL,
    status_kamar ENUM('Terisi', 'Kosong')
        NOT NULL DEFAULT 'Kosong'
) ENGINE=InnoDB;

-[Tabel Penghuni]-
  
CREATE TABLE penghuni (
    id_penghuni INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama_penghuni VARCHAR(100) NOT NULL,
    no_hp VARCHAR(15),
    tanggal_masuk DATE NOT NULL
) ENGINE=InnoDB;

-[Tabel Tagihan]-

CREATE TABLE tagihan (
    id_tagihan INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_kamar INT UNSIGNED NOT NULL,
    id_penghuni INT UNSIGNED NOT NULL,
    periode DATE NOT NULL,
    pemakaian_kwh DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    total_tagihan DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    status_pembayaran ENUM('Belum Bayar', 'Lunas')
        NOT NULL DEFAULT 'Belum Bayar',

    CONSTRAINT fk_tagihan_kamar
        FOREIGN KEY (id_kamar)
        REFERENCES kamar(id_kamar)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_tagihan_penghuni
        FOREIGN KEY (id_penghuni)
        REFERENCES penghuni(id_penghuni)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_tagihan_kamar_periode
        UNIQUE (id_kamar, periode)
) ENGINE=InnoDB;
