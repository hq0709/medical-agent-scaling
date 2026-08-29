# 论文规划 — 医学版 NMI 复刻

**目标期刊**：npj Digital Medicine（首选）· NEJM AI · ML 备选 ML4H / NeurIPS D&B
**对标论文**：Kim et al., *Capable language models can outgrow the benefits of collaboration*,
Nature Machine Intelligence 8:1157–1172 (2026)（预印本 arXiv:2512.08296）

## 标题候选
1. *Does the AI consultation threshold hold in medicine? Scaling agent systems on
   expert-level clinical questions*
2. *When more AI doctors make things worse: coordination scaling laws in clinical LLM panels*
3. *The tool-free limit of agent scaling: multi-expert LLM consultation in medicine*

## 一句话定位
NMI 2026 在六个 **agentic（工具重）** benchmark 上建立了 agent 系统的标度律，并明确把医学
排除在外。我们在 **工具数 T = 0 的极限切面**上复刻同一设计——180 个配置、同样的五架构分类、
同样的协调指标与标度律——回答三个 NMI 无法回答的问题：**45% 能力阈值在医学上成立吗？去掉
工具开销后协调收益会显现吗？协作效应会随题目难度变号吗？**

## 章节结构（镜像 NMI）

| 节 | 内容 | 依赖 |
|---|---|---|
| 1 Introduction | 多智能体会诊是医学 LLM 最流行的设计模式；NMI 建立了通用域标度律但排除医学；工具重是其核心混淆——医学 MCQA 提供干净的 T=0 检验 | — |
| 2 Related work | 医学多智能体（MedAgents, MDAgents, MAC, TeamMedAgents）· 怀疑派（MedAgentBoard, npj DM 2026）· 标度理论（More Agents, Are More LLM Calls, **NMI 2026**）· 机制（Correlated Errors, Demystifying MAD）· 人类锚点（Kämmer 2017, Barnett 2019, Hautz 2024） | — |
| 3 Method | 3.1 五架构形式化（严格照搬 NMI 的 A/C/Ω 记号）· 3.2 三层能力阶梯（**横跨 45% 阈值**）· 3.3 三个 benchmark · 3.4 难度分层 · 3.5 协调指标定义 · 3.6 等预算对照 · 3.7 统计 | — |
| 4.1 主结果 | 180 配置的 accuracy × 架构 × N × tier | 网格 |
| 4.2 架构 | 性能 vs 成本前沿（NMI Fig：mean performance vs normalized cost，SEM 误差棒） | 网格 |
| 4.3 标度律 | 拟合 NMI 的 T=0 切面函数形式；报告 β、CV R²、留一域 CV | 网格 |
| 4.4 协调动力学 | 轮数幂律 · 消息密度对数饱和 · 错误吸收/放大 · MAST 错误分类 | 网格 |
| **4.5 难度分层（我们独有）** | 协作效应在难度上变号；NMI 只有 benchmark 级 D，没有 item 级难度 | 网格+难度标注 |
| **4.6 等预算自洽对照（我们独有）** | 医学多智能体文献无人做；panel 是否打得过同模型多采样 | 网格 |
| 5 Limitations | T=0 意味着结论不外推到工具型临床 agent；OpenAI 单厂商（异质臂降级为同厂不同家族）；MCQA≠真实诊疗 | — |
| 6 Conclusion | — | — |

## 图表清单

| 编号 | 内容 | 对应 NMI |
|---|---|---|
| Fig 1 | accuracy vs N，3 tier × 4 架构面板，Wilson CI 带 | NMI 主结果图 |
| Fig 2 | 性能 vs 归一化成本散点（SEM 误差棒），按架构/tier 着色 | NMI Architectures 图 |
| Fig 3 | **能力阈值检验**：x=单医生基线 P_SA，y=协作增益，叠加 NMI 的 45% 竖线 | NMI 能力天花板 |
| Fig 4 | 协调动力学：(a) 轮数幂律 (b) 消息密度饱和 (c) 错误放大热图 | NMI §4.4 |
| Fig 5 | **难度分层曲线**（我们独有，试点已见变号） | 无对应 |
| Tab 1 | 五架构形式化定义 | NMI Table |
| Tab 2 | 180 配置主表 | NMI Table 3 |
| Tab 3 | 标度律系数（与 NMI 的 β 并列对比） | NMI Table 3 |
| Tab 4 | 协调指标（与 NMI 的 17.2×/4.4×/22.7% 并列） | NMI Table 5 |

## 关键卖点（按强度排序）
1. **45% 阈值的医学检验** —— NMI 明确未做，我们的阶梯正好横跨
2. **T=0 极限切面** —— 剥离 NMI 的头号混淆（工具开销），协调收益是否显现
3. **难度变号** —— item 级分层，NMI 没有
4. **等预算自洽对照** —— 医学多智能体文献首次
