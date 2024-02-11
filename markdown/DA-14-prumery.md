# 14. Průměry – způsoby výpočtu, vlastnosti, příklady použití. Základní míry polohy a variability pro proměnné nominální, ordinální a kvantitativní.



## Typy proměnných

#### kvalitativní (slovní) 
- **nominální** (kategoriální)
  - např. barva očí, příchutě zmrzliny
- **ordinální** (dá se seřadit) 
  - slovní hodnocení, známky

#### kvantitativní (číselné)
- **diskrétní** 
  - spočetná 
  - často na ose x
- **spojitá** 
  - nespočetná 
  - často na ose y


## Míry polohy

### Střední hodnota $E(X)$
- vlastnosti: 
  - $E(a) = a$
  - $E(bX) = b \cdot E(X)$
  - $E(a + bX) = a + b \cdot E(X)$
  - $E(X + Y) = E(X) + E(Y)$
  - $E(X \cdot Y) \not= E(X) \cdot E(Y)$     
  rovnost by platila pouze pokud by X a Y byly nezávislé 
- výpočet:  
   diskrétní:  $E(X) = \sum_{x_j} x_j \cdot P(X=x_j)$  
   spojité: $E(X) = \int_{-\infty}^{\infty} x_j \cdot f(x) dx$

### Kvantily 

medián - dělí soubor na dvě stejné poloviny

### Průměry 

#### aritmetický průměr $x̄_A$
$$\overline{x} = \frac{\sum\limits^n\limits_{i=1} x_{i}}{n}$$ 

Funkce všech hodnot souboru. Představuje *"typickou"* hodnotu proměnné v souboru. Je to také první obecný moment. Používáme jej, pokud má smysl hodnoty proměnné sčítat

#### geometrický průměr $x̄_G$

$$\overline{x_G} = \sqrt[n]{x_1 \cdot x_2 \cdot ... \cdot x_n}$$ 

Představuje koeficient růstu. Průměruje hodnoty, které nemá smysl sčítat, např. řetězové indexy.

#### harmonický průměr $x̄_H$

#### kvadratický průměr $x̄_K$

$x̄_H \le x̄_G \le x̄_A \le x̄_K$  
   platí pro kladné hodnoty proměnné 


#### chronologický průměr 
- používá se pro okamžikové proměnné 

#### klouzavé průměry 


## Míry variability 
 - charakterizují proměnlivost statistického souboru 

### Variační rozpětí  
- vzdálenost maximální hodnoty a minimální hodnoty v souboru 

### Kvantilová rozpětí 
- mají schopnost odříznout extrémy (podle kvantilu si zvolím "velikost" odřezku)
- malá vypovídající schopnost 

### Rozptyl $D(X)$; $s^2_x$
- vlastnosti: 
  - $D(X) \ge 0$
  - $D(a) = 0$
  - $D(bX) =  b^2 D(X)$ 
  - $D(X+Y) = D(X) + 2cov(X,Y) + D(Y)$ 
  - $D(aX+bY+c) = a^2D(X) + 2  \cdot a \cdot b \cdot cov(X,Y) + b^2D(Y) + 0$ 
- výpočet: 
  - $D(X) = E(X^2) - [E(X)]^2$
  - $s^2_x = \frac{\sum^n_{i=1}(x_i -  x̄)^2}{n}$


absolutní míra variability, v jednotkách na druhou, 
rozklad rozptylu - statistická metoda k odhalení odlišnosti skupin (ANOVA) 


### Směrodatná odchylka 
- druhá odmocnina rozptylu $\sqrt{D(X)}$

### Variační koeficient 
- nemá jednotky, můžu porovnávat různé soubory dat

$$ V_x = \frac{D(X)}{E(X)} $$  
TODO - kontrola vzorce 

#### kvalitativní proměnné 
- poměrový koeficient determinace - ordinální 
- nominální variance (mutabilita) - kategoriální 






