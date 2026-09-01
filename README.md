# Rethinking the Arithmetic of Multi-Agent Medical Consultation

In medicine, agreement is evidence. When independent specialists converge on a diagnosis, the
convergence itself is information — that is why tumour boards and second opinions change
decisions. Multi-agent consultation has become the default design pattern in medical
language-model systems on the strength of that inheritance. This paper tests whether it survives
the transfer.

## Headline result

**Agreement survives; the independence that gave it meaning does not.**

| | |
|---|---|
| A nine-member panel speaks with one voice on | **69.5%** of items |
| …and is wrong on | **39.7%** of the items it agrees on |
| Peer discussion raises unanimity to | **98.3%** |
| …and lowers the accuracy of that unanimity to | **54.3%** |
| Agreement separates right answers from wrong ones at | AUC **0.59** |
| Self-reported confidence, Youden *J* | ≤ **0.18** |

The cause is measurable. Mean pairwise error correlation is **φ = 0.79**, leaving nine members
worth **1.22 effective independent opinions**; discussion drives it to 0.990, so a consultation at
the moment of consensus is worth 1.01 physicians.

Independence cannot be bought. Normalising φ by its attainable maximum shows the apparent
decorrelation from mixing capability is an artefact of unequal error rates, and every pair we can
form across six independently trained ecosystems — three American, three Chinese — moves a
nine-member panel from 2.60 effective opinions to **2.29**, and at matched capability from 2.31 to
**2.02**: the wrong way.

Nor can any rule read past it. On a scale where picking a member at random scores 0 and always
picking a correct one scores 100, the five architectures score **−12 to +4**. A gradient-boosted
selector trained on the panel's own output, with ground-truth labels and grouped cross-validation,
does not beat counting votes.

## Scale

**420 multi-agent configurations** · 144,499 episodes · 7 models across 3 vendors ×
3 medical benchmarks × 5 architectures × *N* ∈ {1,3,5,7,9}, with a budget-matched single-model
control at every cell. The diversity analysis adds six more models, spanning six ecosystems:
OpenAI, Google, Anthropic, DeepSeek, Alibaba, Zhipu.

Medicine makes the measurement possible in a way general-domain agentic benchmarks cannot:
multiple-choice clinical reasoning uses no tools, so coordination is measured without the confound
of tool-call overhead.

## Build

```bash
tectonic -X compile main.tex
```

## Layout

```
main.tex            paper root
sections/           intro · related · systems · experiments · limitations · conclusion
figures/            capability grid · coordination · diversity ladder · ceiling · reliability
tables/             generated from results/ by experiments/make_*.py
icons/              vendor marks (CC0 / public domain)
refs.bib
```

Experiment code, the configuration grid and the raw episodes live in
[consultation-arithmetic](https://github.com/hq0709/consultation-arithmetic).

## Status

Preprint in preparation.
