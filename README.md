# Earth Mover's Distance

This implementation is based on [The Earth Mover's Distance  as a Metric for Image Retrieval](https://www.researchgate.net/publication/220659330_The_Earth_Mover's_Distance_as_a_Metric_for_Image_Retrieval), Y. Rubner, C. Tomasi and L. Guibas, International Journal of Computer Vision, 40(2), pp. 99-121, 2000.

## Usage

````shell
emd ---> computes the earth mover's distance between two signatures
gmd ---> computes the ground distance matrix between two signatures
gdf ---> computes the ground distance between two feature vectors
test --> is an auxiliary module to show how the above functions work
````

## Earth Mover's Distance (EMD) between two signatures
`[X, FVAL] = EMD(F1, F2, W1, W2, FUNC)` is the Earth Mover's Distance between two signatures `S1 = {F1, W1}` and `S2 = {F2, W2}`.

`F1` and `F2` consist of feature vectors which describe `S1` and `S2`, respectively.
Weights of these features are stored in `W1` and `W2`.
`FUNC` is a function that computes the ground distance between two feature vectors.

### Example
````shell
f1 = [[100, 40, 22]; [211, 20, 2]; [32, 190, 150]; [2, 100, 100]];
f2 = [[0, 0, 0]; [50, 100, 80]; [255, 255, 255]];
w1 = [0.4; 0.3; 0.2; 0.1];
w2 = [0.5; 0.3; 0.2];

[x fval] = emd(f1, f2, w1, w2, @gdf);
````

**EMD** is formalized as linear programming problem in which the flow that
minimizes an overall cost function subject to a set of constraints is
computed. This implementation is based on "The Earth Mover's Distance
as a Metric for Image Retrieval", Y. Rubner, C. Tomasi and L. Guibas,
International Journal of Computer Vision, 40(2), pp. 99-121, 2000.

The outcome of **EMD** is the flow (`X`) which minimizes the cost function
and the value (`FVAL`) of the flow.

## Ground distance between (GDF) two vectors
`[E] = GDF(F1, F2)` is the ground distance between two feature vectors.

### Example
````shell
v1 = [100, 40, 22];
v2 = [50, 100, 80];

[e] = gdf(v1, v2);
````

## Ground distance matrix (GDM) between two signatures
`[F] = GDM(F1, F2, FUNC)` is the ground distance matrix between
two signatures whose feature vectors are given in `F1` and `F2`.

`FUNC` is a function which computes the ground distance between two feature vectors.

### Example
````shell
f1 = [[100, 40, 22]; [211, 20, 2]; [32, 190, 150]; [2, 100, 100]];
f2 = [[0, 0, 0]; [50, 100, 80]; [255, 255, 255]];

[f] = gdm(f1, f2, @gmf);
````

## License
Copyright (c) 2021, Ulaş Yılmaz

This program is free software: You are welcome to copy, redistribute or modify it under the terms of [GNU General Public License](LICENSE).

Please note that this program is not designed for commercial usage or for critical systems.
It comes without any warranty, merchantability or usage for a particular purpose.
