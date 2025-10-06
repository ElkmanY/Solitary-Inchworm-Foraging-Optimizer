# Solitary Inchworm Foraging Optimizer

**[SIFO](https://github.com/ElkmanY/Solitary-Inchworm-Foraging-Optimizer)** | **[A memory-saving metaheuristic algorithm for onboard optimization: Solitary Inchworm Foraging Optimizer](https://doi.org/10.1016/j.apm.2025.116423)** | **[ResearchGate](https://www.researchgate.net/publication/395423663)**

<!--![Python Version](https://img.shields.io/badge/Python-3.8%2B-blue) -->
![Matlab Version](https://img.shields.io/badge/Matlab-2020%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)

![Optimization](https://img.shields.io/badge/Metaheuristic-Memory%20Efficient-orange)
![Research](https://img.shields.io/badge/Type-Research%20Implementation-yellow)
<!--![Framework](https://img.shields.io/badge/PyTorch-1.9%2B-orange) <!-- 可选，显示框架 -->

> **A memory-saving metaheuristic algorithm designed for onboard optimization problems under severe memory constraints, inspired by inchworm foraging behavior.**

## 📖 Introduction

**Solitary Inchworm Foraging Optimizer (SIFO)** is a novel metaheuristic algorithm that addresses the critical challenge of memory limitations in onboard optimization scenarios, such as embedded systems, IoT devices, and autonomous systems.

### 🎯 Problem Focus
Traditional population-based optimization algorithms often require substantial memory resources, making them unsuitable for memory-constrained environments. SIFO solves this through its innovative single-agent design.

### 🔬 Key Innovations

- **🪱 Single-Agent Search Mechanism**: Mathematically models inchworm foraging behavior using a unique solitary search strategy
- **⚡ Parallel Communication Strategy**: Enables efficient information exchange while maintaining computational efficiency  
- **💾 Memory-Efficient Design**: Dramatically reduces memory footprint compared to population-based algorithms
- **🎯 Onboard Optimization Ready**: Specifically designed for memory-constrained embedded systems

### 📊 Validated Performance

- **Theoretical Foundation**: Complete computational complexity analysis and global convergence proof
- **Benchmark Superiority**: Outperforms 8 state-of-the-art metaheuristic algorithms across three benchmark test suites
- **Real-World Efficacy**: Hardware-in-the-loop simulations show better solution quality with less computation time vs. 5 baseline algorithms


## 📁 Project Structure
```tex
Solitary-Inchworm-Foraging-Optimizer/
├── SIFO.m                  # Main SIFO algorithm implementation
├── runtest.m               # Main test script for running benchmarks
├── input_data/             # CEC benchmark function data
├── input_data17/           # CEC 2017 benchmark function data  
├── input_data22/           # CEC 2022 benchmark function data
├── cec14_func.cpp          # CEC 2014 benchmark functions (C++ source)
├── cec14_func.mexw64       # CEC 2014 compiled MEX function (Windows)
├── cec17_func.cpp          # CEC 2017 benchmark functions (C++ source)
├── cec17_func.mexw64       # CEC 2017 compiled MEX function (Windows)
├── cec22_func.cpp          # CEC 2022 benchmark functions (C++ source)
├── cec22_func.mexw64       # CEC 2022 compiled MEX function (Windows)
├── LICENSE                 # MIT License file
├── .gitignore              # Git ignore rules
└── README.md               # This documentation file
```

## 🔬 Citation
If you use SIFO in your research, please cite our paper:

```bibtex
@article{YU2026116423,
title = {A memory-saving metaheuristic algorithm for onboard optimization: Solitary Inchworm Foraging Optimizer},
journal = {Applied Mathematical Modelling},
volume = {151},
pages = {116423},
year = {2026},
issn = {0307-904X},
doi = {https://doi.org/10.1016/j.apm.2025.116423},
url = {https://www.sciencedirect.com/science/article/pii/S0307904X25004974},
author = {Zhihao Yu and Jialu Du and Guangqiang Li},
}
```