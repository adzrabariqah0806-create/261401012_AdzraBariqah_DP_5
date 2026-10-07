program Soal4;
uses crt;

var
  pilihan: integer;
  a, b: real;
  ulang: char;
  // pilihan = nomor menu yang dipilih user
  // a, b = dua angka yang mau dihitung, pake real biar bisa desimal juga
  // ulang = jawaban user mau ngitung lagi apa nggak ( cuma 1 huruf, makanya tipe char )

begin
clrscr;
// Bersihin layar dulu guys, biar kinclong :D

  repeat
    // Seluruh kalkulator dibungkus repeat, jadi menu bakal muncul lagi
    // dan lagi sampai user bilang udahan. Minimal jalan 1x juga, cocok buat menu
    writeln('=== KALKULATOR ===');
    writeln('1. Penjumlahan');
    writeln('2. Pengurangan');
    writeln('3. Perkalian');
    writeln('4. Pembagian Real');
    writeln('5. DIV & MOD');
    write('Pilih operasi: ');
    readln(pilihan);
    // Nampilin daftar menu, terus pilihan user disimpen di variabel pilihan

    write('Angka pertama: ');
    readln(a);
    write('Angka kedua  : ');
    readln(b);
    // Input dua angka masuk ke a dan b. Dua spasi di 'kedua  :' itu biar titik duanya sejajar, rapi~

    case pilihan of
    // Case itu kayak if else if tapi versi rapi. Cocok kalo pilihannya banyak
    // Nilai pilihan dicocokin ke 1, 2, 3, dst. yang cocok langsung dijalanin
      1: writeln('Hasil: ', a + b:0:2);
      2: writeln('Hasil: ', a - b:0:2);
      3: writeln('Hasil: ', a * b:0:2);
      // ':0:2' artinya tampilin 2 angka di belakang koma, misal 5 jadi 5.00

      4: begin
           if b = 0 then
             writeln('Error: tidak bisa dibagi 0!')
           else
             writeln('Hasil: ', a / b:0:2);
         end;
         // Pembagian real pake '/'. WAJIB dicek dulu b-nya nol apa nggak,
         // karena dibagi 0 itu bikin program crash. Satpam dulu sebelum ngitung!

      5: begin
           if trunc(b) = 0 then //trunc itu buang koma dibelakang, bulat nya aja diambil
             writeln('Error: tidak bisa dibagi 0!')
           else
           begin
             writeln('DIV: ', trunc(a) div trunc(b));
             writeln('MOD: ', trunc(a) mod trunc(b));
           end;
         end;
         // DIV = hasil bagi bulat ( 7 div 2 = 3 ), MOD = sisa baginya ( 7 mod 2 = 1 )
         // Kedua operator ini cuma jalan buat bilangan bulat, padahal a dan b kita real.
         // Makanya di-trunc dulu. Contoh: 7.9 jadi 7, bukan dibulatin ke 8 ya!
         // Cek trunc(b) = 0 juga penting: input 0.5 itu bukan 0, tapi pas di-trunc jadi 0.
         // Kalo ga dicek trunc-nya, bisa crash juga

    else
      writeln('Pilihan tidak valid!');
      // 'else' di case = jaring pengaman, kalo user ngetik selain 1-5 masuknya kesini
    end;

    writeln;
    write('Apakah ingin melakukan perhitungan lagi? (Y/T): ');
    readln(ulang);
    writeln;
    // Nanya mau lanjut apa nggak, jawabannya disimpen di variabel ulang

  until (ulang = 'T') or (ulang = 't');
  // Loop berhenti kalo user jawab T atau t ( huruf besar & kecil dua-duanya dihitung )
  // Jawaban selain itu ( Y, y, atau ngasal ) otomatis lanjut lagi
end.