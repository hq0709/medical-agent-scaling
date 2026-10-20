# Writing review: defensive writing, repeated emphasis, coined terms

Manuscript: "Reading panels of vision-language models share their errors" (Meta-Radiology).

**Sources**
- /home/myid/hj67104/consultation_saturation/paper/radiology/sections/{abstract,highlights,introduction,methods,results,discussion,conclusions}.tex
- /home/myid/hj67104/consultation_saturation/paper/radiology/supplement.tex (S1, S2 and S5 prose only)

**How to read the locations**
- Each location is file:line. Every paragraph is one source line, so "sentence n" means the nth sentence of that line.
- Quotes show the rendered text, with LaTeX commands removed.
- The abstract is exactly 250 words, the journal limit. Every abstract suggestion below keeps the word count the same or lowers it.

No file in the repositories was changed.

## Must-fix

1. **D-01** | abstract.tex:7; discussion.tex:19 (sentence 7); conclusions.tex:3 (sentence 6) | "An independent second read of radiology images requires a different model to perform the seeing." | **Overclaim** (the claim is stronger than the evidence).
   - The largest drop in error correlation comes from changing the whole model (model contrast −0.470 to −0.492).
   - On MedXpertQA-MM, changing the reasoner lowers error correlation more than changing the perceiver (−0.430 vs −0.263; results:87, discussion:17).
   - discussion:13 names both the perceiver and the reasoner as sources of the differences.
   - results:133 finds that the pair of models sharing a vision encoder is no more correlated than other pairs.
   - abstract:7 also says "because its readers shared the model's seeing and the question-text prior", which leaves out judging.
   - Suggest for the abstract: "...because its readers shared one model's perception, interpretation and language prior. An independent second read of radiology images requires a different model." This is 4 words shorter. At discussion:19 and conclusions:3, end with "...when it comes from a different model."
   - **must-fix**

2. **D-02** | discussion.tex:19 (sentence 7) and conclusions.tex:3 (sentence 6) are near-verbatim. The same claim also appears at highlights.tex:2, abstract.tex:7, results.tex:11 and discussion.tex:3 (sentence 1). | "a reading panel built from one model is closer to one read than to nine, and a second AI read adds independent information" | **Repeated emphasis.** The same headline sentence closes both the Discussion and the Conclusions, and the Discussion also opens with it. | Suggest: delete discussion:19 sentence 7 and keep the sentence in the Conclusions. | **must-fix**

3. **D-03** | abstract.tex:7 (×2); introduction.tex:9 (×3 each); methods.tex:4, :57 (Table 2 row B), :74 (heading); results.tex:66 (heading); discussion.tex:13, :15, :17, :19; conclusions.tex:3 | "We separated image evidence from the question-text prior and seeing from judging. Seeing was defined as the extraction of visual findings, and judging as the selection of an answer" | **Self-coined term** (gerunds used as labels). introduction:3 already cites the field's terms: radiologists' errors are "perceptual or interpretive" (Bruno 2015). The VLM literature calls the same split perception and reasoning. | Suggest: use "perception" and "interpretation" throughout, including the headings and Table 2. | **must-fix**

4. **D-04** | abstract.tex:7; introduction.tex:7, :9; methods.tex:4, :69 (heading); results.tex:25 (heading); discussion.tex:7, :9; conclusions.tex:3 | "The question-text prior is information supporting an answer from the question and options without image content." | **Self-coined term.** The very next sentence cites Goyal 2017 and uses the standard name, "language priors". discussion:9 uses it too. | Suggest: write "language prior" at all nine places and delete the definition sentence at introduction:7 (sentence 2). | **must-fix**

## Should-fix

5. **D-05** | discussion.tex:3 (sentences 1–3) vs conclusions.tex:3 (sentences 1, 4, 5, 6) | "A reading panel of nine readers built from one VLM did not provide nine independent reads. Shared errors limited the benefit of majority voting" | **Repeated emphasis** plus **negative framing in a high-impact position.** The Discussion opens with a recap that the Conclusions repeat, and the headline is stated as a negation. | Suggest: replace sentences 1–3 with "Readers built from one VLM made correlated errors, so a panel of nine provided fewer than two effective reads." Keep sentences 4–5, fixed as in D-10. | **should-fix**

6. **D-06** | highlights.tex:5; abstract.tex:5, :7; discussion.tex:3 (sentence 3), :17 (sentence 7), :19 (sentence 7); conclusions.tex:3 (sentences 4, 6) | "None of the within-model changes brought error correlation near the level of readers from different models." | **Repeated emphasis** (8 statements, 3 of them in the Discussion) plus **negative framing.** | Suggest: in the Discussion, say it once at :17 in positive form: "A change of model lowered error correlation more than twice as much as any within-model change (Fig. 7b)." This holds on all three data sets. Delete discussion:3 sentence 3 (see D-05). | **should-fix**

7. **D-07** | introduction.tex:3 (sentence 6); discussion.tex:5 (sentence 1); discussion.tex:19 (sentence 1, and sentence 6 "alongside its individual accuracy and correlation with the first reader"); conclusions.tex:3 (sentence 2) | "The value of another reader therefore depends on both individual accuracy and error correlation." | **Repeated emphasis** (5 statements). | Suggest:
   - Keep introduction:3 and conclusions:3.
   - In the Discussion, keep only discussion:19 sentence 1, merged with its evidence as in D-36.
   - Delete discussion:5 sentence 1.
   - Trim discussion:19 sentence 6 to "...by the errors it corrects and introduces."
   - **should-fix**

8. **D-08** | discussion.tex:21 (sentences 2–3) | "Each condition used a single sampling seed; item bootstrap intervals did not measure variation across seeds. API models were evaluated through a single router at one time point." | **Self-volunteered weakness** (a negative self-limiting statement). The seed and the router are already stated as method facts at methods:40, and the basis of the CIs at methods:101. | Suggest: delete both sentences. State the scope positively in methods:40 instead: "All reader calls used OpenRouter between [dates]." | **should-fix**

9. **D-09** | methods.tex:101; results.tex:32; discussion.tex:21 (sentence 4); supplement.tex:37 (sentences 1–2) | "Gray-image abstentions counted as wrong; correlation among answered items was included as a sensitivity analysis." | **Repeated emphasis**: one limitation is stated in four sections. supplement:37 also says "part of the gray-image prompts" where results:32 gives 4.3% to 14.8%. | Suggest: keep methods:101 and results:32. Delete discussion:21 sentence 4 and supplement:37 sentences 1–2. | **should-fix**

10. **D-10** | discussion.tex:3 (sentence 4); supplement.tex:51 (sentences 1, 4) | "The same error correlation and rise during discussion occurred for text-only clinical questions, from 0.758 to 0.990" | **Overclaim** (the wording is stronger than the data).
    - In the imaging study, generic-panel error correlation ranges from 0.442 to 0.915, and S5 itself says only "the same magnitude".
    - S5 opens with "The same reading-panel designs", but its list includes centralized and tiered panels, which the imaging study does not use.
    - Suggest for discussion:3: "Error correlation of the same magnitude, and the same rise during discussion (0.758 to 0.990), occurred for text-only questions."
    - Suggest for S5: "Independent and discussion panels, together with centralized and tiered panels, were applied..."
    - Check which configurations the 0.758 covers. The NAACL source (/home/myid/hj67104/consultation_saturation/paper/sections/experiments.tex:145–148) computes it over Independent, Centralized and Decentralized panels and leaves Hybrid out. The count "340 configurations" does not appear in that source.
    - **should-fix**

11. **D-11** | discussion.tex:17 (sentences 3–5); the contrasts are also defined at methods.tex:96 and in the Fig. 7 caption (results.tex:94) | "These interventions progressively changed more of the information used in a reading while retaining the underlying model." | **Overclaim**: the study never measures an "amount of information" by which these interventions could be ranked. Sentences 3 and 5 re-define contrasts that methods:96 and the Fig. 7 caption already define (**over-explanation**). | Suggest: delete sentences 3–5. Keep the observed ordering, its replication across data sets (sentence 6) and the reasoner result (sentence 8). | **should-fix**

12. **D-12** | methods.tex:40; methods.tex:53–58 (Table 2); supplement.tex:31 (Throughput row) | "Because of its throughput, Qwen 3.8 Flash ran only the original-image baseline (A0), graded evidence (A1), generic reading panel (C1), and varied image rendering (C2)." | **Defensive resource framing**: a cost reason is given to excuse the scope, and the supplement row repeats the justification with seconds per call. | Suggest: "Qwen 3.8 Flash was evaluated in A0, A1, C1 and C2 (Table 2)." Delete the Throughput row. | **should-fix**

13. **D-13** | methods.tex:42 | "LLaVA-1.5 7B met the pooled threshold; its VQA-RAD validation accuracy was near chance." | **Self-volunteered weakness.** The inclusion rule uses pooled accuracy, and results:129 and Fig. S1a already report the model's accuracy. | Suggest: end the sentence at "met the pooled threshold." | **should-fix**

14. **D-14** | supplement.tex:37 (sentence 3) | "The output-quality stop that ends a run when more than 15% of answers cannot be parsed was designed to catch configuration errors and was turned off for the gray-image conditions." | **Self-volunteered weakness**: the sentence creates an objection (a safeguard was turned off) that a reader would not otherwise raise. Abstention handling is already specified elsewhere. | Suggest: delete. | **should-fix**

15. **D-15** | methods.tex:40 | "Google models were restricted to Gemini 3.7 Flash." | **Unnecessary disclaimer**: it answers a question nobody asked ("why not Gemini Pro?"), and the model list already names the model. | Suggest: delete. | **should-fix**

16. **D-16** | abstract.tex:5 (used there without definition); methods.tex:9, :40, :58 (Table 2, ×2), :67, :77, :94, :96; results.tex:94, :108; supplement.tex:31 | "Generic panels contained 9 readers with identical general-radiologist prompts; their initial responses differed only through separate sampling." | **Self-coined term.** Nine samples of one prompt combined by majority vote is what the LLM literature calls self-consistency (Wang et al.; already in refs.bib). | Suggest: use "self-consistency" (for example "self-consistency panels"), including at abstract:5. | **should-fix**

17. **D-17** | "Reading panel" is used in three senses.
    - Umbrella sense (all panel types): introduction.tex:5, :7, :9; methods.tex:4, :9, :64; results.tex:4, :21; discussion.tex:3, :19; conclusions.tex:3.
    - Independent-panel sense: abstract.tex:3; results.tex:5, :7, :26, :28.
    - Generic-panel sense: methods.tex:40.
    - Quote: "Reading-panel differences ranged from −2.8 to 0.8, −1.2 to 1.2, and −2.8 to 4.0 percentage points, respectively"
    - Problem: **inconsistent term** — one label names three different things.
    - Suggest: keep "reading panel" for the umbrella sense, as the Fig. 1 caption uses it. Write "independent specialty panel" at abstract:3 and results:5, :7, :26, :28.
    - **should-fix**

18. **D-18** | One measure goes by four names.
    - "Conformity": methods.tex:96.
    - "abandoned/abandonment": results.tex:113, :115, :117, :124.
    - "overturned": abstract.tex:5, highlights.tex:6, conclusions.tex:3.
    - "abandoned" and "deference" (×2): discussion.tex:7.
    - Quote: "Conformity was the proportion of readers correct in round 0 who ended the discussion wrong."
    - Problem: **self-coined synonyms.** "Deference" also replaces the cited study's own term, automation bias (Dratsch 2023).
    - Suggest: call the measure "conformity" wherever it is reported (Asch is in refs.bib) and use one verb for the event. Write "automation bias" at discussion:7.
    - **should-fix**

19. **D-19** | introduction.tex:9; methods.tex:9, :40, :58, :80 (×2), :96 (×3); results.tex:87, :89, :94 (×3); discussion.tex:17 (×2); conclusions.tex:3; supplement.tex:26, :31 | "In the rendering condition, generic readers 1–3 viewed original images, readers 4–6 viewed gamma-transformed images with gamma 0.7, and readers 7–9 viewed CLAHE images." | **Nonstandard term.** In radiology "rendering" means volume or surface rendering. Gamma correction and CLAHE are contrast enhancement. | Suggest: "contrast enhancement (gamma correction, CLAHE)" or "contrast-enhanced images". | **should-fix**

20. **D-20** | main.tex:18 (title); introduction.tex:9; methods.tex:4 | "This reader study evaluated single readers and reading panels of AI VLMs answering closed questions about radiology images." | **A field term used in a nonstandard sense.** In radiology, "reader study" means a study with human readers (multi-reader multi-case design). discussion:21 states that no human readers were included. | Suggest: replace it with a plain description, for example methods:4 "This study evaluated..." and a title ending "...: an evaluation on radiology images". | **should-fix**

21. **D-21** | introduction.tex:9; methods.tex:9, :40, :54 (Table 2 row A1), :70; supplement.tex:31 | "Graded evidence compared original images capped at 1024 pixels, images capped at 256 or 128 pixels, and uniform gray images." | **Self-coined label.** The abstract already uses plain words: "gray images, reduced resolution". | Suggest: "reduced resolution and gray images", including in Table 2 row A1. | **should-fix**

22. **D-22** | methods.tex:94, :98; results.tex:53, :55 (×2), :62; discussion.tex:11 | "Region dependence was target flip rate minus control flip rate" / "Region reliance subtracted the corresponding control-occlusion change from the target-occlusion change." | **Self-coined labels**, two of them for parallel measures. "Region reliance" is defined but never reported: results:55 gives the open-weight values in flip-rate points, under the name "region dependence". | Suggest: use the standard term "occlusion sensitivity" (target minus control flip rate). Give each reported measure one name and one definition. | **should-fix**

23. **D-23** | discussion.tex:17 (sentence 1) | "The matched contrasts formed a graded ladder of reductions in error correlation" | **Self-coined metaphor.** | Suggest: "...formed an ordering of reductions..." (sentence 6 already says "The ordering also held"). | **should-fix**

24. **D-24** | methods.tex:77 ("this pathway"), :94 ("Report-pathway analyses"); discussion.tex:13 ("report-pathway accuracy") | "Seeing and judging each contributed to report-pathway accuracy" | **Self-coined label.** | Suggest: "Experiment B" or "accuracy with findings reports". | **should-fix**

25. **D-25** | methods.tex:75 (sentence 6); supplement.tex:37 (sentence 4) | "Every reasoner therefore read identical reports for a given perceiver, image, and slot." | **Self-coined term, never defined**: "slot" means the report index, 1 to 9. | Suggest: "...for each of the 9 reports per image". | **should-fix**

26. **D-26** | highlights.tex:4; abstract.tex:5; results.tex:73; discussion.tex:15 (sentences 1, 2, 3, 6); conclusions.tex:3 (sentence 3) | "Sharing a report made readers' errors more alike." ... "Repeated judgments from a shared report consequently depend on the same account of the image." | **Repeated emphasis**: discussion:15 states the point three times and re-lists 0.800 to 0.990 from results:73. | Suggest: keep sentence 1. Delete sentence 2 (the numbers) and sentence 6 (it restates sentence 1). For sentence 3, see D-38. | **should-fix**

27. **D-27** | highlights.tex:6; abstract.tex:5; results.tex:113, :117, :119; discussion.tex:7 (sentences 1–4); conclusions.tex:3 (sentence 5) | "Discussion preserved correct majority answers more often than correct minority answers." | **Repeated emphasis**: discussion:7 sentences 1–3 restate results:113–119. | Suggest: merge sentences 1–4 into one interpretive sentence citing Fig. 9, for example: "On MedXpertQA-MM, correct answers that depended on the image were more often in the initial minority, so discussion exposed them to a majority sharing the language prior." | **should-fix**

28. **D-28** | highlights.tex:3; abstract.tex:5; results.tex:26, :30, :36; discussion.tex:9 (sentences 1–4, 7); conclusions.tex:3 (sentence 3) | "On MedXpertQA-MM, most consensus errors repeated the gray-image majority, ranging from 64.2% to 76.2% across models" | **Repeated emphasis.** discussion:9 restates results:26, :30 and :36 with their numbers. It then restates its own topic sentence twice ("Readers therefore often reached...", "Here, question text supplied..."). | Suggest:
    - Keep sentence 1, sentence 3 without its numbers, and sentence 6 (Loy).
    - Delete sentences 2, 4 and 7.
    - For sentence 5, see D-29.
    - **should-fix**

29. **D-29** | The point "accuracy alone does not show image use" appears three times.
    - introduction.tex:7: sentence 8 "Answer accuracy alone does not measure...", sentence 9 "...agreement among the readers does not show...", and the Goyal, Yan and Jin sentences.
    - discussion.tex:9, sentence 5: the same Goyal and Yan citations again.
    - discussion.tex:11, sentence 6: the same Jin citation again.
    - Quote: "Together, these interventions explain why accuracy on isolated questions is insufficient evidence of image use, consistent with correct medical answers accompanied by flawed image comprehension."
    - Problem: **repeated emphasis** plus **negative framing**; three citations are recycled from the Introduction.
    - Suggest: keep the point once, in the Introduction. Delete introduction:7 sentence 8, and recast the end of sentence 9 as "...so readers can agree without extracting the findings". Delete discussion:9 sentence 5 and discussion:11 sentence 6.
    - **should-fix**

30. **D-30** | introduction.tex:3 (sentences 1, 5); discussion.tex:19 (sentence 5) | "Human evidence likewise supports pooling independent judgments of similar accuracy, and double reading increased mammographic cancer detection." | **Repeated emphasis**: the Introduction's Taylor and Kurvers premises are cited again in the Discussion for the same claims. | Suggest: delete discussion:19 sentence 5. | **should-fix**

31. **D-31** | results.tex:9, :15; discussion.tex:5 (sentences 3–4) | "On VQA-RAD, its mean panel reader exceeded the single reader by 10.3 percentage points, and aggregation added 3.3 percentage points." | **Repeated emphasis**: Results numbers are reported again, together with "−0.07 percentage points". | Suggest: delete sentences 3–4. Fig. 2 and results:9 and :15 carry these numbers. | **should-fix**

32. **D-32** | results.tex:13; discussion.tex:7 (sentence 5) | "After discussion, 8.9% to 70.0% of unanimous answers were wrong." | **Repeated emphasis** (a repeated number). | Suggest: delete. | **should-fix**

33. **D-33** | results.tex:53; discussion.tex:11 (sentence 2) | "Gemini 3.7 Flash had the greatest panel-reader region dependence on SLAKE-target, at 32.9 percentage points, compared with 3.2 percentage points for Claude Haiku 4.5" | **Repeated emphasis** (repeated numbers). | Suggest: delete. Sentence 3 already states the target-versus-control result. | **should-fix**

34. **D-34** | abstract.tex:5; results.tex:67, :69, :71; discussion.tex:13 (sentences 2–4) | "Given identical Gemini 3.7 Flash reports on that set, Gemini 3.7 Flash achieved 74.5% accuracy, GPT-5 mini achieved 62.0%, and Claude Haiku 4.5 achieved 45.6%." | **Repeated emphasis**: sentences 2–4 restate results:69–71 with their numbers. | Suggest: replace sentences 2–4 with one sentence citing Fig. 6: "Gemini 3.7 Flash reports raised the other reasoners' accuracy, and with identical reports the reasoner still changed accuracy." | **should-fix**

35. **D-35** | abstract.tex:5; results.tex:87; discussion.tex:17 (sentence 2) | "On VQA-RAD, mean changes over models were −0.048 for role, −0.092 for rendering, −0.110 for reference cases, −0.199 for report, −0.311 for perceiver, and −0.470 for model." | **Repeated emphasis** (six repeated numbers). | Suggest: delete the sentence and cite Fig. 7b in sentence 1. | **should-fix**

36. **D-36** | results.tex:101, :103; discussion.tex:19 (sentences 1–4) | "Private reference cases lowered error correlation across the evaluated models and formats, while panel accuracy varied" | **Repeated emphasis**: this nearly copies results:101, and 78.0% is repeated from results:103. The paragraph also does four jobs at once: reference-case results, human evidence, a recommendation and the headline (**one paragraph, one job**). | Suggest:
    - Merge sentences 1–2: "...the value of a second read: private reference cases lowered error correlation in every model while panel accuracy depended on the model (Fig. 8)."
    - Delete sentences 3–4.
    - For sentences 5 and 7, see D-30 and D-02.
    - **should-fix**

37. **D-37** | discussion.tex:13 (sentences 5–6) | "Introducing an intermediate report did not itself improve reading; the findings supplied and the model interpreting them determined the result." | **Repeated emphasis within the paragraph** plus a **not-X-but-Y structure**: sentence 5 ("The full comparison therefore identifies both...") and sentence 6 both restate sentence 1. | Suggest: delete sentences 5–6. | **should-fix**

38. **D-38** | discussion.tex:15 (sentence 3) | "Fixing the findings removed much of the variation between readers, locating an important source of their differences in seeing." | **Hedge where a precise statement is available** ("much of", "an important source"). | Suggest: "Sharing one report raised error correlation more than any other within-model change (Fig. 7b), placing a major source of reader differences in perception." | **should-fix**

39. **D-39** | discussion.tex:11 (sentences 4–5); the pair design is also described at introduction.tex:7, methods.tex:16, :34 and results.tex:62 | "The paired-image experiment held the question constant and required opposite answers for different images. Readers frequently gave the same answer to both." | **Vague quantifier** plus **over-explanation**: sentence 4 re-describes the method. | Suggest: "Readers gave the same answer to both images in 25.0% to 57.5% of pairs (Fig. 5c)." | **should-fix**

40. **D-40** | results.tex:128–135; Experiment D is never mentioned in discussion.tex or conclusions.tex | "API consensus errors were associated with lower open-weight visual reliance on SLAKE, with little association on the other data sets." | **Role of each experiment**: Experiment D answers no question that the Discussion or Conclusions use. | Suggest: state in the Discussion what Experiment D shows (the gray-image and occlusion effects hold without sampling), or move results:128–135 to Supplementary S4, next to Fig. S1. Keep the encoder result wherever it ends up (D-41). | **should-fix**

41. **D-41** | results.tex:133 | "Models sharing a vision encoder did not have consistently higher error correlation than models with different encoders." | **Negative framing** plus **precision**: only one pair of models shares an encoder (methods:42). | Suggest: "The pair sharing a vision encoder (HuatuoGPT-Vision 7B, LLaVA-1.5 7B) had φ/φmax of 0.213 to 0.451, within the 0.148 to 0.725 range of pairs with different encoders." | **should-fix**

42. **D-42** | results.tex:89 | "Model-specific contrasts varied in direction for roles and rendering." | **Paragraph opens with a limitation** (a caveat in the topic sentence). | Suggest: fold the per-model ranges into results:87 as plain ranges, without the "varied in direction" opener. | **should-fix**

43. **D-43** | The same procedural assurance appears nine times.
    - methods.tex:4 (sentence 4).
    - methods.tex:42 ("prespecified accuracy rule").
    - methods.tex:75 ("before any reasoner read a report").
    - methods.tex:77 ("fixed ... before running this pathway").
    - methods.tex:80 ("prespecified 5-percentage-point limit").
    - methods.tex:103–104.
    - supplement.tex:13–14 and :37.
    - Quote: "The protocol and validation decisions were locked before the full runs."
    - Problem: **repeated emphasis.** These are explanations written to answer an objection nobody has raised.
    - Suggest: keep methods:4 sentence 4. Reduce methods:103–104 to "Six validation checks fixed the run settings (Table S1)." Drop the add-ons at :42, :77 and :80, and the restatement at supplement:14. For methods:75 and supplement:37, see D-44.
    - **should-fix**

44. **D-44** | methods.tex:75 (sentences 4–6); supplement.tex:37 (sentence 4) | "Each perceiver wrote its 9 reports for each image once, before any reasoner read a report." | **Over-explanation**: the sentence records an implementation fix the reader never sees. S2 repeats it, with the 12,906 count. | Suggest: "Each perceiver wrote 9 reports per image, reused across questions and read by every reasoner." In S2, keep only the length statistics. | **should-fix**

45. **D-45** | methods.tex:75 (sentence 3) vs supplement.tex:37 | "It wrote findings reports of at most 120 words describing modality and plane" | **Factual mismatch** (the skill keeps statements needed for accuracy): S2 reports maximum report lengths of 118 to 127 words. | Suggest: "It was instructed to write at most 120 words..." | **should-fix**

46. **D-46** | methods.tex:80 (sentence 4); supplement.tex:26 (V2) | "Gamma 0.7 replaced grayscale inversion because inversion reduced mean single-reader accuracy by 6.6 percentage points in validation, exceeding the prespecified 5-percentage-point limit." | **Repeated emphasis** plus volunteered design history; Table S1 already records it. | Suggest: "Gamma 0.7 and CLAHE were selected in validation (Table S1, V2)." | **should-fix**

47. **D-47** | methods.tex:87 (last sentence); supplement.tex:30 (V6) | "Letter readout for yes/no items was rejected during validation because the LLaVA family assigned 96%–100% probability to 'A' regardless of image content." | **Repeated emphasis** plus volunteered design history. | Suggest: delete it from the Methods; V6 keeps it. | **should-fix**

48. **D-48** | introduction.tex:5 (sentence 9); introduction.tex:3 (sentence 4) states the same premise | "Different responses alone do not establish independent second reads." | **Negative framing** plus **repeated emphasis** (the same premise twice in the Introduction). | Suggest: delete. | **should-fix**

49. **D-49** | introduction.tex:9 (sentences 3, 7); methods.tex:4 (sentences 2–3); methods.tex:9 (Fig. 1 caption) | "Controlled manipulations varied the information available to readers and the components they shared. The design distinguished image evidence from the question-text prior and separated seeing from judging." | **Repeated emphasis**: the Methods restate the Introduction's design logic almost word for word. | Suggest: delete methods:4 sentences 2–3. The caption can keep its version. | **should-fix**

50. **D-50** | results.tex:21 (Fig. 2 caption) | "matched Qwen 3.8 Flash analyses use 250, 250, and 250 items, respectively." | **Redundant clarification**: the same caption already states 250 items per data set. | Suggest: delete. | **should-fix**

51. **D-51** | results.tex:80, :108, :124 | "Light gray horizontal lines separate data sets; no reference lines are plotted." | **Over-explanation**: the clause only states an absence, to prevent a misunderstanding nobody would have. | Suggest: delete "no reference lines are plotted" in all three captions. | **should-fix**

52. **D-52** | results.tex:41 (Fig. 3 caption) | "Lines join adjacent available conditions; missing estimates are omitted." | **Self-volunteered weakness**: it announces missing data without saying which estimates are missing. | Suggest: name the missing estimates, or delete the clause. | **should-fix**

## Optional

53. **D-53** | results.tex:30 | "Error correlation did not change monotonically with image resolution" | **Negative framing** of a side pattern that Fig. 3b already shows. | Suggest: delete. | **optional**

54. **D-54** | introduction.tex:7 (sentence 4) | "This construction required the image to distinguish between answers to the same question." | **Over-explanation**: it restates the clause before it. | Suggest: delete. | **optional**

55. **D-55** | methods.tex:18, :94 | "The two answers of each pair were compared as option text (yes or no) because option order was randomized separately for each item." | **Over-explanation** plus repetition: methods:18 already states the randomization. | Suggest: "Paired answers were compared as option text (yes or no)." | **optional**

56. **D-56** | methods.tex:80 (sentences 1, 5) | "Cross-vendor comparisons combined existing reader responses without additional calls." | **Over-explanation** (a cost detail) plus two unclear labels: "vendor" appears only here, and "discussion records" (sentence 1) is never explained. | Suggest: "Cross-model comparisons used the same reader responses." Write "discussion" instead of "discussion records". | **optional**

57. **D-57** | methods.tex:101 | "Analyses used descriptive estimates and CIs without hypothesis tests or P values." | **Negative framing.** | Suggest: "Results are reported as estimates with 95% CIs." | **optional**

58. **D-58** | methods.tex:42; supplement.tex:30 (V6) | "its accuracy was 53%, below the 55% threshold, pooled over 100 validation items. These comprised 50 items each from S1 and S2." | **Repeated emphasis**: Table S1 gives the same numbers. | Suggest: "LLaVA-Med v1.5 was excluded under the accuracy rule (Table S1, V6)." | **optional**

59. **D-59** | methods.tex:82; supplement.tex:27 (V3 "Setting fixed" column) | "exclusions also removed reference cases within Hamming distance 8 of its 64-bit perceptual hash or with CLIP cosine similarity of at least 0.98" | **Repeated emphasis**: the rule is written out twice. | Suggest: in V3, write "Rule as in Methods". | **optional**

60. **D-60** | methods.tex:16, :72 (sentence 3); supplement.tex:28 (V4) | "Control boxes matched target-box dimensions, did not overlap the target, and met the body-coverage criterion." | **Repeated emphasis**: the control box is defined three times. | Suggest: delete the methods:72 sentence. | **optional**

61. **D-61** | methods.tex:14, :16; methods.tex:30–34 (Table 1); supplement.tex:28 (V4) | "S1 contained 250 of 251 eligible VQA-RAD test questions with yes/no answers." | **Repeated emphasis**: the counts appear in the text, in Table 1 and in V4, and "104 templates" appears three times. | Suggest: keep the counts in Table 1 and cite the table from the text. | **optional**

62. **D-62** | results.tex:57; discussion.tex:19 (sentence 2) | "Pair accuracy was highest for Gemini 3.7 Flash among the API models tested." | **Redundant scope qualifiers** ("tested", "the evaluated models and formats"). "For the evaluated contrasts" at discussion:17 is necessary and should stay. | Suggest: delete "tested" and "the evaluated". | **optional**

63. **D-63** | results.tex:55 | "Region dependence was positive across open-weight models, with the LLaVA-1.5 7B interval including zero." | **The exception sits in the topic sentence.** | Suggest: "Region dependence was positive for all five open-weight models, with CIs excluding zero for four (LLaVA-1.5 7B: 2.4 points, −2.0 to 6.8)." | **optional**

64. **D-64** | results.tex:87; results.tex:67, :71 | "In VQA-RAD, SLAKE, and MedXpertQA-MM order, role contrasts averaged −0.048 (95% CI, −0.071 to −0.023)" | **Redundant presentation**: 21 estimates with CIs duplicate Fig. 7b, and results:67 and :71 list the cell values of Fig. 6a. | Suggest: move the full list to a supplementary table and keep only the endpoints of the ordering in the text. | **optional**

65. **D-65** | results.tex:75; discussion.tex:15 (sentence 4) | "Reports omitted the queried SLAKE target among both errors and all reports." | **Lead with the claim**: the paragraph lists rates but never states the comparison they support. | Suggest: "With Gemini 3.7 Flash as perceiver, omission was more frequent among errors (33.6%–47.1%) than among all reports (26.7%)", or move the paragraph to the supplement. | **optional**

66. **D-66** | results.tex:99 | "Shared reference cases changed single-reader accuracy differently across models and data sets." | **Role of each experiment**: no claim is stated, and single-reader accuracy with reference cases feeds no conclusion. | Suggest: move the paragraph to the supplement. | **optional**

67. **D-67** | results.tex:11, :13, :131 | "Panels behaved like few independent readers." | **Vague topic sentences** ("few"; "Visual reliance varied..."; "the first three models"). | Suggest: "Panels of nine behaved like 1.17 to 1.99 independent readers." Name the three models at :13. | **optional**

68. **D-68** | discussion.tex:5 (sentence 2) | "Qwen 3.8 Flash had less correlated errors than the other models and gained more over the single reader." | **Implied causal link that the decomposition does not support**: most of the gain came from more accurate readers (results:9). | Suggest: "Qwen 3.8 Flash's panel gain came mostly from more accurate panel readers, with aggregation adding less (Fig. 2)." | **optional**

69. **D-69** | discussion.tex:7 (sentence 7) | "In these panels, the final consensus reflects both the initial readings and subsequent deference to peers." | **Redundant closing sentence.** | Suggest: delete. | **optional**

70. **D-70** | results.tex:21, :41, :48, :62, :80, :94, :108, :124 | "Blue circles denote GPT-5 mini; teal squares, Gemini 3.7 Flash; amber diamonds, Claude Haiku 4.5; rose triangles, Qwen 3.8 Flash." | **Repeated emphasis**: the model key appears in 8 captions. | Suggest: put one shared model legend in the figures, and keep caption keys only where a figure's markers differ. | **optional**

71. **D-71** | abstract.tex:3 vs methods.tex:9 | "Outcomes were error correlation and the effective number of independent readers." | **Precision**: the Results report accuracy, and the Fig. 1 caption lists it as an outcome. | Suggest: "Outcomes were accuracy, error correlation, and..." This adds 1 word, offset by D-01. | **optional**

72. **D-72** | highlights.tex:6 | "Discussion overturned correct minority answers based on image evidence." | **Precision**: it joins two separate analyses (minority status, results:117; gray-image dependence, results:113 and :119) into one claim that no single analysis reports. | Suggest: "Discussion overturned 41.5% to 100.0% of correct minority answers." | **optional**

73. **D-73** | abstract.tex:3; methods.tex:40 | "Perceivers wrote reports; reasoners answered questions from them." | **Inconsistent role names**: methods:40 calls the same models "report writers". | Suggest: use one name throughout. | **optional**

74. **D-74** | abstract.tex:3; introduction.tex:9; methods.tex:40, :53–58, :87; results.tex:53, :57, :62, :135; discussion.tex:21; supplement.tex:25 | "four application programming interface vision-language models (VLMs)" | **Nonstandard category label**: the usual counterpart of "open-weight" is "proprietary". | Suggest: if all four models are closed-weight, use "proprietary models". This also shortens the abstract. | **optional**

75. **D-75** | abstract.tex:3; methods.tex:9, :57; results.tex:67, :80; discussion.tex:15 | "question-blind findings reports" | **Coined modifier**: reader-study usage is "blinded to". | Suggest: "findings reports written blinded to the question". | **optional**

76. **D-76** | methods.tex:94 (sentence 1) | "The prior decomposition cross-tabulated each reader's correctness with real and gray images." | **Coined label.** | Suggest: "Each reader's correctness with original and gray images was cross-tabulated." | **optional**

77. **D-77** | Several things each go by more than one name.
    - Readers: abstract.tex:1 ("model readers"); introduction.tex:9 ("AI readers", "AI models"); methods.tex:4 ("AI VLMs").
    - The unaltered image: methods.tex:94, :98 and results.tex:34, :48 say "real image".
    - The gray-image manipulation: results.tex:28, :30 and discussion.tex:9 say "Removing the image".
    - Manipulations: discussion.tex:11 says "Image interventions".
    - Quote: "To measure error correlation among model readers"
    - Problem: **inconsistent synonyms.** "Removing the image" also describes a different operation from replacing it with a gray image.
    - Suggest: use "AI readers", "original image", "gray image" and "image manipulations" throughout.
    - **optional**

78. **D-78** | results.tex:84 (heading), :85 | "Readers sharing everything retained model-dependent error correlation." | **Colloquial heading** ("What two readers share") plus an **inaccurate generalization**: these readers still differ in their samples. | Suggest: heading "Shared components and error correlation"; sentence "Readers differing only in sampling retained model-dependent error correlation." | **optional**

79. **D-79** | supplement.tex:51 (sentences 1–2); supplement.tex:37 (sentence 5) | "the first-round error correlation between panel positions was 0.758" | **Terms used only in the supplement**: "panel positions", "tiered" and "episodes lost to transient errors". The main text says "reader pairs" and has no tiered design. | Suggest:
    - "between reader pairs".
    - Name or define the tiered design.
    - "Calls that failed with transient API errors were repeated until every condition was complete."
    - **optional**

80. **D-80** | supplement.tex:25 (V1) | "Claude Haiku 4.5 retained; GPT-5 mini at low effort." | **Over-explanation without its context**: "retained" implies the model was at risk of exclusion, which the text never explains. | Suggest: delete "Claude Haiku 4.5 retained;". | **optional**

81. **D-81** | methods.tex:65 | "For each specialty panel, GPT-4.1 nano ranked 9 radiology subspecialty roles using the question text." | **Precision**: the roster listed next contains 12 roles. | Suggest: state exactly what was done, for example "ranked the 12 roles; the top 9 formed the panel", if that is the procedure. | **optional**

82. **D-82** | methods.tex:96 | "The primary analysis compared matched groups of reader pairs within each reasoner model using differences in mean pairwise error correlation." | **One paragraph, one job**: the contrasts, the regression, error correlation during discussion, and conformity all share one paragraph. | Suggest: split into three paragraphs: contrasts; regression summary; discussion and conformity. | **optional**

83. **D-83** | methods.tex:92, :94, :101 | "Differences were paired by item." | **Repeated qualifier** (three times in the Methods). | Suggest: state the item pairing once, under Statistical analysis. | **optional**

## Summary

**Counts.** There are 83 findings: 4 must-fix, 48 should-fix and 31 optional. By primary category:

| Category | Findings |
|---|---|
| Repeated emphasis | 27 |
| Self-coined or nonstandard term | 19 |
| Over-explanation | 8 |
| Overclaim (claim stronger than the evidence) | 4 |
| Self-volunteered weakness | 4 |
| Negative framing | 4 |
| Paragraph structure / lead with the claim | 4 |
| Factual mismatch (precision) | 4 |
| Vague quantifier where a number exists | 3 |
| Role of each experiment / redundant presentation | 3 |
| Unnecessary disclaimer or redundant scope qualifier | 2 |
| Defensive resource framing | 1 |

**Not found:**
- stacked modal hedges ("may", "might" and "could" never qualify a claim);
- "we do not claim"-type disclaimers;
- concessive however/although transitions;
- self-undermining contribution statements.

**Keep as written** (necessary scope or method statements):
- discussion:21 sentence 1 (closed public questions, no human readers or clinical reporting);
- methods:4 "Pilot observations were excluded";
- methods:40 "Where a model accepted the parameter";
- the leakage rationale at methods:82;
- the sensitivity analysis at results:32;
- the ethics statement.

**Captions.** Captions that restate conditions and item counts were not flagged, because figure legends must stand alone. D-50 to D-52 and D-70 are the exceptions.

**Outside the skill's categories.** highlights.tex:2 lacks the final period that the other four bullets have.

**Three most frequent patterns**

1. **The Discussion re-runs the Results.** Paragraph after paragraph opens with a topic sentence, repeats the Results numbers, then closes by restating the topic with "therefore", "thus", "consequently" or "Together". This accounts for 13 findings (D-05, D-26 to D-37), plus D-69.
2. **Coined labels replace field terms that the manuscript itself cites or uses.** Several things carry two to four names (D-03, D-04, D-16 to D-25, D-73 to D-79):
   - seeing/judging instead of perceptual/interpretive (introduction:3);
   - question-text prior instead of language prior (introduction:7);
   - generic panel instead of self-consistency;
   - abandonment/overturned/deference instead of conformity and automation bias;
   - region dependence instead of occlusion sensitivity;
   - rendering instead of contrast enhancement.
3. **Process assurances and validation history repeat across the Methods, Discussion and Supplement, often with a self-volunteered weakness attached** (15 findings: D-08, D-09, D-12 to D-15, D-43, D-44, D-46, D-47, D-52, D-58 to D-61). Examples:
   - "locked", "prespecified" or "before any..." nine times;
   - abstention handling four times;
   - the history of the inversion and letter-readout decisions;
   - the Qwen throughput reason, LLaVA-1.5 "near chance", the quality stop "turned off", and the single seed and router.
