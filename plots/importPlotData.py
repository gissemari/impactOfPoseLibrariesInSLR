import pickle
import pandas as pd
import scipy.io

'''
Developed by Gissella Bejarano

Script to plot data quality analyzis of the the pose estimation libraryes and datasets
A dictionary in pkl is read and then exported into .mat files

'''

objects = []
with (open("data_plot.pkl", "rb")) as openfile:
    while True:
        try:
            element = pickle.load(openfile)
            objects.append(element)
            print("Element")
            #print(element)
        except EOFError:
            break

print(len(objects))
print(objects[0].keys())


datasets = {"aec":"Aec","pucp":"Pucp","wlasl":"Wlasl"}
poseLibraries = {"MediaPipe":"MP", "OpenPose":"OP", "WholePose":"WP"}

#### Stacked bar plots #####

'''
for poseLibrary in poseLibraries.keys():
    for dataset in datasets.keys():
        dfPosLibDataset = objects[0]["stacked_plot"][dataset][poseLibrary]
        # Changing names
        dfPosLibDataset = dfPosLibDataset.rename(columns={'Good Point': 'InRange', 'Out of Range': 'OutRange', 'Filled Missing Value': 'Missing'})
        scipy.io.savemat('df%s%s.mat' % (datasets[dataset],poseLibraries[poseLibrary]), {'struct1':dfPosLibDataset.to_dict("list")})
'''




'''
dfAecMP= objects[0]["stacked_plot"]["aec"]["MediaPipe"]
dfAecOP= objects[0]["stacked_plot"]["aec"]["OpenPose"]
dfAecWP= objects[0]["stacked_plot"]["aec"]["WholePose"]

dfPucpMP= objects[0]["stacked_plot"]["pucp"]["MediaPipe"]
dfPucpOP= objects[0]["stacked_plot"]["pucp"]["OpenPose"]
dfPucpWP= objects[0]["stacked_plot"]["pucp"]["WholePose"]

dfWaslMP= objects[0]["stacked_plot"]["wlasl"]["MediaPipe"]
dfWaslOP= objects[0]["stacked_plot"]["wlasl"]["OpenPose"]
dfWaslWP= objects[0]["stacked_plot"]["wlasl"]["WholePose"]


dfAecMP = dfAecMP.rename(columns={'Good Point': 'InRange', 'Out of Range': 'OutRange', 'Filled Missing Value': 'Missing'})
dfAecOP = dfAecOP.rename(columns={'Good Point': 'InRange', 'Out of Range': 'OutRange', 'Filled Missing Value': 'Missing'})
dfAecWP = dfAecWP.rename(columns={'Good Point': 'InRange', 'Out of Range': 'OutRange', 'Filled Missing Value': 'Missing'})

dfPucpMP = dfPucpMP.rename(columns={'Good Point': 'InRange', 'Out of Range': 'OutRange', 'Filled Missing Value': 'Missing'})
dfPucpOP = dfPucpOP.rename(columns={'Good Point': 'InRange', 'Out of Range': 'OutRange', 'Filled Missing Value': 'Missing'})
dfPucpWP = dfPucpWP.rename(columns={'Good Point': 'InRange', 'Out of Range': 'OutRange', 'Filled Missing Value': 'Missing'})

dfWaslMP = dfWaslMP.rename(columns={'Good Point': 'InRange', 'Out of Range': 'OutRange', 'Filled Missing Value': 'Missing'})
dfWaslOP = dfWaslOP.rename(columns={'Good Point': 'InRange', 'Out of Range': 'OutRange', 'Filled Missing Value': 'Missing'})
dfWaslWP = dfWaslWP.rename(columns={'Good Point': 'InRange', 'Out of Range': 'OutRange', 'Filled Missing Value': 'Missing'})


scipy.io.savemat('dfPucpMP.mat', {'struct1':dfPucpMP.to_dict("list")})
scipy.io.savemat('dfPucpOP.mat', {'struct1':dfPucpOP.to_dict("list")})
scipy.io.savemat('dfPucpWP.mat', {'struct1':dfPucpWP.to_dict("list")})

scipy.io.savemat('dfAecMP.mat', {'struct1':dfAecMP.to_dict("list")})
scipy.io.savemat('dfAecOP.mat', {'struct1':dfAecOP.to_dict("list")})
scipy.io.savemat('dfAecWP.mat', {'struct1':dfAecWP.to_dict("list")})

scipy.io.savemat('dfWaslMP.mat', {'struct1':dfWaslMP.to_dict("list")})
scipy.io.savemat('dfWaslOP.mat', {'struct1':dfWaslOP.to_dict("list")})
scipy.io.savemat('dfWaslWP.mat', {'struct1':dfWaslWP.to_dict("list")})
'''



### Line plots ###
linePlots = {
"left_wrist_analysis": {
        "wlasl", #: df_notna_lm_lw_wlasl,
        "pucp", #: df_notna_lm_lw_pucp,
        "aec", #: df_notna_lm_lw_aec
    },
"right_wrist_analysis": {
        "wlasl", #: df_notna_lm_rw_wlasl,
        "pucp", #: df_notna_lm_rw_pucp,
        "aec", #: df_notna_lm_rw_aec
    },
"pose_analysis": {
        "wlasl", #: df_notna_lm_pose_wlasl,
        "pucp", #: df_notna_lm_pose_pucp,
        "aec", #: df_notna_lm_pose_aec
    },
"face_analysis": {
        "wlasl", #: df_notna_lm_face_wlasl,
        "pucp", #: df_notna_lm_face_pucp,
        "aec", #: df_notna_lm_face_aec
    },
"left_hand_analysis": {
        "wlasl", #: df_notna_lm_lh_wlasl,
        "pucp", #: df_notna_lm_lh_pucp,
        "aec", #: df_notna_lm_lh_aec
    },
"right_hand_analysis": {
        "wlasl", #: df_notna_lm_rh_wlasl,
        "pucp", #: df_notna_lm_rh_pucp,
        "aec", #: df_notna_lm_rh_aec
    }

}


for analysis in linePlots.keys():
    for dataset in datasets.keys():
        #print(objects[0][analysis])
        dfAnalysis = objects[0][analysis][dataset]
        # Changing names
        dfAnalysis = dfAnalysis.rename(columns={'MediaPipe Landmarks': 'MediaPipe', 'WholePose Landmarks': 'WholePose', 'OpenPose Landmarks': 'OpenPose'})
        scipy.io.savemat('df%s_%s_Stacked.mat' % (datasets[dataset],analysis), {'struct1':dfAnalysis.to_dict("list")})

# Print indexes names
objects[0]["pose_analysis"]["aec"].to_csv("poseLabels.csv")
objects[0]["left_hand_analysis"]["aec"].to_csv("leftHandLabels.csv")
objects[0]["right_hand_analysis"]["aec"].to_csv("rightHandLabels.csv")
objects[0]["face_analysis"]["aec"].to_csv("faceLabels.csv")