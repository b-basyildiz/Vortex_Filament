numpoints = 1000; 
    x = linspace(0,1,numpoints); 
    eps=0.1;
    y = (exp(x*((-1+sqrt(1-eps))/eps))-exp(x*((-1-sqrt(1-eps))/eps)))/(exp((-1+sqrt(1-eps))/eps)-exp((-1-sqrt(1-eps))/eps)); 
    eps2=0.025;
    y2 = (exp(x*((-1+sqrt(1-eps2))/eps2))-exp(x*((-1-sqrt(1-eps2))/eps2)))/(exp((-1+sqrt(1-eps2))/eps2)-exp((-1-sqrt(1-eps2))/eps2));
    eps3=0.005;
    y3= (exp(x*((-1+sqrt(1-eps3))/eps3))-exp(x*((-1-sqrt(1-eps3))/eps3)))/(exp((-1+sqrt(1-eps3))/eps3)-exp((-1-sqrt(1-eps3))/eps3)); 
    figure 
    hold on 
    h = animatedline;
    c = h.Color;
    h.Color = 'magenta';
    h2 = animatedline;
    c = h2.Color;
    h2.Color = 'blue';
    h3= animatedline;
    c=h3.Color;
    h3.Color = "red";
    axis([0,.5,0,2]) 
    legend('0.1','0.025','0.005')
    lgd = legend;
    lgd.FontSize = 14;
    lgd.Title.String = 'Epsilon Size';
    
    
  
    for k = 1:numpoints 
      addpoints(h,x(k),y(k)) 
      addpoints(h2,x(k),y2(k)) 
      addpoints(h3,x(k),y3(k))
      drawnow 
    end
    