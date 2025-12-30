clear;clc;

global n;
n = 10;
K = 3*eye(2);
h = 0.01;
tspan = 0:h:10;


x0 = rand(n,1);
y0 = rand(n,1);

z0 = [x0; y0];

[t, z] = ode45(@robotODE, tspan, z0);

x = z(:,1:n);
y = z(:,n+1:end);

figure;
hold on;
for i = 1:n
    plot(x(:,i),y(:,i));
end
axis([0 1 0 1]);
title('Robot Trajectories');
xlabel('X Position');
ylabel('Y Position');
hold off;

figure;
for k = 1:length(t)
    clf;
    plot(x(k,:),y(k,:),'bo');hold on;
    voronoi(x(k,:), y(k,:));
    xlim([0 1]); ylim([0 1]);
    title(['t = ' num2str(t(k))]);
    drawnow;
end
