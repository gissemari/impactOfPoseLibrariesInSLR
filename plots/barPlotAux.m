%nameFile = "dfPucpMP.mat"

function []= plotOne(nameFile)
    nameFile;
    pucpMPinOut = load(nameFile).struct1
    
    
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
    set(gca,'yticklabel',new_yticks)
    set(gca,'xticklabel',new_xticks)
    
    ylabel('Percentage of Landmarks') 
    %xlabel('Body Locations') 
