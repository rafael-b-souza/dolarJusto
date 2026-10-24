library(quantmod)
library(ecoseries)
library(twitteR)

# Consulta inflacao dos EUA (CPIAUCSL) via FRED
getSymbols('CPIAUCSL', src = "FRED")

cpi.eua = window(ts(CPIAUCSL, start = c(1947, 1), freq = 12), start = c(1994, 7))

# Consulta inflacao brasileira (IPCA - serie 36482) via IPEADATA
ipca = window(ts(series_ipeadata('36482', periodicity = 'M')$serie_36482$valor,
                 start = c(1979, 12), freq = 12), start = c(1994, 7))

cpi.acc = ((tail(cpi.eua, 1) / head(cpi.eua, 1) - 1) * 100)
ipca.acc = ((tail(ipca, 1) / head(ipca, 1) - 1) * 100)

dolarJusto = ipca.acc / cpi.acc
dolarformatado = format(round(dolarJusto, 2), nsmall = 2)

cat(paste0("Valor justo do dolar (PPC desde 1994): R$ ", dolarformatado, "\n"))

# Configuracao opcional para publicacao no Twitter via variaveis de ambiente
consumerKey = Sys.getenv("TWITTER_CONSUMER_KEY")
consumerSecret = Sys.getenv("TWITTER_CONSUMER_SECRET")
accessToken = Sys.getenv("TWITTER_ACCESS_TOKEN")
accessTokenSecret = Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")

if (consumerKey != "" && consumerSecret != "") {
  setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)
  tweet(paste0("Hoje, o valor justo do dolar e R$ ", dolarformatado))
  cat("Publicado no Twitter com sucesso.\n")
}
