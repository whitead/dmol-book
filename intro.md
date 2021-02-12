![Picture of art installation of networked cables](_static/images/header_small.jpg)

# Overview

Deep learning is becoming a standard tool in chemistry and materials. Deep learning is specifically about connecting two types of data with a neural network function, which is differentiable and able to approximate any function. The classic example is connecting function and structure in molecules. A recent example is dramatically accelerating quantum calculations to the point that you can achieve DFT level accuracy with a rapid differentiable calculation. What makes deep learning especially relevant is that it's a powerful tool for approximating previously intractable functions **and** it's ability to generate new data.

```{warning}
This book is continuously being revised. Found a mistake? [Go here](https://github.com/whitead/dmol-book/issues) or email me.
```

In this work, we will view deep learning as a set of tools that allows us to create models that either were previously infeasible or incredibly difficult to construct. One example that sets deep learning apart from machine learning is in feature engineering. Much of the data-driven work in the past required decisions about what features are important and you needed to make sure they are captured correctly. These are called molecular descriptors. Deep learning is typically trained end-to-end, meaning decisions about which features are important are no longer relevant. Another change is the tools. Previously training and using models in machine learning was a tedious process and required deriving equations for each model change. Deep learning has removed this need and model changes can be done nearly effortlessly. Deep learning is not a new paradigm of science or a replacement for a chemist. It's a tool that is mature and now ready for application in molecules and materials.

## Language Choice

Deep learning is always a little tied-up in the implementation details. Thus, language choice can be a part of the learning process. In this book, we use `Jax`, `Tensorflow`, `Keras`, and `scikit-learn` for different purposes. `Jax` is quite easy to learn with because it's essentially `numpy` with automatic differentation and GPU/TPU-acceleration. In this book, I use `Jax` when it's important to understand the implementation details and connect the equations to the code. `Keras` is a high-level language that has many common deep learning features implemented. It is used when we would like to work with more complex models and I'm trying to show a more complete model. Of course, you can use `Jax` for complete models and show new implementations in `Keras`. This is just my reasoning for the choice of language. `scikit-learn` is an ML package and thus we'll see in the early chapters on ML. Finally, `Tensorflow` is the underlying language of `Keras` so if we want to implement new layers in `Keras` we do it through `Tensorflow`. `TensorflowProbability` is an extension to `Tensorflow` that supports random variables and probability distributions used in our generative models. The most important language left out of this book is `PyTorch`, which has recently taken the lead to be the most popular language in deep learning research (not necessarily industry). Ultimately, this book presents the equations and implementation details so that you should learn concepts that are independent on the language and you should be able to quickly pick-up `PyTorch` or develop more competence in `Keras` quickly.

One of the most common mistakes I see of students is that they try to learn deep learning via web searching questions and reading documentation. *This is a terrible way to learn deep learning.* There is quite a bit of information out there, but you will end-up with a distorted and language-specific understanding of deep learning. Remember, a high ranking search result may be relevant and popular, but that doesn't mean it will help you learn. More importantly, learning deep learning through blogs and Stackoverflow makes it so hard to grasp the mathematics and intuition. Web searching and hacking together code is definitely a part of deep learning (for better or worse), but you should do this once you have a firm grasp of the math and details of the model you want to implement.

## Table of Contents

```{tableofcontents}
```

## Progress Bar

Chapter Goal: 18

To come:

1. Complex Training (Meta-learning, Active Learning)
2. NLP representations (DeepSMILES, VAE on Smiles, SELFIES)
3. Equivariant networks -- complete harmonic analysis section
4. Application: Zeolites
5. XAI

<div class="wh-wrapper">
    <div class="wh-progress-bar">
        <span class="wh-progress-bar-fill" style="width: 80%;"> 80% </span>
    </div>
</div>

## Citation

Please cite as

> White, Andrew D. *Deep Learning for Molecules and Materials*. 2021.

## Contributors

Thank you to Contributors (students in my class):

1. Oion Akif
2. Heta Gandhi
3. Mattias Hartveit

## Image Credit

[@alinnnaaaa](https://unsplash.com/@alinnnaaaa)
