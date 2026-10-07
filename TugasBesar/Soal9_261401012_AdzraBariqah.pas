program TahunKabisat;
uses crt;

var
  tahun, bulan, hari: integer;
  kabisat: boolean;

begin
  clrscr;

  // tanya tahun & bulan ke user
  write('Tahun        : ');
  readln(tahun);
  write('Bulan (1-12) : ');
  readln(bulan);

  // cek kabisat: habis dibagi 400, ATAU habis dibagi 4 tapi nggak habis dibagi 100
  // "habis dibagi" = sisa bagi (mod) nya 0
  kabisat := (tahun mod 400 = 0) or ((tahun mod 4 = 0) and (tahun mod 100 <> 0));

  // tentuin jumlah hari sesuai bulan
  case bulan of
    1, 3, 5, 7, 8, 10, 12: hari := 31;   // bulan 31 hari
    4, 6, 9, 11          : hari := 30;   // bulan 30 hari
    2: begin
         // februari: tergantung kabisat atau nggak
         if kabisat then
           hari := 29
         else
           hari := 28;
       end;
  else
    hari := 0;   // bulan di luar 1-12 = nggak valid
  end;

  // tampilin hasil (kalau hari = 0 berarti bulannya salah)
  if hari = 0 then
    writeln('Bulan tidak valid!')
  else
  begin
    writeln('Jumlah hari: ', hari);
    if kabisat then
      writeln('(', tahun, ' adalah tahun kabisat)')
    else
      writeln('(', tahun, ' bukan tahun kabisat)');
  end;

  readln;   // nahan layar biar nggak langsung nutup
end.