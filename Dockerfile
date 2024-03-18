FROM continuumio/miniconda3:24.1.2-0 as base

RUN conda install -c conda-forge -c pypi -y keplergl==0.3.2 \
                                            pydeck==0.8.0 \
                                            jupyterlab==3.6.3 \
                                            ipython==8.15.0 \
                                            ipywidgets==7.8 \
                                            widgetsnbextension==3.6.6
                                            # nodejs==18.14.2

FROM base

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies - this will install in the `base` conda env
# RUN conda install -c conda-forge -c pypi --file requirements.txt
RUN /opt/conda/bin/pip install -r requirements.txt

COPY . .

# EXPOSE port
