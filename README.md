# Originální modpack "Nargbox"
Tento repozitář oživuje modpack, který v roce 2012 vytvořil tvůrce jménem [NargonCZ](https://www.youtube.com/@NargonCZ). Jen pro představu, první díl třetí série [S03E01](https://www.youtube.com/watch?v=qS4QGI0xDeM&list=PLdGtlU5Soz0K-r-zCiFTjx99h2YlyeguL) nasbíral od svého vydání už přes 1,5 milionu zhlédnutí.

## Úvod
Jako osmiletý kiddo jsem začal objevovat YouTube. V tu dobu dominoval GEJMR se svým Tekkitem a Pedro se svým survival světem (který ukončil až v roce 2022). Skrz GEJMRův Tekkit jsem se dostal k Nargonovi. Oba tvůrci si byli dost podobní a měli vášeň pro technické módy tehdejšího Minecraftu. Nargona jsem dokázal sledovat hodiny v kuse a hlavně díky němu mě baví cokoliv spojeného s technologiemi až dodnes.

## Cíl
Pár týdnů zpátky jsem dostal neskutečnou chuť si zavzpomínat a zhlédl jsem prakticky celou S02 a S03. Pro svou tradiční "2 week Minecraft phase" jsem si proto vybral právě tento modpack z odkazu na MediaFire, který má Nargon pořád aktivní na svém YouTube profilu. Po těch letech už ale modpack nefungoval, takže mým cílem bylo ho znovu zprovoznit:

- Přes PrismLauncher jsem nainstaloval Minecraft verzi 1.4.7 s Forge verzí 6.6.2.534.
- Následně jsem nainstaloval Javu JDK 8:
  - **Na Windows x64:** [Odkaz do Oracle archivu JDK verzí](https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html)
  - **Na Linuxu:** Osobně jedu na CachyOS (based on Arch + pacman package manager), takže stačilo `sudo pacman -Syy jdk8-openjdk`
- Po několika errorech jsem vyřešil alokaci paměti. Ideální nastavení pro můj systém je:
  - **Java Executable:** *Zde vyber instalaci JDK 8*
  - **Skip Java compatibility checks:** *Zaškrtnuto*
  - **Memory (Min/Max/PermGen Size):** 2048 / 4096 / 256 MiB
  - **Java Arguments:** *Žádné*

S hotovým nastavením instance Minecraftu se ale objevily problémy se samotnými módy:
- **Forestry** se tlouklo s **IC2** a naopak. Samostatně oba módy fungovaly, ale spolu nešly.
- Přes web archive bylo potřeba najít správnou historickou verzi **Railcraftu**.
- Po delší dekompilaci Nargonova serverového `.jar` souboru jsem zjistil, že Forestry dělá problémy kvůli configům.
- **Řešení:** Smazal jsem staré configy, nechal je vygenerovat znova a pak je manuálně přepsal do správné podoby.

A všechno fungovalo krásně.

## Server samotný
Osobně hostuji server pro sebe a svého kamaráda na Linuxu. Z toho důvodu sem nedokážu dát `.bat` soubor pro Windows, který by zaručeně fungoval. S největší pravděpodobností už původní Nargonův `.bat` soubor na spuštění stejně fungovat nebude. Zprovoznění lokálního serveru na Windows tedy nechávám na vás ostatních (dneska s tím beztak nejvíc pomůže samotné AI).

---

Kdyby se tohle repo někdy dostalo k samotnému Nargonovi: Děkuji za krásně strávený čas. Naučil jsi mě spoustu věcí a hlavně jsi mi dal směr (technologie obecně). Dnes jsem díky tomu na vysoké škole a studuji obor Aplikovaná informatika. <3
