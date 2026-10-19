Soal 2
-[CREATE]-

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

-[READ]-
    
SELECT * FROM kamar;
SELECT * FROM penghuni;
SELECT * FROM tagihan;

-[UPDATE]-
    
UPDATE tagihan
SET status_pembayaran = 'Lunas'
WHERE id_tagihan = 2;

-[DELETE]-

DELETE FROM tagihan
WHERE id_tagihan = 3;
