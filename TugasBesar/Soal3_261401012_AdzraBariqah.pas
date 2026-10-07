program Soal3;
uses crt;

var
  n, kategori, i: integer;
  // n = batas angka, kategori = pilihan user ( 1 ganjil / 2 genap ), i = penghitung loop

begin
  clrscr;
  // Bersihin layar dulu guys, biar kinclong :D

  // Tanya user: mau sampai angka berapa & deret apa
  write('Masukkan N: ');
  readln(n);
  write('Kategori (1: Ganjil, 2: Genap): ');
  readln(kategori);
  // Input n sama kategori masuk ke variabelnya masing-masing, nanti dipake buat nyaring angka

  // Header dicetak SEKALI aja, makanya ditaruh sebelum loop
  // Kalo ditaruh di dalem loop, judulnya bakal ke-print berkali-kali. Capek bacanya :(
  if kategori = 1 then
    writeln('===== Deret Ganjil =====')
  else
    writeln('===== Deret Genap =====');

  // Mulai dari 0, soalnya i naik duluan di dalam loop ( jadi angka pertama = 1 )
  i := 0;

  // Ulang terus selama i belum nyampe n
  while i < n do
  begin
    // Naikin i DI AWAL, biar nggak infinite loop pas kena continue
    // Kalo naikinnya di akhir, pas continue kejadian baris itu ke-skip,
    // i ga pernah nambah, dan loop muter terus selamanya. Ngeri :O
    i := i + 1;

    // Satpam 1: kalau pilih ganjil tapi i-nya genap ( sisa bagi 2 = 0 ), skip!
    // 'continue' artinya langsung lompat ke putaran loop berikutnya
    if (kategori = 1) and (i mod 2 = 0) then
      continue;

    // Satpam 1 juga: kalau pilih genap tapi i-nya ganjil ( sisa bagi 2 <> 0 ), skip!
    // 'mod' itu operator sisa bagi, jadi 7 mod 2 = 1 ( ganjil ), 8 mod 2 = 0 ( genap )
    if (kategori = 2) and (i mod 2 <> 0) then
      continue;

    // Satpam 2: kelipatan 5 ( sisa bagi 5 = 0 ) juga di-skip, apapun kategorinya
    // Jadi 5, 10, 15, dst. ga bakal pernah muncul
    if i mod 5 = 0 then
      continue;

    // Lolos semua satpam, baru deh ditampilin ( + spasi biar nggak nempel )
    write(i, ' ');
    // Pake write bukan writeln biar angkanya berderet ke samping, ga turun-turun
  end;

  writeln;   // Pindah baris biar rapi

  readln;    // Nahan layar biar nggak langsung nutup
end.