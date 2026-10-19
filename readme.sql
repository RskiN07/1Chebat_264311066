-Tabel Kamar-

CREATE TABLE kamar (
    id_kamar INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    no_kamar VARCHAR(10) NOT NULL UNIQUE,
    daya_va INT UNSIGNED NOT NULL,
    status_kamar ENUM('Terisi', 'Kosong')
        NOT NULL DEFAULT 'Kosong'
) ENGINE=InnoDB;

-Tabel Penghuni-
  
CREATE TABLE penghuni (
    id_penghuni INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama_penghuni VARCHAR(100) NOT NULL,
    no_hp VARCHAR(15),
    tanggal_masuk DATE NOT NULL
) ENGINE=InnoDB;

-Tabel Tagihan-

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

-CREATE-

INSERT INTO kamar
    (id_kamar, no_kamar, daya_va, status_kamar)
VALUES
    (1, 'A01', 1300, 'Terisi'),
    (2, 'A02', 900, 'Terisi'),
    (3, 'A03', 1300, 'Terisi');

INSERT INTO penghuni
    (id_penghuni, nama_penghuni, no_hp, tanggal_masuk)
VALUES
    (1, 'Neisya', '088103630458', '2025-01-10'),
    (2, 'Nashwa', '083117678815', '2026-08-25'),
    (3, 'Hosana', '082833872202', '2026-12-31');

INSERT INTO tagihan
    (id_tagihan, id_kamar, id_penghuni, periode,
     pemakaian_kwh, total_tagihan, status_pembayaran)
VALUES
    (1, 1, 1, '2026-09-01', 85.50, 128250.00, 'Lunas'),
    (2, 2, 2, '2026-09-01', 72.00, 108000.00, 'Belum Bayar'),
    (3, 3, 3, '2026-09-01', 91.25, 136875.00, 'Belum Bayar');

-READ-
    
SELECT * FROM kamar;

UPDATE tagihan
SET status_pembayaran = 'Lunas'
WHERE id_tagihan = 2;

-DELETE-

DELETE FROM tagihan
WHERE id_tagihan = 3;
