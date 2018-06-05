FROM brainlife/freesurfer

RUN apt-get update --fix-missing \
    && apt-get install -y wget

RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install nibabel pandas
RUN apt-get install -y python2.7
RUN apt-get install -y python-pip

RUN apt-get install -y git

# Configure environment
ENV FSLDIR=/usr/share/fsl/5.0
ENV FSLOUTPUTTYPE=NIFTI_GZ
ENV PATH=/usr/lib/fsl/5.0:$PATH
ENV FSLMULTIFILEQUIT=TRUE
ENV POSSUMDIR=/usr/share/fsl/5.0
ENV LD_LIBRARY_PATH=/usr/lib/fsl/5.0:$LD_LIBRARY_PATH
ENV FSLTCLSH=/usr/bin/tclsh
ENV FSLWISH=/usr/bin/wish
ENV FSLOUTPUTTYPE=NIFTI_GZ

ENV OS Linux
ENV FS_OVERRIDE 0
ENV FIX_VERTEX_AREA=
ENV SUBJECTS_DIR /usr/local/freesurfer/subjects
ENV FSF_OUTPUT_FORMAT nii.gz
ENV MNI_DIR /usr/local/freesurfer/mni
ENV LOCAL_DIR /usr/local/freesurfer/local
ENV FREESURFER_HOME /usr/local/freesurfer
ENV FSFAST_HOME /usr/local/freesurfer/fsfast
ENV MINC_BIN_DIR /usr/local/freesurfer/mni/bin
ENV MINC_LIB_DIR /usr/local/freesurfer/mni/lib
ENV MNI_DATAPATH /usr/local/freesurfer/mni/data
ENV FMRI_ANALYSIS_DIR /usr/local/freesurfer/fsfast
ENV PERL5LIB /usr/local/freesurfer/mni/lib/perl5/5.8.5
ENV MNI_PERL5LIB /usr/local/freesurfer/mni/lib/perl5/5.8.5
ENV PATH /usr/local/freesurfer/bin:/usr/local/freesurfer/fsfast/bin:/usr/local/freesurfer/tktools:/usr/local/freesurfer/mni/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PYTHONPATH=""

RUN apt-get install -y mrtrix
RUN apt-get install -y python-dev
RUN apt-get install -y python3-dev
RUN pip install --upgrade setuptools
RUN git clone https://github.com/neurospin/pyconnectome.git
RUN pip install --upgrade six
RUN cd pyconnectome && python setup.py develop --user && cd ..

RUN apt-get install -y freeglut3-dev
RUN git clone https://github.com/Danny02/OpenCTM.git
RUN apt-get install -y gtk-2.0
RUN cd OpenCTM && make -f Makefile.linux && cd ..
RUN cd OpenCTM && make -f Makefile.linux install && cd ..

RUN git clone https://github.com/neurospin/pyfreesurfer.git
RUN cd pyfreesurfer && python setup.py develop --user && cd ..

RUN git clone https://github.com/neurospin/pyconnectomist.git && cd pyconnectomist && python setup.py develop --user && cd ..

RUN apt-get update
RUN apt-get install -y fsl-5.0
ENV FSL_DIR=/usr/share/fsl/5.0
RUN . /usr/share/fsl/5.0/etc/fslconf/fsl.sh
RUN echo "vsprovatorova@gmail.com 36352 *CRfnS/ZgSXEo  FSDM9WOLRViz2" > /usr/local/freesurfer/license.txt
RUN apt-get install -y nano
