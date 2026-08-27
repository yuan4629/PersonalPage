# Yuan Huang (黄远)

huangyuan4629@gmail.com · +86 191 6050 6039
[Homepage](https://yuan4629.github.io/PersonalPage/) · [Google Scholar](https://scholar.google.com/citations?user=eN-CIw4AAAAJ&hl=en) · [GitHub](https://github.com/yuan4629)
Northeastern University, Shenyang, China

---

## Research Interests

Measurement validity in model evaluation — whether the benchmarks and automatic judges used to
rank models are measuring what they claim to. Concretely: counterfactual auditing of
(multimodal) LLM judges, benchmark design grounded in large-scale real human behavior rather
than model self-play, and social and strategic reasoning in LLM agents.

---

## Research Direction

One result recurs across my projects: **surface competence ≠ underlying cognitive competence**.
In geolocation, a correct answer is not a correct reasoning process; in social deduction,
persuasive language is not strategic correctness; in multimodal judging, a verdict that looks
right is not one that used the right evidence.

The question I want to work on: why can a language model be this fluent and this capable at the
surface, yet lack robust reasoning, strategy, and depth — what is missing between generating
language and thinking? At three levels:

1. **Measure the gap.** Evaluation grounded in real human behavior and cognitive process, built to
   separate surface success from the capacity it stands in for.
2. **Explain it.** Mechanistic accounts of what inside the model produces the failure.
3. **Close it.** Interventions that change the underlying process rather than the benchmark number.

Longer term: what computational process turns language generation into reasoning, conceptual
restructuring, and discovery — a science of machine thought, rather than a model that writes
more like someone who thinks.

**PromptChecker** *(early stage)* — instructions arrive one at a time and rarely specify the
problem on their own; a model that answers immediately is answering a question that was never
fully asked. Reconstruct what the user actually needs before responding, and treat "not yet
enough to act" as a first-class output.

---

## Education

**Northeastern University, China** — B.Eng. in Computer Science and Technology · 2023 – 2027 (expected)

- CGPA **4.05 / 5.00** (90 / 100) · **Rank 5 / 100** in major cohort
- Research advising: Shiqi Zhao, Brain-Computer Interface and Hardware Acceleration Lab, since 2024

---

## Publications

\* denotes equal contribution.

**[1] Beyond Survival: Evaluating LLMs in Social Deduction Games with Human-Aligned Strategies**
Zirui Song\*, **Yuan Huang**\*, Junchang Liu\*, et al.
*EMNLP 2026, Main Conference.* · arXiv:2510.11389 · **co-first author**
[Dataset](https://huggingface.co/datasets/n0nam4/WereBench)

**[2] Geolocation with Real Human Gameplay Data: A Large-Scale Dataset and Human-Like Reasoning Framework**
Zirui Song, Jingpu Yang, **Yuan Huang**, et al.
*Preprint.* · arXiv:2502.13759
[Dataset](https://huggingface.co/datasets/ShirohAO/tuxun) · [Code](https://github.com/yuan4629/Geocomp)

**[3] EditJudgeBias: A Preservation-Gated Counterfactual Audit of MLLM Judges for Instruction-Based Image Editing**
**Yuan Huang** — *sole first author*
*In preparation; targeting ICLR 2027.*

---

## Research Experience

### EditJudgeBias — counterfactual auditing of multimodal image-editing judges
*Sole first author. Conception, design, implementation, analysis, and writing.* · 2026 – present

Leaderboards for instruction-based image editing increasingly rank models with MLLM judges that
are not themselves audited. This project makes "how much of the score is edit quality" measurable.

- **Method.** A single invariant runs through the pipeline: admit only perturbations that can be
  shown not to have changed edit quality. Preservation verification is an **admission gate** every
  injector and metric must pass — not a post-hoc check — with coverage reported layer by layer, and
  each cue carries a **zero-dose sham control** establishing a per-judge, per-metric floor so that
  null results are readable. (Preservation checking itself is not novel; making it a gate, and
  pairing it with sham floors, is the departure.)
- **Scale.** 13 cue conditions across four injection sites — protocol, pixel, content, prompt —
  plus a null control; 5 published judges plus an independent replication arm carrying its own
  BH family; base images from 5 public sources through a text / sha1 / ORB near-duplicate gate
  into 3 disjoint content pools. **97,973 judgments**, 1:1 with raw responses, 0.300% parse
  failure. 11 cues carry human-annotation legs, three rounds, **κ = 0.8930** (read beside κ_max = 0.8930).
- **Findings.** Protocol-level reordering alone — nothing else touched — flips decisions at
  **38.2× the judge's self-noise**. Five pixel/content cues depress across 5/5 judges; bandwagon is
  the only consistent inflator. Most effects are order-preserving depressions. **Rubric scoring
  buys absolute-score stability but not rank stability.** Of three mitigation layers only the
  protocol-level one works, and its mechanism is **abstention, not debiasing**; ensemble median is
  worse than nothing. A 5/5 null on a skin-tone attribute is readable only because same-batch
  positive controls fired — testing specificity alone would certify a never-alarming judge as
  best-calibrated (revocation sensitivity 0.032 vs 0.946 on identical data).
- **Verification.** 1,307 unit tests; 109 frozen artifacts each with sha256, producer, and an
  explicit "must not be read as" field; a single reconstruction path with byte-level comparison
  after full rebuild; a self-certifying delivery package (1,289 tests pass in-package, 112
  rebuilt analysis tables byte-identical). The audit overturned four of my own conclusions,
  including a correction of one claim from 13/40 significant cells to 2/40 after adding clustering.

### WereBench / WereAlign — human-aligned evaluation of LLM social reasoning
*Co-first author; from project inception through submission.* · EMNLP 2026 Main

- Built a benchmark from **100+ hours** of professionally produced human social-deduction gameplay
  (**32.4M utterance tokens**, 30 roles, 15 rule variants, multimodal), using **winning-side MVP
  strategy trajectories as ground truth** rather than LLM self-play.
- Designed a 5-dimension verbal evaluation and 2 decision tasks; contributed to research design,
  experiments, evaluation, and iterative refinement.
- **Half of the evaluated models score below 0.50**; the best reaches **0.720**. Weakest dimensions
  are **deception reasoning** and **counterfactual trade-off** while persuasive generation stays
  strong — **fluency ≠ strategic correctness**.
- Two controlled interventions separated distinct failure paths, showing models can mistake another
  speaker's persuasive utterance for an instruction.

### GeoComp / GeoCoT / GeoEval — geolocation from real human gameplay data
*Co-author (3 of 9).* · Preprint

- Contributed to a dataset from a public geo-guessing platform: **740K users, 2.7M locations,
  25M human response records**, with human accuracy calibrating item difficulty.
- Multi-step geographic reasoning improved standard metrics by up to **25%**; scoring the
  **reasoning process** rather than only the final answer added a further **9%**.

---

## Honors & Awards

- **China National Scholarship** — national level · 2023–2024
- Northeastern University Comprehensive Scholarship · 2024–2026
- **Third Prize, National Finals**, Lanqiao Cup Programming Competition · 2024

---

## Skills

- **Languages:** Python, C++, Java
- **ML / research:** PyTorch, Hugging Face Transformers
  <!-- ADD IF TRUE: vLLM, LLaMA-Factory, VeRL, DeepSpeed, TransformerLens.
       Only list what you can discuss in an interview. -->
- **English:** IELTS Academic — taken 4 September 2026 (score to follow); CET-6 534

---

## Also

- Backend engineering intern, 2024 — Java / Spring Boot.
