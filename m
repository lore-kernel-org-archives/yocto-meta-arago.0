Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 721F4529B5
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 19:20:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OJKY5V011352;
	Thu, 24 Apr 2014 14:20:34 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OJKYpa011227;
	Thu, 24 Apr 2014 14:20:34 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 14:20:34 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [oe-layersetup][PATCH 1/3] configs: move out old
	samples into denzil dir, update old release configs
Thread-Index: AQHPX+E1JOLssghHTUm4DtKiXrhggpshJLfQ
Date: Thu, 24 Apr 2014 19:20:33 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C68EA4F@DFLE08.ent.ti.com>
References: <1398359871-24257-1-git-send-email-denis@denix.org>
In-Reply-To: <1398359871-24257-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [oe-layersetup][PATCH 1/3] configs: move out old samples into denzil dir, update old release configs
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Apr 2014 19:20:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, April 24, 2014 12:18 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [oe-layersetup][PATCH 1/3] configs: move out old
> samples into denzil dir, update old release configs
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  configs/amsdk/amsdk-05.06.00.00-config.txt         |   2 +-
>  configs/mcsdk/mcsdk-03.00.00.03-config.txt         |   2 +-
>  configs/mcsdk/mcsdk-03.00.00.05-config.txt         |   4 +-
>  configs/mcsdk/mcsdk-03.00.00.06-config.txt         |   4 +-
>  configs/mcsdk/mcsdk-03.00.00.07-config.txt         |   4 +-
>  sample-files/bblayers-denzil.conf.sample           |   9 --
>  sample-files/denzil/bblayers-denzil.conf.sample    |   9 ++
>  sample-files/denzil/local-arago-linaro.conf.sample | 160
> +++++++++++++++++++++
>  sample-files/local-arago-linaro.conf.sample        | 160 ---------------=
------
>  9 files changed, 177 insertions(+), 177 deletions(-)  delete mode 100644
> sample-files/bblayers-denzil.conf.sample
>  create mode 100644 sample-files/denzil/bblayers-denzil.conf.sample
>  create mode 100644 sample-files/denzil/local-arago-linaro.conf.sample
>  delete mode 100644 sample-files/local-arago-linaro.conf.sample
>=20
> diff --git a/configs/amsdk/amsdk-05.06.00.00-config.txt
> b/configs/amsdk/amsdk-05.06.00.00-config.txt
> index a0d453a..bda8c46 100644
> --- a/configs/amsdk/amsdk-05.06.00.00-config.txt
> +++ b/configs/amsdk/amsdk-05.06.00.00-config.txt
> @@ -6,5 +6,5 @@ meta-arago,http://arago-project.org/git/projects/meta-
> arago-amsdk.git,amsdk-05.0
>  meta-openembedded,git://git.openembedded.org/meta-
> openembedded,denzil,e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f,layers=3Dto
> olchain-layer:meta-oe
>  meta-ti,http://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-
> 05.06.00.00-integration,amsdk-05.06.00.00-release,layers=3D
>  oe-core,git://git.openembedded.org/openembedded-
> core,denzil,c15fae372cf75403facc28cf76f973b1279425dd,layers=3Dmeta
> -OECORELAYERCONF=3D./sample-files/bblayers-denzil.conf.sample
> +OECORELAYERCONF=3D./sample-files/denzil/bblayers-denzil.conf.sample
>  OECORELOCALCONF=3D./sample-files/local-arago.conf.sample
> diff --git a/configs/mcsdk/mcsdk-03.00.00.03-config.txt
> b/configs/mcsdk/mcsdk-03.00.00.03-config.txt
> index 9afaf0e..0fdc3d0 100644
> --- a/configs/mcsdk/mcsdk-03.00.00.03-config.txt
> +++ b/configs/mcsdk/mcsdk-03.00.00.03-config.txt
> @@ -6,5 +6,5 @@ meta-arago,git://arago-project.org/git/meta-
> arago.git,master,2012.07,layers=3Dmeta
>  meta-ti,git://arago-project.org/git/meta-
> ti.git,denzil,f95b2e51ea8194b82d2476b338610782a83ce4de,layers=3D
>  meta-linaro,git://git.linaro.org/openembedded/meta-
> linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=3D
>  oe-core,git://git.openembedded.org/openembedded-
> core,denzil,741146fa90f28f7ce8d82ee7f7e254872d519724,layers=3Dmeta
> -OECORELAYERCONF=3D./sample-files/bblayers-denzil.conf.sample
> +OECORELAYERCONF=3D./sample-files/denzil/bblayers-denzil.conf.sample
>  OECORELOCALCONF=3D./sample-files/local-arago.conf.sample
> diff --git a/configs/mcsdk/mcsdk-03.00.00.05-config.txt
> b/configs/mcsdk/mcsdk-03.00.00.05-config.txt
> index 9fba566..77a09ed 100644
> --- a/configs/mcsdk/mcsdk-03.00.00.05-config.txt
> +++ b/configs/mcsdk/mcsdk-03.00.00.05-config.txt
> @@ -7,5 +7,5 @@ meta-openembedded,git://git.openembedded.org/meta-
> openembedded,denzil,e77646bc2c
>  meta-ti,git://arago-project.org/git/meta-
> ti.git,denzil,973138efa050a37462c5fbf0f8eeb5cfbdac478f,layers=3D
>  meta-linaro,git://git.linaro.org/openembedded/meta-
> linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=3D
>  oe-core,git://git.openembedded.org/openembedded-
> core,denzil,c15fae372cf75403facc28cf76f973b1279425dd,layers=3Dmeta
> -OECORELAYERCONF=3D./sample-files/bblayers-denzil.conf.sample
> -OECORELOCALCONF=3D./sample-files/local-arago-linaro.conf.sample
> +OECORELAYERCONF=3D./sample-files/denzil/bblayers-denzil.conf.sample
> +OECORELOCALCONF=3D./sample-files/denzil/local-arago-linaro.conf.sample
> diff --git a/configs/mcsdk/mcsdk-03.00.00.06-config.txt
> b/configs/mcsdk/mcsdk-03.00.00.06-config.txt
> index 624dd53..933ac1b 100644
> --- a/configs/mcsdk/mcsdk-03.00.00.06-config.txt
> +++ b/configs/mcsdk/mcsdk-03.00.00.06-config.txt
> @@ -7,5 +7,5 @@ meta-openembedded,git://git.openembedded.org/meta-
> openembedded,denzil,c0117f5ad7
>  meta-ti,git://arago-project.org/git/meta-
> ti.git,denzil,f4cc35d3ac44a29d3001a295a99f39ecf19fc9ca,layers=3D
>  meta-linaro,git://git.linaro.org/openembedded/meta-
> linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=3D
>  oe-core,git://git.openembedded.org/openembedded-
> core,denzil,0a9e8bf35afd5990c1b586bba5eb68f643458a4b,layers=3Dmeta
> -OECORELAYERCONF=3D./sample-files/bblayers-denzil.conf.sample
> -OECORELOCALCONF=3D./sample-files/local-arago-linaro.conf.sample
> +OECORELAYERCONF=3D./sample-files/denzil/bblayers-denzil.conf.sample
> +OECORELOCALCONF=3D./sample-files/denzil/local-arago-linaro.conf.sample
> diff --git a/configs/mcsdk/mcsdk-03.00.00.07-config.txt
> b/configs/mcsdk/mcsdk-03.00.00.07-config.txt
> index 29ade94..bab9705 100644
> --- a/configs/mcsdk/mcsdk-03.00.00.07-config.txt
> +++ b/configs/mcsdk/mcsdk-03.00.00.07-config.txt
> @@ -7,5 +7,5 @@ meta-openembedded,git://git.openembedded.org/meta-
> openembedded,denzil,c0117f5ad7
>  meta-ti,git://arago-project.org/git/meta-
> ti.git,denzil,2ef919df5cfb48755456251836d80083abc7dce7,layers=3D
>  meta-linaro,git://git.linaro.org/openembedded/meta-
> linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=3D
>  oe-core,git://git.openembedded.org/openembedded-
> core,denzil,0a9e8bf35afd5990c1b586bba5eb68f643458a4b,layers=3Dmeta
> -OECORELAYERCONF=3D./sample-files/bblayers-denzil.conf.sample
> -OECORELOCALCONF=3D./sample-files/local-arago-linaro.conf.sample
> +OECORELAYERCONF=3D./sample-files/denzil/bblayers-denzil.conf.sample
> +OECORELOCALCONF=3D./sample-files/denzil/local-arago-linaro.conf.sample
> diff --git a/sample-files/bblayers-denzil.conf.sample b/sample-files/bbla=
yers-
> denzil.conf.sample
> deleted file mode 100644
> index b1c3952..0000000
> --- a/sample-files/bblayers-denzil.conf.sample
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -# This template file was created by taking the oe-
> core/meta/conf/bblayers.conf -# file and removing the BBLAYERS section at
> the end.
> -
> -# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf -#
> changes incompatibly -LCONF_VERSION =3D "4"
> -
> -BBPATH =3D "${TOPDIR}"
> -BBFILES ?=3D ""
> diff --git a/sample-files/denzil/bblayers-denzil.conf.sample b/sample-
> files/denzil/bblayers-denzil.conf.sample
> new file mode 100644
> index 0000000..b1c3952
> --- /dev/null
> +++ b/sample-files/denzil/bblayers-denzil.conf.sample
> @@ -0,0 +1,9 @@
> +# This template file was created by taking the
> +oe-core/meta/conf/bblayers.conf # file and removing the BBLAYERS section
> at the end.
> +
> +# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf #
> +changes incompatibly LCONF_VERSION =3D "4"
> +
> +BBPATH =3D "${TOPDIR}"
> +BBFILES ?=3D ""
> diff --git a/sample-files/denzil/local-arago-linaro.conf.sample b/sample-
> files/denzil/local-arago-linaro.conf.sample
> new file mode 100644
> index 0000000..24d14dc
> --- /dev/null
> +++ b/sample-files/denzil/local-arago-linaro.conf.sample
> @@ -0,0 +1,160 @@
> +# CONF_VERSION is increased each time build/conf/ changes incompatibly
> +CONF_VERSION =3D "1"
> +
> +#
> +# Where to place downloads
> +#
> +# During a first build the system will download many different source
> +code # tarballs from various upstream projects. This can take a while,
> +particularly # if your network connection is slow. These are all stored
> +in DL_DIR. When # wiping and rebuilding you can preserve this directory
> +to speed up this part # of subsequent builds. This directory is safe to
> +share between multiple builds # on the same machine too.
> +DL_DIR =3D "${OEBASE}/downloads"
> +
> +#
> +# Where to place shared-state files
> +#
> +# BitBake has the capability to accelerate builds based on previously
> +built # output. This is done using "shared state" files which can be
> +thought of as # cache objects and this option determines where those fil=
es
> are placed.
> +#
> +# You can wipe out TMPDIR leaving this directory intact and the build
> +would # regenerate from these files if no changes were made to the
> configuration.
> +# If changes were made to the configuration, only shared state files
> +where the # state was still valid would be used (done using checksums).
> +SSTATE_DIR =3D "${OEBASE}/build/sstate-cache"
> +
> +#
> +# Shared-state files from other locations # # As mentioned above,
> +shared state files are prebuilt cache data objects which # can be used
> +to accelerate build time. This variable can be used to configure # the
> +system to search other mirror locations for these objects before it #
> +builds the data itself.
> +#
> +# This can be a filesystem directory, or a remote url such as http or ft=
p.
> +# These would contain the sstate-cache results from previous builds
> +(possibly # from other machines). This variable works like fetcher
> +MIRRORS/PREMIRRORS # and points to the cache locations to check for the
> shared objects.
> +#SSTATE_MIRRORS ?=3D "\
> +#file://.* http://someserver.tld/share/sstate/ \n \
> +#file://.* file:///some/local/dir/sstate/"
> +
> +#
> +# Where to place the build output
> +#
> +# This option specifies where the bulk of the building work should be
> +done and # where BitBake should place its temporary files and output.
> +Keep in mind that # this includes the extraction and compilation of
> +many applications and the toolchain # which can use Gigabytes of hard di=
sk
> space.
> +TMPDIR =3D "${OEBASE}/build/arago-tmp"
> +
> +#
> +# Machine Selection
> +#
> +# You need to select a specific machine to target the build with. There
> +are a selection # of emulated machines available which can boot and run =
in
> the QEMU emulator:
> +#
> +MACHINE ?=3D "arago"
> +
> +#
> +# Package Management configuration
> +#
> +# This variable lists which packaging formats to enable. Multiple
> +package backends # can be enabled at once and the first item listed in
> +the variable will be used # to generate the root filesystems.
> +# Options are:
> +#  - 'package_deb' for debian style deb files #  - 'package_ipk' for
> +ipk files are used by opkg (a debian style embedded package manager) #
> +- 'package_rpm' for rpm style packages # E.g.: PACKAGE_CLASSES ?=3D
> +"package_rpm package_deb package_ipk"
> +# We default to ipk:
> +PACKAGE_CLASSES ?=3D "package_ipk"
> +
> +#
> +# SDK/ADT target architecture
> +#
> +# This variable specified the architecture to build SDK/ADT items for
> +and means # you can build the SDK packages for architectures other than
> +the machine you are # running the build on (i.e. building i686 packages
> +on an x86_64 host._ # Supported values are i686 and x86_64 SDKMACHINE
> +?=3D "i686"
> +
> +#
> +# Extra image configuration defaults
> +#
> +# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added
> +to the generated # images. Some of these options are added to certain
> +image types automatically. The # variable can contain the following opti=
ons:
> +#  "dbg-pkgs"       - add -dbg packages for all installed packages
> +#                     (adds symbol information for debugging/profiling)
> +#  "dev-pkgs"       - add -dev packages for all installed packages
> +#                     (useful if you want to develop against libs in the=
 image)
> +#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
> +#  "tools-debug"    - add debugging tools (gdb, strace)
> +#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng
> +valgrind (x86 only)) #  "tools-testapps" - add useful testing tools (ts_=
print,
> aplay, arecord etc.)
> +#  "debug-tweaks"   - make an image suitable for development
> +#                     e.g. ssh root access has a blank password
> +# There are other application targets that can be used here too, see #
> +meta/classes/image.bbclass and meta/classes/core-image.bbclass for more
> details.
> +# We default to enabling the debugging tweaks.
> +EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> +
> +#
> +# Additional image features
> +#
> +# The following is a list of additional classes to use when building
> +images which # enable extra features. Some available options which can
> +be included in this variable # are:
> +#   - 'buildstats' collect build statistics
> +#   - 'image-mklibs' to reduce shared library files size for an image
> +#   - 'image-prelink' in order to prelink the filesystem image
> +#   - 'image-swab' to perform host system intrusion detection
> +# NOTE: if listing mklibs & prelink both, then make sure mklibs is
> +before prelink # NOTE: mklibs also needs to be explicitly enabled for a
> +given image, see local.conf.extended USER_CLASSES ?=3D "buildstats image=
-
> mklibs image-prelink"
> +
> +# By default disable interactive patch resolution (tasks will just fail =
instead):
> +PATCHRESOLVE =3D "noop"
> +
> +# Qemu 0.12.x is giving too much problems recently (2010.05), so
> +disable it for users ENABLE_BINARY_LOCALE_GENERATION =3D "0"
> +
> +# By default the machine configuration file sets the IMAGE_FSTYPES.
> +But if you # would like to add additional file system types you can
> +uncomment the # following line and add the additional IMAGE_FSTYPES you
> +want created # as part of the build flow.  Some common types are listed
> +below and you # can remove the ones you do not want.
> +# IMAGE_FSTYPES +=3D "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz t=
ar.bz2
> cpio"
> +
> +#
> +# Parallelism Options
> +#
> +# These two options control how much parallelism BitBake should use.
> +The first # option determines how many tasks bitbake should run in paral=
lel:
> +#
> +BB_NUMBER_THREADS =3D "1"
> +#
> +# The second option controls how many processes make should run in
> +parallel when # running compile tasks:
> +#
> +PARALLEL_MAKE =3D "-j 1"
> +#
> +# For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D
> "-j
> +4" would # be appropriate for example
> +
> +DISTRO   =3D "arago"
> +TOOLCHAIN_BRAND =3D "linaro"
> +
> +# Set terminal types by default it expects gnome-terminal # but we
> +chose xterm TERMCMD =3D "${XTERM_TERMCMD}"
> +TERMCMDRUN =3D "${XTERM_TERMCMDRUN}"
> +
> +# Don't generate the mirror tarball for SCM repos, the snapshot is
> +enough BB_GENERATE_MIRROR_TARBALLS =3D "0"
> +
> +# Uncomment this to remove work directory after packaging to save disk
> +space #INHERIT +=3D "rm_work"
> diff --git a/sample-files/local-arago-linaro.conf.sample b/sample-files/l=
ocal-
> arago-linaro.conf.sample
> deleted file mode 100644
> index 24d14dc..0000000
> --- a/sample-files/local-arago-linaro.conf.sample
> +++ /dev/null
> @@ -1,160 +0,0 @@
> -# CONF_VERSION is increased each time build/conf/ changes incompatibly -
> CONF_VERSION =3D "1"
> -
> -#
> -# Where to place downloads
> -#
> -# During a first build the system will download many different source co=
de -#
> tarballs from various upstream projects. This can take a while, particula=
rly -#
> if your network connection is slow. These are all stored in DL_DIR. When =
-#
> wiping and rebuilding you can preserve this directory to speed up this pa=
rt -#
> of subsequent builds. This directory is safe to share between multiple bu=
ilds -
> # on the same machine too.
> -DL_DIR =3D "${OEBASE}/downloads"
> -
> -#
> -# Where to place shared-state files
> -#
> -# BitBake has the capability to accelerate builds based on previously bu=
ilt -#
> output. This is done using "shared state" files which can be thought of a=
s -#
> cache objects and this option determines where those files are placed.
> -#
> -# You can wipe out TMPDIR leaving this directory intact and the build wo=
uld -
> # regenerate from these files if no changes were made to the configuratio=
n.
> -# If changes were made to the configuration, only shared state files whe=
re
> the -# state was still valid would be used (done using checksums).
> -SSTATE_DIR =3D "${OEBASE}/build/sstate-cache"
> -
> -#
> -# Shared-state files from other locations -# -# As mentioned above, shar=
ed
> state files are prebuilt cache data objects which -# can be used to accel=
erate
> build time. This variable can be used to configure -# the system to searc=
h
> other mirror locations for these objects before it -# builds the data its=
elf.
> -#
> -# This can be a filesystem directory, or a remote url such as http or ft=
p.
> -# These would contain the sstate-cache results from previous builds (pos=
sibly
> -# from other machines). This variable works like fetcher
> MIRRORS/PREMIRRORS -# and points to the cache locations to check for the
> shared objects.
> -#SSTATE_MIRRORS ?=3D "\
> -#file://.* http://someserver.tld/share/sstate/ \n \
> -#file://.* file:///some/local/dir/sstate/"
> -
> -#
> -# Where to place the build output
> -#
> -# This option specifies where the bulk of the building work should be do=
ne
> and -# where BitBake should place its temporary files and output. Keep in
> mind that -# this includes the extraction and compilation of many
> applications and the toolchain -# which can use Gigabytes of hard disk sp=
ace.
> -TMPDIR =3D "${OEBASE}/build/arago-tmp"
> -
> -#
> -# Machine Selection
> -#
> -# You need to select a specific machine to target the build with. There =
are a
> selection -# of emulated machines available which can boot and run in the
> QEMU emulator:
> -#
> -MACHINE ?=3D "arago"
> -
> -#
> -# Package Management configuration
> -#
> -# This variable lists which packaging formats to enable. Multiple packag=
e
> backends -# can be enabled at once and the first item listed in the varia=
ble
> will be used -# to generate the root filesystems.
> -# Options are:
> -#  - 'package_deb' for debian style deb files -#  - 'package_ipk' for ip=
k files are
> used by opkg (a debian style embedded package manager) -#  - 'package_rpm=
'
> for rpm style packages -# E.g.: PACKAGE_CLASSES ?=3D "package_rpm
> package_deb package_ipk"
> -# We default to ipk:
> -PACKAGE_CLASSES ?=3D "package_ipk"
> -
> -#
> -# SDK/ADT target architecture
> -#
> -# This variable specified the architecture to build SDK/ADT items for an=
d
> means -# you can build the SDK packages for architectures other than the
> machine you are -# running the build on (i.e. building i686 packages on a=
n
> x86_64 host._ -# Supported values are i686 and x86_64 -SDKMACHINE ?=3D
> "i686"
> -
> -#
> -# Extra image configuration defaults
> -#
> -# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added
> to the generated -# images. Some of these options are added to certain im=
age
> types automatically. The -# variable can contain the following options:
> -#  "dbg-pkgs"       - add -dbg packages for all installed packages
> -#                     (adds symbol information for debugging/profiling)
> -#  "dev-pkgs"       - add -dev packages for all installed packages
> -#                     (useful if you want to develop against libs in the=
 image)
> -#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
> -#  "tools-debug"    - add debugging tools (gdb, strace)
> -#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgri=
nd (x86
> only)) -#  "tools-testapps" - add useful testing tools (ts_print, aplay, =
arecord
> etc.)
> -#  "debug-tweaks"   - make an image suitable for development
> -#                     e.g. ssh root access has a blank password
> -# There are other application targets that can be used here too, see -#
> meta/classes/image.bbclass and meta/classes/core-image.bbclass for more
> details.
> -# We default to enabling the debugging tweaks.
> -EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> -
> -#
> -# Additional image features
> -#
> -# The following is a list of additional classes to use when building ima=
ges
> which -# enable extra features. Some available options which can be inclu=
ded
> in this variable -# are:
> -#   - 'buildstats' collect build statistics
> -#   - 'image-mklibs' to reduce shared library files size for an image
> -#   - 'image-prelink' in order to prelink the filesystem image
> -#   - 'image-swab' to perform host system intrusion detection
> -# NOTE: if listing mklibs & prelink both, then make sure mklibs is befor=
e
> prelink -# NOTE: mklibs also needs to be explicitly enabled for a given i=
mage,
> see local.conf.extended -USER_CLASSES ?=3D "buildstats image-mklibs image=
-
> prelink"
> -
> -# By default disable interactive patch resolution (tasks will just fail =
instead):
> -PATCHRESOLVE =3D "noop"
> -
> -# Qemu 0.12.x is giving too much problems recently (2010.05), so disable=
 it
> for users -ENABLE_BINARY_LOCALE_GENERATION =3D "0"
> -
> -# By default the machine configuration file sets the IMAGE_FSTYPES.  But=
 if
> you -# would like to add additional file system types you can uncomment t=
he
> -# following line and add the additional IMAGE_FSTYPES you want created -=
#
> as part of the build flow.  Some common types are listed below and you -#
> can remove the ones you do not want.
> -# IMAGE_FSTYPES +=3D "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz t=
ar.bz2
> cpio"
> -
> -#
> -# Parallelism Options
> -#
> -# These two options control how much parallelism BitBake should use. The
> first -# option determines how many tasks bitbake should run in parallel:
> -#
> -BB_NUMBER_THREADS =3D "1"
> -#
> -# The second option controls how many processes make should run in
> parallel when -# running compile tasks:
> -#
> -PARALLEL_MAKE =3D "-j 1"
> -#
> -# For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D
> "-j 4" would -# be appropriate for example
> -
> -DISTRO   =3D "arago"
> -TOOLCHAIN_BRAND =3D "linaro"
> -
> -# Set terminal types by default it expects gnome-terminal -# but we chos=
e
> xterm -TERMCMD =3D "${XTERM_TERMCMD}"
> -TERMCMDRUN =3D "${XTERM_TERMCMDRUN}"
> -
> -# Don't generate the mirror tarball for SCM repos, the snapshot is enoug=
h -
> BB_GENERATE_MIRROR_TARBALLS =3D "0"
> -
> -# Uncomment this to remove work directory after packaging to save disk
> space -#INHERIT +=3D "rm_work"
> --
> 1.9.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

