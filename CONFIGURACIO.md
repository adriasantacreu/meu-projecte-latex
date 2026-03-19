# Guia de l'Entorn LaTeX Local — Windows 11

## Eines instal·lades

| Eina | Versió | Ubicació |
|------|--------|----------|
| MiKTeX (compilador LaTeX) | 25.12 | `C:\Users\adria\AppData\Local\Programs\MiKTeX` |
| VS Code (editor) | 1.112.0 | `C:\Users\adria\AppData\Local\Programs\Microsoft VS Code` |
| LaTeX Workshop (extensió VS Code) | 10.13.1 | Dins de VS Code |
| Pandoc (convertidor Markdown) | 3.9 | `C:\Users\adria\AppData\Local\Microsoft\WinGet\Packages\...` |

---

## Estructura del projecte

```
meu_projecte_latex/
├── assets/          → imatges (.png, .jpg) i bibliografia (.bib)
├── out/             → PDFs generats i fitxers temporals (.log, .aux)
├── src/
│   ├── main.tex     → document LaTeX principal
│   ├── preamble.tex → estils, paquets i colors
│   └── exemple.md   → document Markdown d'exemple
└── .vscode/
    └── settings.json → configuració de VS Code per a aquest projecte
```

---

## Flux de treball A: LaTeX pur

Ideal quan necessites control total del format.

### 1. Obrir el projecte

Obre un terminal (PowerShell o CMD) i executa:

```powershell
code C:\projects\latex-compiler-final\meu_projecte_latex
```

### 2. Editar el document

- Obre `src/main.tex` des de l'explorador de VS Code
- Escriu el contingut dins les seccions:

```latex
\section{Introducció}
El teu text aquí.

\subsection{Una subsecció}
Més text.
```

- Si vols canviar estils (colors, marges, fonts), edita `src/preamble.tex`

### 3. Compilar a PDF

**Automàtic:** Simplement desa amb `Ctrl+S`. VS Code compila sol i obre el PDF.

**Manual des del terminal:**

```powershell
cd C:\projects\latex-compiler-final\meu_projecte_latex\src
pdflatex -output-directory=..\out main.tex
```

### 4. Veure el PDF

- El PDF apareix automàticament en una pestanya de VS Code
- O obre `out/main.pdf` des de l'explorador de fitxers

---

## Flux de treball B: Markdown → PDF (via Pandoc)

Ideal quan vols escriure ràpid sense preocupar-te de sintaxi LaTeX.

### 1. Escriure en Markdown

Edita `src/exemple.md`. La sintaxi bàsica és:

```markdown
---
title: "Títol del document"
author: "El teu nom"
date: "Març 2026"
toc: true
---

# Títol de secció

Text normal amb **negreta** i *cursiva*.

## Subsecció

- Element de llista
- Un altre element

### Fórmules matemàtiques

Fórmula en línia: $E = mc^2$

Fórmula en bloc:
$$\int_{0}^{\infty} e^{-x^2} dx = \frac{\sqrt{\pi}}{2}$$

### Taules

| Cap 1 | Cap 2 | Cap 3 |
|-------|-------|-------|
| A     | B     | C     |
```

### 2. Convertir a PDF

Executa aquesta comanda des del terminal:

```powershell
cd C:\projects\latex-compiler-final\meu_projecte_latex

& "C:\Users\adria\AppData\Local\Microsoft\WinGet\Packages\JohnMacFarlane.Pandoc_Microsoft.Winget.Source_8wekyb3d8bbwe\pandoc-3.9\pandoc.exe" `
  src\exemple.md `
  -o out\exemple.pdf `
  --pdf-engine="C:\Users\adria\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe"
```

> **Consell:** Pots crear un fitxer `compilar.ps1` a l'arrel del projecte amb aquesta comanda per no haver-la d'escriure cada vegada.

### 3. Convertir a .tex (opcional)

Si vols obtenir el fitxer LaTeX intermedi per editar-lo:

```powershell
& "C:\Users\adria\AppData\Local\Microsoft\WinGet\Packages\JohnMacFarlane.Pandoc_Microsoft.Winget.Source_8wekyb3d8bbwe\pandoc-3.9\pandoc.exe" `
  src\exemple.md `
  -o out\exemple.tex
```

---

## Script de compilació ràpida

Per evitar escriure les comandes llargues, crea el fitxer `compilar.ps1`:

```powershell
# Compila el Markdown a PDF
$pandoc = "C:\Users\adria\AppData\Local\Microsoft\WinGet\Packages\JohnMacFarlane.Pandoc_Microsoft.Winget.Source_8wekyb3d8bbwe\pandoc-3.9\pandoc.exe"
$pdflatex = "C:\Users\adria\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe"

& $pandoc src\exemple.md -o out\exemple.pdf --pdf-engine=$pdflatex
Write-Host "PDF generat a out\exemple.pdf"
```

Per executar-lo:

```powershell
cd C:\projects\latex-compiler-final\meu_projecte_latex
.\compilar.ps1
```

---

## Verificació de les eines

Per comprovar que tot funciona, obre un terminal nou i executa:

```powershell
# Comprova MiKTeX
pdflatex --version
# Ha de mostrar: MiKTeX-pdfTeX 4.23 (MiKTeX 25.12)

# Comprova VS Code
code --version
# Ha de mostrar: 1.112.0

# Comprova Pandoc
& "C:\Users\adria\AppData\Local\Microsoft\WinGet\Packages\JohnMacFarlane.Pandoc_Microsoft.Winget.Source_8wekyb3d8bbwe\pandoc-3.9\pandoc.exe" --version
# Ha de mostrar: pandoc 3.9
```

---

## Errors coneguts i solucions

### "pdflatex: major issue: So far, you have not checked for MiKTeX updates"

Aquest error bloqueja la compilació. Solució:

```powershell
# Neteja el fitxer d'errors de MiKTeX
'[]' | Set-Content 'C:\Users\adria\AppData\Roaming\MiKTeX\miktex\config\issues.json'
```

### "pdflatex: command not found"

El PATH no s'ha actualitzat. Obre un terminal **nou** o executa:

```powershell
$env:PATH += ";C:\Users\adria\AppData\Local\Programs\MiKTeX\miktex\bin\x64"
```

---

## Passos pendents

- [ ] **Pas 3:** Configurar Git i sincronitzar amb GitHub
- [ ] **Pas 4:** Integrar Gemini CLI per assistència amb IA
