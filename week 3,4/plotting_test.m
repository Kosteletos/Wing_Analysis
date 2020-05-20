close
clear all
data = load('Data/naca4412par');
cd = data.cdswp;
alpha = data.alpha;
cl = data.clswp;
lovd = data.lovdswp;

figure('Name','L/D vs \alpha')
plot(alpha,lovd)
figure('Name','C_D vs C_L')
plot(cl,abs(cd))
figure('Name','C_D vs alpha')
plot(alpha,cd)
figure('Name','C_L vs alpha')
plot(alpha,cl)

data4 = load('Data/naca4412par_4');
cp = data4.cp;
x = data4.xs;
thetal=data4.thetal;
thetau=data4.thetau;
deltastarl=data4.delstarl;
deltastaru=data4.delstaru;
Heu =deltastaru./thetau;
Hel = deltastarl./thetal;
figure('Name','C_p')
plot(x,-cp)
figure('Name','thetal')
plot(thetal)
figure('Name','thetau')
plot(thetau)

data5 = load('Data/naca4412par_5');
cp5 = data5.cp;
x = data5.xs;
thetal5=data5.thetal;
thetau5=data5.thetau;
deltastarl=data5.delstarl;
deltastaru=data5.delstaru;

figure('Name','C_p5')
plot(x,-cp5)
figure('Name','thetal5')
plot(thetal5)
figure('Name','thetau5')
plot(thetau5)




