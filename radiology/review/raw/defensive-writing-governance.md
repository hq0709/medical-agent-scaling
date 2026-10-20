# Writing review: defensive statements, repeated emphasis, self-coined words

Manuscript: "Reading panels of vision-language models share their errors" (Meta-Radiology draft).
Files read: sections/abstract.tex, highlights.tex, introduction.tex, methods.tex, results.tex (text and captions), discussion.tex, conclusions.tex; supplement.tex S1 (including Table S1), S2, S5. Paths are relative to /home/myid/hj67104/consultation_saturation/paper/radiology/ (section files are under sections/). Line numbers are source lines, and each paragraph is one line.
Method: defensive-writing-governance, identification and classification only. A statement is flagged when its job is to protect the author, a model, a tool or the process. Statements that carry evidence scope, a real alternative explanation or a required disclosure are kept. No governance file was created and no file was edited.
Field terms were checked against Kim et al., NMI 2026 (docs/NMI_2512.08296_fulltext.txt), the companion text-only paper (paper/sections/*.tex, the source of S5), refs.bib, and Prism ([arXiv:2406.14544](https://arxiv.org/pdf/2406.14544); [NeurIPS 2024](https://papers.neurips.cc/paper_files/paper/2024/hash/cac9e747a1d480c78312226959566cef-Abstract-Conference.html)).

Format: ID | file:line | original text | category | recommended destination or fix | severity

## Must-fix

G-01 | discussion.tex:19 | "a reading panel built from one model is closer to one read than to nine, and a second AI read adds independent information when a different model performs the seeing" | repeated emphasis | Delete this closing sentence; conclusions.tex:3 has it word for word. | must-fix
  Occurrences: abstract.tex:7; highlights.tex:2; results.tex:11; discussion.tex:3 (first sentence); discussion.tex:19; conclusions.tex:3. conclusions.tex:3 and discussion.tex:19 share 18 six-word sequences.

G-02 | introduction.tex:9 | "Seeing was defined as the extraction of visual findings, and judging as the selection of an answer using findings and prior knowledge." | self-coined word | Use "perception" and "interpretation", the radiology error taxonomy the paper already cites (introduction.tex:3, Bruno 2015: "perceptual or interpretive"), or Prism's "perception"/"reasoning". Use the same pair as in G-09. | must-fix
  Occurrences: abstract.tex:7 ("the model's seeing", "perform the seeing"); introduction.tex:9 (x3); methods.tex:4; methods.tex:57 (Table 2, "B, seeing and judging"); methods.tex:74 (heading); results.tex:66 (heading); discussion.tex:13, 15, 17, 19; conclusions.tex:3.

G-03 | introduction.tex:7 | "The question-text prior is information supporting an answer from the question and options without image content." | self-coined word | Use "language prior" (Goyal et al. 2017). The manuscript already uses it at introduction.tex:7 and discussion.tex:9, so one concept has two names. | must-fix
  Occurrences: abstract.tex:7; introduction.tex:7, 9; methods.tex:4; methods.tex:69 (heading); results.tex:25 (heading); discussion.tex:7, 9; conclusions.tex:3 ("Question-text priors").

G-04 | discussion.tex:21 | "Gray-image abstentions counted as wrong; correlation among answered items was included as a sensitivity analysis." | 预先辩解 (also a repeated reminder of one limitation) | Delete it from the Limitations paragraph and delete the matching S2 sentence. The rule stays once in methods.tex:101 and the numbers once in results.tex:32. | must-fix
  Occurrences: methods.tex:101; results.tex:32; discussion.tex:21; supplement.tex:37 ("Declined answers counted as wrong, the abstention rate is reported for each condition, and the error correlation on answered items is reported as a sensitivity analysis."). supplement.tex:37 also repeats the refusal fact from methods.tex:101 and results.tex:32 ("Claude Haiku 4.5 declined to answer for part of the gray-image prompts").

G-05 | discussion.tex:19 | "Complementary errors and adequate reader accuracy together determine the value of a second read." | repeated emphasis | Keep introduction.tex:3 (premise), discussion.tex:5 (topic sentence) and conclusions.tex:3. Delete this sentence, the "evaluating a second reader by the errors it corrects..." sentence in the same paragraph, and the "Shared errors limited..." clause at discussion.tex:3. | must-fix
  Occurrences: introduction.tex:3 ("The value of another reader therefore depends on both individual accuracy and error correlation."); discussion.tex:3 ("Shared errors limited the benefit of majority voting"); discussion.tex:5 (x2: "The panel advantage depended on the accuracy of its readers and their error correlation."; "This agreement connects the limited return from additional readers to measured error correlation."); discussion.tex:19 (x2); conclusions.tex:3 (x2: "...shared errors that limited the benefit of majority voting."; "Panel accuracy depended on both individual reader accuracy and error correlation.").

## Should-fix

G-06 | methods.tex:104 | "Full runs used only the settings fixed by these checks." | 流程性自我保护 (also repeated) | Move to the supplement: the subsection "Validation before full runs" (methods.tex:103-104) goes to S1, which already holds Table S1. Delete methods.tex:4 "The protocol and validation decisions were locked before the full runs." Keep supplement.tex:14 as the only statement, optionally with the protocol's location in the code repository. | should-fix
  Occurrences: methods.tex:4; methods.tex:104; supplement.tex:14. The jargon "full runs" goes with the subsection (see G-35).

G-07 | methods.tex:4 | "Pilot observations were excluded from the study analyses." | 流程性自我保护 | Delete. No pilot is described anywhere in the manuscript. If it has to be on record, give it one line in S2. | should-fix

G-08 | methods.tex:42 | "LLaVA-1.5 7B met the pooled threshold; its VQA-RAD validation accuracy was near chance." | 预先辩解 | Delete from Methods. LLaVA-1.5's 55% is in Table S1 (V6) and its accuracy is in Supplementary Fig. S1a, so no statement becomes false. | should-fix

G-09 | abstract.tex:3 | "Perceivers wrote reports; reasoners answered questions from them." | self-coined word | Use Prism's "perception stage" and "reasoning stage" (Qiao et al., NeurIPS 2024, the closest decoupled VLM evaluation), with one name per role. "Perceiver" is also the name of an existing architecture (Jaegle et al., 2021). | should-fix
  Occurrences: abstract.tex:3, 5; methods.tex:9, 75, 77, 94, 96; results.tex:67, 69, 71, 73, 75, 80, 87, 89, 94; discussion.tex:13, 15, 17; supplement.tex:37. The same roles are also called "report writers" (methods.tex:40) and "report readers" (methods.tex:57).

G-10 | methods.tex:67 | "Generic panels contained 9 readers with identical general-radiologist prompts; their initial responses differed only through separate sampling." | self-coined word | Call it self-consistency (Wang et al., ICLR 2023; wang2023selfconsistency is already in refs.bib). The companion text-only study, the source of S5, calls the same condition "self-consistency". | should-fix
  Occurrences: abstract.tex:5; methods.tex:9, 40 ("generic reading panel"), 58, 67, 77, 80 ("generic readers"), 94, 96; results.tex:94, 108; supplement.tex:31.

G-11 | discussion.tex:3 | "The same error correlation and rise during discussion occurred for text-only clinical questions, from 0.758 to 0.990 (Supplementary S5)." | self-coined word (label collision) | Refer to item sets by data set name, as the Results already do, and drop S1-S5 as set labels. As written, "Supplementary S5" reads as item set S5 (SLAKE-pairs). | should-fix
  Occurrences: item-set labels at methods.tex:9, 14, 16, 18, 30-34, 42, 53-59, 70, 72, 75, 77, 80, 82, 87; supplementary sections S1-S5 at supplement.tex:13, 36, 39, 42, 50; Supplementary Table S1; Supplementary Fig. S1 at results.tex:129, 131, 133.

G-12 | supplement.tex:51 | "as single readers and as independent, centralized, discussion and tiered panels of 3 to 9 readers with specialty roles" | self-coined word | Use the names from the source study and Kim et al. NMI 2026: Independent, Centralized, Decentralized, Hybrid. The "96 discussion configurations" are the source's 96 Decentralized configurations. Change "first-round" to "round 0" and "panel positions" to "readers", matching the main text. | should-fix

G-13 | methods.tex:80 | "In the rendering condition, generic readers 1--3 viewed original images, readers 4--6 viewed gamma-transformed images with gamma 0.7, and readers 7--9 viewed CLAHE images." | self-coined word | In radiology "rendering" means volume or surface rendering. Gamma correction and CLAHE are contrast enhancement (image preprocessing), so use that term. | should-fix
  Occurrences: introduction.tex:9; methods.tex:9, 40, 58, 70 ("rendered dimensions"), 80, 87 ("rendered pixels"), 96; results.tex:87, 89, 94; discussion.tex:17; conclusions.tex:3; supplement.tex:26 ("rendering panel"), 31.

G-14 | methods.tex:70 | "Graded evidence compared original images capped at 1024 pixels, images capped at 256 or 128 pixels, and uniform gray images." | self-coined word | Name the conditions directly (reduced resolution; gray image), as results.tex:26-30 already do. In a medical journal "evidence level" collides with "level of evidence". | should-fix
  Occurrences: introduction.tex:9; methods.tex:9, 40, 54, 70 (also "each evidence level"); results.tex:41 ("image evidence levels"); supplement.tex:31 ("graded-evidence").

G-15 | methods.tex:96 | "Conformity was the proportion of readers correct in round 0 who ended the discussion wrong." | self-coined word (three names for one quantity) | Use the defined term "conformity" throughout the Results, the Fig. 9 caption and the Discussion (Asch 1956 is in refs.bib). For the human analogue, the cited source (Dratsch 2023) uses "automation bias". | should-fix
  Occurrences: "abandoned"/"Abandonment" at results.tex:113, 115, 117, 124 and discussion.tex:7; "deference" at discussion.tex:7 (x2). "Conformity" appears only at methods.tex:96.

G-16 | methods.tex:98 | "Region reliance subtracted the corresponding control-occlusion change from the target-occlusion change." | self-coined word (defined, never used) | Delete this definition or report the quantity. results.tex:55 reports open-weight "region dependence" (the flip-rate measure from methods.tex:94) in percentage points, so the target-minus-control effect has two names. "Visual reliance" can stay: the cited Zafar 2026 uses "visually-reliant". | should-fix
  Occurrences: "region dependence" at methods.tex:94; results.tex:53, 55, 62; discussion.tex:11. "Region reliance" only at methods.tex:98.

G-17 | discussion.tex:17 | "None of the within-model changes brought error correlation near the level of readers from different models." | repeated emphasis | Delete the discussion.tex:3 sentence. In discussion.tex:17, keep the interpretation and cite Fig. 7 instead of listing the six contrasts again. | should-fix
  Occurrences: abstract.tex:5; highlights.tex:5; discussion.tex:3 ("...reduced error correlation more than changes in roles."); discussion.tex:17 (this sentence, plus the list "-0.048 for role ... -0.470 for model", which repeats results.tex:87); conclusions.tex:3.

G-18 | discussion.tex:5 | "Across the yes/no panels, observed majority accuracy minus the beta-binomial prediction averaged $-$0.07 percentage points" | repeated emphasis | The Discussion should interpret and cite figures. Delete the repeated numbers listed below; the Results (and the Abstract) already give them. | should-fix
  Occurrences: -0.07 pp (results.tex:15; discussion.tex:5); 10.3 and 3.3 pp (results.tex:9; discussion.tex:5); 8.9% to 70.0% (results.tex:13; discussion.tex:7); 64.2% to 76.2% (abstract.tex:5; results.tex:36; discussion.tex:9); 32.9 vs 3.2 pp (results.tex:53; discussion.tex:11); 74.5%, 62.0%, 45.6% (results.tex:71; discussion.tex:13); 0.800 to 0.990 (abstract.tex:5; results.tex:73; discussion.tex:15); -0.048 to -0.470 (abstract.tex:5; results.tex:87; discussion.tex:17); 78.0% (results.tex:103; discussion.tex:19).

G-19 | discussion.tex:9 | "Here, question text supplied information that steered readers toward an answer even when the image required a different one." | repeated emphasis (within paragraph) | Make each point once per paragraph and delete the other restatements listed. | should-fix
  Occurrences: discussion.tex:9 (opening "connected shared errors to the question-text prior"; "Readers therefore often reached the same wrong answer with and without image evidence"; this sentence). discussion.tex:13 ("Seeing and judging each contributed..."; "The full comparison therefore identifies both..."; "the findings supplied and the model interpreting them determined the result"; the same point as results.tex:67, and its two Gemini 3.7 Flash sentences repeat results.tex:69). discussion.tex:15 (opening "Sharing a report made readers' errors more alike."; closing "Repeated judgments from a shared report consequently depend on the same account of the image."; "Reports also omitted queried SLAKE targets..." repeats results.tex:75).

G-20 | discussion.tex:11 | "consistent with correct medical answers accompanied by flawed image comprehension" | repeated emphasis | Delete the Discussion sentences that cite the Introduction's sources again for the same point. | should-fix
  Occurrences: jin2024hidden at introduction.tex:7 and discussion.tex:11. goyal2017vqa and yan2025worse at introduction.tex:7 and discussion.tex:9 ("Language priors in visual question answering and poor performance under medical probing provide related evidence."). kurvers2016pooling and taylor2008double at introduction.tex:3 and discussion.tex:19 ("Human evidence likewise supports pooling..."). "Answer accuracy alone does not measure the contribution of image evidence" (introduction.tex:7) is said again as "accuracy on isolated questions is insufficient evidence of image use" (discussion.tex:11).

G-21 | discussion.tex:19 | "Private reference cases lowered error correlation across the evaluated models and formats, while panel accuracy varied" | repeated emphasis | Delete. results.tex:101 says almost the same words and results.tex:103 gives the 78.0%. | should-fix
  Occurrences: results.tex:101, 103; discussion.tex:19 (this sentence, plus the 78.0% sentence and the Gemini 3.7 Flash sentence).

G-22 | discussion.tex:7 | "Discussion preserved correct majority answers more often than correct minority answers." | repeated emphasis | In discussion.tex:7, keep the mechanism and the BI-RADS comparison. Delete the repeated findings and the discussion.tex:3 clause. | should-fix
  Occurrences: abstract.tex:5; highlights.tex:6; results.tex:13, 113, 117, 119; discussion.tex:3 ("discussion increased agreement without consistently improving accuracy"); discussion.tex:7 (this sentence; "every model abandoned correct answers that differed..." repeats results.tex:113; "more often in the initial minority" repeats results.tex:119; 8.9% to 70.0% repeats results.tex:13); conclusions.tex:3.

G-23 | methods.tex:4 | "The design distinguished image evidence from the question-text prior and separated seeing from judging." | repeated emphasis | Delete this sentence and the preceding "Controlled manipulations varied..." sentence. introduction.tex:9 already says both. | should-fix
  Occurrences: introduction.tex:9 ("We separated image evidence from the question-text prior and seeing from judging."; "Controlled manipulations varied the image ... and varied what readers shared"); methods.tex:4 (x2). The component list at introduction.tex:9 appears again at methods.tex:80.

G-24 | methods.tex:40 | "Google models were restricted to Gemini 3.7 Flash." | 能力说明 | Delete. The model list in the same paragraph already names Gemini 3.7 Flash. | should-fix

G-25 | methods.tex:40 | "Because of its throughput, Qwen 3.8 Flash ran only the original-image baseline (A0), graded evidence (A1), generic reading panel (C1), and varied image rendering (C2)." | 能力说明 | Keep the coverage, which is necessary scope, in Methods or Table 2. Move the reason to the supplement: Table S1's "Throughput" row already has it. "C1" and "C2" are not in Table 2. | should-fix

G-26 | methods.tex:40 | "Where a model accepted the parameter, panel readers, discussion rounds, and report writers sampled at temperature 0.7 and the single reader at 0.3" | 能力说明 | Keep, because the sampling settings are necessary scope, but name the models that ignore temperature and seed instead of using a blanket qualifier. | should-fix

G-27 | discussion.tex:21 | "API models were evaluated through a single router at one time point." | 能力说明 | Move to Methods as facts: OpenRouter is already at methods.tex:40; add the dates of the API calls. Delete from Limitations. | should-fix

G-28 | methods.tex:40 | "Routing and token budgets were held constant within each experimental condition." | 流程性自我保护 | Move to the supplement (S2, the run record) or delete. "Routing" here also clashes with the role ranking called "routing" earlier in the same paragraph (see G-35). | should-fix

G-29 | methods.tex:80 | "Gamma 0.7 replaced grayscale inversion because inversion reduced mean single-reader accuracy by 6.6 percentage points in validation, exceeding the prespecified 5-percentage-point limit." | 预先辩解 | Delete from Methods. Table S1 (V2) records the replacement and its reason. | should-fix

G-30 | methods.tex:87 | "Letter readout for yes/no items was rejected during validation because the LLaVA family assigned 96\%--100\% probability to ``A'' regardless of image content." | 预先辩解 | Delete from Methods. Table S1 (V6) records it. | should-fix

G-31 | methods.tex:75 | "Each perceiver wrote its 9 reports for each image once, before any reasoner read a report." | 流程性自我保护 (also repeated) | Methods keeps the design fact: every reasoner read the same reports for a given perceiver and image. The timing moves to the supplement (S2 only). Give 12,906 in one place. | should-fix
  Occurrences: methods.tex:75 (the same paragraph also has "Reports were reused across questions about the same image." and "Every reasoner therefore read identical reports..."); supplement.tex:37 ("Each perceiver wrote its findings reports once for each image and slot before any reasoner read a report (12,906 reports; ...").

G-32 | results.tex:80 | "Light gray horizontal lines separate data sets; no reference lines are plotted." | 流程性自我保护 | Delete "no reference lines are plotted" from all three captions. A caption describes what is drawn. | should-fix
  Occurrences: results.tex:80 (Fig. 6); results.tex:108 (Fig. 8); results.tex:124 (Fig. 9, "No reference lines are plotted.").

G-33 | results.tex:21 | "matched Qwen 3.8 Flash analyses use 250, 250, and 250 items, respectively." | 流程性自我保护 | Delete. The same sentence already says 250 items each. | should-fix

G-34 | discussion.tex:17 | "The matched contrasts formed a graded ladder of reductions in error correlation" | self-coined word | Drop the metaphor and state the order of the contrasts. | should-fix

G-35 | methods.tex:40 | "the routing and modality-screening outputs of GPT-4.1 nano (temperature 0)" | self-coined word (pipeline jargon) | Use terms the paper defines or the field's terms. The role ranking (methods.tex:65) is what MDAgents calls "expert recruitment", and "routing" also clashes with OpenRouter routing ("router", discussion.tex:21). "Cross-vendor comparisons" (methods.tex:80) is the defined model contrast. "Discussion records" (methods.tex:80) is not varied in Experiment C. "Slot" (methods.tex:75; supplement.tex:37) means one of the 9 reports. "C1"/"C2" (methods.tex:40) are never defined. "Full runs" (methods.tex:4, 103, 104; supplement.tex:13, 14) means the main experiments. | should-fix

## Optional

G-36 | methods.tex:82 | "The data sets carried no patient identifiers; these bounds guarded against reference cases from the same scan or patient." | 预先辩解 | Keep the first clause; it is necessary scope because it explains why image-similarity exclusion replaced patient-level splitting. Delete the assurance "these bounds guarded against..."; the evidence is in Table S1 (V3). | optional

G-37 | methods.tex:94 | "The two answers of each pair were compared as option text (yes or no) because option order was randomized separately for each item." | 预先辩解 (also repeats methods.tex:18) | Delete. methods.tex:18 already states that option order was randomized per item. | optional

G-38 | methods.tex:77 | "using a synonym list fixed from SLAKE labels before running this pathway" | 流程性自我保护 | Delete "before running this pathway". | optional

G-39 | methods.tex:80 | "Cross-vendor comparisons combined existing reader responses without additional calls." | 流程性自我保护 | Keep the substantive part, that cross-model pairs reuse generic-panel responses. Delete "without additional calls". | optional

G-40 | methods.tex:42 | "LLaVA-Med v1.5 was screened and excluded under the prespecified accuracy rule" | 流程性自我保护 | Keep the exclusion and threshold, which are a necessary disclosure. Delete "prespecified" here and at methods.tex:80 ("the prespecified 5-percentage-point limit"). | optional

G-41 | methods.tex:40 | "were generated once and reused" | 流程性自我保护 | Delete (implementation detail) or move to S2. | optional

G-42 | results.tex:41 | "Lines join adjacent available conditions; missing estimates are omitted." | 流程性自我保护 | Name the missing estimates, or delete the clause if none are missing. | optional

G-43 | results.tex:57 | "Pair accuracy was highest for Gemini 3.7 Flash among the API models tested." | 免责 | Delete "tested". The next sentences name the three models. | optional

G-44 | discussion.tex:19 | "across the evaluated models and formats" | 免责 | Write "in every model and format", as results.tex:101 does. This is moot if G-21 deletes the sentence. | optional

G-45 | supplement.tex:25 | "Claude Haiku 4.5 retained; GPT-5 mini at low effort." | 流程性自我保护 | Delete "Claude Haiku 4.5 retained". The question of retaining it is never raised. | optional

G-46 | supplement.tex:37 | "The output-quality stop that ends a run when more than 15\% of answers cannot be parsed was designed to catch configuration errors and was turned off for the gray-image conditions." | 流程性自我保护 | Keep in S2: it is a protocol deviation, and the supplement is the right place for it. Replace the coined label "output-quality stop" with a plain description of the stopping rule. | optional

G-47 | supplement.tex:37 | "every condition was run again to fill episodes lost to transient errors; calls already made were read from the cache" | 能力说明 | Keep the re-run statement in S2 (it describes missing-data handling). Change "episodes" to "responses" and delete the cache clause. | optional

G-48 | methods.tex:57 | "Question-blind findings reports by 3 perceivers; each reader's own report or one shared report" | self-coined word | Prism calls a perception instruction written without the question "query-agnostic". | optional
  Occurrences: abstract.tex:3; methods.tex:9, 57; results.tex:67, 80; discussion.tex:15.

G-49 | methods.tex:94 | "The prior decomposition cross-tabulated each reader's correctness with real and gray images." | self-coined word | Drop the label, which is used once, and simply describe the cross-tabulation. | optional

G-50 | methods.tex:94 | "Report-pathway analyses compared accuracy and error correlation and separated errors by report coverage of the queried target." | self-coined word | Use "Experiment B" or "the report conditions", both already defined. | optional
  Occurrences: methods.tex:77 ("this pathway"), 94; discussion.tex:13 ("report-pathway accuracy").

G-51 | results.tex:28 | "Removing the image changed single-reader accuracy little on MedXpertQA-MM for GPT-5 mini, Claude Haiku 4.5, and Qwen 3.8 Flash." | self-coined word (label variants) | Use the defined terms "gray image" and "original image" throughout. The gray condition still supplies an image, so "removing" is inaccurate. | optional
  Occurrences: "Removing the image" at results.tex:28, 30 and discussion.tex:9; "Replacing the image with gray" at results.tex:26; "without the image" at results.tex:129; "real image" at methods.tex:94, 98 and results.tex:34, 48, against "original image" at methods.tex:53, 70 and results.tex:26, 41.

G-52 | discussion.tex:11 | "Image interventions distinguished use of the relevant anatomy from answering correctly through the question text." | self-coined word (label variant) | Use "manipulations", as at abstract.tex:3, introduction.tex:9 and methods.tex:4, 9. In radiology "intervention" also means an interventional procedure. | optional
  Occurrences: discussion.tex:11 (x2), 17.

G-53 | methods.tex:84 | "For shared reference cases, set 1 was supplied to every reader; for private reference cases, set $i$ was supplied to reader $i$." | self-coined word | The VLM literature calls retrieved image-question-answer examples in the prompt "in-context examples". If "reference cases" stays for a radiology audience, link it to that term once at methods.tex:82. | optional

G-54 | abstract.tex:3 | "We compared single readers, independent reading panels, and discussion panels." | self-coined word (label variants) | Use one name per panel type: the abstract's "independent reading panels" are the Methods' "independent specialty panels". The closest papers (MedAgents, MDAgents, Kim et al. NMI 2026) say "multi-agent system", which is already a keyword; radiology reader studies say "reader panel". | optional
  Occurrences: "independent specialty panels" at methods.tex:9, 53, 70 and results.tex:21, 41, 48; "reading panel" defined at introduction.tex:5.

G-55 | abstract.tex:3 | "on five item sets from VQA-RAD, SLAKE, and MedXpertQA" | self-coined word | Use "evaluation sets". "Test sets" would be wrong here because SLAKE-target also draws on training-split items. | optional
  Occurrences: abstract.tex:3; introduction.tex:9; methods.tex:9, 14, 22 (Table 1 caption).

G-56 | highlights.tex:2 | "Nine readers from one model were worth 1.17 to 1.99 independent readers" | self-coined word (label variants) | Use the Methods name, "effective number of independent readers" (methods.tex:90), everywhere. The highlight drops "effective", which changes the claim. Likewise use "round 0" rather than "initial". | optional
  Occurrences: "effective independent readers" at abstract.tex:7 and supplement.tex:51; "effective readers" at supplement.tex:51; "independent readers" at highlights.tex:2; "round 0"/"round-0" at methods.tex:96, 101 and results.tex:21, 124, against "initial" at results.tex:117, 119 and discussion.tex:7.

G-57 | discussion.tex:11 | "Target occlusion changed answers more than matched control occlusion, directly connecting responses to the queried region." | repeated emphasis | Delete; results.tex:53 states the finding. Also delete "The paired-image experiment held the question constant and required opposite answers for different images.", which repeats methods.tex:16. | optional

G-58 | methods.tex:72 | "Control boxes matched target-box dimensions, did not overlap the target, and met the body-coverage criterion." | repeated emphasis | State each design fact once, in the text or in a table. | optional
  Occurrences: control-box criteria at methods.tex:16, 72. Eligible and sampled counts at methods.tex:14, 16, again in Table 1 (methods.tex:30-34) and in Table S1 V4 (supplement.tex:28). The 1024-pixel cap at methods.tex:18, 70 and results.tex:41. The open-weight condition list at methods.tex:59 (Table 2) and methods.tex:87. "One forward pass" at methods.tex:59, 87, results.tex:62 and supplement.tex:46. "Paired by item" at methods.tex:92, 94, 101. The evaluation at each evidence level at methods.tex:70 and in Table 2 row A1 (methods.tex:54).

G-59 | results.tex:41 | "Blue circles denote GPT-5 mini; teal squares, Gemini 3.7 Flash; amber diamonds, Claude Haiku 4.5; rose triangles, Qwen 3.8 Flash." | repeated emphasis | Put the model key in each figure's legend, or define it once (Fig. 2) and refer back to it. Keep metric definitions in Methods only. | optional
  Occurrences: the key at results.tex:21, 41, 48, 62, 94, with color-only versions at results.tex:80, 108, 124. Definitions said again: results.tex:131 (from methods.tex:98), results.tex:133 (from methods.tex:90), and results.tex:48 "at least 7 of 9" (from methods.tex:94).

G-60 | supplement.tex:51 | "Error correlation and its rise during discussion therefore had the same magnitude without images as in the imaging experiments." | repeated emphasis | State the conclusion once, at discussion.tex:3, and let S5 report only the numbers. | optional

## Kept (necessary scope; stays in place)

G-61 | discussion.tex:21 | "This study used closed questions from public data sets and included no human readers or clinical reporting." | 免责 | Keep in Limitations: it states data coverage and how far the results extend. | optional (no change)

G-62 | discussion.tex:21 | "Each condition used a single sampling seed; item bootstrap intervals did not measure variation across seeds." | 免责 | Keep in Limitations: it states what the CIs do not cover (evidence strength). | optional (no change)

G-63 | discussion.tex:17 | "The ordering also held on SLAKE and, for the evaluated contrasts, MedXpertQA-MM." | 免责 | Keep: reference-case contrasts were not run on MedXpertQA-MM. | optional (no change)

G-64 | results.tex:32 | "Claude Haiku 4.5 readers remained highly correlated when gray-image analyses excluded abstentions." | 预先辩解 | Keep in Results. It answers a real alternative explanation: refusals on gray images produce shared "errors" mechanically. Outside Methods, this is the only place the abstention issue belongs (see G-04). | optional (no change)

G-65 | methods.tex:101 | "Analyses used descriptive estimates and CIs without hypothesis tests or $P$ values." | 预先辩解 | Keep: it is the required statement of the statistical approach. | optional (no change)

## Outside the requested categories (not counted)

- methods.tex:75 says reports were "at most 120 words", but supplement.tex:37 gives a "maximum 118 to 127" words.
- abstract.tex:5, "Panels of nine readers changed accuracy by $-$2.8 to 4.0 percentage points", is true only for independent panels: results.tex:5 reports a Claude Haiku 4.5 discussion panel at 5.6.
- methods.tex:65 says GPT-4.1 nano "ranked 9 radiology subspecialty roles", but the roster lists 12.
- methods.tex:40 gives "the seed was 1" for every reader, while methods.tex:67 says generic readers "differed only through separate sampling". The text never explains how identical prompts with one seed produce different answers.
- main.tex:19 has "\author{Anonymous}", but methods.tex:107 gives a GitHub URL that contains the account name. This matters if review is blinded.

## Summary

By category (65 findings):
- 免责: 5 (2 to trim: G-43, G-44; 3 kept: G-61 to G-63)
- 预先辩解: 8 (6 to remove or move: G-04, G-08, G-29, G-30, G-36, G-37; 2 kept: G-64, G-65)
- 能力说明: 5 (G-24 to G-27, G-47)
- 流程性自我保护: 13 (G-06, G-07, G-28, G-31 to G-33, G-38 to G-42, G-45, G-46)
- repeated emphasis: 13 (G-01, G-05, G-17 to G-23, G-57 to G-60)
- self-coined word: 21 (G-02, G-03, G-09 to G-16, G-34, G-35, G-48 to G-56)

By severity: must-fix 5, should-fix 30, optional 25, kept unchanged 5.
Where the 31 defensive statements go: delete or trim 18; move to the supplement 4 (G-06, G-25 reason, G-28, G-31 timing); move to Methods 1 (G-27); keep 8 (G-26 with the models named, G-46 and G-47 staying in the supplement with wording changes, G-61 to G-65); move to the Limitations paragraph 0.
