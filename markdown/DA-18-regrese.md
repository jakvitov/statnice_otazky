# 18. Regresní analýza (jednoduchá regrese, vícenásobná regrese). Metody, testy, příklady.

 > *Pozn.: omlouvám se za anglicko-české zápisky*


= finding the best linear approximation for our data 
- used for forecasts 

### $instructions$
- zajímá mě jednostranná závislost mezi nějakou závislou proměnnou na nějaké vysvětlující proměnné 
- závislá proměnná $Y$ *(dependent, predicted, response, output variable)*
- vysvětlující proměnné $X_{i}$ *(independent, predictor, carrier, input variable)*
	- **číselné**  - jejich vliv vysvětlen pomocí koeficientů $\beta_{i}$ 
	- **kategoriální** - jejich vliv vysvětlen pomocí koeficientů $\gamma_{i}$
- $m$ je počet vysvětlujících proměnných (bez interceptu $\beta_{0}$)
- $n$ je počet pozorování 

1. podívám se na scatterploty, doporučuju `pairs()` v R 
	- hodí se k assesnutí nějakých possible multicolinearit a tak 
2. udělám odhady $\beta$ , podívám se na $R^2$
3. F test o modelu, t testy o parametrech
	- podle výsledků buď model zahodím, ponechám nebo zmenším dimenze 
4. diagnostics 
	- jsou splněny všechny assumtions? není tam nějaká patologie? 

### $assumptions$ 
- linear relationship between $X_{i}$ and $Y$ *(at least close to linear)*
- $E[\varepsilon_i] = 0$ 
	we don't have systematic error 
- $V[\varepsilon_i] = \sigma^2_{\varepsilon}$  
	variance is constant, doesn't change, variance is finite = $homoskedasticity$
- $Cov[\varepsilon_i, \varepsilon_j] =E[\varepsilon_i \cdot \varepsilon_j] = 0$ for each $j \ne i$ 
	no systematic relationship between residuals
- $\varepsilon_{i}\sim N(0, \sigma^2)$ 

### $linear$ $regression$ $model$
$$
\begin{align*}
 Y &= \beta_{0} + \beta_{1}X_{1} + \dots + \beta_{m} + \varepsilon \\
\hat{Y_{i}} &= \hat{\beta_{0}} + \hat{\beta_{1}}X_{1}+ \dots + \hat{\beta_{m}}
\end{align*}
$$
- jedna vysvětlující a jedna závislá proměnná 
- $\hat{\theta}$ *(hat)* představuje odhadované proměnné 

<u>Metoda nejmenších čtverců MNČ</u> = OLS (*ordinary least squares*) 
= minimalizujeme čtverce reziduí 
$$
\begin{align*}
SS_{R} =& \sum({y_{i}}-\hat{y_{i}})^2 = \sum e_{i}^2\\
SS_{T} =& \sum(\hat{y_{i}}-\bar{y})^2\\
SS_{y} =& \sum(y_{i} - \bar{y})^2 = SS_{T} + SS_{R}
\end{align*}
$$
- $SS_{R}$ = reziduální součet čtverců, nevysvětlená variabilita ($RSS$)
  $SS_{T}$ = vysvětlená variabilita ($SS_{reg}$)
  $SS_{y}$ = celková variabilita ($SS_{tot}$)

###### INTERCEPT $\beta_{0}$
= situace, kdy $x=0$; průsečík na ose $y$  
###### SLOPE $\beta_{1}$ - *simple linear regression* 
= tempo růstu, směrnice přímky 
###### RESIDUALS $e_{i} = y_{i} - \hat{y_{i}}$
= skutečná hodnota mínus teoretická 
- $\sigma^2_{\varepsilon} \to s_{e}^2$  approximation 
$$
s^2_{e} = \frac{1}{n-m-1} \sum e^2_{i}
$$

###### ESTIMATORS $\hat{\beta_{i}}$ 
= mají své vlastní rozdělení, střední hodnotu představuje $\beta_{i}$ 
- testujeme, jestli jsou statisticky významné 
	- nejprve model jako celek: **F-test** 
	- poté jednotlivé koeficienty: **dílčí t-testy** 
- estimator as a random variable: 
$$
\begin{align*}
E[\hat{\beta_{i}}] &= \beta_{i} \\
V[\hat{\beta_{i}}] &= \frac{\sigma_{\varepsilon}^2}{\sum(x_{ij}-\bar{x}_{j})^2} \frac{1}{1-R^2} = \sigma_{\varepsilon}^2 \cdot c_{jj} 
\end{align*}
$$
- $c_{jj}$ je prvkem matice $(\mathbf{X}^T \mathbf{X})^{-1}$ 
- how to estimate the estimators? 
	- simple linear regression 
		- $\hat{\beta_{0}} = \bar{y}-\bar{x} \cdot \hat{\beta_{1}}$
		- $\hat{\beta_{1}} = {s_{xy}}/{s_{x}^2}$  ($s_{xy}$ = $cov(x,y)$, $s^2_{x}$ = $var(x)$) 
	- multiple linear regression 
		- $\hat{\beta} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{Y}$

###### COEFFICIENT OF DETERMINANCE $R^2$ 
= míra, která nám říká, jaký díl variability se nám podařilo vysvětlit naším modelem 
- u simple linear regression je tohle taky [[korelační koeficient]], znamínko se potom dosadí podle $\beta_{1}$
- obor hodnot: $<0,1>$ 
	- $1$ - vysvětlili jsme všechnu variabilitu 
		- funkční závislost
	- $0$ - nevysvětlili jsme nic 
		- žádná 
- výpočet: 
$$
\begin{align*}
R^2 &=  \frac{\sum(\hat{y_{i}}-\bar{y})^2}{\sum(y_{i} - \bar{y})^2} = \frac{SS_{T}}{SS_{y}} = 1-\frac{SS_{R}}{SS_{y}}
\end{align*}
$$
- is affected by the number of regressors - $adjusted$ $R^2=R_{adj}^2$ 
$$
\begin{align*}
R_{adj}^2 &= \left( R^2 - \frac{m}{n-1} \right) \frac{n-1}{n-m-1}  \\ \\

& = 1-\frac{SS_{R}}{SS_{y}} \frac{n-1}{n-m-1} \\ \\

&= 1-\left(1-R^2 \right) \frac{n-1}{n-m-1}
\end{align*}
$$
- mám ale pocit, že to zdroje definují různě, což je sus 
- tohle číslo pak můžeme používat pro porovnávání různých modelů a podle něj vybrat ten přesnější (nemusí to ale vždycky být to, co nutně chceme) 

###### F-TEST = test o modelu 
$$
\begin{cases}& H_{0}: & \beta_{0} = \beta_{1} =\dots \beta_{m} =0\\
& H_{1}: & \beta_{0} \ne 0 \lor \beta_{1} \ne 0 \lor \dots \lor\beta_{m} \ne 0  \\
\end{cases}
$$
- $H_{0}$ : the model is not plausible, all of the parameters are not important 
  $H_{1}$ : at least one of the parameters is significant for our model 
- one sided test, rejection region: $F_{obs} > F_{m; n-m-1; \alpha}$ 
$$
F_{obs} = \frac{R^2/m}{(1-R^2)/(n-m-1)} = \frac{SS_{reg}/m}{SS_{error}/(n-m-1)}
$$
###### T-TESTy = testy o parametrech 
  - pro každý parametr zvlášť 
$$
\begin{cases} &H_{0}: & \beta_{i} = 0\\
&H_{1}: & \beta_{j} \ne 0  \\
\end{cases}
$$
- $H_{0}$ : the parameter is not significant 
  $H_{1}$ : we should include this parameter in our model 
- two sided test ($\alpha/2$), rejection region: $|T_{obs}| \ge t_{n-m-1; \alpha/2}$ 
$$
\begin{align*}
T = \frac{\beta_{i}}{\sqrt{V[\beta_{i}]}}
\end{align*}
$$
### $including$ $a$ $categorical$ $variable$ 
$$
 Y = \beta_{0} + \beta_{1}X_{1} + \dots + \gamma_{i} D_{i} + \dots + \gamma_{j} D_{j} + \varepsilon
$$
- parametry $\gamma_{i}$ se chovají jako $\beta_{i}$ - přistupujeme k nim stejně během testů 
- **$1$ kategoriální proměnná k sobě může mít $j$ parametrů** $\to$ 
	- $j$ = počet kategorií$-1$ 
	- jeden stav vybereme jako $default$
	- pro každou jednu kategorii budeme mít zvlášť $dummy$ proměnnou $D_{j}$, která nabývá dvou hodnot $\{ 0,1\}$
	- takhle to potom vypadá pro proměnnou, která nabývá 3 možných hodnot: $\{A,B,C \}$ 
$$
\begin{align*} \\
&D_{0} \text{ is not present, it is set to be the default, cat.: A} \\ \\
&D_{1} \begin{cases}  &1: & \text{category B is present in our model}\\
&0: & \text{category B is not present in our model}\\
\end{cases} \\ \\
&D_{2} \begin{cases}  &1: & \text{category C is present in our model}\\
&0: & \text{category C is not present in our model}\\
\end{cases}
\end{align*}
$$

> *Tady vidíme, že $j=2$, protože kategorie jsou 3. Default je kategorie $A$, dále pak modelujeme chování pro $B$ a $C$ pomocí dummies $D_{1}$ a $D_{2}$. Chování kategorie $A$ je popsáno pomocí modelu bez dummies.*  

- interpretace je taková, že kategorie ovlivní hodnotu $Y$ o $\gamma_{i}$, pokud se nic jiného nemění 
	- přičtu to k interceptu 
	- jakoby mám rovnoběžné přímky ukazující situaci pro each kategorie 
- a taky to apparently jde nějak kombinovat? nechapu ale jak 

### $interaction$ $effects$
- synergy efect between two variables that cannot be modelled by simple summation 
- we can model this by creating a new variable that can be f.e. a result of a addition of two variables 
$$
 Y = \beta_{0} + \beta_{1}X_{1} + \beta_{2}X_{2} + \mathbf{\beta_{3}X_{1}X_{2}} + \varepsilon
$$
- we are then asking if the interaction is significant? 
- if we include the interaction, we must include the variables the interaction is consisted of
	- slope is different only where the student categ. is present
- this is an example where a categorical and a numerical variable are in an interaction
- there is an effect only for the income and the student 

### $linear$ $transformations$
- hyperbola: $Y = \beta_{0} + \beta_{1} \frac{1}{x}$
- parabola: $Y = \beta_{0} + \beta_{1} x + \beta_{2}x^2$
- logaritmická přímka: $Y = \beta_{0} + \beta_{1}\ln(x)$
- polynom: $Y = \beta_{0} + \beta_{1} x + \beta_{2}x^2 + \dots + \beta_{n}x^n$

- tady si dát obecně pozor na interpretaci 
- někdy jsou modely přesnější, ale to neznamená, že lepší (mohou být hard to interpret)
- lineární je to model proto, že **musí být lineární v koeficientu** = lineární operace (plus, mínus, ne násobení, dělení, mocnění atd.)

$non$-$linear$ $transformations$
- exponenciální funkce: $Y=\beta_{0}\beta_{1}^x$
- mocninná funkce: $Y=\beta_{0}x^{\beta_{1}}$

- vyžadují ještě větší míru úprav 

### $diagnostics$ 
- mám funkční model, co teď? 
- co se může pokazit a tak 
- zkontrolovat assumptions, possible problems:
	- non-linearity of the model 
		- residuals x fitted values plot - some sort of structure
		- shows what is missing in the model
	- correlation of the error terms
		- some sort of structure behind the residuals, some groups,...
		- we want most of the residuals around zero = no corr 
	- non-constant variance = $heteroskedasticity$
		- helps to put logarithm of the response in the model
		- or weighted least squares approach
	- outliers = `tHe WeiRdOS` = just lowers the performance of the model
	- high leverage points = unusual values with high impact, has impact 

###### MULTICOLINEARITY 
= vysvětlující proměnné mají mezi sebou nějaký [[korelační koeficient|lineární vztah]]
- increases the SE of the estimates
- can be discovered by scatter plots, correlation matrix etc. between the variables that estimate the response variable (between $X_{1},X_{2}$)
	- vyhnout se $|corr(X_{i}, X_{j})| \ge 0.9$ 
	- $VIF_{j}>5$  
		= variance inflation factor (not that important)$$VIF_{j} (\hat{\beta_{j}}) = \frac{1}{1-R^2_{j}}$$
 - resolved by: dropping a problematic variable or combining problematic variables 

###### NORMALITY OF RESIDUALS
$$
\hat{r_{i}} = \frac{\hat{e_{i}}}{s_{e} \sqrt{ (1-h_{ii}) }}
$$
- $h_{ii}$ comes from the hat matrix ($\mathbf{H} = \mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T$)

- histogram of $\hat{r}$ - normality
- scatter plot ($\hat{r},\hat{y}$) - random scatter 
	- $heteroskedasticity$ can be discovered here
- QQ-plot $\hat{r}$ 
- **Shapiro-Wilk test** - we do not reject $H_{0}$ ($H_{0}$: normality of the model) 
- **Bartlett's test** - we do not reject $H_{0}$ ($H_{0}: homoskedasticity$)

###### MOST INFLUENTIAL REGRESSORS 
= které regressory mají na model největší vliv 
- pomáhá k rozhodnutí, které z vysvětlujících proměnných dále uvažovat nebo ne 
$$
\hat{\beta}^*_{i}=\hat{\beta_{1}} \frac{s_{\beta_{1}}}{s_{y}}
$$
- největší $\hat{\beta_{i}^*}$ má největší vliv, je pro model nejdůležitější 

###### LEVERAGE POINTS, OUTLIERS etc. 
- leverage points = points that attract the line more than others, usually an outlier
	- $h_{ii}$ is leverage value 
	- leverage point is when: $h_{ii} \ge \frac{2(m+1)}{n}$
- influential observations = presence/absence has high effect on the model
	- **Cook's distance** = distance between $\hat{\beta}$ and $\hat{\beta}_{i}$ , $D_{i}>1$ 
$$
D_{i} = \frac{\hat{r}^2_{i}}{(m+1)} \frac{h_{ii}}{(1-h_{ii})}
$$
