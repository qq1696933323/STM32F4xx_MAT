function Plot_PMSM(i,theta,offset)
clf
% Set figure properties
scrsz = get(0,'ScreenSize');
figsz = get(gcf,'OuterPosition');
set(gcf,'Name','Field position');
set(gcf,'OuterPosition',[figsz(1) figsz(2) scrsz(3)/2 scrsz(4)/2]);
h1 = uicontrol('Style','text',...
                'Position',[0 0 scrsz(3)/8 scrsz(4)/4],'FontWeight','bold',...
                'String',['Field (grey arrow) results from motor poles applied currents (blue, green and red arrows).',...
                'System control is more efficient when field is perpendicular to permanent magnet (cyan arrow).']);
h2 = uicontrol('Style','text',...
                'Position',[3*scrsz(3)/8 0 scrsz(3)/8-5 scrsz(4)/8],...
                'String',['Function arrow.m developed by ',...
                'Dr. Erik A. Johnson (johnsone@usc.edu) is used for visualization and distributed with STM32-MAT package.']);
clear h1 h2

theta = theta+offset;
axis(1.5*[-1 1 -1 1]);
% plot 3 phase vectors
arrow([0 0],[0 1],15,'BaseAngle',60,'LineWidth',2);
arrow([0 0],[-cosd(30) -sind(30)],15,'BaseAngle',60,'LineWidth',2);
arrow([0 0],[cosd(30) -sind(30)],15,'BaseAngle',60,'LineWidth',2);
% plot 3 phase current vectors
arrow([0 0],i(1)*[0 1],15,'BaseAngle',60, 'EdgeColor','b','FaceColor','b','LineWidth',2);
arrow([0 0],i(2)*[-cosd(30) -sind(30)],15,'BaseAngle',60, 'EdgeColor','r','FaceColor','r','LineWidth',2);
arrow([0 0],i(3)*[cosd(30) -sind(30)],15,'BaseAngle',60, 'EdgeColor','g','FaceColor','g','LineWidth',2);
% plot resultant
i_tot = i(1)*[0 1]+i(2)*[-cosd(30) -sind(30)]+i(3)*[cosd(30) -sind(30)];
arrow([0 0],i_tot,15,'BaseAngle',60, 'EdgeColor',[0.5 0.5 0.5],'FaceColor',[0.5 0.5 0.5],'LineWidth',2);
% plot rotor
d = 0.8*[-sin(theta) cos(theta)];
arrow(-d,d,15,'BaseAngle',60, 'EdgeColor',[0.2 0.8 0.8],'FaceColor',[0.2 0.8 0.2],'LineWidth',3);
% plot resultant on rotor tip
arrow(d,d+i_tot,8,'BaseAngle',60, 'EdgeColor',[0.5 0.5 0.5],'FaceColor',[0.5 0.5 0.5],'LineWidth',1);
% Title
title('PMSM Phase Currents and Rotor');
text(0, 1.1, 'A', 'horizontalAlignment','center')
text(-cosd(30)*1.1, -sind(30)*1.1, 'B', 'horizontalAlignment','center')
text(cosd(30)*1.1, -sind(30)*1.1, 'C', 'horizontalAlignment','center')

pbaspect([1 1 1])
end
