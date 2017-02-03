FROM ubuntu:trusty

RUN apt-get update  && apt-get install -y texlive-xetex texlive-latex-recommended texlive-latex-extra \
#    ttf-arphic-gbsn00lp ttf-arphic-ukai ttf-wqy-microhei ttf-wqy-zenhei
    latex-cjk-chinese \
    libglib2.0-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone git://github.com/fletcher/MultiMarkdown-5.git \
    && cd MultiMarkdown-5 \
    && ./update_submodules.sh \
    && ./link_git_modules \
    && ./update_git_modules \
    && make && cd build && make \
    && cp multimarkdown /bin
