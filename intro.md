![Overhead view of a waves on a beach](_static/images/header_small.jpg)


# Deep Learning for Molecules and Materials

These are course notes for *Deep learning for molecules and materials* taught by Andrew White at the University of Rochester,
first offered in Fall 2020. They aspirationally make a "book."

```{danger}
This book is being written and revised currently. It is incomplete and probably has lots of errors. Have a suggestion? [Go here](https://github.com/whitead/dmol-book/issues) or email me.
```

## Why Deep Learning

Before deep learning, machine learning was popular. Prior to machine learning's popularity, data science was proclaimed the fourth pillar of science. The materials genome project was going to revolutionize materials like informatics did to biology. In the 90s, quantitative structure-activity relationship modeling was revolutionizing drug discovery. Before that, we had the expert systems that could replace a chemist. Artificial neural networks were popular in the late 80s and people were able to predict melting points just from molecular structure. Many of these areas are important and research is ongoing, but I think expectations have been reassessed for most of them.

Each of these ares was an important step but the real work that leads to new molecules and materials is almost always rational design in the laboratory. The best modeling work uses computers, but until recently they were rarely data driven. Even if they were (e. g., Lennard-Jones parameters in force fields), it was rarely discussed. I believe that has changed and deep learning is going to be a standard tool in chemistry and materials. Deep learning is specifically about connecting two types of data with a neural network function, which is smooth and differentiable. The classic example is connecting function and structure in molecules. A new example is dramatically accelerating quantum calculations to the point that you can achieve DFT level accuracy with a rapid differentiable calculation. What makes deep learning especially relevant is that it's a powerful tool for approximating previously intractable functions **and** it's ability to generate new data.

In this work, we will view deep learning as a set of tools that allows us to create models that either were previously infeasible or incredibly difficult to create. One example that sets deep learning apart from machine learning is in feature engineering. Much of the data-driven work in the past required decisions about what features are important and you needed to make sure they are captured correctly. Deep learning is typically trained end-to-end, meaning decisions about which features are important are no longer relevant. Another change is the tools. Previously training and using models in machine learning was a tedious process and required deriving equations for each model change. Deep learning has removed this need and model changes can be done nearly effortlessly. Deep learning is not a new paradigm of science or a replacement for a chemist. It's a tool that is mature and now ready for application in molecules and materials.

## Progress Bar

Chapter Goal: 20

<div class="wh-wrapper">
    <div class="wh-progress-bar">
        <span class="wh-progress-bar-fill" style="width: 15%;"> 15% </span>
    </div>
</div>


## Table of Contents

```{tableofcontents}
```

## Citation

Please cite as

> White, Andrew D. *Deep Learning for Molecules and Materials*. 2020.

## Image Credit

[@alinnnaaaa](https://unsplash.com/@alinnnaaaa)