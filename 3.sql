Soal 3

SELECT
    k.no_kamar,
    p.nama_penghuni,
    SUM(t.pemakaian_kwh) AS total_pemakaian_kwh,
    SUM(t.total_tagihan) AS total_tagihan_lunas
FROM tagihan AS t
INNER JOIN kamar AS k
    ON t.id_kamar = k.id_kamar
INNER JOIN penghuni AS p
    ON t.id_penghuni = p.id_penghuni
WHERE t.status_pembayaran = 'Lunas'
GROUP BY
    k.id_kamar,
    k.no_kamar,
    p.id_penghuni,
    p.nama_penghuni;
