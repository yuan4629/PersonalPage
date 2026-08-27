# Yuan Huang (黄远)

huangyuan4629@gmail.com · +86 191 6050 6039
[Homepage](https://yuan4629.github.io/PersonalPage/) · [Google Scholar](https://scholar.google.com/citations?user=eN-CIw4AAAAJ&hl=en) · [GitHub](https://github.com/yuan4629)
Northeastern University, Shenyang, China

---

## Research Interests

Trustworthy and human-centered evaluation of large (multimodal) language models. Specifically:
benchmark design grounded in large-scale real human behavior rather than model self-play;
reliability and bias of LLM-as-a-judge; **mechanistic accounts of why a model's judgment fails**;
and social and strategic reasoning in LLM agents.

---

## Education

**Northeastern University, China** — B.Eng. in Computer Science and Technology · 2023 – 2027 (expected)

- CGPA **4.05 / 5.00** (90 / 100) · **Rank 5 / 100** in major cohort
- Expected graduation: mid-2027

---

## Publications

\* denotes equal contribution.

**[1] Beyond Survival: Evaluating LLMs in Social Deduction Games with Human-Aligned Strategies**
Zirui Song\*, **Yuan Huang**\*, Junchang Liu\*, et al.
*EMNLP 2026, Main Conference.* · arXiv:2510.11389 · **co-first author**

**[2] Geolocation with Real Human Gameplay Data: A Large-Scale Dataset and Human-Like Reasoning Framework**
Zirui Song, Jingpu Yang, **Yuan Huang**, et al.
*Preprint.* · arXiv:2502.13759

**[3] Inside the Unfair Judge: A Mechanistic Interpretability Account of MLLM-as-Judge Bias**
**Yuan Huang** — *sole first author*
*In preparation; targeting ICLR 2027 (abstract deadline 18 Sep 2026).*

---

## Research Experience

### Mechanistic Interpretability of MLLM-as-Judge Bias — independent first-author project
*Sole first author. Conception, experimental design, implementation, analysis, and writing.* · 2026 – present

- Showed that multimodal LLM judges are steered by **non-visual** factors while the image stays
  **pixel-identical**: attaching a caption line lowers the score; inserting a social cue
  ("most reviewers preferred it") into the prompt raises it.
- Gave a **mechanistic account of how the bias forms inside the model**, rather than reporting the
  behavioral effect alone.
- Evaluated **three widely used debiasing strategies**; **none** restored the correct judgment.

### WereBench / WereAlign — human-aligned evaluation of LLM social reasoning
*Co-first author; involved from project inception through submission.* · EMNLP 2026 Main

- Built a benchmark from **100+ hours** of professionally produced human social-deduction gameplay
  (**32.4M utterance tokens**, 30 roles, 15 rule variants, multimodal), using **winning-side MVP
  strategy trajectories as ground truth** — in contrast to prior LLM self-play data.
- Designed a 5-dimension verbal evaluation and 2 decision tasks; contributed to research design,
  experiments, evaluation, and iterative refinement throughout.
- **Half of the evaluated SOTA models score below 0.50**; the best reaches only **0.720**. Weakest
  dimensions are **deception reasoning** and **counterfactual trade-off**, while persuasive
  generation stays strong — i.e. **fluency ≠ strategic correctness**.
- Two controlled interventions separated distinct failure paths, showing that models can mistake
  another speaker's persuasive utterance for an instruction.

### GeoComp / GeoCoT / GeoEval — geolocation from real human gameplay data
*Co-author (3 of 9).* · Preprint

- Contributed to a dataset from a public geo-guessing platform: **740K users, 2.7M locations,
  25M human response records**, with human accuracy used to calibrate item difficulty.
- Multi-step geographic reasoning improved standard geolocation metrics by up to **25%**;
  scoring the **reasoning process** rather than only the final answer added a further **9%**.

---

## Honors & Awards

- **China National Scholarship** — national level, top ~1% nationally · 2023–2024
- Northeastern University Comprehensive Scholarship · 2023–2026
- **Third Prize, National Finals**, Lanqiao Cup Programming Competition · 2024

---

## Skills

- **Languages:** C++, Python, Java
- **ML / research:** PyTorch, Hugging Face Transformers
  <!-- ADD IF TRUE: LLaMA-Factory, VeRL / verl, DeepSpeed, vLLM, TransformerLens, nnsight,
       baukit — anything you have actually used for training or interpretability.
       Your competitor lists training infra explicitly; it signals you can run experiments
       without hand-holding. Do not list anything you can't discuss. -->

---

## Also

- Backend engineering intern, 2024 — Java / Spring Boot.
