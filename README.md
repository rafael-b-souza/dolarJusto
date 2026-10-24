# Dólar Justo (R)

Script econométrico em **R** que estima o valor teórico do "Dólar Justo" utilizando a metodologia de Paridade do Poder de Compra (PPC) relativa desde o início do Plano Real (julho de 1994).

## Metodologia

O cálculo compara a inflação acumulada no Brasil com a inflação acumulada nos Estados Unidos a partir da paridade inicial de R$ 1,00 = US$ 1,00 em julho de 1994:

- **Brasil (IPCA)**: Série `36482` obtida via API do IPEADATA (`ecoseries`).
- **Estados Unidos (CPI)**: Série `CPIAUCSL` obtida via Federal Reserve Bank of St. Louis (`quantmod` / FRED).

$$\text{Dólar Justo} = \frac{\Delta \text{IPCA}_{\text{acumulado}}}{\Delta \text{CPI}_{\text{acumulado}}}$$

## Requisitos

```R
install.packages(c("quantmod", "ecoseries", "twitteR"))
```

## Execução

```bash
Rscript getData.r
```

## Publicação no Twitter (Opcional)

Para habilitar a postagem automática, defina as seguintes variáveis de ambiente ou utilize um arquivo `.env`:

- `TWITTER_CONSUMER_KEY`
- `TWITTER_CONSUMER_SECRET`
- `TWITTER_ACCESS_TOKEN`
- `TWITTER_ACCESS_TOKEN_SECRET`
