program Soal6;
uses crt;

var
  tugas, uts, uas, kehadiran, nilaiAkhir: real;
  indeks: char;
  // tugas, uts, uas = nilai mentah dari user, kehadiran = persen hadir
  // Semuanya real biar bisa input desimal ( misal 87.5 ), nilaiAkhir juga real
  // indeks = huruf A-E, cuma 1 karakter makanya tipe char

begin
  clrscr;
  // Bersihin layar dulu guys, biar kinclong :D

  // Input semua nilai + kehadiran
  write('Nilai Tugas : ');
  readln(tugas);
  write('Nilai UTS   : ');
  readln(uts);
  write('Nilai UAS   : ');
  readln(uas);
  write('Kehadiran (%): ');
  readln(kehadiran);
  // Empat angka ini masuk ke variabelnya masing-masing, nanti dipake buat ngitung nasib kita :P

  // Hitung nilai akhir pakai bobot 30% + 30% + 40%
  nilaiAkhir := tugas * 0.30 + uts * 0.30 + uas * 0.40;
  // Persen ditulis desimal ( 30% = 0.30 ), total bobotnya pas 100% ( 0.30 + 0.30 + 0.40 = 1 )
  // Kehadiran SENGAJA ga ikut dihitung di sini, dia cuma jadi syarat lulus di bawah

  // Tentuin indeks huruf, cek dari yang paling tinggi dulu
  // Urutan itu PENTING! If else if dicek dari atas ke bawah, begitu ada yang cocok
  // sisanya langsung diabaikan. Contoh nilai 90: lolos >= 85, jadi 'A' dan selesai.
  // Kalo urutannya kebalik ( mulai dari >= 50 ), nilai 90 bakal nyangkut jadi 'D'. Kacau :(
  if nilaiAkhir >= 85 then
    indeks := 'A'
  else if nilaiAkhir >= 75 then
    indeks := 'B'
  else if nilaiAkhir >= 60 then
    indeks := 'C'
  else if nilaiAkhir >= 50 then
    indeks := 'D'
  else
    indeks := 'E';
  // Yang ga lolos semua syarat di atas ( di bawah 50 ) otomatis jatuh ke 'E'

  writeln('Nilai Akhir : ', nilaiAkhir:0:2);
  writeln('Indeks      : ', indeks);
  // ':0:2' = 2 angka di belakang koma. Spasi di tulisan 'Indeks      :' buat ngerapihin titik dua

  // Lulus kalau nilai >= 60 DAN hadir >= 80%, dua-duanya harus kepenuhi
  // Pake 'and' artinya kalo salah satu aja gagal, langsung TIDAK LULUS
  // Contoh: nilai 90 tapi hadir 70% tetep tidak lulus. Rajin masuk juga penting guys!
  if (nilaiAkhir >= 60) and (kehadiran >= 80) then
    writeln('Status      : LULUS')
  else
    writeln('Status      : TIDAK LULUS');

  readln;   // Nahan layar biar nggak langsung nutup
end.