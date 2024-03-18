# 10. Stochastická konvergence. Centrální limitní věta a zákon velkých čísel. Použití ve statistice.

## Stochastická konvergence

obecně platí, že při zvětšení $n$ se nám zlepší výsledky. 

## Centrální limitní věta 

Máme-li $n$ nezávislých pozorování z populace, která je charakterizovaná nějakou střední hodnotou $\mu$ a rozptylem $\sigma^2$, pro $n>30$ můžeme říct, že proměnná je z normálního rozdělení. 

$$\bar{x} \sim N (\mu, \frac{\sigma^2}{n}) \text{, where:  } \bar{x} = \frac{1}{n} \Sigma x_{i}$$

Můžeme tak zaměňovat ostatní rozdělení za normální rozdělení. Toto je odhad střední hodnoty. 

- při zvětšení $n$ klesá rozptyl 
- předpokládá se stabilní střední hodnota a rozptyl (nejdou do nekonečna)

máme pak dál konkretní transformace CLV, pomocí kterých přistupujeme k řešešní konkrétních problémů. 

obecná transformace: 
$$U = \frac{X-E(X)}{\sqrt{D(X)}}; U \sim N(0,1)$$

je přesnější při $n \to \infty$ 

## Zákon velkých čísel 

$$\lim_{ n \to \infty } P(\mid \bar{X}_{n} - \pi | > \varepsilon ) = 0$$ 

$\pi$ představuje relativní četnosti výskytu jevu v Alternativním (Bernoulliho) rozdělení (tzn. střední hodnota)  

$\varepsilon$ představuje jakékoli číslo větší než 0 

Limitně se průměr blíží střední hodnotě s pravděpodobností 1. 

Dá se tedy říct, že s nulovou pravděpodobností bude rozdíl průměru a střední hodnoty větší než nula. 

- na tomto principu jsou založeny Monte Carlo simulace 
  - ty ale předpokládají předchozí znalost rozdělení proměnné 
