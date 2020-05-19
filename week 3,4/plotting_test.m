close
clear all
data = load('Data/naca0012par');
cd = data.cdswp;
alpha = data.alpha;
cl = data.clswp;
lovd = data.lovdswp;
figure('Name','L/D vs \alpha')
plot(alpha,lovd)
figure('Name','C_D vs C_L')
plot(cl,abs(cd))

data4 = load('Data/naca0012par_4');
cp = data4.cp;
x = data4.xs;
figure('Name','C_p')
plot(x,-cp)



