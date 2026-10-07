program Soal1;
uses crt;

var
  i, n : integer;
  harga : array[1..100] of real;
  diskon, total, totalBayar : real;
  // Pake array karena harga tiap barang harus DISIMPEN dulu, soalnya
  // nanti pas rincian kita mau nampilin ulang harga satu-satu.
  // Kalo cuma pake 1 variabel biasa, harga barang sebelumnya ketimpa. Hilang deh :(
  // Ukuran 1..100 = muat sampe 100 barang, udah lebih dari cukup lah ya

begin
  clrscr;
  // Bersihin layar dulu guys, biar tampilannya kinclong gak ada sisa-sisa tulisan lama

  writeln(' Berapa jumlah barang yang anda beli ? (dalam bilangan bulat) : ');
  readln(n);
  // Memberi tempat Input bagi pengguna :D ntar dimasukin ke variabel n

  total := 0;
  // Kosongin dulu guys, biar bisa ditambah per loop.
  // Bagaikan isi minyak: mulai dari nol, baru diisi pelan-pelan

  for i := 1 to n do
  begin
    writeln(' Masukkan Harga Barang ke-', i);
    readln(harga[i]);
    // Buat perintah For To, setiap loop bakalan ada ruang untuk input harga
    // sebanyak n ( jumlah belanjaan ). Harganya masuk ke harga[i] sesuai urutan

    total := total + harga[i];
    // Rumus untuk total: total yang lama + harga barang baru. Numpuk terus tiap loop
  end;

  if total < 100000 then
    diskon := 0
  else if (total >= 100000) and (total < 500000) then
    diskon := 0.10
  else
    diskon := 0.20;
  // Penentuan diskon pake if else yaa
  // < 100rb = zonk (0%), 100rb sampe sebelum 500rb = 10%, 500rb ke atas = 20% sultan :D
  // Ditulis 0.10 dan 0.20 karena di Pascal persen itu bentuk desimal ( 10% = 0.10 )

  totalBayar := total - (total * diskon);
  // Rumus total bayar SETELAH terkena Diskon ( jika ada )
  // Kalo diskon = 0 ya total - 0, jadi tetep aman gak error

  writeln('--------------RINCIAN BELANJA---------------');
  for i := 1 to n do
    writeln(' Barang ke-', i, ' Rp ', harga[i]:0:0);
  // Nampilin SELURUH belanjaan pake for to lagi, makanya tadi harga disimpen di array
  // ':0:0' artinya ga ada angka di belakang koma ( biar ga keluar format ilmiah 1.0E+05 )

  writeln(' Total Belanjaan adalah : Rp ', total:0:0);
  writeln();

  if diskon = 0 then
    writeln('Anda tidak mendapat diskon')
  else
    writeln('Anda mendapat diskon : ', diskon*100:0:0, '%');
  // Penentuan jika ga dapet diskon ama dapet diskon.
  // Karena diskon itu bilangan riil ( 0.10 ), aku kali 100 dulu biar jadi 10,
  // terus ':0:0' buat buang angka di belakang koma. Baru tambahin tanda % deh

  writeln(' Total Bayar anda adalah : Rp ', totalBayar:0:0);
  // Terakhir, tampilin total yang beneran harus dibayar. Selesai dah! :D
end.