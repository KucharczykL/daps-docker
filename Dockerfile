FROM opensuse/tumbleweed
LABEL maintainer="lukas.kucharczyk@suse.com"
RUN zypper ar -G https://download.opensuse.org/repositories/Documentation:/Tools/openSUSE_Tumbleweed/Documentation:Tools.repo && zypper ref && zypper in -y --no-recommends daps
RUN zypper in -y tar
WORKDIR /files
CMD sleep infinity
