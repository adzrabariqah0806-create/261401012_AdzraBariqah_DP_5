program VerifikasiPassword;

uses crt;

var
  passwordRahasia : string;
  inputPassword   : string;
  percobaan       : integer;
  // passwordRahasia = kunci yang bener, inputPassword = tebakan si pengguna
  // percobaan = penghitung udah berapa kali nyoba (bagaikan nomor antrian)

begin
  clrscr;
  // Bersihin layar dulu guys, biar login-nya kinclong :D

  // Kata sandi rahasia kita tentuin duluuu, terus percobaan mulai dari 0 ya
  passwordRahasia := 'pascal123';
  percobaan := 0;
  // Karena tipe datanya string, ditulis pake tanda kutip ' ' yaa

  writeln('===========================================');
  writeln('       SISTEM LOGIN SEDERHANA');
  writeln('===========================================');
  writeln('Anda memiliki maksimal 3 kali percobaan.');
  writeln;
  // Ngasih tau pengguna dulu kalo kesempatannya cuma 3. Jangan asal nebak :P

  { Loop repeat-until untuk maksimal 3 kali percobaan }
  repeat
    percobaan := percobaan + 1;
    // Tambah total percobaan, start di 0 terus +1 tiap loop
    // Jadi loop pertama = percobaan 1, dst. Ibarat ngitung tiap kali ngetuk pintu

    write('Percobaan ke-', percobaan, ' - Masukkan kata sandi: ');
    readln(inputPassword);
    // Ini nampilin udah percobaan ke berapa, terus inputnya dibaca masuk ke
    // variabel inputPassword buat nanti dibandingin ama passwordRahasia

    // Cek pake if else, bener ga passwordnya?
    if (inputPassword = passwordRahasia) then
    begin
      writeln;
      writeln('Login Berhasil! Selamat Datang');
      break;
      // Berhenti kalau udah bener! Pake break biar langsung keluar dari loop,
      // ga perlu nunggu sampe percobaan ke-3. Hemat waktu :D
    end
    else
    begin
      writeln('Kata sandi salah! Sisa percobaan: ', 3 - percobaan);
      writeln;
      // Lanjut kalau masih salah. Karena jatah percobaan ada 3,
      // sisa kesempatan = 3 dikurang percobaan yang udah kepake
    end;

  until (percobaan >= 3);
  // Loop jalan SAMPAI kondisi benar (benar = berhenti)
  // Repeat-until itu kebalikan while: ngulang selama kondisinya SALAH,
  // dan baru berhenti pas kondisinya jadi BENER ( percobaan udah 3 )
  // Plus, repeat selalu jalan minimal 1x karena ngecek kondisinya di BELAKANG

  // KALAU gagal 3 kali ( percobaan ampe 3 ) dan input password beda ama password rahasia maka..
  if (percobaan >= 3) and (inputPassword <> passwordRahasia) then
  begin
    writeln('===========================================');
    writeln('Akses Ditolak! Akun Terkunci.');
    writeln('===========================================');
  end;
  // Kenapa harus dicek dua kondisi? Soalnya kalo cuma percobaan >= 3,
  // orang yang bener pas percobaan ke-3 juga bakal ikut ke-lock. Kasian :(
  // Makanya ditambah syarat password-nya HARUS masih salah ( <> artinya tidak sama dengan )

  readln;
  // Nahan layar biar ga langsung nutup, tunggu pengguna pencet Enter dulu
end.