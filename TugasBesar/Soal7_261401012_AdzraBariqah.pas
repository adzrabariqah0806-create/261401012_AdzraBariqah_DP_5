program Soal7;
uses crt;

var
  kode: char;
  jam: integer;
  tarif: longint;      // longint biar nggak overflow
  // kode = jenis kendaraan ( 1 huruf makanya char ), jam = lama parkir
  // tarif pake longint karena integer biasa di Pascal batasnya cuma sekitar 32 ribu,
  // sedangkan tarif kita bisa nyampe 50000. Kalo ga pake longint, angkanya bisa ngaco :O

begin
  clrscr;
  // Bersihin layar dulu guys, biar kinclong :D

  write('Kode kendaraan (M/K/B): ');
  readln(kode);
  write('Lama parkir (jam)     : ');
  readln(jam);
  // Kode masuk ke variabel kode, lama parkir masuk ke variabel jam

  case upcase(kode) of
  // upcase itu ngubah huruf kecil jadi BESAR, jadi user ngetik 'm' atau 'M'
  // sama-sama dianggep 'M'. Jadi kita ga perlu nulis 2 versi di case. Hemat tenaga~

    'M': begin
           if jam > 10 then
             tarif := 30000
           else
             tarif := 5000 + (jam - 1) * 3000;
         end;
         // Rumus tarif: jam pertama harga dasar ( 5000 ), terus tiap jam
         // setelahnya nambah 3000. Makanya ( jam - 1 ), karena jam pertama
         // udah masuk harga dasar. Kalo parkir lebih dari 10 jam, tarifnya
         // dipatok flat 30000 aja ( ada batas maksimalnya, ga naik terus )

    'K': begin
           if jam > 10 then
             tarif := 10000
           else
             tarif := 2000 + (jam - 1) * 1000;
         end;
         // Polanya sama persis kayak M, cuma angkanya beda:
         // dasar 2000, tambahan 1000 per jam, flat 10000 kalo > 10 jam

    'B': begin
           if jam > 10 then
             tarif := 50000
           else
             tarif := 10000 + (jam - 1) * 5000;
         end;
         // Sama lagi polanya: dasar 10000, tambahan 5000 per jam, flat 50000 kalo > 10 jam

  else
    begin
      writeln('Kode kendaraan tidak valid!');
      tarif := 0;
      // Jaring pengaman: kalo user ngetik selain M/K/B masuknya kesini.
      // tarif diisi 0 biar nanti ga ke-print, dan juga biar variabelnya ga berisi nilai ngaco
    end;
  end;

  if tarif > 0 then
    writeln('Tarif parkir: Rp ', tarif);
  // Tarif cuma ditampilin kalo > 0, alias kodenya valid.
  // Jadi kalo kode salah, user ga dikasih tau "Tarif parkir: Rp 0". Aneh kan?

  readln;
  // Nahan layar biar nggak langsung nutup
end.