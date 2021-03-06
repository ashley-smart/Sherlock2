import numpy as np
import ants
import nibabel as nib

#folder path for brains
folder_path = '/oak/stanford/groups/trc/data/Ashley2/imports/'

#date
date = '20200918/'

#fly_folder_names



# brain file paths
channel_1_brain_fn = '/oak/stanford/groups/trc/data/Ashley2/imports/20200918/fly1_2x1_dehyd_1s_8.5v-031/fly1_2x1_dehyd_1s_8.5v-031_channel_1.nii'
channel_2_brain_fn = '/oak/stanford/groups/trc/data/Ashley2/imports/20200918/fly1_2x1_dehyd_1s_8.5v-031/fly1_2x1_dehyd_1s_8.5v-031_channel_1.nii'

#save file path
save_file_path = folder_path + date


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
ch1_reference = ants.from_numpy(ch1_brain[:, :, :, 0:100].mean(axis=3), spacing=brain_spacing[0:3])  # xyz
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


nib.save(nib.Nifti1Image(merged, np.eye(4)), save_file_path + '_reg.nii')
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
np.save(save_file_path + '_transform', transform_matrix)

print('Saved reg and transforms: {} ({} sec.)'.format(save_file_path, time.time()-t_0))
