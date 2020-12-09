![Picture of art installation of networked cables](_static/images/header_small.jpg)

# Overview

These are course notes for *Deep learning for molecules and materials* taught by Andrew White at the University of Rochester,
first offered in Fall 2020. They aspirationally make a "book."

```{warning}
This book is continuously being revised. Found a mistake? [Go here](https://github.com/whitead/dmol-book/issues) or email me.
```

## Why Deep Learning

Deep learning is becoming a standard tool in chemistry and materials. Deep learning is specifically about connecting two types of data with a neural network function, which is differentiable and able to approximate any function. The classic example is connecting function and structure in molecules. A recent example is dramatically accelerating quantum calculations to the point that you can achieve DFT level accuracy with a rapid differentiable calculation. What makes deep learning especially relevant is that it's a powerful tool for approximating previously intractable functions **and** it's ability to generate new data.

In this work, we will view deep learning as a set of tools that allows us to create models that either were previously infeasible or incredibly difficult to construct. One example that sets deep learning apart from machine learning is in feature engineering. Much of the data-driven work in the past required decisions about what features are important and you needed to make sure they are captured correctly. These are called molecular descriptors. Deep learning is typically trained end-to-end, meaning decisions about which features are important are no longer relevant. Another change is the tools. Previously training and using models in machine learning was a tedious process and required deriving equations for each model change. Deep learning has removed this need and model changes can be done nearly effortlessly. Deep learning is not a new paradigm of science or a replacement for a chemist. It's a tool that is mature and now ready for application in molecules and materials.

## Progress Bar

Chapter Goal: 18

To come:

1. Application: VAE CG
2. Complex Training (Meta-learning, Active Learning)
3. Symbolic Regression
4. Equivariant networks as separate chapter
5. Application: Zeolites
6. Normalizing flow with AA

<div class="wh-wrapper">
    <div class="wh-progress-bar">
        <span class="wh-progress-bar-fill" style="width: 72%;"> 72% </span>
    </div>
</div>


## Table of Contents

```{tableofcontents}
```

## Citation

Please cite as

> White, Andrew D. *Deep Learning for Molecules and Materials*. 2020.

## Contributors

Thank you to contributions from students in my class:

1. Oion Akif
2. Heta Gandhi

## Image Credit

[@alinnnaaaa](https://unsplash.com/@alinnnaaaa)