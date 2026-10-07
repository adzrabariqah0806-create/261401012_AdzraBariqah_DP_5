program Soal8;
uses crt;

var
  gol: char;
  jam: integer;
  pokok, lembur, bonus, total: longint;
  // gol = golongan karyawan ( 1 huruf makanya char ), jam = total jam kerja
  // pokok, lembur, bonus, total = komponen gaji. Pake longint karena nominalnya jutaan,
  // integer biasa batasnya cuma sekitar 32 ribu. Bisa overflow kalo dipaksa :O

begin
  clrscr;
  // Bersihin layar dulu guys, biar kinclong :D

  write('Golongan (A/B/C): ');
  readln(gol);
  write('Total jam kerja  : ');
  readln(jam);
  // Golongan masuk ke variabel gol, jam kerja masuk ke variabel jam

  // Gaji pokok sesuai golongan
  case upcase(gol) of
  // upcase ngubah huruf kecil jadi BESAR, jadi 'a' dan 'A' sama-sama dianggap 'A'
    'A': pokok := 1500000;
    'B': pokok := 2000000;
    'C': pokok := 2500000;
    // Makin tinggi golongan, makin gede gaji pokoknya. Naik pangkat itu indah~
  else
    pokok := 0;
    // Jaring pengaman: kalo golongan di luar A/B/C, gaji pokoknya 0
    // biar variabel pokok ga berisi nilai ngaco
  end;

  // Lembur kalau lebih dari 40 jam
  if jam > 40 then
    lembur := (jam - 40) * 20000
  else
    lembur := 0;
  // Yang dihitung lembur cuma jam SETELAH 40 jam pertama, makanya ( jam - 40 )
  // Contoh: kerja 45 jam berarti lembur 5 jam, 5 x 20000 = 100000
  // Kalo ga lebih dari 40 jam, lembur diisi 0 ( jangan dikosongin ya, nanti ikut kejumlah ngaco )

  // Bonus khusus golongan C yang kerja > 50 jam
  if (upcase(gol) = 'C') and (jam > 50) then
    bonus := 100000
  else
    bonus := 0;
  // Pake 'and' jadi dua-duanya HARUS kepenuhi: golongan C DAN jam kerja lebih dari 50
  // Golongan C tapi cuma kerja 50 jam atau kurang? Gagal dapet bonus. Sabar yaa :D
  // upcase dipake lagi disini biar 'c' kecil tetep kebaca

  total := pokok + lembur + bonus;
  // Total gaji = gaji pokok + lembur + bonus. Tinggal dijumlahin semua

  writeln('Gaji Pokok : Rp ', pokok);
  writeln('Lembur     : Rp ', lembur);
  writeln('Bonus      : Rp ', bonus);
  writeln('Total Gaji : Rp ', total);
  // Nampilin rincian satu-satu. Spasi di tiap label buat ngerapihin titik dua

  readln;
  // Nahan layar biar nggak langsung nutup
end.