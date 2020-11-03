import numpy as np
import ants
import nibabel as nib
import os
os.listdir(os.getcwd())

#folder path for brains
folder_path = '/oak/stanford/groups/trc/data/Ashley2/imports/'

#date
date = '20200916/'  #don't forget the / at end

#save file path
file_path = folder_path + date
save_file_path = '/oak/stanford/groups/trc/data/Ashley2/brain_registration/' + str(date)
if os.path.exists(save_file_path):
    print('folder there')
else:
    os.makedirs(save_file_path)

#fly_folder_names
files = os.listdir(file_path)

fly_folder_name_list = []
for file in files:
    if os.path.isdir(os.path.join(file_path, file)):
        fly_folder_name_list.append(file)
    else:
        print('not opening: ', file)

#brain_file paths
for fly_name in fly_folder_name_list:
    channel_1_brain_fn = str(file_path) + str(fly_name) + '/' + str(fly_name) + '_channel_1.nii'
    channel_2_brain_fn = str(file_path) + str(fly_name) + '/' + str(fly_name) + '_channel_2.nii'

    if os.path.exists(channel_1_brain_fn) and os.path.exists(channel_2_brain_fn):

        # Load brains using nibabel
        # shape is x,y,z,t
        nib_brain_1 = np.asanyarray(nib.load(channel_1_brain_fn).dataobj).astype('uint32')
        nib_brain_2 = np.asanyarray(nib.load(channel_2_brain_fn).dataobj).astype('uint32')

        micronsPerPixel_XAxis = 1 #um
        micronsPerPixel_YAxis = 1
        micronsPerPixel_ZAxis = 5
        frame_period = 1 # sec

        # define the brain spacing in microns. Not strictly necessary but nice to save out correct transform files and
        # if you want to change parameters on, e.g., how much things can be allowed to shift in each dimension
        brain_spacing = (micronsPerPixel_XAxis, micronsPerPixel_YAxis, micronsPerPixel_ZAxis, frame_period)

        # convert to ants format
        ch1_brain = ants.from_numpy(nib_brain_1, spacing=brain_spacing)
        ch2_brain = ants.from_numpy(nib_brain_2, spacing=brain_spacing)

        # reference brain = time-average of first 100 frames
        ch1_reference = ants.from_numpy(ch1_brain[:, :, :, 0:100].mean(axis=3), spacing=brain_spacing[0:3])  # xyz  originally spacing = spacing, but I think it should be brain_spacing
        ch2_reference = ants.from_numpy(ch2_brain[:, :, :, 0:100].mean(axis=3), spacing=brain_spacing[0:3])  # xyz

        ch1_corrected = []
        ch2_corrected = []
        ##max sets ch2 to the ch1 brain, but I am doing the reverse because ch1 gets washed out with stim bleedthrough
        transform = []
        for brain_frame in range(ch2_brain.shape[3]): # for each frame
            # register ch2 frame to ch2 reference
            # see https://antspy.readthedocs.io/en/latest/registration.html for allowable types of transforms.
            # Rigid (translation + rotation) is usually OK for this. Transforms with more degrees of freedom take longer to compute
            reg = ants.registration(ch2_reference, ants.from_numpy(ch2_brain[:, :, :, brain_frame], spacing=brain_spacing[0:3]), type_of_transform='Rigid')
            # apply registration to ch2
            ch1_frame = ants.apply_transforms(ch1_reference, ants.from_numpy(ch1_brain[:, :, :, brain_frame], spacing=brain_spacing[0:3]), reg['fwdtransforms'])

            ch2_corrected.append(reg['warpedmovout'].numpy())
            ch1_corrected.append(ch1_frame.numpy())
            transform.append(reg['fwdtransforms'])

        print('Brain registered')
        # swap axes back to match original xyzt and cast back to uint16
        ch1_corrected = np.moveaxis(np.asarray(ch1_corrected), 0, 3).astype('uint16')
        ch2_corrected = np.moveaxis(np.asarray(ch2_corrected), 0, 3).astype('uint16')
        # merge into a single .nii file: # xyztc
        merged = np.stack([ch1_corrected, ch2_corrected], axis=4)  # xyztc


        nib.save(nib.Nifti1Image(merged, np.eye(4)), str(save_file_path) + str(fly_name) + '_reg.nii')
        nib.save(nib.Nifti1Image(ch1_corrected, np.eye(4)), str(save_file_path) + str(fly_name) + '_reg_ch1.nii') #not sure if these need the eye array or if it should be 3
        nib.save(nib.Nifti1Image(ch2_corrected, np.eye(4)), str(save_file_path) + str(fly_name) + '_reg_ch2.nii')
        print('Brain saved')

        # have to do some weird format changes to pull out the transform data...
        transform_matrix = []
        for i, t in enumerate(transform):
            for x in t:
                if '.mat' in x:
                    temp = ants.read_transform(x)
                    transform_matrix.append(temp.parameters)
        transform_matrix = np.array(transform_matrix)

        # shows transformation parameters (e.g. x translation, y translation, x axis rotation etc. etc.) for each frame
        np.save(str(save_file_path) + str(fly_name) + '_transform', transform_matrix)

        #print('Saved reg and transforms: {} ({} sec.)'.format(save_file_path, time.time()-t_0))
        print('Saved reg and transforms: {} '.format(str(save_file_path)+ str(fly_name)))

    else:
        print('Could not find filepath: ', fly_name)
