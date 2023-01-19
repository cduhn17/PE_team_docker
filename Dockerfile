FROM postgres

ARG USER=pe_reports
#RUN useradd -rm -d /home/$USER -s /bin/bash -p order1030 -g root -G sudo -u 1001 $USER
RUN useradd -ms /bin/bash $USER
USER $USER
WORKDIR /home/$USER
RUN mkdir /myvol
RUN echo "Hellow World" > /myvol/greeting

#SHELL ["/bin/bash", "-o", "pipefail", "-c"]
#RUN echo '$USER:$USER' | chpasswd