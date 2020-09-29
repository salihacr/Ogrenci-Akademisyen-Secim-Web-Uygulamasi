<h1 align="center">
  Bilgisayar Mühendisliği Proje Seçimi Öğrenci Akademisyen Eşleştirme Uygulaması
</h1>

Proje ASP.NET framework ve Sql Server tabanlı bir web uygulamasıdır. Bilgisayarınızda çalıştırmak için şu adımları gerçekleştiriniz.
<ol>
  <li> Sql Server üzerinde bir veritabanı oluşturun. Sonrasında New Query i seçip <a href="https://github.com/salihacr/Ogrenci-Akademisyen-Tez-Secim-Web-Uygulamasi/blob/master/ProjeSonTest/database-script/db-script.sql">şu kodları</a> yapıştırın ve execute edin(çalıştırın).</li>
<li> Veritabanı oluştuktan sonra, projeyi Visual Studio (2017 veya üzeri) açın. Proje ana dizininde bulunan <b>"Web Config"</b> dosyasını açın.
<p align="center">
  <img src="https://github.com/salihacr/Ogrenci-Akademisyen-Tez-Secim-Web-Uygulamasi/blob/master/ProjeSonTest/project-images/web-config.PNG">
</p>
  Buradaki data source kısmına Sql Server name (adını) yazınız. Inıtal Catalog'a da "oluşturduğunuz veritabanı ismi" giriniz. 
</li>
  <li> Projeyi çalıştırıp ilgili incelemeyi veya düzenlemeyi yapabilirsiniz.</li>
</ol>

<h2 align="center">
  Proje Hakkında
</h2>

Projede iki ayrı kullanıcı tipine ait (admin/user) panelleri bulunmaktadır. Sistem kullanıcıları sadece kendisi için akademisyen seçimi yapabilir.
Admin yani yöneticiler ise kendisini seçen öğrencileri görüntüleyebilir. Sisteme dilediği kadar dönem, kullanıcı, akademisyen verisi ekleyip güncelleyebilir.
Dönemleri aktif pasif edebilir, sistemde istediği tüm verileri tek bir operasyon ile silebilir.

<h4 align="left">
  Kullanıcı Girişi
</h4>
<p>
  Normal kullanıcılar onlara tanımlanmış olan email ve şifre ile sisteme giriş yaparlar. Yetkili kullanıcılar ise sisteme giriş yaparken akademisyen olduğunu işaret eden
  seçim kutusunu işaretlemek zorundadırlar.
  <img src="https://github.com/salihacr/Ogrenci-Akademisyen-Tez-Secim-Web-Uygulamasi/blob/master/ProjeSonTest/project-images/login.PNG">
</p>

<h4 align="left">
  Admin Paneli
</h4>
<p>
  Admin panelide kendi içinde iki kısma ayrılmaktadır, yetkisiz akademisyenler yalnızca kendilerini seçen öğrencilerin listesini görebilirken, yetkili akademisyenler veya sistem
  yetkilileri Ekle Sil Güncelle Listele (CRUD) işlemlerinin tamamını yapabilmektedirler.
  
  <img src="https://github.com/salihacr/Ogrenci-Akademisyen-Tez-Secim-Web-Uygulamasi/blob/master/ProjeSonTest/project-images/acd.PNG">
  <img src="https://github.com/salihacr/Ogrenci-Akademisyen-Tez-Secim-Web-Uygulamasi/blob/master/ProjeSonTest/project-images/acd4.PNG">
  <img src="https://github.com/salihacr/Ogrenci-Akademisyen-Tez-Secim-Web-Uygulamasi/blob/master/ProjeSonTest/project-images/acd2.PNG">
  <img src="https://github.com/salihacr/Ogrenci-Akademisyen-Tez-Secim-Web-Uygulamasi/blob/master/ProjeSonTest/project-images/acd3.PNG">
</p>
<p>Kendi senaryolarınıza göre projeyi düzenleyip kaynak belirtmek şartı ile kullanabilirsiniz.</p>
