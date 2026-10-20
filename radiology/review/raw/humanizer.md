Humanizer review of the Meta-Radiology manuscript

Saved to /dev/shm/hj_review_humanizer.md. No repository file was changed.

Scope: abstract, highlights, introduction, methods, results (text and captions), discussion and conclusions in /home/myid/hj67104/consultation_saturation/paper/radiology/sections/, plus S1 (prose and the hand-written Table S1), S2 and S5 of /home/myid/hj67104/consultation_saturation/paper/radiology/supplement.tex.

How to read it:
- Each paragraph is one source line, so "S3" means the third sentence on that line.
- Quotes keep the LaTeX escapes so you can search for them in the source.
- Labels: §n = humanizer pattern n; (a) = repeated emphasis; (b) = self-coined term.
- Format: ID | file:line | original text | problem | suggestion | severity.

MUST-FIX

1. H-01 | discussion.tex:19 S7; conclusions.tex:3 S6; also abstract.tex:7, highlights.tex:2, results.tex:11 S1, discussion.tex:3 S1 | "and a second AI read adds independent information when a different model performs the seeing" | (a) + §3. The headline appears six times. The Discussion states it in its first sentence (3 S1) and again in its last (19 S7), and this 16-word clause ends both the Discussion and the Conclusions word for word. "Closer to one read than to nine" turns the N_eff range into an aphorism. | Delete discussion.tex:19 S7. Have discussion.tex:3 S1 give the 1.17 to 1.99 range instead of "did not provide nine independent reads". | must-fix

2. H-02 | introduction.tex:7 S2 (definition), 9 S3; abstract.tex:7; methods.tex:4, 69 (heading); results.tex:25 (heading); discussion.tex:7 S4, 9 S1; conclusions.tex:3 S3 | "The question-text prior is information supporting an answer from the question and options without image content." | (b). The next sentence (introduction.tex:7 S3) and discussion.tex:9 S5 use the established term for the same thing, "language priors" (Goyal et al.), so one concept has two names. | Use "language prior" throughout. Drop the definition sentence or cut it to one clause. | must-fix

3. H-03 | abstract.tex:7 (twice); introduction.tex:9 S3, S4, S7; methods.tex:4, 57 (Table 2, "B, seeing and judging"), 74 (heading); results.tex:66 (heading); discussion.tex:13 S1, 15 S3, 15 S5, 17 S5, 19 S7; conclusions.tex:3 S6 | "because its readers shared the model's seeing and the question-text prior. An independent second read of radiology images requires a different model to perform the seeing." | (b). Covers "seeing/judging" and the nouns "the model's seeing" and "perform the seeing". Radiology calls this split perceptual vs interpretive (Bruno et al., cited at introduction.tex:3 S3). Two-stage VLM evaluation calls it perception and reasoning (Prism, Qiao et al., NeurIPS 2024). | Use perception/interpretation (or perception/reasoning) throughout, e.g. "requires a different model to extract the image findings". | must-fix

4. H-04 | methods.tex:96 ("Conformity", the definition); results.tex:113, 115, 117, 124 ("abandoned", "abandonment"); discussion.tex:7 S2 ("abandoned"), S6 and S7 ("deference"); abstract.tex:5, highlights.tex:6, conclusions.tex:3 S5 ("overturned") | "Conformity was the proportion of readers correct in round 0 who ended the discussion wrong." | (b). One measure has four names, and the defined name never appears in Results. discussion.tex:7 S6 calls the effect in the cited Dratsch study "deference"; that paper calls it automation bias. S6 is also §18 ("provides a clinical example"). | Use "conformity" in Results, Fig. 9, abstract, highlights and conclusions. Write "automation bias" when citing Dratsch. | must-fix

5. H-05 | methods.tex:67 S4 (definition), 9, 40 ("generic reading panel (C1)"), 58, 77, 80 ("generic readers"), 94, 96; abstract.tex:5; results.tex:94, 108; supplement.tex:31 | "Generic panels contained 9 readers with identical general-radiologist prompts; their initial responses differed only through separate sampling." | (b). Sampling one prompt repeatedly and taking the majority vote is self-consistency (Wang et al., ICLR 2023, already in refs.bib). The companion text-only paper calls this baseline "Self-consistency". | Call it self-consistency (9 samples of the general-radiologist prompt, majority vote) everywhere. | must-fix

6. H-06 | Family sense: introduction.tex:5, 7, 9; abstract.tex:7; discussion.tex:3, 19; conclusions.tex:3. Subtype sense: abstract.tex:3 ("independent reading panels"); results.tex:5, 7, 26, 28 ("reading panel(s)"); methods.tex:9, 70 and results.tex:21, 48 ("independent specialty panels"); methods.tex:53-56, 65, 96 ("specialty panels") | "Among their reading and discussion panels, only the Claude Haiku 4.5 discussion panel on VQA-RAD had a difference CI excluding zero" | (b). "Reading panel" names both the whole family and the vote-only subtype, and the subtype has four names. At results.tex:5 a reader cannot tell whether "reading panels" includes discussion panels. | Give the vote-only subtype one name ("Independent", as in NMI and the companion paper). Keep "reading panel" for the family. | must-fix

7. H-07 | methods.tex:94 S4 (region dependence, flip rates), 98 S3 (region reliance, log-odds); results.tex:53, 55, 62; discussion.tex:11 S2 | "Region reliance subtracted the corresponding control-occlusion change from the target-occlusion change." | (b). The same target-minus-control contrast has two names and two definitions. results.tex:55 reports open-weight "region dependence" in percentage points, so the quantity defined as "region reliance" is never reported. The field's name for answer change under occlusion is occlusion sensitivity. | Use one name and one definition for API and open-weight models. Delete methods.tex:98 S3 or report that value. | must-fix

8. H-08 | discussion.tex:5 S6, 7 S7, 9 S4, 9 S7 (the closers of paragraphs 3, 11, 13, 15 and 19 are covered in H-26, H-29, H-09, H-10 and H-01) | "In these panels, the final consensus reflects both the initial readings and subsequent deference to peers." | §2. Eight of the nine interpretive Discussion paragraphs end on a sentence that restates the paragraph, usually after therefore, thus, consequently or together. 9 S4 ("Readers therefore often reached the same wrong answer with and without image evidence.") restates 9 S3. | Delete 7 S7 and 9 S4. Merge 9 S7 into 9 S6 (the Loy analogy). Keep 5 S6 only if it is the one place the evaluation point is made. | must-fix

9. H-09 | discussion.tex:13 S6 (with S1, S5); results.tex:67 S1, 71 S1 | "Introducing an intermediate report did not itself improve reading; the findings supplied and the model interpreting them determined the result." | §1 + (a). The negative half answers a claim no one made. The paragraph also says three times (S1, S5, S6) that both perceiver and reasoner matter, after Results has already said it twice. | Keep S1 and its evidence; delete S5 and S6. | must-fix

10. H-10 | discussion.tex:15 S1, S2, S6 (S3 is in H-59); results.tex:73 S1-S2; abstract.tex:5; highlights.tex:4; conclusions.tex:3 S3 | "Repeated judgments from a shared report consequently depend on the same account of the image." | (a). One paragraph makes the shared-report point four times and re-reports the 0.800 to 0.990 range already given in the abstract and Results. | Keep S5 (what a findings report exposes and omits); delete S1, S2 and S6. | must-fix

11. H-11 | results.tex:101 S1 and discussion.tex:19 S2; results.tex:103 S3 and discussion.tex:19 S3 (78.0\%); results.tex:101 S3 and discussion.tex:19 S4 | "Private reference cases lowered error correlation across the evaluated models and formats, while panel accuracy varied" | (a). The Discussion repeats the Results topic sentence almost word for word, then repeats two of its numbers. | Replace discussion.tex:19 S2-S4 with one sentence on what lower error correlation without higher panel accuracy means (Fig. 8). | must-fix

12. H-12 | results.tex:21 (Fig. 2 caption) | "matched Qwen 3.8 Flash analyses use 250, 250, and 250 items, respectively." | §25. This template slot was left over from a smaller Qwen sample and now repeats the clause before it. | Delete the clause after the semicolon. | must-fix

SHOULD-FIX: REPEATED EMPHASIS (a)

13. H-13 | highlights.tex:5; abstract.tex:5 S5; discussion.tex:3 S3; discussion.tex:17 S7; conclusions.tex:3 S4 | "None of the within-model changes brought error correlation near the level of readers from different models." | (a). The Discussion states the between-model result at line 3 and again at line 17, where the six values in S2 already show it. | Delete discussion.tex:17 S7. | should-fix

14. H-14 | introduction.tex:3 S4, S6; discussion.tex:3 S2, 5 S1, 19 S1, 19 S6; conclusions.tex:3 S1, S2 | "Complementary errors and adequate reader accuracy together determine the value of a second read." | (a) + §3. The Introduction's premise (accuracy and error correlation set the value of another reader) comes back four times in the Discussion and twice in the Conclusions. | Keep introduction.tex:3 and discussion.tex:5 S1, where the beta-binomial fit supports it. Delete discussion.tex:19 S1 and one of conclusions.tex:3 S1-S2. | should-fix

15. H-15 | abstract.tex:5 S3; highlights.tex:3; results.tex:36; discussion.tex:9 S3 | "On MedXpertQA-MM, most consensus errors repeated the gray-image majority, ranging from 64.2\% to 76.2\% across models" | (a). This is the fourth statement of the same result and range. | Drop the range from the Discussion and cite Fig. 4. | should-fix

16. H-16 | results.tex:13 S3; discussion.tex:7 S5 | "After discussion, 8.9\% to 70.0\% of unanimous answers were wrong." | (a). | Delete from the Discussion. | should-fix

17. H-17 | results.tex:71 S2-S3; discussion.tex:13 S4 | "Given identical Gemini 3.7 Flash reports on that set, Gemini 3.7 Flash achieved 74.5\% accuracy, GPT-5 mini achieved 62.0\%, and Claude Haiku 4.5 achieved 45.6\%." | (a) + §7 ("achieved" three times). | Point to results.tex:71 and Fig. 6a instead of re-listing the three values. | should-fix

18. H-18 | abstract.tex:5 S4; results.tex:69 S1-S2, S5; discussion.tex:13 S2-S3 | "Gemini 3.7 Flash reports improved GPT-5 mini and Claude Haiku 4.5 on every data set relative to reading images directly." | (a). S2 restates results.tex:69 S1, and S3 restates results.tex:69 S5. | Keep at most one evidence sentence in discussion.tex:13. | should-fix

19. H-19 | abstract.tex:5 S5; results.tex:87; discussion.tex:17 S2 | "On VQA-RAD, mean changes over models were $-$0.048 for role, $-$0.092 for rendering, $-$0.110 for reference cases, $-$0.199 for report, ..." | (a). Six values are re-listed from results.tex:87. | State the ordering and cite Fig. 7b. | should-fix

20. H-20 | results.tex:53 S1-S3; discussion.tex:11 S2 (S3 is in H-59) | "Gemini 3.7 Flash had the greatest panel-reader region dependence on SLAKE-target, at 32.9 percentage points, compared with 3.2 percentage points for Claude Haiku 4.5" | (a). | Drop the values from the Discussion (Fig. 5). | should-fix

21. H-21 | results.tex:7, 9 S2, 85; discussion.tex:5 S2-S3 | "On VQA-RAD, its mean panel reader exceeded the single reader by 10.3 percentage points, and aggregation added 3.3 percentage points." | (a). S2 ("less correlated errors ... gained more") restates results.tex:7 and 85; S3 restates results.tex:9. | Keep 5 S1 and cite Fig. 2; delete S2-S3. | should-fix

22. H-22 | results.tex:15 S2; discussion.tex:5 S4 | "Across the yes/no panels, observed majority accuracy minus the beta-binomial prediction averaged $-$0.07 percentage points" | (a). | Refer to the fit (Fig. 2d) without the value. | should-fix

23. H-23 | abstract.tex:5 S3; results.tex:26 S1, 30 S1; discussion.tex:9 S2 | "Removing the image lowered accuracy toward chance on VQA-RAD and SLAKE and increased error correlation for Gemini 3.7 Flash, Claude Haiku 4.5, and Qwen 3.8 Flash" | (a). It restates two Results topic sentences. | Delete; 9 S1 with a figure reference makes the point. | should-fix

24. H-24 | results.tex:113 S1, 117 S1, 119 S1; discussion.tex:7 S1-S3 | "On MedXpertQA-MM, every model abandoned correct answers that differed from its gray-image answers more often than correct answers that matched them" | (a). discussion.tex:7 S1-S3 repeat the topic sentences of three consecutive Results paragraphs. | Keep S4 (the interpretation) and cite Fig. 9. | should-fix

25. H-25 | results.tex:75 S1-S2; discussion.tex:15 S4 | "Reports also omitted queried SLAKE targets among both correct and incorrect answers." | (a). | Delete. | should-fix

26. H-26 | discussion.tex:3 S4-S5; supplement.tex:51 S2-S4 | "Shared errors therefore extend beyond image interpretation to the way readers built from the same model answer clinical questions." | (a) + §2 + §13. The text-only result is stated in the Discussion and again in S5's closing sentence ("...therefore had the same magnitude without images as in the imaging experiments."). "The same error correlation" (3 S4) also overstates: imaging generic-panel values span 0.442 to 0.915 (abstract.tex:5). | Use one sentence: text-only questions showed the same rise during discussion, 0.758 to 0.990 (Supplementary S5). Delete discussion.tex:3 S5 and supplement.tex:51 S4. | should-fix

27. H-27 | introduction.tex:3 S1, S5; discussion.tex:19 S5 | "Human evidence likewise supports pooling independent judgments of similar accuracy," | (a). The Introduction's two opening citations come back with the same claims. "Human evidence" is also a vague label for the source (§17). | Delete, or say how the AI panels differ from these human results. | should-fix

28. H-28 | introduction.tex:7 S3, S5; discussion.tex:9 S5 | "Language priors in visual question answering and poor performance under medical probing provide related evidence." | (a) + §14. The Introduction's citations come back without saying how the present result relates to them. | Say how the gray-image result compares with theirs, or delete. | should-fix

29. H-29 | introduction.tex:7 S6, S8; discussion.tex:11 S6 | "Together, these interventions explain why accuracy on isolated questions is insufficient evidence of image use, consistent with correct medical answers accompanied by flawed image comprehension." | (a) + §2. It restates introduction.tex:7 S8, and the Jin clause repeats introduction.tex:7 S6 nearly word for word. | Delete. | should-fix

30. H-30 | introduction.tex:9 S3, S6, S7; methods.tex:4 S1-S3; methods.tex:9 (Fig. 1 caption); abstract.tex:3 S1 | "The design distinguished image evidence from the question-text prior and separated seeing from judging." | (a). methods.tex:4 S1-S3 restate introduction.tex:9 S3, S6 and S7 (S3 nearly word for word), and the Fig. 1 caption repeats the list a third time. | End the Introduction at the aim sentence. Let Methods 2.1 and Fig. 1 describe the design. | should-fix

31. H-31 | introduction.tex:9 S1-S2 | "Whether a reading panel of AI models provides independent second reads of radiology images has not been measured, nor have the sources of its shared errors." | (a). The aim sentence that follows restates it. | Keep the aim sentence, or fold the gap into it as one clause. | should-fix

32. H-32 | methods.tex:4 S4; methods.tex:104 S3; supplement.tex:14 | "Each check was run before any full run, and the full runs used only the settings it fixed" | (a) + §24. Three places say the settings were fixed before the full runs. The supplement sentence also restates its heading. | Keep one statement in Methods; delete the sentence at supplement.tex:14. | should-fix

33. H-33 | methods.tex:104 S1-S2; supplement.tex:25-30 (Table S1) | "V1 checked API answer parsing and reasoning effort; V2 checked image transformations; V3 checked reference retrieval, leakage exclusions, and multiple-image parsing." | (a) + §7. Six "Vn checked" clauses duplicate the rows of Table S1. | Replace with one sentence pointing to Supplementary Table S1. | should-fix

34. H-34 | methods.tex:80 S4; supplement.tex:26 (V2) | "Gamma 0.7 replaced grayscale inversion because inversion reduced mean single-reader accuracy by 6.6 percentage points in validation, exceeding the prespecified 5-percentage-point limit." | (a) + §25. The replacement history appears in both Methods and Table S1. | In Methods, state the gamma 0.7 condition and cite Table S1 for the reason. | should-fix

35. H-35 | methods.tex:87 S7; supplement.tex:30 (V6) | "Letter readout for yes/no items was rejected during validation because the LLaVA family assigned 96\%--100\% probability to ``A'' regardless of image content." | (a) + §25. | Same fix as H-34. | should-fix

36. H-36 | methods.tex:75 S5-S7; supplement.tex:37 S4 | "Each perceiver wrote its findings reports once for each image and slot before any reasoner read a report (12,906 reports" | (a). | Keep it in Methods; leave only the length statistics in S2. | should-fix

37. H-37 | methods.tex:101 S5-S6; supplement.tex:37 S2; discussion.tex:21 S4 | "Gray-image abstentions counted as wrong; correlation among answered items was included as a sensitivity analysis." | (a). The same handling is described three times, the third time as a limitation. | Keep methods.tex:101. Delete supplement.tex:37 S2 and discussion.tex:21 S4. | should-fix

38. H-38 | methods.tex:16 S4; methods.tex:72 S3 | "Control boxes matched target-box dimensions, did not overlap the target, and met the body-coverage criterion." | (a), within Methods. | State the control-box criteria once. | should-fix

SHOULD-FIX: SELF-COINED TERMS (b)

39. H-39 | abstract.tex:3 S3; methods.tex:9, 57; results.tex:67, 80; discussion.tex:15 S5 | "Manipulations included gray images, reduced resolution, region occlusion, image pairs, question-blind findings reports, and shared or private reference cases." | (b). Prism calls an instruction to describe the image without the question "query-agnostic" (vs "query-aware"). | "query-agnostic findings reports", or "findings reports written without the question". | should-fix

40. H-40 | abstract.tex:3 S4, 5; methods.tex:9, 40 ("report writers"), 57, 75, 77, 94, 96; results.tex:67-94; discussion.tex:13, 15, 17; supplement.tex:37 | "Perceivers wrote reports; reasoners answered questions from them." | (b). The abstract introduces these role labels without defining them. "Perceiver" is also the name of a known architecture (Jaegle et al., 2021). methods.tex:40 adds a third name, "report writers". | Use Prism's wording (a perception model writes the findings, a reasoning model answers), or "report-writing model" and "answering model". | should-fix

41. H-41 | introduction.tex:9 S7; methods.tex:9, 40, 54, 70 S3 and S5; results.tex:41; supplement.tex:31 | "The single reader and independent specialty panels were evaluated at each evidence level." | (b). In a medical journal, "graded evidence" and "evidence level" read as levels of evidence (GRADE). | "reduced-resolution and gray-image conditions" (image degradation). | should-fix

42. H-42 | introduction.tex:9 S5; methods.tex:9, 40, 58, 80, 96; results.tex:87, 89, 94; discussion.tex:17; conclusions.tex:3 S4; supplement.tex:26, 31 | "In the rendering condition, generic readers 1--3 viewed original images, readers 4--6 viewed gamma-transformed images with gamma 0.7, and readers 7--9 viewed CLAHE images." | (b). In radiology "rendering" means volume rendering or MIP; gamma correction and CLAHE are contrast adjustment. | "contrast adjustment (gamma 0.7, CLAHE)". | should-fix

43. H-43 | methods.tex:77 S5, 94 S7; discussion.tex:13 S1 | "Report-pathway analyses compared accuracy and error correlation and separated errors by report coverage of the queried target." | (b). | "the report conditions (Experiment B)". Prism calls this setup a decoupled, two-stage evaluation. | should-fix

44. H-44 | methods.tex:94 S1 | "The prior decomposition cross-tabulated each reader's correctness with real and gray images." | (b). The label is used only once. | "Each reader's correctness was cross-tabulated with original and gray images." | should-fix

45. H-45 | "real": methods.tex:94, 98; results.tex:34, 48. "original": methods.tex:53, 58, 59, 70, 72, 80, 87; results.tex:26, 30, 41, 129. Verbs: results.tex:26 ("Replacing the image with gray"); results.tex:28, 30 and discussion.tex:9 S2 ("Removing the image"); results.tex:129 ("without the image") | "Removing the image changed single-reader accuracy little on MedXpertQA-MM for GPT-5 mini, Claude Haiku 4.5, and Qwen 3.8 Flash." | (b). One condition has two names and four verbs. "Removing" is also inaccurate: a gray image was sent. | Use "original image" and "gray image" (or "replacing the image with a uniform gray image") throughout. | should-fix

46. H-46 | "own" meaning same model: results.tex:69 S4-S5, discussion.tex:13 S3. "own" meaning one report per reader: results.tex:73 S2, 80, 94; methods.tex:57, 77, 96. Also "separate reports" (results.tex:73, 94; discussion.tex:15, 17) and "independent-report condition" (methods.tex:77) | "Reading a reasoner's own reports improved accuracy with a CI excluding zero only for GPT-5 mini on SLAKE" | (b). "Own report" has two meanings, and the one-report-per-reader condition has three names. | "separate reports" for one report per reader; "reports from the same model" when perceiver and reasoner match. | should-fix

47. H-47 | highlights.tex:6 ("based on image evidence"); discussion.tex:7 S3 and conclusions.tex:3 S5 ("dependent on image evidence"); the measured form is at methods.tex:96 and results.tex:113, 119, 124 | "Discussion overturned correct minority answers based on image evidence." | (b). An interpretive label, in two wordings, stands in for the measured definition (the answer differs from the same reader's gray-image answer). | Use the measured wording, or define one label once in Methods. | should-fix

48. H-48 | "effective number of independent readers": abstract.tex:3, methods.tex:9, 90, results.tex:11, 21. "effective independent readers": abstract.tex:7, supplement.tex:51. "independent readers": highlights.tex:2. "effective readers": supplement.tex:51 | "Nine readers from one model were worth 1.17 to 1.99 independent readers" | (b). N_eff has four names. The quantity is Kish's effective sample size, n/(1+(n-1)rho). highlights.tex:2 also lacks the final period the other highlights have. | Use "effective number of independent readers (N_eff)" everywhere; optionally cite Kish for the formula. | should-fix

49. H-49 | supplement.tex:51 S1-S3 | "as single readers and as independent, centralized, discussion and tiered panels of 3 to 9 readers with specialty roles." | (b). The companion paper calls these Independent, Centralized, Decentralized and Hybrid. S5 also uses "first-round" (main text: round 0), "panel positions" (main text: reader pairs) and "effective readers". "The same reading-panel designs" is inaccurate, because centralized and tiered panels are not in the imaging study. | Use the companion paper's architecture names and the main text's terms; drop "The same". | should-fix

50. H-50 | methods.tex:75 S6; supplement.tex:37 S4 | "Every reasoner therefore read identical reports for a given perceiver, image, and slot." | (b). "Slot" is an undefined pipeline term. | "for a given perceiver, image, and reader (1 to 9)". | should-fix

51. H-51 | methods.tex:40 S2, S5; discussion.tex:21 S3 | "All reader calls used OpenRouter; the routing and modality-screening outputs of GPT-4.1 nano (temperature 0) were generated once and reused." | (b). Here "routing" means GPT-4.1 nano's role ranking; in S5 ("Routing and token budgets were held constant") it means API routing. "A single router" (discussion.tex:21) is equally vague. | Say "role ranking" for GPT-4.1 nano, and name OpenRouter in the limitation. | should-fix

52. H-52 | methods.tex:80 S5 | "Cross-vendor comparisons combined existing reader responses without additional calls." | (b) + §25. This is a third name for what methods.tex:96 calls the model contrast, and "without additional calls" describes cost. | "Model contrasts paired existing responses from readers of different models." | should-fix

53. H-53 | discussion.tex:17 S1, S4 | "The matched contrasts formed a graded ladder of reductions in error correlation" | §3 + (b): a coined image. S4 ("These interventions progressively changed more of the information used in a reading") is §13: how much information each change alters was not measured. | "The matched contrasts ordered the components by how much they lowered error correlation (Fig. 7)"; delete S4. | should-fix

SHOULD-FIX: OTHER HUMANIZER PATTERNS

54. H-54 | introduction.tex:5 S9; introduction.tex:7 S4 | "Different responses alone do not establish independent second reads." | §2 + §1 (clipped negative). It is also §5, since no cited work claims the opposite. introduction.tex:7 S4 explains the Goyal example the reader has just read. | Delete both; introduction.tex:5 S8 already makes the point. | should-fix

55. H-55 | results.tex:11 S1, 75 S1, 85 S1, 99 S1, 131 S1 | "Shared reference cases changed single-reader accuracy differently across models and data sets." | §4. These topic sentences announce that results vary without giving a direction. results.tex:75 S1 ("Reports omitted the queried SLAKE target among both errors and all reports.") is also ungrammatical. | Delete them or state the direction, and let the numbers open the paragraph. | should-fix

56. H-56 | methods.tex:96 S2-S8; results.tex:87 S2-S8 | "The role contrast was the mean for reader pairs in specialty panels minus that for reader pairs in generic panels." | §7. Seven consecutive "The X contrast was/compared" definitions are followed by seven "X contrasts were" sentences carrying 20 CIs. "In VQA-RAD, SLAKE, and MedXpertQA-MM order" is awkward. | Put the definitions in a Table 2 column and the 20 estimates in a table (Fig. 7b already plots them). | should-fix

57. H-57 | discussion.tex:17 S3, S5 | "Roles changed instructions; renderings changed the presentation of the same image; private reference cases changed the examples available to each reader." | §6. Two parallel triads, which also restate methods.tex:96 and the Fig. 7 caption. | Use one sentence, or delete (the Fig. 7 caption defines each contrast). | should-fix

58. H-58 | discussion.tex:5 S5, 9 S1; introduction.tex:3 S2; methods.tex:77 S4, 87 S6 | "This agreement connects the limited return from additional readers to measured error correlation." | §14 + §18. "Connects", "connected", "at rates that depended on the setting", "provided the reference comparison" and "represented each answer" name a link without stating it. | E.g. "Error correlation therefore accounts for the small gain from added readers"; give the review's range at introduction.tex:3. | should-fix

59. H-59 | discussion.tex:11 S3, 15 S3 | "Fixing the findings removed much of the variation between readers, locating an important source of their differences in seeing." | §15 (plus §13, "important"). 11 S3 ("..., directly connecting responses to the queried region") also restates results.tex:53 S1. | Delete both riders; if the claim matters, give it its own sentence. | should-fix

60. H-60 | results.tex:84; results.tex:66 and methods.tex:74; results.tex:25 and methods.tex:69; results.tex:112; supplement.tex:36 | "What two readers share" | §20. This heading is written for effect. "Discussion among readers" collides with the Discussion section, "Run record" is an internal label, and the other headings carry coined terms (H-02, H-03). | "Error correlation by shared component"; "Discussion rounds"; rename the rest after H-02 and H-03. | should-fix

61. H-61 | results.tex:80 and 108 ("no reference lines are plotted"), 124 ("No reference lines are plotted."), 41 ("missing estimates are omitted"), 62 ("Lines in (a) join the rates.") | "Light gray horizontal lines separate data sets; no reference lines are plotted." | §25. These captions describe what the figure lacks or what the reader can already see. "Missing estimates are omitted" leaves the reader asking which ones. | Delete these clauses; name any missing estimates. | should-fix

62. H-62 | methods.tex:40 S4, S6 | "Because of its throughput, Qwen 3.8 Flash ran only the original-image baseline (A0), graded evidence (A1), generic reading panel (C1), and varied image rendering (C2)." | §25 (plus b). C1 and C2 are defined nowhere (Table 2 has only C). "Throughput" here means latency (Table S1: 6-77 s per call). S4 ("Google models were restricted to Gemini 3.7 Flash.") is a protocol rule that the model list already implies. | Delete S4. Name the conditions or define C1 and C2 in Table 2. Write "Because of its latency". | should-fix

63. H-63 | supplement.tex:37 S3, S5 | "After each model finished, every condition was run again to fill episodes lost to transient errors; calls already made were read from the cache." | §25 + (b) ("episodes", "output-quality stop", "cache"). S3 also defends a switched-off check no one asked about (§5). | "Calls that failed with transient API errors were repeated until every item had a response; the stop at more than 15\% unparsed answers was not applied to gray-image conditions." | should-fix

64. H-64 | supplement.tex:51 S1 | "The same reading-panel designs were applied to text-only clinical questions in a companion analysis" | §17 (unnamed source). The reader cannot find the companion analysis. | Cite the companion manuscript, or label it unpublished data. | should-fix

OPTIONAL

65. H-65 | methods.tex:42 S3-S4; supplement.tex:30 (V6) | "LLaVA-Med v1.5 was screened and excluded under the prespecified accuracy rule: its accuracy was 53\%, below the 55\% threshold, pooled over 100 validation items." | (a). | Keep the rule and the exclusion in Methods and the pooled accuracies in Table S1. | optional

66. H-66 | methods.tex:40 S6; supplement.tex:31 | "Qwen 3.8 Flash ran the original-image, graded-evidence, generic-panel and rendering conditions only." | (a). | Keep one. | optional

67. H-67 | methods.tex:82 S2-S3; supplement.tex:27 (V3) | "References excluded if SHA-256 identical, within Hamming distance 8 of the 64-bit perceptual hash, or at CLIP cosine of at least 0.98." | (a). | Keep the rule in Methods and only the rationale in Table S1. | optional

68. H-68 | methods.tex:92 S4, 94 S9, 101 S1; methods.tex:18 S4, 94 S6 | "Differences were paired by item." | (a), a repeated qualifier: item pairing is stated three times and per-item option randomization twice. | State pairing once, in Statistical analysis. | optional

69. H-69 | results.tex:21, 41, 48, 62, 94 and 80, 108, 124 | "Blue circles denote GPT-5 mini; teal squares, Gemini 3.7 Flash; amber diamonds, Claude Haiku 4.5; rose triangles, Qwen 3.8 Flash." | (a) at caption scale; "(250 items each)" also appears 8 times. | If the journal does not require standalone captions, put the model key in the figure legends and write "Model colors as in Fig. 2" in later captions. | optional

70. H-70 | introduction.tex:7 S5 | "leading multimodal models performed worse than random guessing on simple probing questions about diagnosis." | §16 (mild). | "large multimodal models". | optional

71. H-71 | abstract.tex:3 S1; introduction.tex:9 S6; methods.tex:40, 87 ("the API arm"); results.tex:53, 57; discussion.tex:21; supplement.tex:25 | "We evaluated four application programming interface vision-language models (VLMs) and five open-weight models" | (b, mild). The usual counterpart of "open-weight" is "proprietary". Spelled out, "application programming interface" becomes a three-word modifier. | "four proprietary VLMs and five open-weight VLMs". | optional

72. H-72 | methods.tex:82-84; results.tex:98-108; discussion.tex:17, 19 | "Reference cases were evaluated on S1 and S2 using VQA-RAD and English SLAKE training images with closed yes/no questions." | (b, weak). ML papers call retrieved examples in the prompt in-context (few-shot) examples; radiology readers will accept "reference cases". | Define the term once as retrieved in-context examples. | optional

73. H-73 | methods.tex:14 S5-S6, 32 (Table 1); supplement.tex:27 | "Claude Haiku 4.5 (claude-haiku-4.5) confirmed that candidate images were actual acquisitions." | (b). "Radiologic acquisition", "actual acquisitions" and "ordinary similar cases" are not standard terms. | "radiologic images"; "similar images from different patients". | optional

74. H-74 | supplement.tex:25 (V1) | "All four API models parsed 100\% of single-reader answers through OpenRouter." | §11 (wrong actor: the parser parsed the answers). "Claude Haiku 4.5 retained" in the same row reports a decision without saying what the alternative was (§25). | "Answers from all four API models parsed in 100\% of cases." | optional

75. H-75 | discussion.tex:17 S6, 19 S2 | "The ordering also held on SLAKE and, for the evaluated contrasts, MedXpertQA-MM." | §9 (weak). "Evaluated" hedges where the text could say what is missing. | "...and on MedXpertQA-MM, where reference cases were not tested." | optional

76. H-76 | results.tex:26, 30, 34, 67, 99 | "Corresponding SLAKE ranges were 72.4\% to 91.2\% and 38.8\% to 54.4\%." | §7 at paragraph scale ("Corresponding ... were" five times, "ranged from" 32 times). This is weak in a Results section. | Move the per-data-set ranges to tables. | optional

77. H-77 | methods.tex:70, 75, 80, 87 | "Experiment A used S1--S5." | §7 + §24. Each Experiment subsection opens by restating its heading and Table 2's Sets column. | Delete these opening clauses. | optional

78. H-78 | discussion.tex:11 S1, S6, 17 S4, vs abstract.tex:3, introduction.tex:9, methods.tex:4, 9 | "Image interventions distinguished use of the relevant anatomy from answering correctly through the question text." | (b, mild). The Discussion says "interventions"; everywhere else says "manipulations". | Use "manipulations" throughout. | optional

79. H-79 | results.tex:30 S4 | "Error correlation did not change monotonically with image resolution" | §1 (weak). It says only what did not happen. | Say where error correlation peaked. | optional

OUTSIDE THE SKILL'S CATEGORIES (noticed in passing)

80. H-80 | methods.tex:65 S2-S3 | "For each specialty panel, GPT-4.1 nano ranked 9 radiology subspecialty roles using the question text." | Not a skill pattern (consistency). The roster that follows lists 12 subspecialties. | E.g. "ranked the 12 roles; the top 9 formed the panel", if that is the procedure. | should-fix

81. H-81 | methods.tex:75 S3; supplement.tex:37 S4 | "It wrote findings reports of at most 120 words" | Not a skill pattern. S2 reports maximum lengths of 118 to 127 words. | "was instructed to write at most 120 words". | should-fix

82. H-82 | methods.tex:80 S1 | "Experiment C used S1--S3 to vary shared VLMs, image rendering, roles, reports, reference cases, and discussion records." | Not a skill pattern, plus (b). "Discussion records" is defined nowhere, reports belong to Experiment B, and Table 2 row C lists only the generic panel, renderings and reference cases (reference cases on S1-S2 only). | List only Experiment C's conditions. | should-fix

83. H-83 | discussion.tex:9 S2 | "Removing the image lowered accuracy toward chance on VQA-RAD and SLAKE" | Not a skill pattern. SLAKE gray-image accuracy was 38.8\% to 54.4\% (results.tex:26), i.e. at or below chance. Moot if H-23 is applied. | "to or below chance". | optional

84. H-84 | results.tex:9, 28, 57, 89 | "(Supplementary Tables)" | Not a skill pattern. The pointer does not say which table. | Give the table numbers. | optional

85. H-85 | abstract.tex:3 S5; methods.tex:9 (Fig. 1 caption) | "Outcomes were error correlation and the effective number of independent readers." | Not a skill pattern. The Fig. 1 caption also lists accuracy as an outcome. | Make the two lists match. | optional

SUMMARY

There are 85 findings: 12 must-fix, 55 should-fix (3 of them outside the skill) and 18 optional (3 of them outside the skill).

Counts by primary category:
- Repeated emphasis (a): 34
- Self-coined or multi-named terms (b): 25
- §25 writing about the document: 4
- §7 repeated openings: 3
- §1 not X but Y: 2
- §2 one-line closers: 2 (H-08 covers four sentences; the pattern ends eight of the nine interpretive Discussion paragraphs)
- One each: §4, §6, §9, §11, §14/§18, §15, §16, §17, §20
- Outside the skill: 6

Patterns not found:
- §8: LaTeX "--" appears only in ranges and compound names.
- §10 and §12: none of the listed AI words appear.
- §19: the bold abstract labels are the journal's structured format.
- §21, §22 and §23: none.
- §26 does not apply to a paper.

The three patterns that recur most:
1. Repeated emphasis. Nearly every Discussion paragraph re-reports Results numbers and topic sentences (H-09 to H-11, H-15 to H-26). Methods restates Supplementary Table S1 (H-32 to H-36, H-65 to H-67). The headline appears six times, and the Discussion and Conclusions end on the same clause word for word (H-01).
2. Self-coined or multi-named terms. Several replace a standard term the manuscript itself cites: language prior, perceptual/interpretive, self-consistency, automation bias. Several measures carry two to four names: conformity/abandonment/overturned/deference, region dependence/region reliance, four names for N_eff, and "own" reports in two senses.
3. §2 closers. Eight of the nine interpretive Discussion paragraphs end on a sentence that restates the paragraph, usually after therefore, thus, consequently or together. The Introduction makes the same move three times (introduction.tex:3 S6, 5 S9, 7 S8).

Sources for the Prism terms (perception/reasoning stages, query-agnostic vs query-aware instructions): [Prism, arXiv 2406.14544](https://arxiv.org/html/2406.14544v1); [Prism, NeurIPS 2024](https://papers.neurips.cc/paper_files/paper/2024/hash/cac9e747a1d480c78312226959566cef-Abstract-Conference.html)
