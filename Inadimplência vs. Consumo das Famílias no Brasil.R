# Instalar os pacotes necessários (caso não tenha)
install.packages(c("tidyverse", "rbcb", "sidrar", "lubridate", "scales"))
install.packages("gridExtra")
# Instalar se não tiver
install.packages("DT")

# Carregar os pacotes
library(tidyverse)
library(rbcb)
library(sidrar)
library(lubridate)
library(scales)
library(knitr)
library(gridExtra)
library(gt)
library(png)
library(grid)
library(DT)

# ===========================
# Inadimplência das Pessoas Físicas (Banco Central)
# ===========================
inadimplencia <- get_series(21096) %>%
  rename(inadimplencia = `21096`) %>%
  mutate(data = as.Date(date)) %>%
  select(data, inadimplencia)

# Verificar os dados
head(inadimplencia)

# ===========================
# Consumo das Famílias (IBGE - Pesquisa Mensal do Comércio)
# ===========================
consumo <- get_series(22769) %>%
  rename(consumo = `22769`) %>%
  mutate(data = as.Date(date)) %>%
  select(data, consumo)

head(consumo)

# ===========================
# Unir as duas bases
# ===========================
dados <- inadimplencia %>%
  left_join(consumo, by = "data") %>%
  drop_na()

# Verificar os dados combinados
head(dados)

# ===========================
# Visualizações
# ===========================

# Evolução da Inadimplência
ggplot(inadimplencia, aes(x = data, y = inadimplencia)) +
  geom_line(color = "red", size = 1.2) +
  labs(
    title = "Inadimplência das Pessoas Físicas no Brasil",
    x = "Ano",
    y = "Percentual (%)"
  ) +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  theme_minimal()

# Evolução do Consumo das Famílias
ggplot(consumo, aes(x = data, y = consumo)) +
  geom_line(color = "blue", size = 1.2) +
  labs(
    title = "Consumo das Famílias no Brasil (PMC - Varejo Ampliado)",
    x = "Ano",
    y = "Índice (Base 2014 = 100)"
  ) +
  theme_minimal()

# Séries combinadas
ggplot(dados) +
  geom_line(aes(x = data, y = inadimplencia * 100, color = "Inadimplência (%)")) +
  geom_line(aes(x = data, y = consumo, color = "Consumo (Índice)")) +
  labs(
    title = "Inadimplência vs. Consumo das Famílias no Brasil",
    x = "Ano",
    y = "Escala relativa"
  ) +
  scale_color_manual(values = c(
    "Inadimplência (%)" = "red",
    "Consumo (Índice)" = "blue"
  )) +
  theme_minimal()

# Correlação entre Inadimplência e Consumo
ggplot(dados, aes(x = inadimplencia, y = consumo)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "darkgreen") +
  labs(
    title = "Correlação entre Inadimplência e Consumo das Famílias",
    x = "Inadimplência (%)",
    y = "Consumo (Índice)"
  ) +
  theme_minimal()


# ===========================
# Estatísticas Descritivas
# ===========================

estatisticas_long <- tibble(
  Estatistica = c("Mínimo", "1º Quartil", "Mediana", "Média", "3º Quartil", "Máximo", "Desvio Padrão"),
  Inadimplencia = c(
    min(dados$inadimplencia),
    quantile(dados$inadimplencia, 0.25),
    median(dados$inadimplencia),
    mean(dados$inadimplencia),
    quantile(dados$inadimplencia, 0.75),
    max(dados$inadimplencia),
    sd(dados$inadimplencia)
  ),
  Consumo = c(
    min(dados$consumo),
    quantile(dados$consumo, 0.25),
    median(dados$consumo),
    mean(dados$consumo),
    quantile(dados$consumo, 0.75),
    max(dados$consumo),
    sd(dados$consumo)
  )
) %>%
  mutate(across(where(is.numeric), ~ round(.x, 2)))

# Renderizar no Viewer do RStudio
datatable(estatisticas_long,
          caption = "Estatísticas Descritivas de Inadimplência e Consumo",
          options = list(pageLength = 10, scrollX = TRUE))


# Renderizar com gt no Viewer
estatisticas_long %>%
  gt() %>%
  tab_header(
    title = "Estatísticas Descritivas de Inadimplência e Consumo"
  )

