%Line plots
% redTable takes first row as header
%S = readtable('tagNamesXLinesPose.csv')

%poseLabels.csv leftHandLabels.csv rightHandLabels.csv faceLabels.csv
T = csvimport('leftHandLabels.csv')
tags =  strrep(T(:,1),'_','\\newline')
%fileNameUnique = ["dfWlasl_pose_analysis_Stacked.mat","dfWlasl_left_hand_analysis_Stacked.mat","dfPucp_left_hand_analysis_Stacked.mat","dfPucp_right_hand_analysis_Stacked.mat"]
%fileNames = ["dfAecMP.mat" "dfAecOP.mat" "dfAecWP.mat" "dfPucpMP.mat" "dfPucpOP.mat" "dfPucpWP.mat" "dfWaslMP.mat" "dfWaslOP.mat" "dfWaslWP.mat"]
Atags = {}

sizeTags = size(tags,1)
sizeTags
% "dfWlasl_pose_analysis_Stacked.mat", "dfWlasl_left_hand_analysis_Stacked.mat","dfPucp_left_hand_analysis_Stacked.mat","dfPucp_right_hand_analysis_Stacked.mat"
for fileName = ["dfPucp_left_hand_analysis_Stacked.mat"]
    struct = load(fileName).struct1
    
    xtickesScale = 1:3:3*sizeTags-3
    plot(xtickesScale,struct.MediaPipe,xtickesScale,struct.WholePose,xtickesScale,struct.OpenPose,'LineWidth',1.0)
    Atags = {}
    %sizeTags = sizeTags+1
    for c=2:sizeTags
        % Access to cell array (which is like a list) tags{c}
        Atags = cat(1,Atags,sprintf(tags{c}))

        %
        %Atags = cat(2,Atags,strrep(tags(c),' ','\\newline'))
    end
     
    xticklabels(Atags)
    a=[cellstr(num2str(get(gca,'ytick')'*100))]; 
    pct = char(ones(size(a,1),1)*'%'); 
    new_yticks = [char(a),pct];
    %%%%%%%%%%%%% check order
    xlim([1 63])
    new_xticks = {'Face';'Pose';'Left Hand';'Right Hand'};
    set(gca,'yticklabel',new_yticks,'fontsize',10)
    set(gca,'XTick', xtickesScale, 'xticklabels',xticklabels,'fontsize',7)

    legend({'WholePose', 'MediaPipe', 'OpenPose'},'Location','southwest','fontsize',5)
    % it would be great to have  with at least 90% of landmarks In-Range
    ylabel('% of Frames with all landmarks In-Range','FontSize',8)
    xlabel('Left-Hand Keypoint Larmarks','FontSize',8)
    title('Left-Hand Section in Frames of WLASL','FontSize',12)
    set(gcf,'position',[10,10,1200,300])

end




