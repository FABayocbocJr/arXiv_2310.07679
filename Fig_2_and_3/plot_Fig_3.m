
hbar = 1.05457148e-34;
M = 1.44316060e-25; %Rb87
L = 96e-6;% 3*RTF;
x0 = L;
t0 = M*L*L/hbar;
E0 = hbar*hbar/(M*L*L);

Nlat = 1024;
Nmodes = 1023;
mu1 = 10937.2;
mu2 = 10937.2;
Omega = 21874.40;
OmegaCr = 0.5*Omega;
tempbar = 0.0;

detun = [27.34 54.69 82.03 109.37 136.72 164.06 191.40 218.74 246.09 273.43];
%detun = [109.37 136.72 164.06 191.40 218.74 246.09 273.43];

fs = 14;
lw = 2;

% plot Fig 3a

figure(124)
clf
hold on
box on
grid on
tt = 201;
for ii = 1:length(detun)
fileName = sprintf('data_M_Nlat_%d_Nmodes_%d_mu1_%.2f_mu2_%.2f_T_%.2f_Omega_%.2f_detuning_%.2f_fine_1_500_b_c.mat',Nlat, Nmodes, mu1, mu2, tempbar, Omega, detun(ii));
load(fileName)
MM = squeeze((mean_rho1(:,tt) - mean_rho2(:,tt))./(mean_rho1(:,tt) + mean_rho2(:,tt)));
err_MM = MM.*sqrt( (sqrt(err_rho1(:,tt).^2 + err_rho2(:,tt).^2)./(mean_rho1(:,tt) - mean_rho2(:,tt))).^2 + (sqrt(err_rho1(:,tt).^2 + err_rho2(:,tt).^2)./(mean_rho1(:,tt) + mean_rho2(:,tt))).^2 );
errorbar(tQ(3:end)*(detun(ii)/t0),MM(3:end)*((detun(ii)/t0)^(-1/3))*((OmegaCr/t0)^(1/3)),1.96*err_MM(3:end)*((detun(ii)/t0)^(-1/3))*((OmegaCr/t0)^(1/3)),'o-')
end

set(gca, 'XScale', 'log', 'YScale','log')
set(gca,'FontSize',fs,'FontName','Times','TickDir','out','LineWidth',lw-1,'TickLength',[0.01 0.02])
xlabel('$b\tau_{Q}$','Interpreter','latex')
ylabel('$(b/\Omega_\mathrm{c})^{-1/\delta}M$','Interpreter','latex')
plot([0.001:0.001:1],11*[0.001:0.001:1].^(2/3),'Color','black','LineWidth',1)
text(5e-2,3.4e0,sprintf('$$\\sim x^{2/3} \\rightarrow$$'),'Interpreter','latex','Color','black','FontSize',fs)
axis([1e-2 1e1 4e-1 8e0])
legend('$\hbar b = 0.0025\times \mu_{0}$','$\hbar b = 0.005\times \mu_{0}$','$\hbar b = 0.0075\times \mu_{0}$','$\hbar b = 0.01\times \mu_{0}$','$\hbar b = 0.0125\times \mu_{0}$','$\hbar b = 0.015\times \mu_{0}$','$\hbar b = 0.0175\times \mu_{0}$','$\hbar b = 0.02\times \mu_{0}$','$\hbar b = 0.0225\times \mu_{0}$','$\hbar b = 0.025\times \mu_{0}$','Interpreter','latex','location','southeast','fontsize',fs-2)
text(3.3e-3,8e0,sprintf('$$\\textbf{(a)}$$'),'Interpreter','latex','Color','black','FontSize',fs)

print('Fig_3a.eps','-depsc')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot Fig 3b

figure(125)
clf
hold on
box on
grid on
tt = 201;
for ii = 1:length(detun)
fileName = sprintf('data_M_Nlat_%d_Nmodes_%d_mu1_%.2f_mu2_%.2f_T_%.2f_Omega_%.2f_detuning_%.2f_fine_1_500_b_c.mat',Nlat, Nmodes, mu1, mu2, tempbar, Omega, detun(ii));
load(fileName)
MM = squeeze((mean_rho1(:,tt) - mean_rho2(:,tt))./(mean_rho1(:,tt) + mean_rho2(:,tt)));
err_MM = MM.*sqrt( (sqrt(err_rho1(:,tt).^2 + err_rho2(:,tt).^2)./(mean_rho1(:,tt) - mean_rho2(:,tt))).^2 + (sqrt(err_rho1(:,tt).^2 + err_rho2(:,tt).^2)./(mean_rho1(:,tt) + mean_rho2(:,tt))).^2 );
errorbar(tQ(3:end)*((detun(ii)/t0)^(3/2))*((OmegaCr/t0)^(-1/2)),MM(3:end),1.96*err_MM(3:end),'o-')
end

set(gca, 'XScale', 'log', 'YScale','log')
set(gca,'FontSize',fs,'FontName','Times','TickDir','out','LineWidth',lw-1,'TickLength',[0.01 0.02])
xlabel('$b^{3/2}\tau_{Q}/\Omega_{\mathrm{c}}^{1/2}$','Interpreter','latex')
ylabel('$M$','Interpreter','latex')
plot([0.001:0.001:0.04],11*[0.001:0.001:0.04].^(2/3),'Color','black','LineWidth',1)
text(4e-3,7e-1,sprintf('$$\\sim x^{2/3} \\rightarrow$$'),'Interpreter','latex','Color','black','FontSize',fs)
axis([1e-3 2e0 6e-2 1.1e0])
legend('$\hbar b = 0.0025\times \mu_{0}$','$\hbar b = 0.005\times \mu_{0}$','$\hbar b = 0.0075\times \mu_{0}$','$\hbar b = 0.01\times \mu_{0}$','$\hbar b = 0.0125\times \mu_{0}$','$\hbar b = 0.015\times \mu_{0}$','$\hbar b = 0.0175\times \mu_{0}$','$\hbar b = 0.02\times \mu_{0}$','$\hbar b = 0.0225\times \mu_{0}$','$\hbar b = 0.025\times \mu_{0}$','Interpreter','latex','location','southeast','fontsize',fs-2)
text(2.9e-4,1.1e0,sprintf('$$\\textbf{(b)}$$'),'Interpreter','latex','Color','black','FontSize',fs)

print('Fig_3b.eps','-depsc')
