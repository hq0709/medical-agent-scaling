# Does the collaboration threshold hold in medicine?

Scaling multi-agent LLM consultation in the tool-free limit.

A medical replication of **Kim et al., _Capable language models can outgrow the benefits of
collaboration_**, Nature Machine Intelligence 8:1157–1172 (2026)
([doi:10.1038/s42256-026-01268-y](https://doi.org/10.1038/s42256-026-01268-y); preprint
[arXiv:2512.08296](https://arxiv.org/abs/2512.08296)), which established scaling principles for
agent systems across six agentic benchmarks and **explicitly excluded medicine**.

## Why medicine is the informative case

Their strongest confound is that every benchmark is tool-heavy: they report a tool–coordination
trade-off (β = −0.330) in which coordination overhead compounds with environmental complexity.
Medical multiple-choice reasoning uses **no tools**, so that term vanishes identically. This is the
`T = 0` limiting case their own design cannot reach, and it isolates coordination itself.

## Headline result

Collaboration in medicine is governed by a **window** of task difficulty, not a ceiling.

| single-doctor baseline P_SA | configurations | mean gain | fraction positive |
|---|---|---|---|
| <25% | 40 | −0.88 pp | 45% |
| **25–35%** | 20 | **+3.56 pp** | **100%** |
| **35–50%** | 20 | **+4.68 pp** | **100%** |
| 50–70% | 20 | −0.88 pp | 50% |
| >70% | 40 | +0.55 pp | 68% |

Every configuration inside the window improves on the single doctor. The reported 45% capability
ceiling is reproduced as the window's **upper** edge — but expert-level medical items reach a
difficulty regime the general-domain benchmarks never approach, revealing a **lower** edge too:
when a task is hard enough, adding physicians does not help either.

Both statistically significant gains in the study sit inside the window and both come from the
**attending-physician (Centralized) architecture at N = 3**: +7.6 pp (p < 10⁻⁴) and +6.4 pp
(p = 0.0037). Panel size predicts nothing (β_log(1+n_a) = −0.005, p = 0.67).

## Scale

175 configurations · 50,749 episodes · 3 capability tiers × 3 medical benchmarks × 5 architectures
× N ∈ {1,3,5,7,9} · OpenAI models only · total API spend **$32**.

## What replicates and what does not

| | NMI 2026 | this work |
|---|---|---|
| gain-model cross-validated R² | 0.513 | **0.531** (no tool term) |
| logical contradiction after discussion | 16.8% → **11.5%** | 15.4% → **11.4%** |
| coordination failure under Independent | **0%** (no channel) | **0.0%** |
| turn-count power-law exponent | 1.724 (R²=0.97) | 0.752 (R²=0.28) — does not hold |
| message-density plateau c\* = 0.39 | R²=0.68 | R²=0.08 — does not hold |
| architecture ranking across domains (Kendall τ) | 0.89 | **−0.07** — does not transfer |

## Build

```bash
tectonic -X compile main.tex
```

## Layout

```
main.tex            paper root (NMI's six-section skeleton)
sections/           intro · related · systems · experiments · limitations · conclusion
figures/            fig1 curves · fig2 cost frontier · fig3 window · fig4 coordination
tables/             main results + coordination metrics (LaTeX and CSV)
refs.bib
```

## Status

Preprint in preparation. Results are complete for 7 of 9 tier×benchmark cells; the final two
(MedAgentsBench at T2/T3) are running and will be folded in.
