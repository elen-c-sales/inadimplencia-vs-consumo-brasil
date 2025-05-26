# Inadimplência vs. Consumo no Brasil

Análise exploratória da relação entre inadimplência das pessoas físicas e consumo das famílias no Brasil, utilizando dados públicos do Banco Central do Brasil (BCB) e do Instituto Brasileiro de Geografia e Estatística (IBGE).

---

## Objetivo

Investigar se existe uma relação entre a taxa de inadimplência das pessoas físicas e o consumo das famílias no Brasil, considerando dados dos últimos anos. A hipótese inicial sugere que, quando a inadimplência aumenta, o consumo tende a diminuir. Esta análise busca validar ou refutar essa hipótese a partir dos dados.

---

## Contexto e Análise

Para responder à pergunta sobre a relação entre inadimplência e consumo, foram utilizados dados de mais de uma década, integrando informações sobre:

- **Taxa de inadimplência das pessoas físicas** (Banco Central do Brasil)
- **Indicador de consumo das famílias**, por meio do volume de vendas do comércio (IBGE - Pesquisa Mensal do Comércio)

### Resultados

Os dados revelam uma **correlação moderada e positiva** entre inadimplência e consumo:

- **Correlação simples:** aproximadamente 0,42
- **Correlação defasada (3 meses):** aproximadamente 0,38

Isso significa que, mesmo com aumento da inadimplência, o consumo das famílias não apenas não diminui, como pode até aumentar em determinados períodos.

### Interpretação

Esse resultado, aparentemente contraditório, reflete a dinâmica econômica brasileira, onde o consumo é frequentemente sustentado por:

- Crédito rotativo (cartões, consignados, cheque especial)
- Renegociações e reparcelamentos de dívidas
- Programas de transferência de renda
- Dinâmicas de inflação, juros e mercado de trabalho

Na prática, muitas famílias seguem consumindo apesar de estarem inadimplentes, recorrendo a diferentes estratégias para manter seu padrão de consumo.

### Análise de Tendência

- **Inadimplência:** queda significativa entre 2016 e 2019, seguida de alta a partir de 2022.
- **Consumo:** tendência geral de estagnação ou leve queda, com picos sazonais, impactado por inflação, juros elevados e perda de poder de compra.

### Conclusão

Este exercício demonstra que dados não falam sozinhos. A análise precisa considerar contexto, interpretação econômica e múltiplos fatores que afetam o comportamento das famílias.

Os resultados reforçam que a inadimplência é um indicador relevante do estresse econômico das famílias, mas não explica isoladamente o comportamento do consumo. Fatores como inflação, juros, acesso ao crédito e políticas públicas desempenham papel fundamental na dinâmica do consumo no Brasil.

---

## Visualizações

### Inadimplência das Pessoas Físicas no Brasil
![Inadimplência](Inadimplência%20das%20Pessoas%20Físicas%20no%20Brasil.png)

---

### Consumo das Famílias no Brasil (PMC - Varejo Ampliado)
![Consumo](Consumo%20das%20Famílias%20no%20Brasil%20(PMC%20-%20Varejo%20Ampliado).png)

---

### Inadimplência vs. Consumo das Famílias no Brasil (Séries Temporais)
![Séries Temporais](Inadimplência%20vs.%20Consumo%20das%20Famílias%20no%20Brasil.png)

---

### Correlação entre Inadimplência e Consumo das Famílias
![Correlação](Correlação%20entre%20Inadimplência%20e%20Consumo%20das%20Famílias.png)

---

### Estatísticas Descritivas
![Estatísticas Descritivas](Estatísticas%20Descritivas%20de%20Inadimplência%20e%20Consumo.png)

> 🔗 **Acesse também a tabela em HTML interativo:**  
[Visualizar estatísticas descritivas (HTML)](estatisticas_descritivas.html)

---

## Tecnologias e Ferramentas

- R
- tidyverse
- rbcb
- sidrar
- gridExtra
- gt
- DT
- ggplot2

---

## Como Reproduzir

1. Clone este repositório:
```bash
git clone https://github.com/seu-usuario/inadimplencia-vs-consumo-brasil.git
