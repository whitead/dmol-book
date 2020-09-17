# Intro to Deep Learning


**Deep learning** is a category of **machine learning**. Machine learning is a category of **artificial intelligence**. These notes are mostly about deep learning, thus the name of the book. Deep learning is the use of neural networks to classify and regress data. I am a chemical engineering professor though; writing an introduction to deep learning is a hopeless task for me. I found the introduction the from [Ian Goodfellow's book](https://www.deeplearningbook.org/contents/intro.html) to be a good intro. If you're more visually oriented, Grant Sanderson has made a [short video series](https://www.youtube.com/watch?v=aircAruvnKk) specifically about neural networks that give an applied introduction to the topic. DeepMind has a high-level video showing what can be accomplished with [deep learning & AI](https://www.youtube.com/watch?v=7R52wiUgxZI). When people write "deep learning is really cool" in their research papers, they typically cite [this Nature paper](https://www.nature.com/articles/nature14539) by Yann LeCun, Yoshua Bengio, and Geoffery Hinton. Zhang, Lipton, Li, and Smola have written a practical and example-driven [online book](http://d2l.ai/index.html) that gives each example in Tensorflow, PyTorch, and MXNet.

The main advice I would give to beginners in deep learning are to focus less on the neurological inspired language (i.e., connections between neurons), and instead view deep learning as a series of linear algebra operations where many of the matrices are filled with adjustable parameters. There are of course a few non-linear functions (activations) here and there, but deep learning is essentially linear algebra operations specified via a graph (network kind) that vaguely looks like neurons in a brain.


## Neural Networks

The *deep* in deep learning means we have many layers in our neural networks. What is a neural network? Without loss of generality, we can view neural networks as 2 components: (1) a non-linear function $g(\cdot)$ which operates on our input features $\mathbf{X}$ and output a new set of features $\mathbf{H} = g(\mathbf{X})$ and (2) a linear model like we saw in our Machine Learning chapter. Our model equation for deep learning regression is:

\begin{equation}
    y = \vec{w}g(\vec{x}) + b
\end{equation}

One of the main discussion points in our ML chapters was how arcane and difficult it is to choose features. Here, we have replaced our features with a set of trainable features $g(\vec{x})$ and then use the same linear model as before. So how do we design $g(\vec{x})$? That is the deep learning part. $g(\vec{x})$ is a differentiable function we design composed of **layers**, which are themselves differentiable functions each with trainable weights (variables). Deep learning is a mature field and there is a set of standard layers, each with a different purpose. For example, convolution layers look at a fixed neighborhood around each element of an input tensor. Dropout layers randomly inactivate inputs as a form of regularization. The most commonly used and basic layer is the **dense** or **fully-connected** layer.

```{margin}
Dense means each input element affects each output element. At one point, sparse layers were popular and had a nice analogy with how a brain is connected. However, dense layers do not require deciding which input/output connections to make and sparse layers are very rare now (except incidentally sparse layers, like convolutions).
```

A dense layer is defined by two things: the desired output feature shape and the **activation**. The equation is:

\begin{equation}
     \vec{h} = \sigma(\mathbf{W}\vec{x} + \vec{b})
\end{equation}

where $\mathbf{W}$ is a trainable $D \times F$ matrix, where $D$ is the input vector ($\vec{x}$) dimension and $F$ is the output vector ($\vec{h}$) dimension, $\vec{b}$ is a trainable $F$ dimensional vector, and $\sigma(\cdot)$ is the activation function. $F$ is an example of a **hyperparameter**, it is not trainable but is a problem dependent choice. $\sigma(\cdot)$ is another hyperparameter. In principle, any differentiable function that has a range of $(-\infty, \infty)$ can be used for activation. However, just a few activations have been empirically designed that balance computational cost and effectiveness. One example we've seen before is the sigmoid. Another is a hyperbolic tangent, which behaves similar (domain/range) to the sigmoid.


## Frameworks


Deep learning has lots of "gotchas" -- easy to make mistakes that make it difficult to implement things yourself. This is especially true with numerical stability, which only reveals itself when your models fails to learn. We will move to a bit of a more abstract software framework than JAX. I may update this, but for now we'll use [Keras](https://keras.io/).

## Discussion

When it comes to introducing deep learning, I will be as terse as possible. There are good learning resources out there. You should use some of the reading above and tutorials put out by Keras (or PyTorch) to get familiar with the concepts.

