rosshutdown
setenv('ROS_MASTER_URI','http://10.42.0.1:11311')
setenv('ROS_IP','10.42.0.28')
rosinit('http://10.42.0.1:11311','NodeHost','10.42.0.28');


% Read scan continously
if ismember('/scan',rostopic('list'))
    scansub = rossubscriber('/scan');
    
    
    while(1)
        linescan = receive(scansub); %Receive message
        ranges = linescan.Ranges; % Extract scan
        angles = linescan.AngleMin:linescan.AngleIncrement:linescan.AngleMax;
        plot(angles, ranges)
        xlabel('Angle [rad]')
        ylabel('Distance [m]')
        %saveas(gcf,'linescan.png')
    end
end