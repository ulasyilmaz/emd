function test

% images
A = rand(400, 300);
B = rand(200, 200);
%B = zeros(200, 200);
%B = ones(200, 200);

% histograms
nbins = 10;
[ca ha] = imhist(A, nbins);
[cb hb] = imhist(B, nbins);

% features
f1 = ha;
f2 = hb;

% weights
w1 = ca / sum(ca);
w2 = cb / sum(cb);

% emd
[f, fval] = emd(f1, f2, w1, w2, @gdf);

% results
wtext = sprintf('fval = %f', fval);
figure('Name', wtext);
subplot(121);imshow(A);title('first image');
subplot(122);imshow(B);title('second image');

end