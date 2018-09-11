% get the discretized labels based on the grey scale of the hand drawn
% image. We have 11 classes altogether, and the class label is the grey
% scale value. 

function label = generate_label(I, num_lab)

  % normalize data 
  I = I/max(max(I));
  % determine label 
  for i = 1:size(I,1)
    for j = 1:size(I,2)
      % assume label(i,j) = 1, if it is not, it will be modified below
      for k = 1:num_lab
        if k == 1 
          if I(i,j)< 1/(num_lab-1)/2
            label(i,j) = 0;
            break
          end
        elseif I(i,j) <= 1/(num_lab-1)/2*(2*k-1)
          label(i,j) = 1/(num_lab-1)*(k-1);
          break
        end
      end
    end
  end
  
  % reshape 2D array to a 1D array
  N_row = size(I,1);
  N_col = size(I,2);  
  label = reshape(label',[N_row*N_col, 1]);
  
end