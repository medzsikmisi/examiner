# examiner

Gyakorló program az ICDL vizsgára való felkészüléshez

## Használat

A release résznél le kell tölteni a .zip fájlt, kicsomagolni, majd futtatni. Ezután kér egy kódot, amit a gyakorlásvezető ad meg a diákoknak.

## Kód előállítása
1. csv fájl készítése a megadott formátumban
2. a fájl feltöltése a [https://catbox.moe/](fájlmegosztó oldalra)
3. alul megjelenik egy hasonló formátumú link: `https://files.catbox.moe/8vjph2.csv`
4. a linkből ki kell szedni a / jel és a ".csv" közötti részt, ezt kell megadni a vizsgázóknak (jelen esetben ezt: `8vjph2`)


## Megfelelő formátum
A legelső sorban csak a legelső megzőt kell kitölteni, ez fogja tartalmazni a vizsga címét
A második sor tartalmazza a vizsgához szükséges adatok neveit (ezek bármik lehetnek, mert a program nem használja fel őket)
A harmadik sortól lefelé szerepelnek a vizsgák a következő formátumban:
- első cella: a vizsgakérdés
- második cella: a helyes válasz
- többi cella: egyéb válaszlehetőségek

A válaszlehetőségek száma tetszőleges (legalább kettő érték szükséges), viszont a második cellának mindenképpen a helyes választ kell tartalmaznia

| Teszt kérdések                            |        |         |         |         |
|-------------------------------------------|--------|---------|---------|---------|
| question                                  | answer | option1 | option2 | option3 |
| Mennyi 2+3?                               | 5      | 3       | 2       | 7       |
| Mennyi 10+3?                              | 13     | 11      | 2       | 7       |
| Mennyi 2+2?                               | 4      | 5       | 2       | 7       |
| Melyik egy nem létező operációs rendszer? | Mec OS | Mac OS  | Linux   | Windows |


## Vizsgafájl készítése Excelben
1. megfelelő formátum kialakítása