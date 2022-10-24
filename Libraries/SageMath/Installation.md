# [Installation](https://doc.sagemath.org/html/en/installation/index.html)
## Linux
~4 GB

- [conda-forge](https://doc.sagemath.org/html/en/installation/conda.html)  
  `mamba create -n sage sage python=3.10`

  `mamba activate sage`
- <details><summary><code>apt install sagemath</code></summary>

  ```sh
  $ sudo apt install sagemath
  Reading package lists... Done
  Building dependency tree
  Reading state information... Done
  The following additional packages will be installed:
    4ti2 bzip2-doc ca-certificates-java cysignals-tools cython3 default-jre default-jre-headless docutils-common dvisvgm
    ecl eclib-tools fflas-ffpack fflas-ffpack-common flintqs fonts-dejavu-extra fonts-droid-fallback fonts-font-awesome
    fonts-glyphicons-halflings fonts-lmodern fonts-lyx fonts-mathjax fonts-mathjax-extras fonts-noto-mono fonts-texgyre
    fonts-urw-base35 gap gap-alnuth gap-atlasrep gap-autpgrp gap-character-tables gap-core gap-dev gap-doc gap-factint
    gap-gapdoc gap-io gap-libs gap-online-help gap-polycyclic gap-primgrp gap-smallgrp gap-table-of-marks gap-transgrp
    gfan gfortran gfortran-9 ghostscript gmp-ecm gsfonts icu-devtools imagemagick imagemagick-6-common imagemagick-6.q16
    ipython3 java-common jmol jupyter-client jupyter-core jupyter-nbextension-jupyter-js-widgets jupyter-notebook lcalc
    libamd2 libapache-pom-java libatk-wrapper-java libatk-wrapper-java-jni libatlas3-base libatomic-ops-dev
    libauthen-sasl-perl libblas-dev libblas3 libbraiding0 libbrial-groebner3 libbrial3 libbz2-dev libcamd2 libccolamd2
    libcdd-doc libcdd-tools libcdd0d libcholmod3 libcliquer1 libcolamd2 libcommons-cli-java libcommons-logging-java
    libcommons-parent-java libdata-dump-perl libdjvulibre-text libdjvulibre21 libdsdp-5.8gf libeantic0 libec5 libecm1
    libencode-locale-perl libfftw3-double3 libfile-basedir-perl libfile-desktopentry-perl libfile-listing-perl
    libfile-mimeinfo-perl libflint-2.5.2 libflint-arb2 libfltk-gl1.3 libfltk-images1.3 libfltk1.3 libfont-afm-perl
    libfontbox-java libfplll6 libgc-dev libgf2x3 libgfortran-9-dev libgfortran5 libgiac0 libgivaro-dev libgivaro9
    libgl2ps1.4 libglpk40 libgs9 libgs9-common libgsl23 libgslcblas0 libharfbuzz-icu0 libhomfly0 libhtml-form-perl
    libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl libhttp-cookies-perl
    libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl libicu-dev libidn11 libijs-0.35
    libilmbase24 libimagequant0 libiml0 libio-html-perl libio-socket-ssl-perl libio-stringy-perl
    libipc-system-simple-perl libjbig2dec0 libjmol-java libjpeg-dev libjpeg-turbo8-dev libjpeg8-dev libjs-backbone
    libjs-bootstrap libjs-bootstrap-tour libjs-codemirror libjs-es6-promise libjs-jed libjs-jquery-typeahead
    libjs-jquery-ui libjs-marked libjs-mathjax libjs-moment libjs-requirejs libjs-requirejs-text libjs-text-encoding
    libjs-three libjs-xterm libkpathsea6 liblapack-dev liblapack3 liblbfgsb0 liblfunction0 liblqr-1-0 liblrcalc1
    liblwp-mediatypes-perl liblwp-protocol-https-perl liblzma-dev libm4ri-0.0.20200125 libm4rie-0.0.20200125
    libmagickcore-6.q16-6 libmagickcore-6.q16-6-extra libmagickwand-6.q16-6 libmailtools-perl libmetis5 libmpfi0
    libnaga-java libnauty2 libnet-dbus-perl libnet-http-perl libnet-smtp-ssl-perl libnet-ssleay-perl libnetpbm10
    libnorm1 libnormaliz3 libntl43 libopenexr24 libpaper-utils libpaper1 libpari-gmp-tls6 libpcre16-3 libpcre2-16-0
    libpcre2-32-0 libpcre2-dev libpcre2-posix2 libpcre3-dev libpcre32-3 libpcrecpp0v5 libpdfbox-java libpgm-5.2-0
    libplanarity0 libpng-dev libpng-tools libppl14 libptexenc1 libpynac18py3 libratpoints-2.1.3 libreadline-dev librw0
    libsingular4m1 libsuitesparseconfig5 libsymmetrica2 libsynctex2 libtachyon-mt-0 libteckit0 libtexlua53 libtexluajit2
    libtie-ixhash-perl libtimedate-perl libtry-tiny-perl libumfpack5 liburi-perl libwebpdemux2 libwebpmux3 libwmf0.2-7
    libwoff1 libwww-perl libwww-robotrules-perl libx11-protocol-perl libxml-parser-perl libxml-twig-perl
    libxml-xpathengine-perl libzmq5 libzn-poly-0.9 libzzip-0-13 lmodern maxima-sage maxima-sage-doc maxima-sage-share
    nauty netpbm normaliz normaliz-bin openjdk-11-jre openjdk-11-jre-headless palp pandoc pandoc-data pari-doc
    pari-elldata pari-galdata pari-gp pari-seadata perl-openssl-defaults preview-latex-style ps2eps
    python-babel-localedata python-gmpy2-common python-matplotlib-data python-ppl-doc python3-alabaster
    python3-atomicwrites python3-babel python3-backcall python3-bleach python3-brial python3-cvxopt python3-cycler
    python3-cypari2 python3-cysignals-pari python3-decorator python3-defusedxml python3-docutils python3-fpylll
    python3-future python3-gmpy2 python3-html5lib python3-imagesize python3-ipykernel python3-ipython
    python3-ipython-genutils python3-ipywidgets python3-itsdangerous python3-jedi python3-jupyter-client
    python3-jupyter-core python3-kiwisolver python3-matplotlib python3-mistune python3-mpmath python3-nbconvert
    python3-nbformat python3-networkx python3-nose python3-notebook python3-numpy python3-olefile python3-openid
    python3-pandocfilters python3-parso python3-path python3-pickleshare python3-pil python3-pkgconfig python3-ppl
    python3-prometheus-client python3-prompt-toolkit python3-psutil python3-pyinotify python3-pytest python3-roman
    python3-rpy2 python3-sagenb-export python3-sagetex python3-scipy python3-send2trash python3-setuptools-scm
    python3-simplegeneric python3-singledispatch python3-snowballstemmer python3-sphinx python3-stemmer python3-sympy
    python3-terminado python3-testpath python3-tornado python3-traitlets python3-tz python3-tzlocal python3-vcversioner
    python3-wcwidth python3-webencodings python3-werkzeug python3-widgetsnbextension python3-zmq r-base-core r-base-dev
    r-cran-boot r-cran-class r-cran-cluster r-cran-codetools r-cran-foreign r-cran-kernsmooth r-cran-lattice r-cran-mass
    r-cran-matrix r-cran-mgcv r-cran-nlme r-cran-nnet r-cran-rpart r-cran-spatial r-cran-survival r-doc-html
    r-recommended rubiks sagemath-common sagemath-database-conway-polynomials sagemath-database-elliptic-curves
    sagemath-database-graphs sagemath-database-mutually-combinatorial-designs sagemath-database-polytopes sagemath-doc
    sagemath-jupyter sagetex sgml-base singular singular-data singular-doc singular-modules singular-ui sphinx-common
    sqlite3 surf-alggeo surf-alggeo-nox sympow sympow-data t1utils tachyon tachyon-bin-nox tcl tcl8.6 tex-common
    tex-gyre texlive-base texlive-binaries texlive-font-utils texlive-fonts-recommended texlive-latex-base
    texlive-latex-extra texlive-latex-recommended texlive-pictures texlive-plain-generic tipa tk tk8.6
    ttf-bitstream-vera x11-xserver-utils xbitmaps xcas xdg-utils xfonts-encodings xfonts-utils xml-core xterm
  Suggested packages:
    4ti2-doc python-cysignals-doc cython-doc slime ecl-doc fflas-ffpack-dev-doc fflas-ffpack-user-doc fonts-noto
    fonts-freefont-otf | fonts-freefont-ttf gap-smallgrp-extra gap-design gap-float gap-grape gap-guava gap-laguna
    gap-openmath gap-radiroot gap-scscp gap-sonata gap-toric gap-pkg-browse gfortran-multilib gfortran-doc
    gfortran-9-multilib gfortran-9-doc libcoarrays-dev ghostscript-x imagemagick-doc autotrace cups-bsd | lpr | lprng
    enscript ffmpeg gimp gnuplot grads hp2xx html2ps libwmf-bin mplayer povray radiance sane-utils transfig ufraw-batch
    libdigest-hmac-perl libgssapi-perl liblapack-doc libavalon-framework-java libcommons-logging-java-doc
    libexcalibur-logkit-java liblog4j1.2-java libfftw3-bin libfftw3-dev giac-doc libgivaro-doc libiodbc2-dev
    default-libmysqlclient-dev gsl-ref-psdoc | gsl-doc-pdf | gsl-doc-info | gsl-ref-html icu-doc libjmol-java-doc
    libjs-jquery-lazyload libjs-json libjs-jquery-ui-docs fonts-stix libjs-mathjax-doc libcrypt-ssleay-perl liblzma-doc
    inkscape libjxr-tools libmpfi-doc nauty-doc readline-doc symmetrica-doc tachyon-doc libwmf0.2-7-gtk
    libauthen-ntlm-perl libunicode-map8-perl libunicode-string-perl xml-twig-tools normaliz-doc libnss-mdns
    fonts-ipafont-gothic fonts-ipafont-mincho fonts-wqy-microhei | fonts-wqy-zenhei fonts-indic texlive-xetex
    texlive-luatex pandoc-citeproc context wkhtmltopdf librsvg2-bin groff ghc nodejs php python node-katex pari-gp2c
    pari-galpol python-bleach-doc python-cvxopt-doc python-cycler-doc docutils-doc fonts-linuxlibertine
    | ttf-linux-libertine texlive-lang-french python-fpylll-doc python-future-doc python-gmpy2-doc python3-genshi
    python3-lxml python-ipython-doc python-ipywidgets-doc dvipng python-matplotlib-doc python3-cairocffi
    python3-gi-cairo python3-gobject python3-pyqt5 python3-sip texlive-extra-utils ttf-staypuft python-mpmath-doc
    python-nbconvert-doc python-networkx-doc python3-gdal python3-pygraphviz | python3-pydot python-nose-doc
    python-notebook-doc python-numpy-doc python3-numpy-dbg python-pil-doc python3-pil-dbg python-psutil-doc
    python-pyinotify-doc python-rpy-docs sagetex-doc python-scipy-doc latexmk python3-sphinx-rtd-theme sphinx-doc
    texlive-fonts-extra python-sympy-doc python3-pycurl python-tornado-doc mercurial python-werkzeug-doc
    python3-termcolor python3-watchdog elpa-ess r-doc-info | r-doc-pdf r-mathlib r-base-html texinfo dot2tex
    sgml-base-doc pdf-viewer sqlite3-doc surf-alggeo-doc graphicsmagick-imagemagick-compat tcl-tclreadline debhelper
    perl-tk xpdf | pdf-viewer xzdec lcdf-typetools psutils texlive-fonts-recommended-doc texlive-latex-base-doc
    icc-profiles libfile-which-perl libspreadsheet-parseexcel-perl texlive-latex-extra-doc texlive-latex-recommended-doc
    texlive-pstricks prerex ruby-tcltk | libtcltk-ruby texlive-pictures-doc vprerex nickle cairo-5c xorg-docs-core hevea
    xfonts-cyrillic
  The following NEW packages will be installed:
    4ti2 bzip2-doc ca-certificates-java cysignals-tools cython3 default-jre default-jre-headless docutils-common dvisvgm
    ecl eclib-tools fflas-ffpack fflas-ffpack-common flintqs fonts-dejavu-extra fonts-droid-fallback fonts-font-awesome
    fonts-glyphicons-halflings fonts-lmodern fonts-lyx fonts-mathjax fonts-mathjax-extras fonts-noto-mono fonts-texgyre
    fonts-urw-base35 gap gap-alnuth gap-atlasrep gap-autpgrp gap-character-tables gap-core gap-dev gap-doc gap-factint
    gap-gapdoc gap-io gap-libs gap-online-help gap-polycyclic gap-primgrp gap-smallgrp gap-table-of-marks gap-transgrp
    gfan gfortran gfortran-9 ghostscript gmp-ecm gsfonts icu-devtools imagemagick imagemagick-6-common imagemagick-6.q16
    ipython3 java-common jmol jupyter-client jupyter-core jupyter-nbextension-jupyter-js-widgets jupyter-notebook lcalc
    libamd2 libapache-pom-java libatk-wrapper-java libatk-wrapper-java-jni libatlas3-base libatomic-ops-dev
    libauthen-sasl-perl libblas-dev libblas3 libbraiding0 libbrial-groebner3 libbrial3 libbz2-dev libcamd2 libccolamd2
    libcdd-doc libcdd-tools libcdd0d libcholmod3 libcliquer1 libcolamd2 libcommons-cli-java libcommons-logging-java
    libcommons-parent-java libdata-dump-perl libdjvulibre-text libdjvulibre21 libdsdp-5.8gf libeantic0 libec5 libecm1
    libencode-locale-perl libfftw3-double3 libfile-basedir-perl libfile-desktopentry-perl libfile-listing-perl
    libfile-mimeinfo-perl libflint-2.5.2 libflint-arb2 libfltk-gl1.3 libfltk-images1.3 libfltk1.3 libfont-afm-perl
    libfontbox-java libfplll6 libgc-dev libgf2x3 libgfortran-9-dev libgfortran5 libgiac0 libgivaro-dev libgivaro9
    libgl2ps1.4 libglpk40 libgs9 libgs9-common libgsl23 libgslcblas0 libharfbuzz-icu0 libhomfly0 libhtml-form-perl
    libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl libhttp-cookies-perl
    libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl libicu-dev libidn11 libijs-0.35
    libilmbase24 libimagequant0 libiml0 libio-html-perl libio-socket-ssl-perl libio-stringy-perl
    libipc-system-simple-perl libjbig2dec0 libjmol-java libjpeg-dev libjpeg-turbo8-dev libjpeg8-dev libjs-backbone
    libjs-bootstrap libjs-bootstrap-tour libjs-codemirror libjs-es6-promise libjs-jed libjs-jquery-typeahead
    libjs-jquery-ui libjs-marked libjs-mathjax libjs-moment libjs-requirejs libjs-requirejs-text libjs-text-encoding
    libjs-three libjs-xterm libkpathsea6 liblapack-dev liblapack3 liblbfgsb0 liblfunction0 liblqr-1-0 liblrcalc1
    liblwp-mediatypes-perl liblwp-protocol-https-perl liblzma-dev libm4ri-0.0.20200125 libm4rie-0.0.20200125
    libmagickcore-6.q16-6 libmagickcore-6.q16-6-extra libmagickwand-6.q16-6 libmailtools-perl libmetis5 libmpfi0
    libnaga-java libnauty2 libnet-dbus-perl libnet-http-perl libnet-smtp-ssl-perl libnet-ssleay-perl libnetpbm10
    libnorm1 libnormaliz3 libntl43 libopenexr24 libpaper-utils libpaper1 libpari-gmp-tls6 libpcre16-3 libpcre2-16-0
    libpcre2-32-0 libpcre2-dev libpcre2-posix2 libpcre3-dev libpcre32-3 libpcrecpp0v5 libpdfbox-java libpgm-5.2-0
    libplanarity0 libpng-dev libpng-tools libppl14 libptexenc1 libpynac18py3 libratpoints-2.1.3 libreadline-dev librw0
    libsingular4m1 libsuitesparseconfig5 libsymmetrica2 libsynctex2 libtachyon-mt-0 libteckit0 libtexlua53 libtexluajit2
    libtie-ixhash-perl libtimedate-perl libtry-tiny-perl libumfpack5 liburi-perl libwebpdemux2 libwebpmux3 libwmf0.2-7
    libwoff1 libwww-perl libwww-robotrules-perl libx11-protocol-perl libxml-parser-perl libxml-twig-perl
    libxml-xpathengine-perl libzmq5 libzn-poly-0.9 libzzip-0-13 lmodern maxima-sage maxima-sage-doc maxima-sage-share
    nauty netpbm normaliz normaliz-bin openjdk-11-jre openjdk-11-jre-headless palp pandoc pandoc-data pari-doc
    pari-elldata pari-galdata pari-gp pari-seadata perl-openssl-defaults preview-latex-style ps2eps
    python-babel-localedata python-gmpy2-common python-matplotlib-data python-ppl-doc python3-alabaster
    python3-atomicwrites python3-babel python3-backcall python3-bleach python3-brial python3-cvxopt python3-cycler
    python3-cypari2 python3-cysignals-pari python3-decorator python3-defusedxml python3-docutils python3-fpylll
    python3-future python3-gmpy2 python3-html5lib python3-imagesize python3-ipykernel python3-ipython
    python3-ipython-genutils python3-ipywidgets python3-itsdangerous python3-jedi python3-jupyter-client
    python3-jupyter-core python3-kiwisolver python3-matplotlib python3-mistune python3-mpmath python3-nbconvert
    python3-nbformat python3-networkx python3-nose python3-notebook python3-numpy python3-olefile python3-openid
    python3-pandocfilters python3-parso python3-path python3-pickleshare python3-pil python3-pkgconfig python3-ppl
    python3-prometheus-client python3-prompt-toolkit python3-psutil python3-pyinotify python3-pytest python3-roman
    python3-rpy2 python3-sagenb-export python3-sagetex python3-scipy python3-send2trash python3-setuptools-scm
    python3-simplegeneric python3-singledispatch python3-snowballstemmer python3-sphinx python3-stemmer python3-sympy
    python3-terminado python3-testpath python3-tornado python3-traitlets python3-tz python3-tzlocal python3-vcversioner
    python3-wcwidth python3-webencodings python3-werkzeug python3-widgetsnbextension python3-zmq r-base-core r-base-dev
    r-cran-boot r-cran-class r-cran-cluster r-cran-codetools r-cran-foreign r-cran-kernsmooth r-cran-lattice r-cran-mass
    r-cran-matrix r-cran-mgcv r-cran-nlme r-cran-nnet r-cran-rpart r-cran-spatial r-cran-survival r-doc-html
    r-recommended rubiks sagemath sagemath-common sagemath-database-conway-polynomials sagemath-database-elliptic-curves
    sagemath-database-graphs sagemath-database-mutually-combinatorial-designs sagemath-database-polytopes sagemath-doc
    sagemath-jupyter sagetex sgml-base singular singular-data singular-doc singular-modules singular-ui sphinx-common
    sqlite3 surf-alggeo surf-alggeo-nox sympow sympow-data t1utils tachyon tachyon-bin-nox tcl tcl8.6 tex-common
    tex-gyre texlive-base texlive-binaries texlive-font-utils texlive-fonts-recommended texlive-latex-base
    texlive-latex-extra texlive-latex-recommended texlive-pictures texlive-plain-generic tipa tk tk8.6
    ttf-bitstream-vera x11-xserver-utils xbitmaps xcas xdg-utils xfonts-encodings xfonts-utils xml-core xterm
  0 upgraded, 409 newly installed, 0 to remove and 0 not upgraded.
  Need to get 725 MB of archives.
  After this operation, 4141 MB of additional disk space will be used.
  Do you want to continue? [Y/n]
  ```
  - `ModuleNotFoundError: No module named 'sage'`  
    [ImportError: No module named 'sage' - ASKSAGE: Sage Q&A Forum](https://ask.sagemath.org/question/34416/importerror-no-module-named-sage/)
  </details>

## Windows
[SageMath for Windows](https://github.com/sagemath/sage-windows)