# Terminology audit: paper/radiology/sections (Meta-Radiology draft)

Feedback only. No repository file was changed.

## 0. Scope, counting, sources

- Text audited: abstract, highlights, introduction, methods, results, discussion, conclusions (`paper/radiology/sections/*.tex`). I also checked the title and keywords (`main.tex:18, :24`) and the text inside the figure PDFs (`figures/*.pdf`), because readers see both.
- Counts are case-insensitive. They cover visible text only, with `\ref`, `\label` and `\cite` stripped, and they include compounds ("generic-panel readers" counts under "generic panel"). First use is given in the order abs → hl → intro → meth → res → disc → concl, as file:line (for example `meth:96`).
- Sources, read in full unless marked otherwise. Locators: arXiv PDF page (p.), local NMI line (L), or section.
  - **NMI-v1**: Kim et al., arXiv:2512.08296v1. Local file `docs/NMI_2512.08296_fulltext.txt`, cited by line number.
  - **NMI-pub**: Kim et al., *Nat Mach Intell* 8:1157 (2026), open-access text from nature.com. I checked it against v1. The published text uses "subagent", "final-round answers", "multi-agent gain" and "capability-saturation threshold".
  - **MDAgents**: arXiv:2404.15155v3. **MedAgents**: arXiv:2311.10537v4. **Du**: arXiv:2305.14325.
  - **CorrErr**: Kim, Garg, Peng, Garg, ICML 2025, arXiv:2506.07962v1.
  - **Prism**: arXiv:2406.14544v1. **MMVP**: Tong et al., arXiv:2401.06209v2. **MMStar**: arXiv:2403.20330v2.
  - **VQAv2**: Goyal et al., arXiv:1612.00837v3. **NaturalBench**: arXiv:2410.14669v4.
  - **ProbMed**: Yan et al., arXiv:2405.20421v5. **Zafar**: arXiv:2607.03647v1.
  - **Geijer**: *Insights Imaging* 2018, full text PMC5990995.
  - **Taylor**: *Eur J Cancer* 2008. Abstract only (PMID 18353630).
- Further sources. The manuscript cites these in the same sentences, or no listed paper covers the concept:
  - Abstracts of Bruno 2015 (RadioGraphics), Kurvers 2016 (PNAS), McKinney 2020 (Nature), Dratsch 2023 (Radiology) and Loy & Irwig 2004 (JAMA).
  - Jin 2024 (npj Digit Med, full text).
  - **Z&F**: Zeiler & Fergus, arXiv:1311.2901v3 §4.2.
  - **Zhu26**: Zhu et al., "Demystifying Multi-Agent Debate", arXiv:2601.19921v3, already in `refs.bib` as `demystifying_mad`.
  - Clemen & Winkler 1985 (*Oper Res* 33:427, abstract) and Morrison & Schmittlein 1991 (*Oper Res* 39:519, title and abstract).

These terms have no hits in any of the sources above: perceiver, reasoner (as a stage name), judging (in this sense), question-blind, findings report, image evidence, question-text prior, reading panel, reader panel, specialty panel, generic panel, discussion panel, consensus error, flip rate, region dependence, reference case, round 0, abandon, overturn, deference, effective number, report pathway, reader study, second read, panel advantage. NMI-v1 uses "reader" 0 times outside the arXiv HTML footer and "agent" 354 times.

## 1. Highest-impact problems

1. **The whole "panel" vocabulary is coined**: reading panel, specialty panel, generic panel, discussion panel and panel advantage. NMI uses "Multi-Agent System (MAS)", "Independent", "Decentralized", "MAS advantage" and "multi-agent gain". Your own keyword (`main.tex:24`) and intro:5 say "multi-agent system", then the text switches vocabularies.
2. **"Generic panel" is self-consistency in the field's taxonomy**: identical prompt, sampling and majority vote. MDAgents lists CoT-SC under single-agent ("Solo") methods. Du and NMI call self-consistency a single-model or single-agent strategy.
3. **Perceiver, reasoner, seeing and judging are coined.** Prism says "perception module/stage" and "reasoning module/stage". Radiology (Bruno; Geijer; your own intro:3) says "perceptual" vs "interpretive/cognitive".
4. **"Question-text prior" and "image evidence" are coined.** The field says "language prior(s)" (VQAv2, NaturalBench, Zafar) and "visual evidence" or "visual information" (Zafar, Prism). The manuscript itself already uses "language priors" (intro:7, disc:9).
5. **"Gray image" is called a "blank" image by Zafar**, the paper whose numbers you cite: "Uniform gray image at the channel mean".
6. **"Reference cases" are few-shot or in-context examples** (MDAgents, MedAgents).
7. **"Region dependence", "region reliance" and "flip rate" are coined.** The terms in Z&F and Zafar are "occlusion sensitivity" and "answer-change"/"prediction changes". "Visual grounding" is a keyword but never appears in the text.
8. **One measure has four names**: "conformity" (meth:96), "abandoned/abandonment" (results, Fig 9), "overturned" (abs, hl, concl) and "deference" (disc:7).
9. **Several words collide with the field's meaning:**
   - "consensus errors" are measured in Independent panels, but the field's "consensus" is what discussion produces.
   - "independent" has three senses.
   - "baseline" here means generic-panel φ; NMI's baseline is single-agent performance.
   - "reader study" implies human readers.
   - "rendering" means 3D rendering in radiology.

## 2. Term table

### 2a. Readers, panels, study framing

| Our term | n; first use | Related papers' term (quoted, source) | Verdict |
|---|---|---|---|
| reader(s) | 165 (all compounds); abs:1 ("model readers") | Radiology: "In double reading, two or more radiologists read the same images" (Geijer, key points); "the AI system outperformed all of the human readers" (McKinney, abstract); "Reader Performance" (Dratsch, title). Agent papers: "a set of agents" (NMI-v1 L168); "multiple instances of a language model" (Du p.1); "solo medical agents" (MDAgents p.4) | Keep (radiology term). Say once that a reader is one agent (NMI). Collapse the variants: "model readers" abs:1, "AI readers" intro:9, "API readers" res:53, "generic readers" meth:80, "report readers" meth:57 |
| single reader | 31; abs:3 | "Single reader aided by CAD" (Geijer, Table 1); "Seventeen compared double to single reading" (Taylor, abstract); "Single-Agent System (SAS)" (NMI-v1 L168); "single-agent baselines" (L130); "Solo/Group/Adaptive setting" (MDAgents, Table 2 caption, p.6) | Keep |
| reading panel(s) | 24, plus title main.tex:18; abs:3 | No source uses it. "Multi-Agent System (MAS)" (NMI-v1 L168); "Multi-agent (Single-model)" vs "Multi-agent (Multi-model)" (MDAgents, Table 2 row groups, p.6); "5 homogeneous agents using the same language model" (Zhu26 p.6). "Panel" for models appears only in the title "a panel of diverse models" (Verga et al., in CorrErr's reference list, p.11). Geijer's "consensus panel" is a reference standard | Coined. Use "multi-agent system" (your keyword) or plainly "nine readers from one model" |
| independent reading panel / independent specialty panel | 1 / 6; abs:3 / meth:9 | "Independent systems aggregate isolated outputs" (NMI-v1 L161); "Each of n agents performs k reasoning iterations independently, then outputs are aggregated" (L207) | Replace with NMI's "Independent" architecture. One arm currently has three names: abs:3, meth:9, and "specialty panels" at meth:53. Fig 2a says "Independent" |
| specialty panel | 12; meth:9 | "we assign medical expertise and roles to multiple LLMs" (MDAgents p.4); "role-playing, where each agent adopts a specific role" (MDAgents p.3); "role-playing setting" (MedAgents p.1); "agent specialization" (NMI-v1 L218); "role prompts" (L615); "sub-specialist" (Geijer) | Coined. Say "readers with subspecialty roles" |
| roster; "ranked 9 ... roles" | 2; meth:65 | "An MDT recruited by recruiter LLM" (MDAgents p.5); "recruit a group of question domain experts" (MedAgents p.3) | Replace with "recruited" |
| generic panel; also "generic reading panel" meth:40, "generic readers" meth:80 | 15; abs:5 (undefined in the abstract) | "Few-shot CoT-SC [82] builds upon Few-shot CoT by sampling multiple chains to yield the majority answer", listed under Solo baselines (MDAgents p.7); Du on self-consistency: "We note that these techniques are applied over a single model instance" (p.1); "single-agent strategies such as self-consistency" (NMI-v1 L165) | Coined, and it conflicts with the field taxonomy. Say "self-consistency (9 samples, majority vote)" |
| discussion panel | 11; abs:3 | "Multiagent Debate" (Du, title) and "Multi-Agent (Debate)" (Du, Table 1, p.6); "Agents communicate in d sequential debate rounds ... This enables consensus formation through peer-to-peer discussion" (NMI-v1 L211); "collaborative multi-round discussion" (MedAgents p.1); "iterative discussion process aimed at reaching a consensus with at most R rounds" (MDAgents p.5); "Multi-agent debate (MAD)" (Zhu26 p.1) | "Discussion" is a field term: keep it and drop "panel". Use "debate" or "discussion" |
| panel reader(s), incl. "generic-/specialty-panel readers" | 10; meth:40 | "sub-agent outputs" (NMI-v1 L195) | Follows the "panel" decision |
| "readers sharing everything" (res:85; Fig 7a "Two readers that share everything") | 1 in text, plus Fig 7a; res:85 | "homogeneous agents using the same language model" (Zhu26 p.6); "homogeneous high-capability" (NMI-v1 L583) | Replace with "homogeneous readers" |
| reader study | 2, plus title; intro:9 | In radiology the readers are people: "27 radiologists read 50 mammograms" (Dratsch, abstract); "an independent study of six radiologists" (McKinney, abstract). "we present a controlled evaluation" (NMI-v1 L144); "Here we conduct a controlled experiment" (NMI-pub, abstract) | Misapplied: disc:21 says there were no human readers. Use NMI's "controlled evaluation" |
| double reading; second reader | 3; 4 — intro:3 | Geijer (passim); "independent second reading", "double reading with arbitration" (Taylor, abstract); "reduced the workload of the second reader by 88%" (McKinney) | Keep |
| "read" as a noun: second read, independent second read(s), second AI read, "one read than to nine" | 6 / 3 / 2 / 3 — abs:7 | "independent second reading" (Taylor); "primary and secondary reading", "discordant readings" (Geijer) | Replace with "reading" or "reader": "independent second reading"; "closer to one reader than to nine" |
| "changed reports at rates" (second-reader effect) | 1; intro:3 | "The rate of discrepancy varied from 0.4 to 22% depending on study setting"; "can find discrepancies in the original report" (Geijer, abstract) | The field's noun is "discrepancy (rate)". The manuscript never uses it |
| role(s); role prompts | 17; 1 — abs:5; intro:5 | "differing only in scale and role prompts" (NMI-v1 L615) | Keep |
| agent; multi-agent system(s) | 2; 1 — intro:5, plus keyword main.tex:24 | NMI throughout | Used once, then replaced by "reading panel". Pick one vocabulary |

### 2b. Discussion, voting, aggregation

| Our term | n; first use | Related papers' term (quoted, source) | Verdict |
|---|---|---|---|
| round 0 / round-0 (Fig 2c "Round 0") | 10; meth:96 | "After initial responses are generated from different agents, we initiate a round of debate" (Du p.4); "plurality/majority vote over the final-round answers" (NMI-pub, definition of Decentralized MAS) | Replace with "initial answer". You already use "initial answers" (meth:65), "initial responses" (meth:67) and "initial minority" (res:119, disc:7) |
| round(s); final | 13; 6 — meth:40; meth:96 | "debate rounds" (NMI-v1 L211); "rounds of discussions" (MedAgents p.4) | Keep |
| unanimity; unanimous | 5; meth:67 | "a unanimous report is generated" (MedAgents p.3); "converge on a single shared answer after multiple rounds of debate" (Du p.4) | Keep |
| majority vote / voting; majority accuracy | 9; 5 — meth:65; res:15 | "majority voting" (NMI-v1 L195); "Majority Voting" (MDAgents, Table 2); "Multi-Agent (Majority)" (Du p.6); "simple majority vote" (Zhu26 p.1) | Keep |
| majority / minority answers | 31; 11 — abs:5 | "groups converge to majority opinions regardless of correctness" (Zhu26 p.3); Asch 1956 title "A minority of one against a unanimous majority" (refs.bib `asch1956conformity`) | Keep |
| aggregation | 4; meth:65 | "how sub-agent outputs are aggregated (e.g., majority voting, weighted synthesis)" (NMI-v1 L195); "aggregation strategy" (L218); "Aggregating the independent judgments of doctors" (Kurvers, abstract) | Keep |
| panel advantage (Fig 2a "Gain over single reader") | 2; res:9 | "MAS advantage" (NMI-v1 L368, L617); "predicts the sign of the multi-agent gain" (NMI-pub) | Replace with "multi-agent gain" and use one label in text and figure |
| mean reader accuracy; individual (reader) accuracy | 8; 4 — meth:92; intro:3 | "the diagnostic accuracy of doctors", "individual decision makers" (Kurvers, abstract) | Keep |
| conformity | 1; meth:96 | "heterogeneous viewpoints help mitigate conformity pressure and 'groupthink,' where groups converge to majority opinions regardless of correctness" (Zhu26 p.3); Zhu26's reference list includes "Conformity in large language models" (ACL 2025). Du: "each agent would quickly change their opinion to a consensus answer" (p.7) and "relatively 'agreeable'" (p.4) | Keep, and use it wherever this measure is reported |
| abandon / abandonment (Fig 9 "Abandoned (%)"; supplement tables "Abandoned, ...") | 8; res:113 | "change their opinion" (Du p.7); "maintain their opinions" (Du p.8) | A coined second name for meth:96 "conformity". Replace |
| overturned | 3; abs:5 | "change their opinion" (Du p.7); "correct and incorrect decisions of the best doctor that are overruled by the collective" (Kurvers, abstract) | A third name for the same measure. The agent is wrong too: readers changed their answers; "discussion" did not overturn them. Replace |
| deference ("to peers"; "to incorrect AI BI-RADS suggestions") | 2; disc:7 | "Automation bias (the propensity for humans to favor suggestions from automated decision-making systems)" (Dratsch, abstract and title) | Replace with "automation bias" in the Dratsch sentence and "conformity" for peers |
| consensus errors | 11; abs:5 (defined meth:94) | "how often do models converge on the same wrong answer?" (CorrErr p.1); "agreement rate when both models are wrong" (CorrErr p.4). In the agent papers, consensus is what discussion produces: "converge to a final consensus answer" (Du p.4); "consensus within the MDT is determined by parsing and comparing their opinions" (MDAgents p.5); "consensus formation through peer-to-peer discussion" (NMI-v1 L211) | Coined, and the word clashes with the field's meaning. You measure it in Independent panels before any discussion, and disc:7 then uses "final consensus" in the field's sense. Say plainly "items that ≥7 of 9 readers answered wrongly" or "shared wrong answers" |

### 2c. Error correlation and independence

| Our term | n; first use | Related papers' term (quoted, source) | Verdict |
|---|---|---|---|
| error correlation, φ | 64; abs:1 | "These measures of error correlation aim to reduce confounding based on model accuracy" (CorrErr p.4); title "Correlated Errors in Large Language Models" | Keep. Where you cite CorrErr, note that its measure is "agreement rate when both models are wrong", not Pearson φ |
| shared errors; correlated (errors) | 7; 3 — abs:1; intro:5 | "highly correlated errors", "avoiding correlated failure" (CorrErr p.1); "duplicates errors without correction opportunities" (NMI-pub; NMI-v1 L405 "duplicating errors") | Keep. The title says "share their errors" and the text alternates between "shared" and "correlated": pick one |
| effective number of independent readers, N_eff; also "effective independent readers" (abs:7), "independent readers" (hl:2), Fig 2b "Effective readers, N_eff" | 5; abs:3 | No listed source names it. 9/(1+8φ) is Kish's design-effect effective sample size, n/[1+(n−1)ρ] (standard statistics, not a listed source). In expert aggregation: "positive dependence among information sources can have a serious detrimental effect on the precision and value of the information" (Clemen & Winkler 1985, abstract); "How Many Forecasters Do You Really Have?" (Morrison & Schmittlein 1991, title) | Keep as a defined quantity, which the author's rule allows. Cite where the formula comes from, and use one label instead of four |
| "independent", three senses | 29; abs:3 | NMI's "Independent" is an architecture (NMI-v1 L161) | Collision: the "independent specialty panels" (architecture) have φ up to 0.915, while "independent readers" means uncorrelated, and meth:77's "independent-report condition" is a third sense. Keep "Independent" for NMI's architecture only and rename the report condition |
| baseline (error correlation); original-image baseline (A0) | 5; meth:40 (also res:85, Fig 7a) | NMI's baseline is single-agent performance: "once single-agent baselines exceed an empirical threshold of ∼45%" (NMI-v1 L130) | Collides with NMI's meaning. Rename to "within-model (generic-panel) error correlation" |
| complete correlation; complementary errors; independent observations | 1 each; res:13; disc:19; disc:5 | — | Plain English. Keep |

### 2d. Shared components and contrasts

| Our term | n; first use | Related papers' term (quoted, source) | Verdict |
|---|---|---|---|
| shared components; "what (two) readers share" (res:84 heading) | 7; 3 — intro:9 | "This literature focuses on the degree to which models use shared components" (CorrErr p.2); "the component sharing hypothesis ... that models with the same components are more likely to have correlated outputs" (CorrErr p.3, citing Bommasani et al. 2022) | Keep, and cite CorrErr or Bommasani for the framing |
| matched contrasts; role / rendering / reference-case / report / perceiver / reasoner / model contrast | 4, first at meth:101; 27 (excluding "contrast-limited", meth:46), first at meth:96 | Standard statistical term | Keep. The labels take on the renamings below |
| graded ladder | 1; disc:17 | — | Coined metaphor. Say "ordering" |
| rendering(s), image rendering (Fig 7 "Image rendering"; meth:40 "varied image rendering (C2)") | 17; 5 — intro:9 | No source. The method is "Contrast Limited Adaptive Histogram Equalization" (Zuiderveld, title); Zafar calls its own image manipulations "counterfactual image conditions" (p.3–4) | Coined and misapplied: in radiology "rendering" means volume or 3D rendering. Say "contrast transformation (gamma 0.7, CLAHE)" |
| cross-vendor | 1; meth:80 | "three LLM families" (NMI-v1 L130); "providers" (CorrErr p.1); your own intro:5 says "providers" | Replace with "cross-provider" |
| regression summary | 1; res:89 | — | Keep |

### 2e. Image evidence and the prior

| Our term | n; first use | Related papers' term (quoted, source) | Verdict |
|---|---|---|---|
| image evidence | 11; hl:6 (main text intro:5) | No source. "extract and articulate visual information in textual form" (Prism p.1); "Visual content is unnecessary for many samples" (MMStar p.1); "whether they reason from visual evidence or exploit textual shortcuts" (Zafar p.1) | Coined compound. Use "visual evidence" (Zafar) or "visual information" (Prism) |
| question-text prior | 9; abs:7 (defined intro:7) | "We propose to counter these language priors"; "learned to exploit language priors" (VQAv2 p.1); "can largely be solved with language priors like commonsense knowledge" (NaturalBench p.1); "language priors, rather than visual reasoning, drive predictions" (Zafar p.1; "text-prior" once, p.6); "The answers can be directly inferred from the questions and options, or the world knowledge embedded in LLMs" (MMStar p.1). Radiology: "tests read twice by the same readers, once without and once with clinical information" (Loy & Irwig, abstract) | Coined. Use "language prior". You already use "language priors" (intro:7, disc:9) and "shortcuts" (intro:7) for the same concept, and the supplement uses "prior" as a noun ("Abandoned, same as prior") |
| prior knowledge (in the definition of judging) | 1; intro:9 | — | Clashes with "prior". This resolves itself if "language prior" is adopted |
| prior decomposition | 1; meth:94 | "VBR counts items where the image enables a correct answer" (Zafar p.5) | Coined label. Delete it: the sentence already says "cross-tabulated" |
| gray image(s) (Fig 3 "Gray", Fig S1 "Gray image") | 33; abs:3 | Zafar calls this stimulus "Blank" and defines it as "Uniform gray image at the channel mean" (p.4); "the signed gap when content is replaced by a blank image" (p.4) | Replace with "blank image" and define it once as uniform gray |
| gray-image majority / gray-image answer(s) | 7 / 5; abs:5 / res:113 | — | Follows the row above |
| original image (15) vs real image (6) | meth:40 / meth:98 | Zafar's condition "Real ... Original, unmodified image" (p.4) | Two names for one condition. Pick one |
| graded evidence; evidence level(s) | 5; 2 — intro:9; meth:70 | No source. "counterfactual image conditions" (Zafar p.3–4); your abstract itself says "gray images, reduced resolution" | Coined. Say "reduced resolution and blank images" |
| removing / replacing the image; without the image | 5; 3 — intro:7; meth:77 | "image substitution costs only ≤6.5 pp on medical benchmarks versus 48–61 pp" (Zafar p.1); "without any visual input" (MMStar p.1) | Keep. intro:7 correctly says "Replacing" for Zafar's 6.5 pp (substitution with CLIP-retrieved images). Keep that separate from your own removal condition (res:26–30; disc:9 "Removing the image") |
| abstentions; unparsed answers; refusals (supplement: "declined") | 4; 1; 1 — meth:101 | — | One concept, four names. Unify |
| chance | 5; intro:7 | "worse than random guessing" (ProbMed p.1) | Keep |

### 2f. Occlusion and paired images

| Our term | n; first use | Related papers' term (quoted, source) | Verdict |
|---|---|---|---|
| region occlusion; target / control occlusion; target / control box | 5; 3 / 7; 7 — abs:3 | "systematically occluding different portions of the input image with a grey square, and monitoring the output of the classifier" (Z&F §4.2, p.5); "30% random patch occlusion" (Zafar p.4) | Keep |
| region dependence (API arm; Fig 5b) / region reliance (open-weight arm) / panel-reader region dependence | 6 / 1 / 1; meth:94 / meth:98 / disc:11 | Section heading "Occlusion Sensitivity" (Z&F §4.2, p.5); "accurate visual grounding is crucial" (MMVP p.1); "grounding metrics" (Zafar p.1). "Visual grounding" is your keyword (main.tex:24) and never appears in the text | Coined, with two names for one construct. Say "occlusion sensitivity (target minus control)" |
| flip rate | 5; meth:94 | "visually reliant if its prediction changes when the image is removed or made uninformative" (Zafar p.1); "binary answer-change criterion" (Zafar p.6). Your Fig 5a axis already says "Answers changed by occlusion (%)" | Coined. Say "answer-change rate" |
| queried region / target / organ or lesion; relevant anatomy | 5; 1 — meth:77; disc:11 | — | Plain. Use one phrase |
| image pairs; paired images; same-question, different-image pairs (Fig 5c "Same question, different image") | 4; 7; 1 — abs:3; intro:9; meth:72 | "collecting complementary images", "a pair of similar images that result in two different answers to the question" (VQAv2 p.1); "pairing each question with two images that yield different answers" (NaturalBench p.1) | Keep "paired images" and drop the variants |
| pair accuracy | 3; meth:94 | "The model receives a score only when both questions for the CLIP-blind pair are answered correctly" (MMVP p.3); "'question accuracy' (Q-Acc) ... award a point only if a model correctly answers a question for both images" (NaturalBench p.7) | Keep (MMVP usage), or adopt NaturalBench's Q-Acc: S5 has exactly NaturalBench's design |
| answers differing between paired images | 7; meth:94 | "models often choose the same answer regardless of the image" (NaturalBench p.1) | Keep |
| image use; use of the image | 2; res:52 | "visual dependency" (MMStar p.1) | Plain |
| manipulations; interventions; conditions | 5; 3; 15 — abs:3; disc:11 | "controlled surrogates", "counterfactual image conditions" (Zafar p.1, p.3–4) | Plain. Use one word |

### 2g. Seeing, judging and reports

| Our term | n; first use | Related papers' term (quoted, source) | Verdict |
|---|---|---|---|
| seeing; judging | 14; 10 — abs:7; intro:9 | "a perception stage ... and a reasoning stage" (Prism p.1); "the intertwined nature of seeing and reasoning in existing VLMs" (Prism p.1); "perceptual errors (those in which an important abnormality is simply not seen on the images) and cognitive errors (those in which the abnormality is visually detected but the meaning or importance of the finding is not correctly understood or appreciated)" (Bruno, abstract); "judged as perceptual in 26% and interpretive in 70%" (Geijer, study table, Sung 2009); "image comprehension, recall of medical knowledge, and step-by-step multimodal reasoning" (Jin, abstract). Your intro:3 already says "perceptual or interpretive" | "Seeing" has one informal precedent (Prism, abstract and intro); "judging" has none. Use "perception" and "interpretation" (radiology, matching intro:3) or "perception" and "reasoning" (Prism) |
| perceiver; reasoner; also "report writers" (meth:40) | 27; 35; 1 — abs:3 | Neither noun appears in any source as a stage name ("reasoner" only appears generically: the "zero-shot reasoners" title, Zafar's "image-reliant reasoner"). "consisting of a perception module and a reasoning module"; "The perception module, typically a VLM" (Prism p.3); "visual descriptions generated by GPT-4o" (ProbMed p.1) | Coined. Use "perception module" and "reasoning module" (Prism), or "report-writing model" and "answering model". "Report writers" is a third name; Fig 6 uses "Reports written by" |
| question-blind | 6; abs:3 | "An instruction (can be query-agnostic or query-aware)" (Prism p.2); "Generic Instruction: a standardized, universal instruction aimed at extracting and describing the basic elements present in an image" (Prism p.3) | Coined. Use "query-agnostic" |
| findings report | 10; abs:3 | "informative visual descriptions" (Prism p.4); "visual descriptions" (ProbMed p.1); radiologists' "report" (Geijer) | "Report" is acceptable. Use "query-agnostic report" or "visual description" |
| report pathway; "this pathway" | 3; meth:77 | "Prism comprises two distinct stages" (Prism p.1) vs "the end-to-end GPT-4o" (p.4) | Coined. Say "two-stage (report, then answer)"; "reading images directly" becomes "end-to-end" |
| own report; separate reports; independent-report condition | 9; 4; 1 — meth:57; res:73; meth:77 | — | One condition, three names. Pick one ("own report") |
| shared report | 12; abs:5 | — | Keep |
| slot | 1; meth:75 | — | An internal code word. Say "report index (1–9)" |
| report coverage; omission | 2; 4 — meth:77; res:75 | — | Keep |

### 2h. Reference cases

| Our term | n; first use | Related papers' term (quoted, source) | Verdict |
|---|---|---|---|
| reference case(s); shared / private reference cases; reference images / text; text-only reference cases; reference format (Fig 8 "No references") | 45; 9 / 11; 12; 3; 1 — abs:3 | No source. "Few-shot [8] involves a small number of examples" (MDAgents p.7); "Few-shot ... introduces several manually templated demonstrations" (MedAgents p.5) | Coined. Say "retrieved in-context (few-shot) examples"; shared/private becomes "the same examples for every reader" vs "different examples per reader" |

### 2i. Open-weight arm

| Our term | n; first use | Related papers' term (quoted, source) | Verdict |
|---|---|---|---|
| open-weight models | 16; abs:3 | — | Keep |
| visual reliance (Fig S1b) | 6; meth:98 | "Visual Reliance Score (VRS) ... quantifies the net advantage of real visual content over a semantically destroyed image" (Zafar p.4); "visually reliant if its prediction changes when the image is removed" (Zafar p.1) | Keep the name, but state that your measure (\|Δ log-odds\| or KL, real vs gray) is not Zafar's VRS (accuracy, real vs shuffled). It is closer to Zafar's "Blank Drop" |
| vision encoder (3) / visual encoder (1) | intro:5 "visual"; meth:42 "vision" | "the CLIP vision encoders could become a bottleneck in such systems" (MMVP p.2) | Keep "vision encoder" and fix intro:5 |
| letter readout | 1; meth:87 | — | Jargon. Say "option-letter probabilities" |
| forward pass | 3; meth:59 | — | Keep |

### 2j. Labels

| Our term | n; first use | Related papers' term | Verdict |
|---|---|---|---|
| S1–S5; item sets | 6; abs:3 | "benchmarks" (NMI) | Keep |
| A0–A3, B, C, D, C1, C2, V1–V6 | C1/C2 appear only at meth:40 | — | C1 and C2 are missing from Table 2. Define them there or drop them |
| closed questions | 9; meth:4 | The datasets' answer type, "closed-ended" or "closed" | Minor |
| keywords "Multi-agent system", "Visual grounding" | main.tex:24 | — | "Visual grounding" never appears in the text; "multi-agent system" appears once (intro:5) |

## 3. Predicates for key relations

| Our predicate | Where | How related papers phrase it (source) | Note |
|---|---|---|---|
| consensus errors "repeated the gray-image majority" | abs:5, hl:3, res:36, disc:9; but "matching" in the Fig 4b caption (res:48) and "Same as gray-image majority" on the Fig 4b axis | "converge on the same wrong answer"; "agree ... when both models err" (CorrErr p.1); "arriving at the same wrong answer under image perturbation" (Zafar p.7) | Use "matched" (your own caption) |
| Discussion "overturned" correct minority answers | abs:5, hl:6, concl:3 | "change their opinion to a consensus answer" (Du p.7); "overruled by the collective" (Kurvers) | The readers changed their answers; discussion is not the agent |
| readers "abandoned" correct answers; "abandonment" | res:113 ×2, res:115, res:117 ×2, res:124 ×2, disc:7 | "change their opinion" (Du p.7); "maintain their opinions" (Du p.8) | Same measure as meth:96 "conformity" |
| Discussion "preserved correct majority answers" | disc:7 | "maintain their opinions" (Du p.8) | — |
| discussion "exposed those answers to a majority" | disc:7 | "conformity pressure" (Zhu26 p.3) | — |
| "deference to peers"; "deference to incorrect AI BI-RADS suggestions" | disc:7 ×2 | "Automation bias"; "more likely to follow the suggestions of the purported AI" (Dratsch) | — |
| discussion "increased agreement"; "brought reader errors close to complete correlation" | disc:3, concl:3; res:13 | "converge on a single shared answer" (Du p.4); "convergence of agent opinions" (MDAgents p.10); "consensus formation" (NMI-v1 L211) | — |
| panels "changed accuracy by" / "changed accuracy little" | abs:5; res:5, 9, 71 | "Relative performance change compared to single-agent baseline" (NMI-v3 abstract); "whether coordination improves or decreases performance" (NMI-pub abstract) | — |
| Qwen "gained"; "Accuracy gains" | abs:5; res:7; disc:5 | "multi-agent gain" (NMI-pub); "MAS advantage" (NMI-v1 L368) | — |
| reader accuracy "accounted for more of the panel advantage than majority voting did"; voting / aggregation "added" | res:9; res:9, disc:5 | "Aggregating the independent judgments of doctors outperforms the best doctor in a group" (Kurvers) | — |
| nine readers "provided 1.17–1.99 effective independent readers" / "were worth" / "behaved like few independent readers" / "did not provide nine independent reads" / "is closer to one read than to nine" | abs:7 / hl:2 / res:11 / disc:3 / disc:19, concl:3 | "a serious detrimental effect on the precision and value of the information" (Clemen & Winkler); "How Many Forecasters Do You Really Have?" (Morrison & Schmittlein); "duplicates errors without correction opportunities" (NMI-pub) | Five predicates for one quantity. Pick one |
| readers "shared the model's seeing and the question-text prior" | abs:7 | "models with the same components are more likely to have correlated outputs" (CorrErr p.3); "the CLIP vision encoders could become a bottleneck" (MMVP p.2) | "because ... shared" makes a causal claim |
| a second read "requires a different model to perform the seeing" / adds information "when a different model performs the seeing" | abs:7 / disc:19, concl:3 | "a perception stage that utilizes a VLM to extract and articulate visual information" (Prism p.1); "teams combining fundamentally different model architectures" (NMI-v1 L615) | — |
| shared report "increased error correlation" / "produced higher error correlation" / "made readers' errors more alike" | hl:4, concl:3 / res:73 / disc:15 | "have more correlated errors" (CorrErr p.1) | Three predicates for one result |
| different models "reduced error correlation"; private cases "lowered error correlation"; "Changing shared components lowered mean error correlation" | hl:5, concl:3, disc:3; res:101, res:103, disc:19; res:87 | "Diversity in training data, architecture, and providers is assumed to mitigate homogeneity in LLMs" (CorrErr p.1) | "decorrelate" does not occur in the files |
| "Removing the image lowered accuracy toward chance"; "Replacing the image with gray lowered accuracy"; "Gray images reduced ... accuracy"; "changed single-reader accuracy little" | disc:9; res:26; abs:5; res:28 | "image substitution costs only ≤6.5 pp" (Zafar p.1); "Blank Drop" (Zafar p.4); "achieves 42.9% ... without any visual input" (MMStar p.1) | — |
| Gemini reports "improved" / "raised accuracy for" the other reasoners | abs:5; res:69; disc:13 | "incorporating visual descriptions generated by GPT-4o, resulting in an average performance improvement of 9.44%" (ProbMed p.1) | — |
| "connected shared errors to the question-text prior"; "connects the limited return ... to measured error correlation"; "directly connecting responses to the queried region" | disc:9; disc:5; disc:11 | "exploit language priors" (VQAv2 p.1); "monitoring the output of the classifier" (Z&F p.5) | "Connect" is used as a causal verb three times |
| question text "steered readers toward an answer" | disc:9 | "models that ignore visual information" (VQAv2 p.1); "answers can be directly inferred from the questions and options" (MMStar p.1) | — |
| readers "reached the same wrong answer with and without image evidence" | disc:9 | "arriving at the same wrong answer under image perturbation" (Zafar p.7); "choose the same answer regardless of the image" (NaturalBench p.1) | — |
| interventions "distinguished use of the relevant anatomy from answering correctly through the question text" | disc:11 | "if the model is truly identifying the location of the object in the image, or just using the surrounding context" (Z&F p.5) | — |
| "locating an important source of their differences in seeing" | disc:15 | Prism's stated aim: "assessment of both proprietary and open-source VLM for their perception and reasoning strengths" (p.1) | — |
| contrasts "formed a graded ladder of reductions" | disc:17 | — | Say "were ordered" |
| "the same items elicit errors from most readers" | disc:5 | "agree ... when both models err" (CorrErr p.1) | — |
| "Readers sharing everything retained model-dependent error correlation" | res:85 | "homogeneous agents" (Zhu26 p.6) | — |
| a second reader "changed reports at rates that depended on the setting" | intro:3 | "The rate of discrepancy varied from 0.4 to 22% depending on study setting" (Geijer) | Use "discrepancy" |
| double reading "increased cancer detection compared with a single reader" | intro:3 | "Seventeen compared double to single reading. Double reading increases cancer detection and recall rates" (Taylor) | Taylor's comparator is single reading, and the recall-rate increase is dropped |
| pooling "improved accuracy when readers had similar individual accuracy" | intro:3; disc:19 | "Aggregating the independent judgments of doctors outperforms the best doctor in a group whenever the diagnostic accuracy of doctors is relatively similar" (Kurvers) | Kurvers' comparator is the best doctor; "improved accuracy" leaves it out |
| sampling and role prompts "change the text of each reader's response" | intro:5 | "individual model instances propose a diverse range of answers despite being the same model class" (Du p.2) | — |
| readers "could retain or revise their answers" | meth:67 | "update their responses based on the responses of other agents" (Du p.4); "maintain their opinions" (Du p.8) | — |
| "the benefit of collaboration shrank as the underlying model became more capable" | intro:5 | "Capable language models can outgrow the benefits of collaboration" (NMI-pub title); "capability-saturation threshold beyond which additional agents are unlikely to improve performance" (NMI-pub abstract) | Consistent with NMI |
| "decorrelate", "set the ceiling", "panel arithmetic" | — | — | None of these occurs in the seven files or the figure text. "arithmetic", "budget" and "memory" survive only in file names and labels (`fig_arithmetic.pdf`, `fig:budget`, `fig:memory`) |

## 4. Repeated emphasis (every location)

The author's rule allows a claim once each in the abstract, introduction, results and conclusions. Repeats beyond that are marked **excess**.

1. **A one-model panel is about one reader (N_eff):** abs:7; hl:2; res:11; disc:3; disc:5 (last sentence); disc:19 (last sentence); concl:3. Set up at intro:5 ("Different responses alone do not establish independent second reads") and intro:9. **Excess:** stated three times in the Discussion, and disc:19 and concl:3 are near-verbatim.
2. **A different model must do the seeing:** abs:7; disc:19; concl:3. **Excess:** disc:19 and concl:3 share an identical clause: "a second AI read adds independent information when a different model performs the seeing".
3. **Value depends on both accuracy and error correlation:**
   - intro:3, twice: "A second reader adds information only to the extent that the readers do not make the same errors"; "The value of another reader therefore depends on both individual accuracy and error correlation".
   - disc:5, first sentence.
   - disc:19, twice: "Complementary errors and adequate reader accuracy together determine the value of a second read"; "... alongside its individual accuracy and correlation with the first reader".
   - concl:3.
   - **Excess:** twice within intro:3 and twice within disc:19.
4. **Shared errors limited majority voting:** disc:3; concl:3.
5. **Discussion raises agreement, not accuracy; unanimous answers are wrong:** res:13; disc:3; disc:7; concl:3. **Excess:** disc:7 repeats res:13's "8.9% to 70.0% of unanimous answers were wrong".
6. **Discussion drops correct minority / image-dependent answers:**
   - abs:5; hl:6; res:117; concl:3.
   - disc:7, four sentences: "Discussion preserved correct majority answers more often than correct minority answers"; "every model abandoned correct answers that differed from its gray-image answers ..."; "Discussion thus exposed those answers to a majority ..."; "the final consensus reflects both the initial readings and subsequent deference to peers".
   - **Excess:** disc:7 also repeats res:119 ("more often in the initial minority").
7. **Consensus errors repeat the gray-image majority, 64.2–76.2%:** abs:5 (with numbers); hl:3; res:36 (numbers); disc:9 (numbers again). **Excess:** disc:9 states the point four ways in one paragraph:
   - opener: "The gray-image experiments connected shared errors to the question-text prior";
   - the numbers;
   - "Readers therefore often reached the same wrong answer with and without image evidence";
   - "question text supplied information that steered readers toward an answer even when the image required a different one".
8. **The gray image lowers accuracy and raises φ:** abs:5; res:26; res:30. **Excess:** disc:9 repeats res:26 and res:30, with the same three models listed.
9. **A shared report raises φ, 0.800–0.990:** abs:5 (numbers); hl:4; res:73 (numbers); concl:3. **Excess:** disc:15 repeats the numbers and restates the point three more times: "Sharing a report made readers' errors more alike"; "Fixing the findings removed much of the variation between readers"; "Repeated judgments from a shared report consequently depend on the same account of the image".
10. **Different models reduce φ most:** abs:5 (−0.048 vs −0.470); hl:5; res:87 (numbers); disc:3; concl:3. **Excess:** disc:17 repeats all six VQA-RAD means and adds two restatements: "These interventions progressively changed more of the information ..."; "None of the within-model changes brought error correlation near the level of readers from different models".
11. **Gemini reports help the other reasoners:** abs:5 (6.1–16.3 pp); res:69; disc:13.
12. **Perception and reasoning both matter:** res:67 ("depended on both the perceiver and the reasoner"). **Excess:** disc:13 says it three times: "Seeing and judging each contributed ..."; "The full comparison therefore identifies both the perceiver's extraction of findings and the reasoner's selection of an answer ..."; "the findings supplied and the model interpreting them determined the result".
13. **Accuracies with identical reports (74.5 / 62.0 / 45.6%):** res:71; disc:13.
14. **Region dependence, Gemini 32.9 vs Claude 3.2 pp:** res:53; disc:11.
15. **Paired images got the same answer:** res:57; disc:11.
16. **Accuracy is not evidence of image use:** intro:7, twice ("Answer accuracy alone does not measure the contribution of image evidence"; "agreement among the readers does not show that each extracted the findings the answer requires"); disc:11 ("accuracy on isolated questions is insufficient evidence of image use").
17. **Private reference cases lower φ while accuracy varies; Claude stays at 78.0%:** res:101; res:103; disc:19 (both claims and the 78.0% figure repeated).
18. **Kurvers and Taylor evidence:** intro:3; disc:19 ("Human evidence likewise supports pooling ... and double reading increased mammographic cancer detection").
19. **Design statement:** intro:9 "We separated image evidence from the question-text prior and seeing from judging" and meth:4 "The design distinguished image evidence from the question-text prior and separated seeing from judging". Also intro:9 "Controlled manipulations varied the image ... and varied what readers shared" and meth:4 "Controlled manipulations varied the information available to readers and the components they shared". Both are listed again in the Fig 1 caption (meth:9).
20. **Qwen's gain and its decomposition:** abs:5; res:7; res:9. **Excess:** disc:5 repeats res:9's 10.3 and 3.3 pp.
21. **Beta-binomial fit, −0.07 pp:** res:15; disc:5.
22. **The "independent second reads" refrain:** abs:7; intro:5; intro:9.

Repeated qualifiers:
- "therefore": intro:3, meth:75, disc:3, disc:9, disc:13.
- "both ... and" used for emphasis: intro:3, res:67, disc:7, disc:13, disc:17, concl:3.
- "Together" (disc:11, disc:19), "thus" (disc:7), "consequently" (disc:15).
- "directly connecting": disc:11.
- "Most"/"most" on the same claim: hl:3, res:36, disc:9.
- "consistently": disc:3, res:133.
- The marker and color legend sentence ("Blue circles denote GPT-5 mini; teal squares, ...") repeats in eight captions: res:21, 41, 48, 62, 80, 94, 108, 124. Captions must stand alone, so this is low priority.

## 5. Variant sets and collisions (summary)

**Several names for one thing:**
- **Arm without discussion:** "independent reading panels" (abs:3); "independent specialty panels" (meth:9); "specialty panels" (meth:53); "Independent" (Fig 2a).
- **Same-prompt arm:** "generic panels"; "generic reading panel" (meth:40); "generic readers" (meth:80).
- **First answers:** "round 0"; "initial answers"; "initial responses".
- **The conformity measure:** "conformity"; "abandoned/abandonment"; "overturned"; "deference".
- **Effective readers:** "effective number of independent readers"; "effective independent readers"; "independent readers"; "Effective readers, N_eff" (Fig 2b).
- **Panel gain:** "panel advantage"; "Gain over single reader" (Fig 2a); "accuracy difference between a reading panel and the single reader" (meth:92).
- **Image conditions:** "original" / "real" / Fig 4 "with image"; "gray image" / "Gray" / "uniform gray image".
- **Correctness:** text "correct"/"wrong" vs Fig 4 "Right"/"Wrong".
- **Report condition:** "own report"; "separate reports"; "independent-report condition".
- **Report writer:** "perceiver"; "report writer"; "Reports written by" (Fig 6).
- **Occlusion measure:** "region dependence"; "region reliance"; "panel-reader region dependence"; "flip rate" vs "Answers changed by occlusion" (Fig 5a).
- **Pairs:** "image pairs"; "paired images"; "same-question, different-image pairs".
- **Missing answers:** "abstentions"; "unparsed answers"; "refusals"; "declined" (supplement).
- **Model sources:** "providers" (intro:5); "vendor" (meth:80).
- **Encoder:** "visual encoder" (intro:5); "vision encoder".
- **Prior:** "question-text prior"; "language priors"; "shortcuts"; "prior" (supplement).
- **Error types:** "perceptual or interpretive" (intro:3) vs "seeing"/"judging".
- **Architecture class:** "multi-agent systems" (intro:5, keyword) vs "reading panel".

**One name for several things:**
- **"independent":** NMI's architecture; uncorrelated errors; the report condition.
- **"consensus":** items with ≥7/9 readers wrong in Independent panels vs agreement after discussion ("final consensus", disc:7).
- **"baseline":** generic-panel φ (meth:96, res:85, Fig 7a) and the "original-image baseline (A0)"; NMI's baseline is single-agent performance.
- **"report":** the radiologist's report (intro:3) vs the text a model writes from the image.
- **"prior":** "question-text prior" vs "prior knowledge" (intro:9).
- **"reader study":** in radiology it means human readers.
- **"rendering":** in radiology it means 3D or volume rendering.
- **"generic panels" in the abstract:** abs:5 uses the term without defining it.
