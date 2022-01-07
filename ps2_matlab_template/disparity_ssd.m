function D = disparity_ssd(L, R, wsize)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    % TODO: Your code here
   rows = size(L,1);
   columns = size(L,2);
   D = zeros(rows,columns);
    
    for tmpr = 1:rows
        for tmpc = 1:columns
            arr = zeros(1,columns);
            arr2 = zeros(1,columns);
            for samplec=1:columns
               svalue =0 ; sboxes = 0;
                for ir = 0: (wsize-1)
                  for  ic = 0 : (wsize-1)
                     if(tmpr-floor(wsize/2)+ir >=1  && tmpr-floor(wsize/2)+ir <= rows && ...
                        tmpc-floor(wsize/2)+ ic >= 1 && tmpc-floor(wsize/2)+ ic <= columns  &&...
                        samplec-floor(wsize/2)+ic >=1  && samplec-floor(wsize/2)+ic <= columns)  
                     sboxes = sboxes+1;
                     tvalue = L(tmpr- floor(wsize/2) + ir , tmpc - floor(wsize/2) +ic);
                     ivalue = R(tmpr - floor(wsize/2) + ir , samplec - floor(wsize/2) + ic);
                     svalue = svalue + (tvalue-ivalue)^2;
                   end
                  end
                end
%                 arr2(1,samplec) = sboxes;
                arr(1,samplec) = svalue;
            end
%              if(tmpc == 128 && (tmpr == 79 || tmpr == 105 || tmpr ==106 || tmpr == 107 || tmpr ==128))
%              disp(arr);
%              fprintf("\n**********\n")
%              disp(arr2);
%              fprintf("\n\n\n&&&&&&&\n\n\n")
%              end
%              if(size(find(arr == min(arr)),2) > 1)
%                  minis = find(arr == min(arr));
%                  mastermin = minis(1,1);
%                  maxsboxes = arr2(1,mastermin);
%                  for m = 1: size(minis,2)
%                      if(arr2(1,minis(1,m))> maxsboxes)
%                          mastermin = minis(1,m);
%                          maxsboxes = arr2(1,mastermin);
%                      end
%                  end
%                  
%              mini = mastermin;
% %              disp(mastermin);
%              else 
                [minv, mini] = min(arr);    
%              end
            D(tmpr, tmpc) = mini- tmpc;
        end
    end
end
