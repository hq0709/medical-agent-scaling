# 写作审稿合并反馈（Meta-Radiology 稿，2026-10-20）

- **范围**：`paper/radiology/sections/*.tex`（摘要、highlights、引言、方法、结果含图注、讨论、结论），以及补充材料 S1/S2/S5 的正文与 Table S1。
- **审稿方式**：五个 subagent 并行，各管一个方面：
  - humanizer（H）
  - academic-humanizer（A）
  - anti-defensive-writing（D）
  - defensive-writing-governance（G）
  - 术语对照（T）：对照 NMI 2026（Kim et al.）、MDAgents、MedAgents、Du 2023、CorrErr（ICML 2025）、Prism、MMVP、MMStar、VQAv2、NaturalBench、ProbMed、Zafar 2026、Geijer 2018 等原文。
  - 各份原始报告在 `raw/`：H 85 条、A 108 条、D 83 条、G 65 条，T 是一张约 60 行的术语表。
- **合并规则**：同一问题只列一次，方括号里标出由哪几份审稿提出。凡是涉及数字或事实的条目，我都用 `results/imaging_v2_*.json` 和代码逐条复核过。
- **手稿一个字没改。**
- **位置写法**：`file:line`。每段占一行源码，S3 表示该段第 3 句。

---

## 一、事实与数字错误（必须改，均已复核）

| # | 位置 | 原文 | 问题（复核结果） | 改法 |
|---|---|---|---|---|
| F-01 | results.tex:113 | "from 2.4\% to 6.3\% for the latter" | MedXpertQA-MM 上与灰图答案相同的正确答案被推翻的比例，四个模型分别为 2.68 / 2.62 / 6.26 / 5.41，应写 **2.6% to 6.3%**。2.4 是 Qwen 多数派的推翻率。`check_numbers.py` 没查出来，因为 2.4 在 numbers.md 的别处出现过。[A] | 改为 2.6%；同时给 check_numbers 加"数字与语境匹配"的检查 |
| F-02 | results.tex:115 | "GPT-5 mini had difference CIs excluding zero" | Qwen 3.8 Flash 在 VQA-RAD 上的差值 5.9（95% CI 0.6 to 11.5）也不含 0，原文漏报了。[A] | 补上 Qwen |
| F-03 | abstract.tex:5 | "Panels of nine readers changed accuracy by −2.8 to 4.0 percentage points" | −2.8 到 4.0 只是**独立面板**的范围；讨论面板是 −3.2 到 5.6（Claude VQA-RAD 的 +5.6，CI 不含 0）。[G] | 写成 "Independent panels of nine…"，或者把两种面板的范围都给出 |
| F-04 | results.tex:69 | "Claude Haiku 4.5 reports lowered their accuracy … −25.9 to −0.4" | −0.4 那一格（SLAKE，GPT-5 mini 作 reasoner）的 CI 是 −5.0 到 4.6。[A] | "lowered accuracy in 5 of 6 cells, by 7.9 to 25.9 percentage points" |
| F-05 | results.tex:30 | "Error correlation did not change monotonically with image resolution" | 不准确。降低分辨率时各模型的变化方向不同：VQA-RAD 上 GPT-5 mini 0.752 → 0.694 → 0.644，单调下降；Qwen 0.439 → 0.442 → 0.480，单调上升。[A, H, D] | 改成"降低分辨率后各模型的变化方向不同"，并给出两端的例子 |
| F-06 | highlights.tex:4；conclusions.tex:3 | "A shared findings report increased error correlation" | 相对"各自读自己的报告"成立（0.800–0.990 对 0.641–0.818）；相对"直接读图"有一格不成立（MedXpertQA-MM，Claude 0.893 对 0.915）。[A] | 写明比较对象：versus separate reports from the same model |
| F-07 | results.tex:129 | "Open-weight models lost accuracy without the image on VQA-RAD and SLAKE" | LLaVA-1.5 7B 在 VQA-RAD 上只降了 2.0（56.0 → 54.0）。[A] | "four of five … on VQA-RAD; all five on SLAKE" |
| F-08 | discussion.tex:19 | "Gemini 3.7 Flash's private text reference cases increased panel accuracy on SLAKE" | 92.0 对 90.4，只差 4/250 题，没有配对 CI，用"increased"太强。[A] | 删掉，或者报配对差值及其 CI |
| F-09 | methods.tex:75 | "It wrote findings reports of at most 120 words" | S2 报告的实测最长篇幅是 118–127 词。[H, D, A, G] | "was instructed to write at most 120 words" |
| F-10 | methods.tex:65 | "GPT-4.1 nano ranked 9 radiology subspecialty roles"，后面列了 12 个亚专科 | 代码（`panels/roles.py::route`）的实际流程：GPT-4.1 nano 从 12 个亚专科里选出最相关的 9 个并排序；返回不足 9 个时，按名单顺序补齐。[H, D, A, G] | 照实际流程写 |
| F-11 | methods.tex:40 与 :67 | 一处写 "the seed was 1"，另一处写 "differed only through separate sampling" | 两句互相矛盾，正文也没解释同一提示、同一种子怎么会得到不同答案。代码的实际做法：配置种子为 1，读者 i 用 seed 100+i，temperature 0.7。GPT-5 mini 是 OpenAI 推理模型，不接收 seed 和 temperature，所以把读者编号写进缓存键。[G] | 照实写，同时点名 GPT-5 mini 是不接收这两个参数的模型（G 的建议） |
| F-12 | supplement.tex:51（S5）；discussion.tex:3 | "Over 340 panel configurations … 0.758 … 96 discussion configurations … 0.758 (SD 0.117) to 0.990" | (1) 这些数字都不在 numbers.md 里。<br>(2) 0.758 来自伴随论文，是 Independent / Centralized / Decentralized（n≥3）的首轮 φ（三者共用首轮意见，按设计相同），不含 Hybrid；而"340 个配置"含 Hybrid，口径不一致。<br>(3) "The same reading-panel designs" 不准确，影像研究里没有 centralized 和 tiered。<br>(4) "companion analysis" 没给出处。<br>[A, D, H, G] | 把 S5 的数字接入 `radiology_numbers.py`；引用伴随稿；架构名改用 NMI 的 Independent / Centralized / Decentralized / Hybrid |
| F-13 | methods.tex:96；results.tex:89 | "regression … summarized the same comparisons" | VQA-RAD 上 report 系数是 **+0.150**（0.092 to 0.218），和配对 contrast 的 −0.199 符号相反；role 系数含 0。"the same comparisons"不成立。[A] | 改为 "an additive regression, a secondary summary"，删掉 "the same comparisons" |
| F-14 | methods.tex:80 | "Experiment C … reports, reference cases, and discussion records" | (1) "discussion records"没有定义。<br>(2) reports 属于 Experiment B。<br>(3) 参考病例只在 S1–S2 上跑过。<br>[H, D, A] | 只列 Experiment C 实际的条件 |
| F-15 | methods.tex:40 | "(C1)" "(C2)" | Table 2 里没有定义 C1、C2。[H, A, T] | 在 Table 2 里补定义，或者删掉 |
| F-16 | abstract.tex:3–7 | Outcomes 一句、Results 部分 | (1) Outcomes 漏了 accuracy（Fig. 1 图注里有）。<br>(2) N_eff 只在 Conclusions 里出现，Results 里没有。<br>(3) "generic panels" 和 "consensus errors" 在摘要里没有定义。<br>(4) 摘要的面板名和正文不一致。<br>[H, D, A] | 逐项对齐；摘要正好 250 词，补字要从别处删 |
| F-17 | results.tex:135 | Spearman −0.048 / −0.401 / 0.006 | 全文只有这几个估计没有 CI。[A] | 补 item bootstrap CI |
| F-18 | main.tex:19；methods.tex:107 | `\author{Anonymous}` 与 GitHub URL | URL 里含账户名。CVPR 是双盲评审，投稿时必须匿名化。[G] | 换成匿名仓库链接 |
| F-19 | 多处 | 格式问题 | (1) highlight 第 1 条缺句号。<br>(2) 摘要写 "Materials and methods"，章节标题写 "Material and methods"。<br>(3) Table S1 里有 "−0.0"。<br>(4) 范围写法不统一（96\%--100\% 对 96--100\%）。<br>(5) "(Supplementary Tables)" 没给表号。<br>(6) discussion:9 说准确率降到 "toward chance"，实际 SLAKE 灰图下 38.8–54.4%，已在机会水平或更低。<br>[H, D, A] | 逐个修 |

## 二、说过头的论断（必须改）

| # | 位置 | 原文 | 问题 | 改法 |
|---|---|---|---|---|
| O-01 | abstract.tex:7；discussion.tex:19 S7；conclusions.tex:3 S6 | "An independent second read … requires a different model to perform the seeing" | (1) φ 降得最多的是换整个模型（−0.470 到 −0.492）。<br>(2) 只换 perceiver 是 −0.263 到 −0.311。<br>(3) MedXpertQA-MM 上只换 reasoner 也降了 −0.430，比换 perceiver 还多。<br>(4) "requires" 是必要性论断，没有被检验过。<br>(5) 不同模型的读者之间仍然相关（A 用 numbers.md 推算，每对模型约 0.13–0.46）。<br>[D, A, H] | "…requires a different model."，删掉 "to perform the seeing"；或者直接写数字 |
| O-02 | abstract.tex:7 | "because its readers shared the model's seeing and the question-text prior" | (1) "because" 只归因到看图和先验，漏了 reasoner。<br>(2) 先验的证据只在 MedXpertQA-MM 上强（64.2–76.2%）；VQA-RAD 是 42.9–54.4%，SLAKE 是 14.3–57.9%，都在 50% 上下。<br>[A, D] | 删掉 because 从句，或者把三个来源都写全，并把先验限定在 MedXpertQA-MM |
| O-03 | discussion.tex:3 S4 | "The same error correlation and rise during discussion occurred for text-only clinical questions" | 影像研究里 φ 是 0.439–0.915，说"the same"不成立。[D, A, H] | "of the same magnitude" 或 "within the imaging range" |
| O-04 | discussion.tex:17 S4 | "These interventions progressively changed more of the information used in a reading" | 信息量没有测过。[H, D, A] | 删 |
| O-05 | discussion.tex:5 S2 | "Qwen 3.8 Flash had less correlated errors … and gained more" | 两件事放在一起读成了因果；按分解结果，增益主要来自读者本身更准。[D, A] | "gained more, mostly through more accurate panel readers" |
| O-06 | highlights.tex:6 | "Discussion overturned correct minority answers based on image evidence" | (1) 把少数派分析和灰图分析两个结果拼成了一句。<br>(2) "based on image evidence" 不是测量定义。<br>[D, A, H] | "Readers abandoned 41.5% to 100.0% of correct minority answers in discussion." |
| O-07 | discussion.tex:7 S4 | "exposed those answers to a majority sharing an incorrect question-text prior" | 多数派是否持灰图答案，没有测过。[A] | 删，或者补报这一比例 |
| O-08 | discussion.tex:11 | "Together, these interventions explain why…"；", directly connecting responses to the queried region" | 用"explain why"太强；而 Claude 的区域依赖只有 3.2 pp，谈不上"directly connecting"。[A, H] | "show that"；删掉后半句 |
| O-09 | results.tex:133 | "Models sharing a vision encoder did not have consistently higher error correlation" | 只有一对模型共享编码器。[D, A] | 点名这一对（HuatuoGPT-Vision 7B / LLaVA-1.5 7B）及其数值 |
| O-10 | methods.tex:14 | "Claude Haiku 4.5 confirmed that candidate images were actual acquisitions" | 另一个模型打的标签算不上"确认"；"actual acquisitions" 也不是标准说法。[A, H] | "also labeled each candidate image as radiologic or not" |
| O-11 | introduction.tex:3 | Kurvers / Taylor 两处转述 | 转述漏了原文的比较对象：Kurvers 比的是组里最好的医生；Taylor 发现双读既提高检出率也提高召回率。[T] | 按原文的比较对象写 |

## 三、术语：自造词与一物多名（需要你拍板）

按你的规则，名词和谓语都照最相关论文的写法来。下表里的"原文用法"都是 T 从原文逐字摘出的。

| # | 现用词（出现次数） | 相关论文原文用法 | 建议 | 我的推荐 |
|---|---|---|---|---|
| T-01 | seeing / judging (14/10) | Prism: "a perception stage … and a reasoning stage"；Bruno 2015（引言已引用）: perceptual vs cognitive/interpretive；Geijer: perceptual / interpretive | 二选一：perception / interpretation（放射科）或 perception / reasoning（Prism） | Meta-Radiology 版用 perception / interpretation，和 intro:3 一致；CVPR 版用 Prism 的 perception / reasoning。A 提醒："reasoning" 和方法里的 "reasoning effort / tokens" 撞词，CVPR 版要把后者改成 "thinking budget" 之类 |
| T-02 | perceiver / reasoner / report writers (27/35/1) | Prism: "a perception module and a reasoning module"；"The perception module, typically a VLM" | perception module / reasoning module，或 report-writing model / answering model | 照抄 Prism 的 perception module / reasoning module，并删掉第三个名字 "report writers" |
| T-03 | question-blind findings report (6) | Prism: "query-agnostic or query-aware" instruction；ProbMed: "visual descriptions" | query-agnostic report | 采纳 |
| T-04 | question-text prior (9) | VQAv2: "language priors"，NaturalBench 和 Zafar 同；我们自己在 intro:7、disc:9 已经用了 language priors | language prior | 采纳（五份审稿全都指出了这一条） |
| T-05 | image evidence (11) | Zafar: "visual evidence"；Prism: "visual information" | visual evidence | 采纳 |
| T-06 | generic panel (15) | MDAgents 把 CoT-SC 列为 Solo（单智能体）方法；Du: "applied over a single model instance"；NMI: "single-agent strategies such as self-consistency"；伴随论文叫 Self-consistency | self-consistency（9 次采样 + 多数投票） | 采纳。按领域分类，self-consistency 本来就算单智能体方法，这正好支持我们的结论：同一模型采样 9 次，只抵得上 1–2 个读者 |
| T-07 | reading panel / specialty panel / independent specialty panel / independent reading panel / discussion panel / panel advantage | NMI: "Multi-Agent System (MAS)"、"Independent"、"Decentralized"、"MAS advantage"、"multi-agent gain"；MDAgents: "Multi-agent (Single-model)" vs "(Multi-model)"；Du: "multiagent debate"。我们的关键词本身就是 "Multi-agent system" | 方案 (a)：整体换成 NMI 词汇；方案 (b)：总称保留 reading panel，子类各只用一个名字（Independent / Discussion / Self-consistency） | CVPR 版用 (a)，对标 NMI，审稿人熟悉；Meta-Radiology 版用 (b)，因为 reader 是放射科用语，T 也建议保留 reader |
| T-08 | conformity / abandoned / overturned / deference / preserved | Zhu26: "conformity pressure"；Du: "change their opinion"；Dratsch: "automation bias" | 指标统一叫 conformity；事件动词用 changed their answer；Dratsch 那句用 automation bias | 采纳。另外 "Discussion overturned" 主语不对：改答案的是读者，不是讨论 |
| T-09 | region dependence / region reliance / flip rate | Zeiler & Fergus §4.2 小节标题 "Occlusion Sensitivity"；Zafar: "answer-change" | occlusion sensitivity（目标遮挡减对照遮挡的答案改变率）；删掉没有报告过的 region reliance 定义 | 采纳 |
| T-10 | rendering (17) | 放射科里 rendering 指体绘制或 3D 渲染；CLAHE 原名见 Zuiderveld；Zafar 称这类操作为 "counterfactual image conditions" | contrast adjustment（gamma 0.7、CLAHE）或 image post-processing | 推荐 contrast adjustment。A 指出 "contrast enhancement" 会和造影剂增强撞词 |
| T-11 | graded evidence / evidence level | 在医学期刊里会被读成 GRADE 证据分级 | reduced resolution and gray images | 采纳 |
| T-12 | gray image (33) | Zafar 的条件名是 "Blank"，定义为 "Uniform gray image at the channel mean" | blank image（uniform gray） | 需你定。按你的规则应该改成 blank；我倾向于改，首次出现时写明 uniform gray |
| T-13 | original / real image；removing / replacing the image | Zafar 的条件 "Real … Original, unmodified image" | 统一用 original image；动词用 replaced with a gray (blank) image。不要写 removing，因为实际送进去了一张灰图 | 采纳 |
| T-14 | reference cases (45) | MDAgents / MedAgents: "few-shot"、"demonstrations" | retrieved in-context (few-shot) examples；shared / private 改为 "the same examples for every reader" / "different examples per reader" | 需你定。放射科读者能接受 reference cases，CVPR 版建议改 |
| T-15 | N_eff 的 4 个名字 | 9/(1+8φ) 就是 Kish 的有效样本量；Morrison & Schmittlein 1991 的标题是 "How Many Forecasters Do You Really Have?" | 统一叫 effective number of independent readers (N_eff)，并引用 Kish | 采纳 |
| T-16 | consensus errors (11) | 在领域里，consensus 指讨论之后形成的共识；CorrErr: "converge on the same wrong answer" | shared wrong answers（≥7/9 个读者答错） | 采纳（目前它在讨论之前的独立面板里测，和 disc:7 的 "final consensus" 撞义） |
| T-17 | round 0 (10) | Du: "initial responses"；NMI: "final-round answers" | initial answers / final answers | 采纳 |
| T-18 | "independent" 的 3–4 种含义 | NMI 里 Independent 是架构名 | 只保留架构这一义；表示统计独立时用 uncorrelated；报告条件另外改名 | 采纳 |
| T-19 | own report / separate reports / independent-report condition | — | 统一为 own-report 与 shared-report 两个条件；perceiver 与 reasoner 是同一模型时写 same-model reports | 采纳 |
| T-20 | reader study（标题、intro:9、methods:4） | 放射科里 reader study 指有人类读者的研究；NMI: "controlled evaluation" | controlled evaluation | 采纳 |
| T-21 | API models | 和 open-weight 对应的常用说法是 proprietary | proprietary models | 采纳 |
| T-22 | baseline（指 generic panel 的 φ） | NMI 里 baseline 指单智能体表现 | within-model error correlation | 采纳 |
| T-23 | second read、one read than to nine（read 当名词用） | Taylor: "independent second reading" | second reading；closer to one reader than to nine | 采纳 |
| T-24 | 内部行话 | — | 逐个换成普通说法，见下方列表 | 采纳 |
| T-25 | 其他一物多名 | — | 每组统一成一个词，见下方列表 | 采纳 |
| T-26 | 题集 S1–S5 | 和补充材料的章节号 S1–S5 撞名 | 改用数据集名 | 需你定。T 认为可以保留，G 建议改；我倾向于改 |

T-24 涉及的内部行话：
- slot → report index
- report pathway → two-stage
- full runs → main experiments
- C1 / C2：未定义
- routing：同时指角色排序和 API 路由两种意思
- cross-vendor → cross-provider（intro:5 用的是 providers）
- discussion records
- episodes → responses
- output-quality stop
- prior decomposition
- letter readout
- graded ladder → ordering
- 标题 "What two readers share"

T-25 要统一的词组：
- interventions / manipulations
- abstentions / unparsed / refusals / declined
- visual encoder / vision encoder
- image pairs / paired images / same-question, different-image pairs
- correct / wrong / Right
- shared / correlated errors

## 四、反复强调（逐条：留哪处、删哪处）

| # | 内容 | 出现位置 | 建议 |
|---|---|---|---|
| R-01 | "一个模型的 9 个读者≈1–2 个读者" | abs:7；hl:2；res:11；disc:3 S1；disc:5 末句；disc:19 S7；concl:3。其中 disc:19 末句和 concl:3 末句逐字相同 | 留摘要、highlight、结果（写数字）、结论；删 disc:3 S1 和 disc:19 S7；res:11 的主题句直接换成数字 [全部] |
| R-02 | "读者的价值取决于准确率和误差相关" | intro:3 ×2；disc:5 S1；disc:19 ×2；concl:3 | 留 intro:3 一次和 concl:3；Discussion 里只在 beta-binomial 拟合处说一次 [H, D, A, G] |
| R-03 | "换模型比模型内改动降 φ 多得多" | hl:5；abs:5；res:87；disc:3 S3；disc:17（S2 列了六个数，S7 又说一遍）；concl:3 | Discussion 只说一次并引 Fig. 7，不再列数字；highlight 改成带数字的写法 [全部] |
| R-04 | "共享报告让 φ 升高" | disc:15 一段里说了 4 遍，还重复了 0.800–0.990 | 只留一句解释 [全部] |
| R-05 | "讨论推翻少数派的正确答案" | 共 6 处；disc:7 S1–S3 复述了 results:113/117/119；8.9–70.0% 也重复了 | Discussion 只留解释 [全部] |
| R-06 | "MedXpertQA-MM 上共识错误与灰图多数答案一致，64.2–76.2%" | 4 处，其中 disc:9 一段里说了 4 遍 | Discussion 引 Fig. 4，只留 Loy 2004 那一处类比 [全部] |
| R-07 | Discussion 重复 Results 的数字 | 10.3 / 3.3 pp；−0.07 pp；74.5 / 62.0 / 45.6%；32.9 对 3.2 pp；78.0%；Gemini 报告的增益 | Discussion 里一律改成引图号 [全部] |
| R-08 | 引言的引文在 Discussion 里原样再用 | Goyal / Yan、Jin、Kurvers / Taylor | 删掉；如果要再引，就写清本研究在它们之外补充了什么 [H, D, A, G] |
| R-09 | 设计逻辑写了三遍 | intro:9 ≈ methods:4 ≈ Fig. 1 图注；component 清单在 intro:9 和 methods:80 各一份 | 引言写目标，方法写定义，各只写一次 [全部] |
| R-10 | Methods 和 Table S1 重复 | V1–V6 清单；gamma 替换灰度反转（−6.6 pp）；LLaVA 对 "A" 给 96–100% 概率；LLaVA-Med 53% 对 55% 的门槛；哈希阈值；Qwen 的条件限制 | 每项只在一处出现：设置写在方法，验证结果写在 Table S1 [全部] |
| R-11 | "锁定 / 预先设定 / 在……之前" | methods:4、:42、:75、:77、:80、:103–104；supplement:13–14、:37，共 9 处 | 留一处 [D, G, H, A] |
| R-12 | 弃答的处理方式 | methods:101；results:32；disc:21；S2，共 3–4 处 | 只留 methods:101 和 results:32 [全部] |
| R-13 | "CI excluding zero" | 出现 10 次 | 这等于在做显著性判断，和 "no hypothesis tests" 冲突。在统计方法里交代一次怎么描述，后文只印 CI [A] |
| R-14 | 图注里的模型配色说明、"(250 items each)" | 各出现 8 次 | 需你定：Meta-Radiology 要求图注自足，可以保留；CVPR 版图里已有图例，只写一次 [全部] |
| R-15 | Methods 内部的重复 | 对照框标准 2 次；配对设计 4 次；"paired by item" 3 次；选项顺序随机化 2 次；题数在正文、Table 1、V4 各一次 | 每项只说一次 [H, D, A, G] |

## 五、防御性写作（删 / 挪 / 留）

**删**
- methods:4 "Pilot observations were excluded from the study analyses."：全文没有描述过 pilot，这句只会引出疑问。G 建议删，D 建议留，我建议删。
- methods:42，LLaVA-1.5 7B 的 "its VQA-RAD validation accuracy was near chance"。[G, D]
- methods:40 "Google models were restricted to Gemini 3.7 Flash."：模型列表里已经写了。[G, D, H, A]
- methods:40 "Because of its throughput, …" 里的理由：只写覆盖了哪些条件，不写理由。[G, D, H]
- results:21 "matched Qwen 3.8 Flash analyses use 250, 250, and 250 items"：同一句前面已经说了每组 250 题。[全部]
- results:80 / 108 / 124 的 "no reference lines are plotted"：图注描述的是图上画了什么。[全部]
- results:41 "missing estimates are omitted"：要么点名缺哪些，要么删。[全部]
- results:57 的 "tested"；disc:19 的 "the evaluated"。[G, D]
- supplement:25 "Claude Haiku 4.5 retained"：全文从没提过要不要保留它。[G, D, A]
- methods:80 "without additional calls"；methods:77 "before running this pathway"；两处 "prespecified"。[G, D]
- methods:80 gamma 0.7 替换灰度反转的经过、methods:87 letter readout 被否决的经过：只留在 Table S1。[全部]
- methods:94 "because option order was randomized separately for each item"：methods:18 已经说过。[G, D, A]
- methods:82 "these bounds guarded against reference cases from the same scan or patient"。[G]
- supplement:37 output-quality stop "was turned off for the gray-image conditions"：D 建议删，G 建议留在 S2 改写。我建议改写成一句中性的事实（"the 15% unparsed stop was not applied to gray-image conditions"）。

**挪**
- disc:21 "single sampling seed … single router at one time point"：挪到 Methods 当事实写，加上 API 调用日期，从 Limitations 里删掉。D 建议挪，G 建议留在 Limitations。按你"不主动暴露弱点"的偏好，我建议挪。
- methods:40 "Routing and token budgets were held constant" → 挪到 S2。[G]
- methods:75 报告"先写、后读"的时间顺序：S2 里只留一次。[G, D, H, A]
- methods:103–104 "Validation before full runs" 整节压成一句，指向 Table S1。[G, D, H]

**留**（必要的范围与方法陈述）
- disc:21 "closed questions from public data sets and included no human readers or clinical reporting"。
- methods:101 的统计方法声明。可以改成正面写法："Results are reported as estimates with 95% CIs."[D]
- results:32 去掉弃答之后的敏感性分析：它回应的是一个真实的替代解释。
- methods:82 去重防泄漏的理由（第一分句）。
- disc:17 "for the evaluated contrasts"：MedXpertQA-MM 确实没跑参考病例，这是必要的范围说明。更好的写法："…and on MedXpertQA-MM, where reference cases were not tested"。
- methods:40 "Where a model accepted the parameter"：保留，但点名不接受这些参数的模型是 GPT-5 mini。[G]

## 六、AI 腔与句式

- Discussion 9 段里有 8 段用 therefore / thus / consequently / Together 开头的收尾句复述本段内容 → 删掉这些收尾句。[H, D, A]
- "X alone does not Y" 式否定句反复出现（intro:5 S9；intro:7 ×2；disc:3；disc:13）→ 改成正面结论加数字，或者直接删。[H, D, A]
- 一些主题句只宣布"有差异"，不给方向（results:11、75、85、99、131）。[H, D, A]
- disc:17 S3 和 S5 是三连排比。[H]
- "connects / connected / directly connecting" 被当成因果动词用（disc:5、9、11）。[H, T, A]
- 修辞性或撞名的标题：
  - "What two readers share"
  - "Discussion among readers"：和 Discussion 一节撞名
  - "Run record"
  - [H, D]
- 模糊量词，有数字却没写数字：
  - much、important、frequently、few
  - "A large evaluation"：NMI 那项是 180 个配置
  - "part of the gray-image prompts"：实际是 4.3–14.8%
  - "at rates that depended on the setting"：Geijer 给的是 0.4–22%
  - [A, D, H]
- 超长句：intro:7 两句分别 41 词和 38 词；S5 一句 53 词。[A]
- 一段塞了几件事：methods:96 把 contrast、回归、讨论中的 φ、conformity 放在一段；disc:19 一段做了四件事。[D]

## 七、几份审稿之间的分歧，我的建议

1. Pilot 那句：G 建议删，D 建议留 → **删**。
2. 单种子和单路由：G 建议留在 Limitations，D 建议删或挪 → **挪到 Methods 当事实写**。
3. rendering 的替代词：D、H、G 建议 contrast enhancement，A 指出它和造影剂增强撞词 → **contrast adjustment**。
4. perception / interpretation 还是 perception / reasoning → 见 T-01。
5. gray 还是 blank：T 建议改成 blank（Zafar 的原词），其余几份没提 → **需你定**。
6. 图注里的重复：D 认为图注必须自足可以重复，H、A、G 建议模型说明只写一次 → **期刊版保留，CVPR 版只写一次**。
7. 题集名 S1–S5：G 建议改，T 认为可以留 → **改用数据集名**，因为和补充材料的章节号撞名。

## 八、对 CVPR 版的影响

- CVPR 是双盲评审，GitHub 链接必须匿名化（F-18）。
- 术语按 VLM 和多智能体文献来定：perception / reasoning（Prism）、query-agnostic、language prior、self-consistency、in-context examples、occlusion sensitivity，以及 NMI 的 multi-agent gain、Independent、Decentralized。
- CVPR 不需要 highlights，也不用结构化摘要。按 CVPR 的写法 Discussion 合进 "Discussion and limitations"，Results 每节自带分析，第四节里的大部分重复会自然消失。
- 我建议的 CVPR 结构如下，等你确认后再写：
  1. Introduction：3–4 条贡献 + teaser
  2. Related work：医疗多智能体协作；相关错误与集成；VLM 的语言先验与视觉依赖
  3. Reading panels and their arithmetic：φ、N_eff、beta-binomial、增益拆分；Fig. 2 用你画的设计图
  4. Setup
  5. Panels of one VLM（Fig. 3）
  6. Where shared errors come from：Fig. 4 语言先验、Fig. 5 区域、Fig. 6 perception vs reasoning
  7. What decorrelates readers（Fig. 7）
  8. Discussion rounds（Fig. 8）
  9. Limitations and conclusion

  补充材料放：分辨率分级、参考病例、开源模型、验证表。

## 九、请你优先拍板的事

1. T-01：seeing / judging 换成哪一对。
2. T-07：面板词汇整体换成 NMI 的说法，还是保留 reading panel。
3. T-06：generic panel 改成 self-consistency。
4. T-12：gray 改成 blank。
5. T-14：reference cases 改成 in-context examples。
6. 第五节：防御性内容的去留，尤其是单种子 / 单路由和 pilot 那句。

第一、二节的数字错误和过度论断不涉及取舍，你确认后可以直接改。
