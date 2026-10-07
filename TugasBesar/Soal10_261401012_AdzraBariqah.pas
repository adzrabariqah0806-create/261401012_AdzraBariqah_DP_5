program InputHari;
uses crt;

var
  angka: integer;
  // angka = nomor hari yang diketik user ( 1 sampe 7 ), bulat aja makanya integer

begin
  clrscr;
  // Bersihin layar dulu guys, biar kinclong :D

  write('Masukkan angka (1-7): ');
  readln(angka);
  // Minta user ngetik angka, terus disimpen ke variabel angka
  // Pake write ( bukan writeln ) biar kursor nunggu di sebelah tulisan, ga turun baris

  case angka of
  // Case itu kayak if else if tapi versi rapi. Nilai angka dicocokin ke 1, 2, 3, dst.
  // yang cocok langsung dijalanin, sisanya dilewatin. Cocok banget buat pilihan banyak gini
    1: writeln('Hari Senin');
    2: writeln('Hari Selasa');
    3: writeln('Hari Rabu');
    4: writeln('Hari Kamis');
    5: writeln('Hari Jumat');
    6: writeln('Hari Sabtu');
    7: writeln('Hari Minggu');
    // Tiap angka punya pasangan harinya masing-masing. Cuma 1 baris ya, jadi ga perlu begin end
  else
    writeln('Angka tidak valid!');
    // Jaring pengaman: kalo user ngetik di luar 1-7 ( misal 0, 8, atau -3 ) masuknya kesini
  end;

  readln;
  // Nahan layar biar nggak langsung nutup
end.