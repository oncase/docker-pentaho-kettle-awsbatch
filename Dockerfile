FROM oncase/pentaho-kettle:8.1

RUN sudo apt-get update && \
    sudo apt-get install -y \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && sudo apt-get clean

RUN sudo python3 -m pip --no-cache-dir install --upgrade awscli 

RUN git config --global credential.helper '!aws codecommit credential-helper $@' && \
    git config --global credential.UseHttpPath true

# Adds connections config files
ADD --chown=pentaho:pentaho scripts/* ./ 
