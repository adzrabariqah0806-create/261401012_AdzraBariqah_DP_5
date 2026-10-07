program Soal5;
uses crt;

var
  m, n, i, j: integer;
  nilai, jumlah, rata: real;
  lulus, tidakLulus: integer;
  // m = jumlah mahasiswa, n = jumlah tugas per mahasiswa
  // i = penghitung loop LUAR ( mahasiswa ), j = penghitung loop DALAM ( tugas )
  // nilai = nilai 1 tugas, jumlah = total nilai 1 mahasiswa, rata = rata-ratanya
  // lulus & tidakLulus = counter buat rekap di akhir ( bulat, soalnya ngitung orang )

begin
  clrscr;
  // Bersihin layar dulu guys, biar kinclong :D

  // Tanya jumlah mahasiswa ( M ) dan jumlah tugas ( N )
  write('Jumlah mahasiswa (M): ');
  readln(m);
  write('Jumlah tugas (N): ');
  readln(n);
  // Dua angka ini yang nentuin berapa kali loop muter nanti

  // Counter lulus & nggak lulus mulai dari 0 dulu
  // Bagaikan papan skor di awal pertandingan, masih 0-0
  lulus := 0;
  tidakLulus := 0;

  // Loop LUAR: per mahasiswa ( makanya batasnya M )
  for i := 1 to m do
  begin
    // Reset jumlah tiap ganti mahasiswa, biar nilai mhs sebelumnya nggak kebawa
    // Kalo lupa di-reset, total mahasiswa ke-2 numpuk sama punya mahasiswa ke-1. Kacau :(
    jumlah := 0;
    writeln('--- Mahasiswa ke-', i, ' ---');

    // Loop DALAM: per tugas ( makanya batasnya N )
    // Ibarat 1 mahasiswa masuk, terus nilainya diinput satu-satu sampe tugas ke-N
    // Loop dalem muter penuh dulu, baru loop luar lanjut ke mahasiswa berikutnya
    for j := 1 to n do
    begin
      write('Nilai tugas ke-', j, ': ');
      readln(nilai);
      jumlah := jumlah + nilai;   // Tambahin NILAI-nya, bukan angka 1
      // Beda ya sama counter! Counter itu +1, kalo ini numpuk nilainya
    end;

    // Rata-rata = total nilai dibagi banyak tugas
    rata := jumlah / n;
    // Pake '/' karena hasilnya bisa desimal, makanya variabel rata bertipe real
    write('Rata-rata: ', rata:0:2, ' -> ');
    // ':0:2' = tampilin 2 angka di belakang koma. Pake write ( bukan writeln )
    // biar status LULUS / TIDAK LULUS nempel di sebelahnya

    // Rata-rata >= 65 berarti lulus, selain itu nggak lulus
    if rata >= 65 then
    begin
      writeln('LULUS');
      lulus := lulus + 1;
      // Counter lulus nambah 1 tiap ada mahasiswa yang lolos
    end
    else
    begin
      writeln('TIDAK LULUS');
      tidakLulus := tidakLulus + 1;
      // Yang gagal masuk sini, counter tidakLulus yang nambah
    end;
    writeln;
    // Baris kosong biar antar mahasiswa ada jarak, enak dibaca
  end;

  // Rekap akhir setelah semua mahasiswa selesai
  // Ditaruh DI LUAR loop biar ke-print sekali aja, pas semua data udah kekumpul
  writeln('Total LULUS       : ', lulus);
  writeln('Total TIDAK LULUS : ', tidakLulus);

  readln;   // Nahan layar biar nggak langsung nutup
end.