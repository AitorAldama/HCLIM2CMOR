#!/bin/bash

#-------------------------------------------------------------------------
# Settings for the first step of the CMOR process
# 
# Matthias Göbel 
#
#-------------------------------------------------------------------------

post_step=0 # to limit post processing to step 1 or 2, for all other values both steps are executed

# Simulation details used for creating a directory structure 
GCM=ICHEC-EC-EARTH # driving GCM
EXP=historical     # driving experiment name

#-------------------------------------------
# Time settings

# processing range for step 1:
START_DATE=199501 # Start year and month for processing (if not given in command line YYYYMM)
STOP_DATE=200512  # End year and month for processing (if not given in command line YYYYMM)

# for step 2 (if different from step 1:
YYA= # Start year for processing YYYY
YYE= # End year for processing YYYY

#-------------------------------------------
# Directory path settings

export BASEDIR=${HOME}/CORDEX-FPS/HCLIM2CMOR_clean    # directory where the scripts are placed 
export DATADIR=${HOME}/CORDEX-FPS/HCLIM2CMOR_clean/data       # directory where all the data will be placed (typically at /scratch/)
ARCH_BASE=/nobackup/rossby18/sm_anddo/HCLIM38h1_FPSconvection_AROME_ALD_ECE_HIST_1995_2005 # directory where the raw data of the simulations are archived

# scripts directory
SRCDIR=${BASEDIR}/src                # directory where the post processing scripts are stored
SRCDIR_POST=${BASEDIR}/src/hclim_post # directory where the subscripts are stored

WORKDIR=${DATADIR}/work/post/FcpECE1995  # work directory, CAUTION: WITH OPTION "--clean" ALL FILES IN THIS FOLDER WILL BE DELETED AFTER PROCESSING!
LOGDIR=${DATADIR}/work/logs         # logging directory

# input/output directory for first step
INDIR_BASE1=${DATADIR}/in            # directory to where the raw data archives are extracted
OUTDIR_BASE1=${DATADIR}/work/outputpost # output directory of the first step
EXPPATH=FcpECE1995                   # directory of the experiment
NAMETAG=FPS3_FPSCP_1995_2005      # file nameing, i.e. var_NAMETAG_date.nc

# input/output directory for second step
INDIR_BASE2=${OUTDIR_BASE1}
OUTDIR_BASE2=${DATADIR}/work/input_CMORlight

#-------------------------------------------
# Special settings for second step

proc_list="tas pr " # which variables to process (set proc_all=false for this to take effect); separated by spaces
proc_all=false      # process all available variables (not only those in proc_list)
LFILE=1             # set LFILE=1 IF ONLY primary fields (given out by COSMO) should be created and =2 for only secondary fields (additionally calculated for CORDEX); for any other number both types of fields are calculated
