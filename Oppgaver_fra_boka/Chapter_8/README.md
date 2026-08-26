---
title: "README"
output: html_document
---

# Bootstrapping

Motivasjonen bak bootstrapping, er at man har et lite utvalg, som ikke er normalfordelt (det er typisk en skjevhet i fordelingen). Vi behandler derfor datasettet som *hele verden* , og trekker ut nye fordelinger av det eksisterende datasettet. Disse "underdatasettene" finner vi fordventingsverdieien til, og den estimerte verdien for $\theta$ blir da $\sum_{i=1}^{n_{boot}} \bar{X_{boot}}$
