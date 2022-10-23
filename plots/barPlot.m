%plot 6 plots


% Create plots
figure('Position', [1, 1, 800, 800])
t = tiledlayout(3,3);
count =1

%["dfAecMP.mat" "dfAecOP.mat" "dfAecWP.mat" "dfPucpMP.mat" "dfPucpOP.mat" "dfPucpWP.mat" "dfWaslMP.mat" "dfWaslOP.mat" "dfWaslWP.mat"]

for fileName = ["dfAecMP.mat" "dfAecOP.mat" "dfAecWP.mat" "dfPucpMP.mat" "dfPucpOP.mat" "dfPucpWP.mat" "dfWaslMP.mat" "dfWaslOP.mat" "dfWaslWP.mat"]
    nexttile;
    %plotOne(fileName)
    if count==3 | count==9
        plotOne2(fileName,count);
    else
        plotOne1(fileName,count);
    end
    count = count + 1;
end
legend({'In Range', 'Out of Range', 'Missing'},'Location','southwest')




function []= plotOne1(nameFile, counterTitle)
    nameFile;
    pucpMPinOut = load(nameFile).struct1;
    
    
    %y = [2 2 3; 2 5 6; 2 8 9; 2 11 12];
    %y = [struct1.Good Point ; struct1.Out of Range ; struct1.Filled Missing Value]
    
    pucpMPinOut.InRange(isnan(pucpMPinOut.InRange))=0;
    pucpMPinOut.OutRange(isnan(pucpMPinOut.OutRange))=0;
    pucpMPinOut.Missing(isnan(pucpMPinOut.Missing))=0;
    
    newInput = [pucpMPinOut.InRange; pucpMPinOut.OutRange; pucpMPinOut.Missing]';
    temp = newInput(2,:)
    newInput(2,:) = newInput(3,:)
    newInput(3,:) = temp
    
    bar(newInput,'stacked')
    
    a=[cellstr(num2str(get(gca,'ytick')'*100))]; 
    pct = char(ones(size(a,1),1)*'%'); 
    new_yticks = [char(a),pct];
    %%%%%%%%%%%%% check order
    new_xticks = {'Face';'Pose';'Left Hand';'Right Hand'};
    set(gca,'yticklabel',new_yticks,'fontsize',8)
    set(gca,'xticklabel',new_xticks)
    
    switch counterTitle
        case 1
            ylabel('% of Landmarks - AEC','FontSize',11)
            title('MediaPipe','FontSize',12)
            %xlabel('MediaPipe','FontSize',12)
        case 2
            %xlabel('OpenPose','FontSize',12)
            title('OpenPose','FontSize',12)
        case 3
            %xlabel('WholePose','FontSize',12)
            title('WholePose','FontSize',12)
        case 4
            ylabel('% of Landmarks - PUCP','FontSize',11)
        case 7
            ylabel('% of Landmarks - WLASL','FontSize',11)
            %xlabel('MediaPipe','FontSize',12)

    end
    %xlabel('Body Locations') 
    
end

function []= plotOne2(nameFile, counterTitle)
    nameFile
    pucpMPinOut = load(nameFile).struct1;
    
    
    %y = [2 2 3; 2 5 6; 2 8 9; 2 11 12];
    %y = [struct1.Good Point ; struct1.Out of Range ; struct1.Filled Missing Value]
    
    pucpMPinOut.InRange(isnan(pucpMPinOut.InRange))=0;
    pucpMPinOut.OutRange(isnan(pucpMPinOut.OutRange))=0;
    %pucpMPinOut.Missing(isnan(pucpMPinOut.Missing))=0;
    aux = [0 0 0 0];

    newInput = [pucpMPinOut.InRange; pucpMPinOut.OutRange; aux]';
    temp = newInput(2,:)
    newInput(2,:) = newInput(3,:)
    newInput(3,:) = temp
    
    bar(newInput,'stacked')
    
    a=[cellstr(num2str(get(gca,'ytick')'*100))]; 
    pct = char(ones(size(a,1),1)*'%'); 
    new_yticks = [char(a),pct];
    %%%%%%%%%%%%% check order
    new_xticks = {'Face';'Pose';'Left Hand';'Right Hand'};
    set(gca,'yticklabel',new_yticks,'fontsize',8)
    set(gca,'xticklabel',new_xticks)
    
    
    switch counterTitle
        case 1
            ylabel('% of Landmarks - AEC','FontSize',11)
            %xlabel('MediaPipe','FontSize',12)
            title('MediaPipe','FontSize',12)
        case 2
            %xlabel('OpenPose','FontSize',12)
            title('OpenPose','FontSize',12)
        case 3
            %xlabel('WholePose','FontSize',12)
            title('WholePose','FontSize',12)
        case 4
            ylabel('% of Landmarks - PUCP','FontSize',11)
        case 7
            ylabel('% of Landmarks - WLASL','FontSize',11)
            %xlabel('MediaPipe','FontSize',12)
    end
    %xlabel('Body Locations') 

end