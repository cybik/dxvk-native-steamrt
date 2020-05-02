FROM dxvk_steamrt_base
RUN sudo apt-get install -y libmpc-dev libmpc2
COPY opt /opt