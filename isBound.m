function bound = isBound(x,y,height, width)
   if(x > 0 && y > 0 && x <= height && y <= width)
       bound = true;
   else
       bound = false;
   end
end