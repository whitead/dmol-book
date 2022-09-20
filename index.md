---
html_meta:
  "description lang=en": "Deep Learning for Molecules & Materials Book"
  "property=og:locale": "en_US"
  "twitter:card": "summary"
  "twitter:description": "Deep Learning for Molecules & Materials Book"
  "twitter:title": "dmol.pub 📖"
  "twitter:image": "https://dmol.pub/_static/robot-chem.png"
  "twitter:site": "@andrewwhite01"
---
![Picture of art installation of networked cables](_static/images/header.png)

# Overview

Deep learning is becoming a standard tool in chemistry and materials science. Deep learning is specifically about connecting some input data (features) and output data (labels) with a neural network function. Neural networks are differentiable and able to approximate any function. The classic example is connecting a molecule's structure and function. A recent [example](https://doi.org/10.1039/C6SC05720A) is dramatically accelerating quantum calculations to the point that you can achieve DFT level accuracy with a neural network. What makes deep learning especially relevant is that it's a powerful tool for approximating previously intractable functions **and** its ability to generate new data.

In this book, we will view deep learning as a set of tools that allows us to create models that were previously infeasible with classical machine learning. What sets deep learning apart from classic machine learning is feature engineering. Much of the data-driven work in the past required decisions about what features are important and how to compute them from molecules. These are called descriptors. Deep learning is typically trained end-to-end, meaning decisions about which features are important are no longer relevant and we can work directly with molecular structures.

Another reason deep learning is a standard method is its mature tools. Previously, training and using models in machine learning was tedious because it required deriving and implementing new equations for each model. Deep learning has removed this need and model changes can be done nearly effortlessly. Deep learning is not a new paradigm of science or a replacement for a chemist. It's a tool that is mature and now ready for application in molecules and materials.

## Target Audience

The target audience of this book is students with a programming and chemistry background that are interested in building competency in deep learning. For example, PhD students or advanced undergraduates in chemistry or materials science with some Python programming skills will benefit from this book. Sections A and B provide a pedagogical introduction to the principles of machine learning, but only covering topics necessary for deep learning. For example, topics like decision trees and SVMs are not covered because they are not critical to understanding deep learning. Section C covers deep learning principles and details on specific architectures, like the important {doc}`dl/gnn` and {doc}`dl/VAE`. Other chapters, like {doc}`dl/NLP`, give a survey-level overview of a much larger area targeted towards chemistry and materials science. Finally Section D gives more complex examples on authentic deep learning problems from chemistry and materials science. Each section states at the top the required background knowledge, but Python programming ability is assumed throughout. You can find a chemistry-specific introduction to Python at the Molecular Sciences Software Institute [resources page](http://education.molssi.org/resources.html#programming).

## Framework Choice

Deep learning is always a little tied up in the implementation details -- it's hard to grasp without seeing code. Thus, framework choice can be a part of the learning process. This book assumes familiarity with Python and `numpy` and we use exclusively Python. For the deep learning framework, we use `Jax`, `Tensorflow`, `Keras`, and `scikit-learn` for different purposes. `Jax` is easy to learn because it's essentially `numpy` with automatic differentiation and GPU/TPU-acceleration. In this book, we use `Jax` when it's important to understand the implementation details and connect the equations to the code. `Keras` is a high-level framework that has many common deep learning features implemented. It is used when we would like to work with more complex models and I'm trying to show a more complete model. Of course, you can use `Jax` for complete models and show detailed implementations in `Keras`. This is just my reasoning for the choice of framework. `scikit-learn` is an ML package and thus we'll see in the early chapters on ML. Finally, `Tensorflow` is the underlying library of `Keras` so if we want to implement new layers in `Keras` we do it through `Tensorflow`. `TensorflowProbability` is an extension to `Tensorflow` that supports random variables and probability distributions used in our generative models. The most important framework left out of this book is `PyTorch`, which has recently taken the lead to be the most popular framework in deep learning research (not necessarily industry). Ultimately, this book presents the equations and implementation details so that you will learn concepts that are independent of the framework. You should thus be able to quickly pick up `PyTorch`, MXNet, or whatever the next new framework might be.

One of the most common mistakes I see from students is that they try to learn deep learning via web searching questions and reading documentation. *This is a terrible way to learn deep learning.* There is quite a bit of information out there, but you will end up with a distorted and framework-specific understanding of deep learning. Remember, a high-ranking search result may be relevant and popular, but that doesn't mean it will help you learn. More importantly, learning deep learning through blogs and Stack overflow makes it so hard to grasp the mathematics and intuition. Web searching and hacking together code is definitely a part of deep learning (for better or worse), but you should do this once you have a firm grasp of the math and details of the model you want to implement.

## Interactivity

On each chapter, you'll see the &nbsp;<i aria-label="Launch interactive content" class="fas fa-rocket"></i>&nbsp; button on the top. This launches the chapter as an interactive Google Colab. Each chapter also includes notes on the packages that may need to be installed. If you have problems with install, the complete current list of packages for the textbook is available [here](https://github.com/whitead/dmol-book/blob/master/package/setup.py#L14).

When using interactivity, many of the chapter will benefit from using a graphics processing unit (GPU). GPUs are what makes deep learning fast enough to be practical on large dataset. This is possible in Google Colab, but may require additional steps if running this locally. Check the documentation of the package you're using (e.g., `Jax`, `PyTorch`, `Tensorflow`) to find out how to use a GPU locally. I have carefully constructed the examples to be small enough though to run on a normal CPU in a laptop though, so the GPU is optional.


## Example models

Here are the major models we will construct learn to implement in this book: *Sorry, but I'm unable to link directly to the examples, so you'll need to scroll to them.*

1. We explore predicting solubility of molecules with {doc}`graph convolutional neural networks<dl/gnn>`, {doc}`recurrent neural networks<dl/NLP>`, {doc}`dense neural networks<dl/xai>`, and {doc}`kernel learning<ml/kernel>`.
2. We implement a SchNet model to {doc}`predict what space group a structure belongs to<dl/gnn>`.
3. We implement a Recurrent Neural Network to {doc}`predict the solubility of proteins/peptides<dl/layers>` and {doc}`predict if a peptide will lyse red blood cells<dl/xai>`.
4. We predict the DFT single-point energy of molecules {doc}`with a graph convolutional neural network<applied/QM9>`.
5. We propose new molecules with a generative {doc}`recurrent neural network<applied/MolGenerator>`.
6. We learn to align and embed polymer trajectories with {doc}`variational autoencoders<dl/VAE>` and {doc}`equivariant data representations<dl/data>`.
7. We classify if molecules are likely to be toxic with {doc}`logistic regression<ml/classification>`.

and there are many smaller examples throughout the book.

## Table of Contents

```{tableofcontents}
```

## Contributors

Thank you to contributors for offering suggestions, identifying errors, and helping improve this book! Twitter handles, if available

### Contributed Chapter

1. Mehrad Ansari (@MehradAnsari)

### Contributed Content to Chapter

1. Geemi Wellawatte (@GWellawatte)

### Substantial Feedback on Content

1. Lily Wang (@lilyminium)
2. Marc Finzi (@m_finzi)
3. Kevin Jablonka (@kmjablonka)
4. Elana Simon
5. Cathrine Bergh (@cathrinebergh)
6. Sam Cox (@SamCox822)

### Code Fixes, Math Fixes, Language Fixes

1. Oion Akif
2. Heta Gandhi (@gandhi_heta)
3. Mattias Hartveit
4. Andreas Krämer
5. Mehrad Ansari (@MehradAnsari)
6. Ritsuya Niwayama
7. Varsha Jain
8. Simon Duerr
9. Julia Westermayr (@JWestermayr)
10. Ernest Awoonor-Williams
11. Joshua Schrier (@joshuaschrier)
12. Marin Bukov
13. Arun Pa Thiagarajan (@arunppsg)
14. Ankur Parmar
15. Erik Thiede (@erik_der_elch)
16. Killian Sheriff(@KillianSheriff)
17. Parsa Pourghasem
18. Zonglun Li
19. Santanu Poddar


## Citation

Please cite the [livecommsj overview article](https://doi.org/10.33011/livecoms.3.1.1499):

```bibtex
@article{white2021deep,
  title={Deep Learning for Molecules and Materials},
  journal={Living Journal of Computational Molecular Science},
  author={White, Andrew D},
  url={https://dmol.pub},
  year={2021},
  volume={3},
  number={1},
  pages={1499},
  doi={10.33011/livecoms.3.1.1499}
}
```

## Funding Support

Research reported in this work was supported by the National Institute of General Medical Sciences of the National Institutes of Health under award number R35GM137966. This material is based upon work supported by the National Science Foundation under Grant No. 1764415.

## License (CC BY-NC 3.0)

Creative Commons Legal Code

Attribution-NonCommercial 3.0 Unported

See complete description of license at [https://creativecommons.org/licenses/by-nc/3.0/](https://creativecommons.org/licenses/by-nc/3.0/) or at repo [https://github.com/whitead/dmol-book](https://github.com/whitead/dmol-book)
