close
clear all
data = load('Data/naca4412par');
cd = data.cdswp;
alpha = data.alpha;
cl = data.clswp;
lovd = data.lovdswp;

data_simple = load('Data/naca4412_simple_par');
cd_simple = data_simple.cdswp;
alpha_simple = data_simple.alpha;
cl_simple = data_simple.clswp;
lovd_simple = data_simple.lovdswp;

datalm1_simple = load('Data/naca4412lm1_simple_par');
cdlm1_simple = datalm1_simple.cdswp;
alphalm1_simple = datalm1_simple.alpha;
cllm1_simple = datalm1_simple.clswp;
lovdlm1_simple = datalm1_simple.lovdswp;

datalm2_simple = load('Data/naca4412lm2_simple_par');
cdlm2_simple = datalm2_simple.cdswp;
alphalm2_simple = datalm2_simple.alpha;
cllm2_simple = datalm2_simple.clswp;
lovdlm2_simple = datalm2_simple.lovdswp;


figure('Name','L/D vs \alpha')
plot(alpha,lovd)
hold on 
plot(alpha_simple,lovd_simple)
plot(alphalm1_simple,lovdlm1_simple)
plot(alphalm2_simple,lovdlm2_simple)
hold off


figure('Name','C_D vs C_L')
plot(cl,cd)
hold on 
plot(cl_simple,cd_simple)
plot(cllm1_simple,cdlm1_simple)
plot(cllm2_simple,cdlm2_simple)
hold off

figure('Name','C_D vs alpha')
plot(alpha,cd)
hold on 
plot(alpha_simple,cd_simple)
plot(alphalm1_simple,cdlm1_simple)
plot(alphalm2_simple,cdlm2_simple)
hold off




data0 = load('Data/naca4412par_0');
cp0 = data0.cp;
x = data0.xs;
figure('Name','C_p0')
plot(x,cp0)

data0_s = load('Data/naca4412_simple_par_0');
cp0_s = data0_s.cp;
x = data0_s.xs;
figure('Name','C_p0_s')
plot(x,cp0_s)

data0_lm1_s = load('Data/naca4412lm1_simple_par_0');
cp0_lm1_s = data0_lm1_s.cp;
x = data0_lm1_s.xs;
figure('Name','cp0_lm1_s')
plot(x,cp0_lm1_s)

data0_lm2_s = load('Data/naca4412lm2_simple_par_0');
cp0_lm2_s = data0_lm2_s.cp;
x = data0_lm2_s.xs;
figure('Name','cp0_lm2_s')
plot(x,cp0_lm2_s)



%{
data4 = load('Data/naca4412par_4');
cp = data4.cp;
x = data4.xs;
figure('Name','C_p')
plot(x,-cp)

thetal=data4.thetal;
thetau=data4.thetau;
deltastarl=data4.delstarl;
deltastaru=data4.delstaru;
Heu =deltastaru./thetau;
Hel = deltastarl./thetal;


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
figure('Name','thetal')
plot(thetal)
figure('Name','thetau')
plot(thetau)

%}



