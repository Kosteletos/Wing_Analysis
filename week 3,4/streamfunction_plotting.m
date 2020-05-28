function streamfunction_plotting(gamma, xs, ys, alpha)

    xmin =-1;
    xmax =1.5;
    ymin =-0.5;
    ymax =0.5;
    nx = 101;
    ny = 81;   
    np = length(gamma)-1;

    x = xmin:((xmax-xmin)/(nx-1)):xmax;
    y = ymin:((ymax-ymin)/(ny-1)):ymax;
    [ym,xm]=meshgrid(y,x);

    psi = ym-(xm-xmin)*tan(alpha); % free stream contribution

   for i = 1:np
        gamma_a = gamma(i);
        gamma_b = gamma(i+1);
        [infa,infb] = panelinf(xs(i),ys(i),xs(i+1),ys(i+1),xm,ym);
        psi = psi + gamma_a.*infa + gamma_b.*infb;
    end

    c = -5:0.04:5;
    figure('Name','streamlines');
    contour(xm,ym,psi,c)
    hold on
    plot(xs,ys)
    hold off 
    xlabel('x')
    ylabel('y')
    set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
    title('Streamlines around cylinder')
    
end