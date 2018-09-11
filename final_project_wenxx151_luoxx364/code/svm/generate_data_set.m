% compute the magnitude of the gradient, the eigenvalue of hessian at each
% pixel, and assemble them into a 3-dimensional array, which is the
% training data

function data_set = generate_data_set(I)

  % the magnitude of the gradient at each pixel
  [Gx,Gy] = imgradientxy(I);
  G_mag = (Gx.^2 + Gy.^2).^0.5;

  % hessian at each pixel
  [Gxx,Gxy1] = imgradientxy(Gx);
  [Gxy2,Gyy] = imgradientxy(Gy);
  Gxy = (Gxy1 + Gxy2)/2;
  % the eigenvalue of the hessian at each pixel
  lambda = ((Gxx-Gyy).^2 + (2*Gxy).^2).^0.5;
  lambda = (Gxx + Gyy + lambda)/2;

  % assemble I, G_mag, and lambda into a 2-dimensional array
  N_row = size(I,1);
  N_col = size(I,2);
  
  I_ = reshape(I',[N_row*N_col, 1]);
  G_mag_ = reshape(G_mag',[N_row*N_col, 1]);
  lambda_ = reshape(lambda',[N_row*N_col, 1]);
  
  % store normalzied data
  data_set(:,1) = I_ /max(I_);
  data_set(:,2) = G_mag_ /max(G_mag_);
  data_set(:,3) = lambda_ /max(lambda_);
  
end