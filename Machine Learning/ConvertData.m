clc; close; clear
load('10tracks_mpw')
mpwall = mpwall.';
m = length(mpwall);
t = zeros(m,1);
for i = 1:m
    t(i) = 0.5/1000*i;
end
plot(t, mpwall)

xlabel('time (s)')
ylabel('Melt Pool Width (m)')

save('Data', 't', 'mpwall')
