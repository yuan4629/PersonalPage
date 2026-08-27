# Yuan Huang (黄远)

huangyuan4629@gmail.com
[Homepage](https://yuan4629.github.io/PersonalPage/) · [Google Scholar](https://scholar.google.com/citations?user=eN-CIw4AAAAJ&hl=en) · [GitHub](https://github.com/yuan4629)
Northeastern University, Shenyang, China

---

## Research Interests

Natural language processing, with a focus on **measurement validity** — whether the benchmarks and
automatic judges used to rank models measure what they claim to. One result recurs across my
projects: **surface competence ≠ underlying competence**. I want to measure that gap, explain it
mechanistically, and close it.

---

## Education

**Northeastern University, China** — B.Eng. in Computer Science and Technology · 2023 – 2027 (expected)

- CGPA **4.05 / 5.00** (90 / 100) · **Rank 5 / 100** in major cohort
- Advised by Shiqi Zhao (Assistant Professor, Northeastern University) since 2024

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

---

## Research Experience

### EditJudgeBias — counterfactual audit of multimodal image-editing judges
*Sole first author.* · 2026 – present · *In preparation; targeting ICLR 2027.*

- **Design.** Admit only perturbations that can be shown not to have changed edit quality:
  preservation verification is an admission gate, not a post-hoc check, and every cue carries a
  zero-dose sham control, so null results are readable.
- **Scale.** 13 cue conditions across four injection sites, 5 published judges plus an independent
  replication arm — **97,973 judgments**, 0.300% parse failure.
- **Findings.** Reordering the two candidates alone flips decisions at **38.2× the judge's
  self-noise**; of three mitigation layers only the protocol-level one works, and it works by
  **abstention, not debiasing**.
- **Rigor.** 1,307 unit tests and 109 sha256-stamped frozen artifacts; the audit overturned four of
  my own conclusions.

### WereBench / WereAlign — human-aligned evaluation of LLM social reasoning
*Co-first author; inception through submission.* · EMNLP 2026 Main

- Benchmark built from **100+ hours** of professional human social-deduction gameplay (**32.4M
  utterance tokens**, 30 roles, 15 rule variants), scored against **winning-side MVP trajectories**
  rather than LLM self-play; 5 verbal dimensions and 2 decision tasks.
- **Half of the evaluated models score below 0.50** (best 0.720). Deception reasoning and
  counterfactual trade-off are weakest while persuasive generation stays strong — **fluency ≠
  strategic correctness**.

### GeoComp / GeoCoT / GeoEval — geolocation from real human gameplay data
*Co-author (3 of 9).* · Preprint

- Dataset from a public geo-guessing platform — **740K users, 2.7M locations, 25M human response
  records** — with human accuracy calibrating item difficulty. Multi-step geographic reasoning
  improved standard metrics by up to **25%**; scoring the reasoning process rather than only the
  final answer added a further **9%**.

---

## Honors & Awards

- **China National Scholarship** — national level · 2023–2024
- Northeastern University Comprehensive Scholarship · 2024–2026
- **Third Prize, National Finals**, Lanqiao Cup Programming Competition · 2024

---

## Skills

- Python, C++, Java · PyTorch, Hugging Face Transformers · backend engineering intern, 2024 (Java / Spring Boot)
- IELTS Academic — taken 4 September 2026 (score to follow) · CET-6 534
