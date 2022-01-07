function bini = findbin(bins, value)
     prevbin =0;
     for bin = bins      
       if (bin >= value)
           if(abs(bin-value) > abs(value-prevbin))
               bini = find(bins == prevbin);
           else 
               bini = find(bins == bin);
           end
       break;
       end
       prevbin = bin;
     end
     if(value > bins(length(bins)))
        bini = length(bins);
     end
end