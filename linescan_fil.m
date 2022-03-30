rosshutdown
init_turtlebot_connection("10.42.0.1", "10.42.0.28");


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
    end
end