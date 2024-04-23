## Veritabanı nedir?

Temel anlamda içerisinde belli bir formatta sorgulanabilir şekilde veri barındıran yazılımlardır.

Verileri listeler haalinde tablo ve satırlarda tutan her yapı aslında kendi çaıpında veritabanıdır.

### Veritabanı nelerden oluşur?

- Tablolar
- Sütunlar
- Satırlar
- Indexler

### Veritabanı sunucu nedir?

- Bir yazılımdır.
- Network üzerinden bir porttan sistemi dinler ve gelen komutlara göre istenilen veriyi gönderir.
- SQL Server, MYSQL, PostgreSQL, Oracle gibi sistemler veritabanı sunucusudur.
- Access, Excel gibi yapılar ise bir sunucu değildir.


# Temel SQL Komutları

## Data Manipülasyon Komutları 
- `Select:` Varitabanındaki tablolardan kayıtları çeker.
- `Update:` Bir tablodaki kaydın bir ya da daha fazla alanını günceller, değiştirir.
- `Delete:` Bir tablodan kayıt siler.
- `Insert:` Tabloya yeni kayıt ekler.
- `Truncate:` Tablonun içini boşaltır.

## Veritabanı Manipülasyon Komutları
- `Create:` Bir veritabanı nesnesi oluşturur.
- `Alter:` Bir veritabanı nesnesinin özelliğini değiştirir.
- `Drop:` Bir veritabanı nesnesini siler.


### Select Komutu

```SQL
SELECT
KOLON1, KOLON2, KOLON3,...
FROM TABLOADI
WHERE<ŞARTLAR>
```
![alt text](images/image.png)

her tabloda benzersiz alan oluşturalım ve bunu otomatik artan olarak işaretleyim

![alt text](images/image-1.png)

Bir E-Ticaret sitesi oluşturmak için ETRADE database'i oluşturduk ve CUSTOMERS tablosu ekledik.

New Query dedikten sonra çıkan sayfada SQL cümlesi yazıyoruz.

![alt text](images/image-2.png)

SQL komutlarını yazdıktan sonra Run (veya F5) basarsak CUSTOMERS tablosundaki verileri getirecek.

![alt text](images/image-3.png)

'*' yerine gelmesini istediğimiz kolonları yazarsak sadece o kolonlar gelecektir.

![alt text](images/image-4.png)

kolon isimlerini yazarken boşluk, türkçe ve özel karakterler (_ dışında) kullanmıyoruz.

### Insert Komutu

```SQL
INSERT INTO TABLOADI
(KOLON1, KOLON2, KOLON3,...)
VALUES
(DEĞER1, DEĞER2, DEĞER3,...)
```

![alt text](images/image-5.png)

ID için otomatik artan işaretlemiştik. Değerleri yazarken ise kendimiz değer göndermeye çalıştığımız için hata aldık. (Girdiğimiz kolonlardan ID ve değer olarak girdiğim 5'i silmemiz gerekiyor.)

### Update Komutu

```SQL
UPDATE TABLOADI
SET COLUMN = VALUE1, COLUMN2 = VALUE2...
WHERE <ŞARTLAR>
```

![alt text](images/image-6.png)

NATION sütunu ekledik ve UPDATE komutunu yazdıktan sona bu sütünu güncelledik

![alt text](images/image-7.png)

AGE kolonu da ekledik ve herkesin yaşını 35 olarak güncelledik ama yaş değerleri herkes için aynı değil. Yaşı hesaplayarak getirebilir miyim?

![alt text](images/image-8.png)

Bunu DATEDIFF komutu ile yapabiliyorum.

![alt text](images/image-9.png)

Şimdiki tarihi almak istersek son parametreye GETDATE() yazabiliriz.


### Delete Komutu

```SQL
DELETE
FROM TABLOADI
WHERE <ŞARTLAR>
```
![alt text](images/image-10.png)

Tablodan her şeyi sildik

### Truncate Komutu

```SQL
TRUNCATE TABLE TABLOADI
```

En son DELETE komutu ile tablodan her şeyi silmiştik.

INSERT ile tabloya yeni müşteriler eklediğimizde otomatik artan alan varsa kaldığı yerde devam eder.

TRUNCATE komutu ile de tabloyu ilk haline getiriyoruz.

## Where Şartı

```SQL
SELECT
KOLON1, KOLON2, KOLON3,...
FROM TABLOADI
WHERE<ŞARTLAR>
```

Sadece İstanbul'da yaşayan müşterileri çekmek isteyebilirim:

```SQL
SELECT
KOLON1, KOLON2, KOLON3,...
FROM TABLOADI
WHERE<CITY = 'İSTANBUL'>
```

|        |  | 
|--------------|-------|
| =        | Eşittir | 
|<>        | Eşit değildir  |
| >         | Büyüktür  | 
|  <      | Küçüktür |
|  >=      | Büyüktür ya da eşittir | 
|   <=     | Küçüktür ya da eşittir | 
|  BETWEEN      | Arasındadır | 
|   LIKE      | İle başlar, İle biter, İçerir | 
|   IN     | İçindedir |  
|  NOT LIKE      | İle başlamaz, İle bitmez, İçermez |  
|   NOT IN     | İçinde değildir | 
 

![alt text](images/image-11.png)

Sadece İstanul'da yaşayan müşterileri çektik.

```SQL
/* İSMİ ALAN İÇERENLER */
WHERE CUSTOMERNAME LIKE '%ALAN%'
```

```SQL
/* İSMİ ALİ İLE BAŞLAMAYANLAR */
WHERE CUSTOMERNAME NOT LIKE 'ALİ%'
```

```SQL
/* 'CITY = İSTANBUL' İFADESİNE TEKABÜL EDECEK */
WHERE CITY IN ('İSTANBUL')
```

```SQL
/* ŞEHRİ İSTANBUL YA DA ANKARA OLANLARI GETİR */
WHERE CITY IN ('İSTANBUL', 'ANKARA')
```

```SQL
/* 'CITY = İSTANBUL' İFADESİNE TEKABÜL EDECEK */
WHERE CITY IN ('İSTANBUL')
```

![alt text](images/image-12.png)

GENDER'ın alan tipini değişştirmek istediğimde sistem izin vermedi.

Tools -> Options -> Designers -> Prevent saving changes that require table re-creation ifadesinden tik işaretini kaldırdığımızda tabloyu edit etmemize izin verecek

![alt text](images/image-13.png)

UPDATE komutu içinde bir WHERE şartı kulllandım

NOT: WHERE şartı INSERT komutu içinde de kullanılabilir ama onun kullanımı biraz daha karmaşık.

## AND / OR Operatörleri



|    AND OPERATÖRÜ      |    OR OPERATÖRÜ | 
|--------------|-------|
| ✔️ A = A AND B = B  ✔️       | ✔️ A = A OR B = B ✔️| 
| ❌ A = C AND B = B  ❌        | ✔️ A = C OR B = B  ✔️ | 
| ❌ A = A AND B = C  ❌       | ✔️ A = A OR B = C ✔️ | 
|❌ A = C AND B = D  ❌       | ❌ A = C OR B = D  ❌ | 


```SQL
/* ŞEHRİ İSTANBUL VE İLÇESİ BEYLİKDÜZÜ OLAN MÜŞTERİLERİ GETİRECEK */
WHERE CITY = 'İSTANBUL' AND DISTRICT = 'BEYLİKDÜZÜ'
```

```SQL
/* BİR KİŞİNİN İLÇESİ HEM BEYLİKDÜZÜ HEM DE ESENLER OLAMAZ. HİÇBİR KAYIT GETİRMEYECEK */
WHERE CITY = 'İSTANBUL' AND DISTRICT = 'BEYLİKDÜZÜ' AND 'ESENLER'
```
