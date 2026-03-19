# Entorn LaTeX Local — Windows 11

Entorn de treball per redactar documents acadèmics i tècnics en local, sense dependre d'Overleaf ni de cap servei al núvol.

## Eines

| Eina | Versió | Funció |
|------|--------|--------|
| [MiKTeX](https://miktex.org/) | 25.12 | Compilador LaTeX → PDF |
| [VS Code](https://code.visualstudio.com/) | 1.112.0 | Editor principal |
| [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) | 10.13.1 | Previsualització PDF en temps real |
| [Pandoc](https://pandoc.org/) | 3.9 | Convertidor Markdown → PDF |

## Estructura

```
├── assets/          # Imatges i bibliografia
├── out/             # PDFs generats
├── src/
│   ├── main.tex     # Document LaTeX principal
│   ├── preamble.tex # Estils, paquets i colors
│   └── exemple.md   # Document Markdown d'exemple
├── compilar.ps1     # Script per compilar Markdown → PDF
└── CONFIGURACIO.md  # Guia detallada de l'entorn
```

## Ús ràpid

### Opció A — LaTeX pur

Obre el projecte a VS Code i desa `src/main.tex` amb `Ctrl+S`. El PDF es genera automàticament a `out/main.pdf`.

```powershell
code C:\projects\latex-compiler-final\meu_projecte_latex
```

### Opció B — Markdown → PDF

Escriu a `src/exemple.md` i executa:

```powershell
.\compilar.ps1
```

El PDF es genera a `out/exemple.pdf`.

## Documentació

Consulta [`CONFIGURACIO.md`](./CONFIGURACIO.md) per a la guia completa amb exemples, errors coneguts i solucions.
