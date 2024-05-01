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

### Data Manipülasyon Komutları 
- `Select:` Varitabanındaki tablolardan kayıtları çeker.
- `Update:` Bir tablodaki kaydın bir ya da daha fazla alanını günceller, değiştirir.
- `Delete:` Bir tablodan kayıt siler.
- `Insert:` Tabloya yeni kayıt ekler.
- `Truncate:` Tablonun içini boşaltır.

### Veritabanı Manipülasyon Komutları
- `Create:` Bir veritabanı nesnesi oluşturur.
- `Alter:` Bir veritabanı nesnesinin özelliğini değiştirir.
- `Drop:` Bir veritabanı nesnesini siler.

## Data Manipülasyon Komutları 

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

ID için otomatik artan işaretlemiştik. Değerleri yazarken ise kendimiz değer göndermeye çalıştığımız için hata aldık. (Girdiğimiz kolonlardan ID ve değer olarak girdiğimiz 5'i silmemiz gerekiyor.)

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

```SQL
WHERE BIRTHDATE BETWEEN '19900101' AND '19981231'

/* WHERE BIRTHDATE >= '19900101' AND BIRTHDATE <='19981231' */
```

```SQL
/* ŞEHRİ İSTANBUL VEYA İZMİR OLANLARI GETİRECEK */
WHERE CITY = 'İSTANBUL' OR CITY = 'İZMİR'
/* WHERE CITY IN ('İSTANBUL', 'İZMİR') */
```

## DISTINCT KOMUTU

Tekrar eden satırları tekilleştirmek amacıyla kullandığımız bir komut.

```SQL
SELECT DISTINCT
KOLON1, KOLON2, KOLON3,...
FROM TABLOADI
WHERE <ŞARTLAR>
```


![alt text](images/image-14.png)

81 ilden 999 tane müşterimiz var 

![alt text](images/image-15.png)
bu komut ile şehirleri tekilleştirdik

![alt text](images/image-16.png)
İstanbul için ilçeleri tekilleştirdik. Normalde İstanbul'dan 36 müşterimiz varken DISTINCT komutu ile ilçeleri tekilleştirdiğimizde 22 satırgörüntüledik.

## ORDERED BY KOMUTU 

```SQL
SELECT
KOLON1, KOLON2, KOLON3,...
FROM TABLOADI
WHERE <ŞARTLAR>
ORDER BY KOLON1 ASC, KOLON2 DESC, KOLON3 ASC
```
`ASC:` küçükten büyüğe sırala

`DESC:` büyükten küçüğe sırala

![alt text](images/image-17.png)

isimleri A'dan Z'ye sıralı bir şekilde getirdi (Neye göre sıralamak istediğimizi belirtmediğimizde varsayılan olarak ASC alır.)

![alt text](images/image-18.png)

önce şehre göre sonra isme göre sıraladık.

![alt text](images/image-19.png)

WHERE şartı ile sadece İstanbul'daki müşterileri önce ilçeye daha sonra müşterilerinin ismine göre sıraladık.

![alt text](images/image-20.png)

kolon adını yazmak yerine bu şekilde de yazabiliriz (5. kolon olan DISTRICT'e göre sıralandı)

## TOP KOMUTU 

veri setinin tamamını görmek yerine bir kısmını görmemizi sağlar

```SQL
SELECT TOP N
KOLON1, KOLON2, KOLON3,...
FROM TABLOADI
WHERE <ŞARTLAR>
```

![alt text](images/image-21.png)

İsme göre sıralanmış yüzde 1'lik kısım.



# Aggregate Functions (Sum, Min, Max, Avg, Count)

```SQL
SELECT
SUM(PRICE), COUNT(ID), MIN(PRICE), MAX(PRICE), AVG(PRICE)
FROM TABLOADI
```

![alt text](images/image-22.png)

satır sayısını tek satırda getirdi

![alt text](images/image-23.png)

minimum satış adetini gösterdi

![alt text](images/image-24.png)

maximum satış adetini de göstermesini istedim

![alt text](images/image-25.png)

toplam satılan ürün sayısı (AMOUNT alanının toplamı)

![alt text](images/image-26.png)

bir satışta ortalama kaç ürün sattığımı bulmak istiyorum: toplam satılan ürün sayısı / toplam satış adeti

![alt text](images/image-27.png)

TOTALPRICE alanına göre görelim

![alt text](images/image-28.png)

WHERE şartı ekleyebiliriz


# Group By

```SQL
SELECT
KOLON1 ,KOLON2...
SUM(PRICE), COUNT(ID), MIN(PRICE), MAX(PRICE), AVG(PRICE)
FROM TABLOADI
GROUP BY KOLON1, KOLON2...
```

![alt text](images/image-29.png)

agragate functionın içersinde geçtiği bir sql cümlesinde alan kullanıyorsan bu agragate function içerisinde geçmeli ya da GROUP BY ile vermen gerekiyor

![alt text](images/image-30.png)

alanı agragate function içinde yazdık

![alt text](images/image-31.png)

GROUP BY kullanarak getirdik

![alt text](images/image-32.png)

kolonları isimlendirmek istersek AS komutu ile yapabiliriz


![alt text](images/image-33.png)

en çok ciro yapan şehirlere göre sırala (sadece CITY ve TOTALPRICE kolonlarını görmek istiyorum)





## BİR MAĞAZANIN GÜN BAZLI SATIŞ RAKAMLARINI GETİRME

![alt text](images/image-34.png)


```SQL
SELECT CONVERT(DATE, '2019-01-01 08:07:24.000')
```
satırını çalıştırdığımda sade tarihi bana döndürüyor 

```SQL
SELECT CONVERT(TIME, '2019-01-01 08:07:24.000')
```
satırını çalıştırdığımda sade saati bana döndürüyor

```SQL
SELECT CONVERT(DATETIME, '2019-01-01 08:07:24.000')
```
hem tarih hem saati döndürüyor


![alt text](images/image-35.png)

DATE2 olarak çeviridğim alan sadece tarih olarak geldi

![alt text](images/image-36.png)

DATE2 olarak yeni bir alan ekledik

![alt text](images/image-37.png)

DATE2 satırları boş bunu güncelleyelim

![alt text](images/image-38.png)

DATE2 alanı güncellendi

![alt text](images/image-39.png)

ANKARA'da 2019-01-01 tarhindeki satışları getirdi

![alt text](images/image-40.png)

yine aynı sorun ile karşılaştığımız için GROUP BY kullanarak bu sorunu düzelteceğiz

![alt text](images/image-41.png)

ANKARA'daki hangi tarihte toplam ne kadar ciro yaptığımızı getirdik

![alt text](images/image-42.png)

mağazanın gün bazlı satış rakamlarını getirdik


## BİR GÜNÜN MAĞAZA BAZLI SATIŞ RAKAMLARINI GETİRME

![alt text](images/image-43.png)

bu tarihte 54 ilde satış gerçekleşmiş

![alt text](images/image-44.png)

bir tarihe göre mağazaların cirolarını getirmiş olduk




## MAĞAZALARIN AYLARA GÖRE SATIIŞ RAKAMLARINI GETİRME

![alt text](images/image-45.png)

SALES tablosuna MONTHNAME_ alanı ekledik

![alt text](images/image-46.png)

```SQL
SELECT DATEPART(MONTH, '2019-08-02')
```
 ay nurmarasını gönderiyor

 ![alt text](images/image-47.png)

bit UPDATE cümlesi yazdık OCAK ayı olanlar 01.OCAK olarak güncellendi

![alt text](images/image-48.png)

bütün aylar için güncelledik

![alt text](images/image-49.png)

aylara göre satışları getirdik

![alt text](images/image-50.png)

her bir şehir için ayrı ayrı görmek istersek

![alt text](images/image-51.png)

veya aya göre şehirleri görmek istersek



## ÜRÜN KATEGORİLERİNE GÖRE SATIŞ RAKAMLARINI GETİRME

![alt text](images/image-52.png)

![alt text](images/image-53.png)

sadece CATEGORY1 altında görmek istersek daha az satır çekmiş oluyoruz




## MAĞAZALARIN MÜŞTERİ SAYILARINI GETİRME

Bir müşteri mağazadan tek seferde birden fazla ürün alabilir. Müşteri 10 ürün aldıysa bu bizim için 10 satıra tekabül ederken aslında bu bizim için 1 müşteridir. Yani 10 satırı bizim 1 müşteri olarak saymamız gerekir. Bu şekilde mağazaya giren tekil müşteri sayısını hesap etmeliyiz.


![alt text](images/image-54.png)

ADANA için 306 müşteri varmış

![alt text](images/image-55.png)

hangi şehirde kaç fiş kesildi ve kaç ürün alınmış

![alt text](images/image-56.png)

müşterileri de tekilleştirdik 


## BELLİ BİR CİRONUN ÜZERİNDE SATIŞ YAPAN MAĞAZALARI GETİRME

![alt text](images/image-57.png)

hiçbir sonuç getirmiyor

![alt text](images/image-58.png)

çünkü satır satır TOTALPRICE alanına bakıyoruz ve 40000 den büyük bir değer olmadığı için sonuç alamıyoruz

benim istediğim bir şehrin toplam cirosu 40000 den büyük mü

![alt text](images/image-59.png)

bunu yapınca da hata aldık 

aggregate fonksiyonu  GROUP BY içinde kullanıyorsam bunu WHERE şartı ile kullanamıyorum

bunu yapmak istersek HAVING kullanarak yapabiliyormuşuz

![alt text](images/image-60.png)

cirosu 40000 den fazla olan 33 şehrimiz varmış

![alt text](images/image-61.png)

wWHERE şartı ile belirttiğim şehirlerden cirosu 40000 den fazla olanları getirdi

aggregate fonksiyonu kolon olarak çekmek istediğimde ve buna şart vereceksem bunu HAVING ile yapmam gerekiyor

![alt text](images/image-62.png)