FROM dxvk-steamrt-base
RUN sudo apt-get install -y libmpc-dev libmpc2
COPY opt /opt
