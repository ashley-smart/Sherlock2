import math
import csv 
import numpy as np
from matplotlib import pyplot as plt
from matplotlib import path
import scipy as scipy
import scipy.io
import cv2

import os
os.listdir(os.getcwd())

import json as json
import pickle as pickle

from read_roi import read_roi_file
from read_roi import read_roi_zip

# from IPython.display import clear_output



##################################
##change this stuff ##############
##################################
date = '20191218'
video_number = 1
roi_number = 1
video_name = 'Video_1.m4v'

##################################



# roi_path = "E:/PER2/" + str(date) + "/analysis/RoiSet_vid" + str(roi_number) + "/"
roi_path = '/oak/stanford/groups/trc/data/Ashley2/PER/' + str(date) + "/analysis/RoiSet_vid" + str(roi_number) + "/"
rois = os.listdir(roi_path)
print(rois)

# jpeg_path = "E:/PER2/" + str(date) + "/analysis/Video_" + str(video_number) + "/"
# jpeg_file_names = os.listdir(jpeg_path)

#video_path = "E:/PER2/" + str(date) + "/" + str(video_name)
video_path = '/oak/stanford/groups/trc/data/Ashley2/PER/' + str(date) + "/" + str(video_name)
cap = cv2.VideoCapture(video_path)

save_file_name = "Results_video_" + str(video_number) + "_python_m4v.csv"
save_path = '/oak/stanford/groups/trc/data/Ashley2/PER/' + str(date) + "/" 

# Check if opened successfully
if (cap.isOpened() is False):
    print("Error opening video stream or file") #, file=f)
    
else:
    print('vid opened successfully') #, file=f)

## Get ROI dictionaries ###

#read_roi_file puts data into dict in dict
all_roi_info_dict = []
for roi_name in rois:
    roi_file_path = os.path.join(roi_path, roi_name)
    # print(roi_file_path)
    roi = read_roi_file(roi_file_path)
    all_roi_info_dict.append(roi)


#get roi names as keys for original dict that has dicts of info
#need to use list to get rid of dict specifier
roi_names_as_keys = []
for i in range(len(all_roi_info_dict)):
    roi_key_name = list(all_roi_info_dict[i].keys())
    roi_names_as_keys.append(roi_key_name[0])
# print(roi_names_as_keys)

all_x1 = []
all_y1 = []
all_width = []
all_height = []
all_name = []
all_poly_name = []
all_poly_x = []
all_poly_y = []
all_name_for_header = []

for i in range(len(all_roi_info_dict)):
    if all_roi_info_dict[i][roi_names_as_keys[i]]['type'] == 'rectangle':
        x1 = all_roi_info_dict[i][roi_names_as_keys[i]]['left']
        y1 = all_roi_info_dict[i][roi_names_as_keys[i]]['top']
        height = all_roi_info_dict[i][roi_names_as_keys[i]]['height']
        width = all_roi_info_dict[i][roi_names_as_keys[i]]['width']
#         name = all_roi_info_dict[i][roi_names_as_keys[i]]['name']
#         all_x1.append(x1)
#         all_y1.append(y1)
#         all_width.append(width)
#         all_height.append(height)
#         all_name.append(name)
        #convert rectangle info to the same format as the polygon (xxxx) (yyyy) order for polygon is lower right then counterclockwise
        right_x = x1 + width
        lower_y = y1 + height #(y runs opposite expected, 0 is top, high is bottom)
        poly_x = (right_x, right_x, x1, x1) #order = lower right, upper right, upper left, lower left
        poly_y = (lower_y, y1, y1, lower_y) #order = lower right, upper right, upper left, lower left
        
    if all_roi_info_dict[i][roi_names_as_keys[i]]['type'] == 'polygon':
        poly_x = all_roi_info_dict[i][roi_names_as_keys[i]]['x']
        poly_y = all_roi_info_dict[i][roi_names_as_keys[i]]['y']
        
    poly_name = all_roi_info_dict[i][roi_names_as_keys[i]]['name']
    name_for_header = "Mean(" + str(poly_name.replace("'", " ")) + ")"
    #print(name_for_header)
    all_poly_name.append(poly_name)
    all_poly_x.append(poly_x)
    all_poly_y.append(poly_y)
    all_name_for_header.append(name_for_header)
print(all_name_for_header)
# print(all_poly_x)

# get h, w
success, image_frame = cap.read()
print('read 1st frame: ' + str(success)) #, file=f)


# frame size
h, w, _ = np.shape(image_frame)
print(np.shape(image_frame))
print('height: %d ' % h) #, file=f)
print('width: %d ' % w) #, file=f)

#convert pixels in image into coordinates in an array
xv, yv = np.meshgrid(np.arange(0,w,1), np.arange(0,h,1))

#turn polygon roi into a path and see which pixels are inside of it
all_roi_coordinates = []
all_roi_paths = []
all_roi_masks = []
for roi_index in range(len(all_poly_x)):
    x = all_poly_x[roi_index]
    y = all_poly_y[roi_index]
    roi_coordinates = list(zip(x,y))
    print(roi_coordinates)
    all_roi_coordinates.append(roi_coordinates)
    ### NEED TO ADD LIGHT too, rectangle shape

    #convert poly coords to path
    #for poly_point_index in range(len(x)): #some polygons are 4 or 5 vertices
    roi_path = path.Path(roi_coordinates)
    all_roi_paths.append(roi_path)
    roi_mask = np.where(roi_path.contains_points(np.hstack((xv.flatten()[:,np.newaxis],yv.flatten()[:,np.newaxis]))))
    all_roi_masks.append(roi_mask)  

fig = plt.figure()
plt.imshow(frame)
for i in range(len(all_poly_x)):
    plt.scatter(all_poly_x[i], all_poly_y[i], color = 'red', s = 2 )
plt.show()
print(all_poly_name)
fig.savefig(os.path.join(save_path, 'video_' + str(video_number) + '_ROI_image.png'))


all_avg_intensity = []
frame_count = 1
while True: 
    clear_output(wait = True)
    success, frame = cap.read()
    if success:
        frame_count += 1
        flat_frame = frame.flatten()
        #get averages for all ROI in one list
        all_roi_avg_intensity_per_frame = []
        for roi_index in range(len(all_roi_masks)):
            avg_intensity_each_roi = np.mean(flat_frame[all_roi_masks[roi_index]])
            all_roi_avg_intensity_per_frame.append(avg_intensity_each_roi)
        all_avg_intensity.append(all_roi_avg_intensity_per_frame)
        last_frame = frame
    else:
        break
        

    
    #to get percent complete
    #print("Current progress: ", np.round(jpeg_index/len(jpeg_file_names) *100, 2), "%")
    print("Current frame #: ", frame_count)
        
        
        
#save results 
#want the format to be the same as the fiji format so I don't have to change my other code
#format for fiji is row 1 [blank(col of frame numbers), Label, Mean(PER), Mean(PER2), etc]
#print(all_name_for_header)
header = all_name_for_header
# if 'Label' not in header: #prevents accidentally adding too many times
#     header.insert(0,'Label')
# print(header)


with open(os.path.join(save_path, str(save_file_name)), 'w', newline='') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(header)
    for frame_i in range(len(all_avg_intensity)):
        writer.writerow(all_avg_intensity[frame_i])
print("saved")



plt.imshow(last_frame)
plt.show()
for i in range(len(all_poly_x)):
    if all_poly_name[i] == 'Light':
        #CROPPING THIS WAY ONLY WORKS FOR RECTANGLES
        #to crop frame[y1:y2, x1:x2]
        #polygon arrangement in poly_x and poly_y (x2, x2, x1, x1) (y2, y1, y1, y2)
        y1 = all_poly_y[i][3]
        y2 = all_poly_y[i][1]
        x1 = all_poly_x[i][3]
        x2 = all_poly_x[i][1]
        print('light')
        y1 = min(all_poly_y[i])  #y axis is opposite of what expect 0 is top
        y2 = max(all_poly_y[i])
        x1 = min(all_poly_x[i])
        x2 = max(all_poly_x[i])
        print(y1, y2, x1, x2)
        cropped_frame = last_frame[y1:y2, x1:x2]
        #cropped_frame = frame[0:300, 0:100]
        plt.imshow(cropped_frame)
        plt.show()
        plt.scatter(all_poly_x[i], all_poly_y[i], color = 'red', s = 2 )
        plt.show()
    else:
        y1 = min(all_poly_y[i])  #y axis is opposite of what expect 0 is top
        y2 = max(all_poly_y[i])
        x1 = min(all_poly_x[i])
        x2 = max(all_poly_x[i])
        
        #print(y1, y2, x1, x2)
#         plt.imshow(frame)
#         plt.scatter(x1, y1, color = 'red')
#         plt.scatter(x2, y2, color = 'white')
        cropped_frame = frame[y1:y2, x1:x2]
        plt.imshow(cropped_frame)
        plt.show()
        plt.scatter(all_poly_x[i], all_poly_y[i], color = 'red', s = 2 ) #to see actual shape
        plt.show()
        fig1.savefig(savepath + str(i) + '_croppedLED.png')
        plt.close()




