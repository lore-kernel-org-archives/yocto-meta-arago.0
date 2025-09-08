Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29670CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 09:08:03 +0000 (UTC)
Subject: Re: [oe-layersetup][master][PATCH] processor-sdk: Add new configs for AM62P PG.12 EA Release
To: meta-arago@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.9)
X-Originating-Platform: Linux Firefox 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 08 Sep 2025 02:08:02 -0700
References: <CADL8D3ZNT4FPD-OhGwhW1Li9syWRvoyYZhH2Mv3nqOK5E_-R7w@mail.gmail.com>
In-Reply-To: <CADL8D3ZNT4FPD-OhGwhW1Li9syWRvoyYZhH2Mv3nqOK5E_-R7w@mail.gmail.com>
Message-ID: <1657.1757322482508837949@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Sep 2025 09:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16542

Hi Jon,

On Fri, Sep  5, 2025 at 09:13 PM, Jon Cormier wrote:

>
> Is there going to be a non chromium version of this config file?
>=20
> Note for the AM62x this also includes the pru fix, mentioned here:
> https://e2e.ti.com/support/processors-group/processors/f/processors-forum=
/1494495/faq-am62x-am64x-how-to-enable-pru-rpmsg-on-processor-sdk-linux-11-=
0
>=20

Since this is a EA release, only minimal configs are pushed here. We are pl=
anning to do a public ti.com release on Oct 10, where all the combinations =
of configs are pushed here.
Meanwhile you can comment the meta-browser layer to get the non chromium co=
nfigs.

- Jeevan
>=20
> On Fri, Sep 5, 2025 at 3:58=E2=80=AFAM Jeevan via lists.yoctoproject.org
> <j-sahu=3Dti.com@lists.yoctoproject.org> wrote:
> >
> > - Add processor-sdk-scarthgap-chromium-11.01.12.10-config
> > used for building AM62P.
> >
> > Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> > ---
> >  ...scarthgap-chromium-11.01.12.10-config.json | 158 ++++++++++++++++
> >  .../bblayers.conf.sample                      |  35 ++++
> >  .../conf-notes.txt                            |  22 +++
> >  .../conf-summary.txt                          |   1 +
> >  .../local.conf.sample                         | 175 ++++++++++++++++++
> >  ...-scarthgap-chromium-11.01.12.10-config.txt |  21 +++
> >  ...-scarthgap-chromium-11.01.12.10-config.yml |  96 ++++++++++
> >  ...-scarthgap-chromium-11.01.12.10-config.xml |  86 +++++++++
> >  8 files changed, 594 insertions(+)
> >  create mode 100644
> bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-=
config.json
> >  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10=
-config/bblayers.conf.sample
> >  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10=
-config/conf-notes.txt
> >  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10=
-config/conf-summary.txt
> >  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10=
-config/local.conf.sample
> >  create mode 100644
> configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config=
.txt
> >  create mode 100644
> kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.yml
> >  create mode 100644
> src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-co=
nfig.xml
> >
> > diff --git
> b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.1=
0-config.json
> > new file mode 100644
> > index 0000000..1036166
> > --- /dev/null
> > +++
> b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.1=
0-config.json
> > @@ -0,0 +1,158 @@
> > +{
> > +  "version": "1.0",
> > +  "description": "TI Processor SDK vchromium-11.01.12.10",
> > +  "sources": {
> > +    "oe-layersetup": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://git.ti.com/git/arago-project/oe-layersetup=
.git"
> > +          }
> > +        },
> > +        "rev": "master"
> > +      },
> > +      "path": "oe-layersetup"
> > +    },
> > +    "bitbake": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://git.openembedded.org/bitbake"
> > +          }
> > +        },
> > +        "rev": "2.8"
> > +      },
> > +      "path": "bitbake"
> > +    },
> > +    "meta-tisdk": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://github.com/TexasInstruments/meta-tisdk.git=
"
> > +          }
> > +        },
> > +        "rev": "scarthgap"
> > +      },
> > +      "path": "meta-tisdk"
> > +    },
> > +    "meta-arago": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://git.yoctoproject.org/meta-arago"
> > +          }
> > +        },
> > +        "rev": "scarthgap"
> > +      },
> > +      "path": "meta-arago"
> > +    },
> > +    "meta-browser": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://github.com/OSSystems/meta-browser.git"
> > +          }
> > +        },
> > +        "rev": "master"
> > +      },
> > +      "path": "meta-browser"
> > +    },
> > +    "meta-qt6": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://code.qt.io/yocto/meta-qt6.git"
> > +          }
> > +        },
> > +        "rev": "6.9"
> > +      },
> > +      "path": "meta-qt6"
> > +    },
> > +    "meta-virtualization": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://git.yoctoproject.org/meta-virtualization"
> > +          }
> > +        },
> > +        "rev": "scarthgap"
> > +      },
> > +      "path": "meta-virtualization"
> > +    },
> > +    "meta-openembedded": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://git.openembedded.org/meta-openembedded"
> > +          }
> > +        },
> > +        "rev": "scarthgap"
> > +      },
> > +      "path": "meta-openembedded"
> > +    },
> > +    "meta-lts-mixins": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
> > +          }
> > +        },
> > +        "rev": "scarthgap/rust"
> > +      },
> > +      "path": "meta-lts-mixins"
> > +    },
> > +    "meta-ti": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://git.yoctoproject.org/meta-ti"
> > +          }
> > +        },
> > +        "rev": "scarthgap"
> > +      },
> > +      "path": "meta-ti"
> > +    },
> > +    "meta-arm": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://git.yoctoproject.org/meta-arm"
> > +          }
> > +        },
> > +        "rev": "scarthgap"
> > +      },
> > +      "path": "meta-arm"
> > +    },
> > +    "meta-clang": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://github.com/kraj/meta-clang"
> > +          }
> > +        },
> > +        "rev": "scarthgap"
> > +      },
> > +      "path": "meta-clang"
> > +    },
> > +    "oe-core": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://git.openembedded.org/openembedded-core"
> > +          }
> > +        },
> > +        "rev": "scarthgap"
> > +      },
> > +      "path": "oe-core"
> > +    }
> > +  },
> > +  "configuration": {
> > +    "bitbake-setup": {
> > +      "default": {
> > +        "description": "Default build configuration",
> > +         "template":
> "oe-layersetup-processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10=
-config",
> > +         "targets": [ "bitbake -k tisdk-default-image" ]
> > +      }
> > +    }
> > +  }
> > +}
> > diff --git
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/bblayers.conf.sample
> > new file mode 100644
> > index 0000000..340048b
> > --- /dev/null
> > +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/bblayers.conf.sample
> > @@ -0,0 +1,35 @@
> > +# This template file was created by taking the
> oe-core/meta/conf/bblayers.conf
> > +# file and removing the BBLAYERS section at the end.
> > +
> > +# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> > +# changes incompatibly
> > +LCONF_VERSION =3D "5"
> > +
> > +BBPATH =3D "${TOPDIR}"
> > +BBFILES ?=3D ""
> > +
> > +BBLAYERS ?=3D " \
> > +    ##OEROOT##/../meta-tisdk/meta-ti-foundational
> > +    ##OEROOT##/../meta-tisdk/meta-ti-ml
> > +    ##OEROOT##/../meta-arago/meta-arago-distro
> > +    ##OEROOT##/../meta-arago/meta-arago-extras
> > +    ##OEROOT##/../meta-arago/meta-arago-test
> > +    ##OEROOT##/../meta-browser/meta-chromium
> > +    ##OEROOT##/../meta-qt6
> > +    ##OEROOT##/../meta-virtualization
> > +    ##OEROOT##/../meta-openembedded/meta-networking
> > +    ##OEROOT##/../meta-openembedded/meta-python
> > +    ##OEROOT##/../meta-openembedded/meta-oe
> > +    ##OEROOT##/../meta-openembedded/meta-gnome
> > +    ##OEROOT##/../meta-openembedded/meta-filesystems
> > +    ##OEROOT##/../meta-openembedded/meta-multimedia
> > +    ##OEROOT##/../meta-lts-mixins
> > +    ##OEROOT##/../meta-ti/meta-ti-extras
> > +    ##OEROOT##/../meta-ti/meta-beagle
> > +    ##OEROOT##/../meta-ti/meta-ti-bsp
> > +    ##OEROOT##/../meta-arm/meta-arm
> > +    ##OEROOT##/../meta-arm/meta-arm-toolchain
> > +    ##OEROOT##/../meta-clang
> > +    ##OEROOT##/../oe-core/meta
> > +    ##OEROOT##/../oe-layersetup
> > +"
> > diff --git
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/conf-notes.txt
> > new file mode 100644
> > index 0000000..1880460
> > --- /dev/null
> > +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/conf-notes.txt
> > @@ -0,0 +1,22 @@
> > +
> > +### Shell environment set up for builds. ###
> > +
> > +You can now run 'bitbake <target>'
> > +
> > +If you have not set MACHINE in your local.conf you can run
> > +'MACHINE=3Dxxxxx bitbake <target>'
> > +
> > +Common targets are:
> > +    tisdk-default-image
> > +    tisdk-base-image
> > +    tisdk-bootstrap-base-image
> > +    tisdk-bootstrap-image
> > +    tisdk-thinlinux-image
> > +    tisdk-tiny-image
> > +
> > +You can also run generated qemu images with a command like 'runqemu
> qemux86-64'.
> > +
> > +Other commonly useful commands are:
> > + - 'devtool' and 'recipetool' handle common recipe tasks
> > + - 'bitbake-layers' handles common layer tasks
> > + - 'oe-pkgdata-util' handles common target package tasks
> > diff --git
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/conf-summary.txt
> > new file mode 100644
> > index 0000000..bd63f9a
> > --- /dev/null
> > +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/conf-summary.txt
> > @@ -0,0 +1 @@
> > +TI Processor SDK vchromium-11.01.12.10
> > diff --git
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/local.conf.sample
> > new file mode 100644
> > index 0000000..8ad6f26
> > --- /dev/null
> > +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/local.conf.sample
> > @@ -0,0 +1,175 @@
> > +# CONF_VERSION is increased each time build/conf/ changes incompatibly
> > +CONF_VERSION =3D "2"
> > +
> > +#
> > +# Where to place downloads
> > +#
> > +# During a first build the system will download many different source =
code
> > +# tarballs from various upstream projects. This can take a while,
> particularly
> > +# if your network connection is slow. These are all stored in DL_DIR. =
When
> > +# wiping and rebuilding you can preserve this directory to speed up th=
is
> part
> > +# of subsequent builds. This directory is safe to share between multip=
le
> builds
> > +# on the same machine too.
> > +DL_DIR =3D "${TOPDIR}/../downloads"
> > +
> > +#
> > +# Where to place shared-state files
> > +#
> > +# BitBake has the capability to accelerate builds based on previously =
built
> > +# output. This is done using "shared state" files which can be thought=
 of
> as
> > +# cache objects and this option determines where those files are place=
d.
> > +#
> > +# You can wipe out TMPDIR leaving this directory intact and the build =
would
> > +# regenerate from these files if no changes were made to the configura=
tion.
> > +# If changes were made to the configuration, only shared state files w=
here
> the
> > +# state was still valid would be used (done using checksums).
> > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > +
> > +#
> > +# Shared-state files from other locations
> > +#
> > +# As mentioned above, shared state files are prebuilt cache data objec=
ts
> which
> > +# can be used to accelerate build time. This variable can be used to
> configure
> > +# the system to search other mirror locations for these objects before=
 it
> > +# builds the data itself.
> > +#
> > +# This can be a filesystem directory, or a remote url such as http or =
ftp.
> > +# These would contain the sstate-cache results from previous builds
> (possibly
> > +# from other machines). This variable works like fetcher MIRRORS/PREMI=
RRORS
> > +# and points to the cache locations to check for the shared objects.
> > +#SSTATE_MIRRORS ?=3D "\
> > +#file://.* http://someserver.tld/share/sstate/ \n \
> > +#file://.* file:///some/local/dir/sstate/"
> > +
> > +#
> > +# Where to place the build output
> > +#
> > +# This option specifies where the bulk of the building work should be =
done
> and
> > +# where BitBake should place its temporary files and output. Keep in m=
ind
> that
> > +# this includes the extraction and compilation of many applications an=
d the
> toolchain
> > +# which can use Gigabytes of hard disk space.
> > +TMPDIR =3D "${TOPDIR}/arago-tmp"
> > +
> > +# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to =
be
> outside
> > +#DEPLOY_DIR =3D "${TOPDIR}/deploy"
> > +
> > +#
> > +# Machine Selection
> > +#
> > +# You need to select a specific machine to target the build with. Ther=
e are
> a selection
> > +# of emulated machines available which can boot and run in the QEMU
> emulator:
> > +#
> > +#MACHINE ?=3D "arago"
> > +
> > +#
> > +# Package Management configuration
> > +#
> > +# This variable lists which packaging formats to enable. Multiple pack=
age
> backends
> > +# can be enabled at once and the first item listed in the variable wil=
l be
> used
> > +# to generate the root filesystems.
> > +# Options are:
> > +#  - 'package_deb' for debian style deb files
> > +#  - 'package_ipk' for ipk files are used by opkg (a debian style embe=
dded
> package manager)
> > +#  - 'package_rpm' for rpm style packages
> > +# E.g.: PACKAGE_CLASSES ?=3D "package_rpm package_deb package_ipk"
> > +# We default to ipk:
> > +PACKAGE_CLASSES ?=3D "package_ipk"
> > +
> > +#
> > +# SDK/ADT target architecture
> > +#
> > +# This variable specified the architecture to build SDK/ADT items for =
and
> means
> > +# you can build the SDK packages for architectures other than the mach=
ine
> you are
> > +# running the build on (i.e. building i686 packages on an x86_64 host.=
_
> > +# Supported values are i686 and x86_64
> > +SDKMACHINE ?=3D "x86_64"
> > +
> > +#
> > +# Extra image configuration defaults
> > +#
> > +# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added =
to
> the generated
> > +# images. Some of these options are added to certain image types
> automatically. The
> > +# variable can contain the following options:
> > +#  "dbg-pkgs"       - add -dbg packages for all installed packages
> > +#                     (adds symbol information for debugging/profiling=
)
> > +#  "dev-pkgs"       - add -dev packages for all installed packages
> > +#                     (useful if you want to develop against libs in t=
he
> image)
> > +#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.=
)
> > +#  "tools-debug"    - add debugging tools (gdb, strace)
> > +#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valg=
rind
> (x86 only))
> > +#  "tools-testapps" - add useful testing tools (ts_print, aplay, areco=
rd
> etc.)
> > +#  "debug-tweaks"   - make an image suitable for development
> > +#                     e.g. ssh root access has a blank password
> > +# There are other application targets that can be used here too, see
> > +# meta/classes/image.bbclass and meta/classes/core-image.bbclass for m=
ore
> details.
> > +# We default to enabling the debugging tweaks.
> > +EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> > +
> > +#
> > +# Additional image features
> > +#
> > +# The following is a list of additional classes to use when building i=
mages
> which
> > +# enable extra features. Some available options which can be included =
in
> this variable
> > +# are:
> > +#   - 'buildstats' collect build statistics
> > +#   - 'image-swab' to perform host system intrusion detection
> > +# NOTE: mklibs also needs to be explicitly enabled for a given image, =
see
> local.conf.extended
> > +USER_CLASSES ?=3D "buildstats"
> > +
> > +# By default disable interactive patch resolution (tasks will just fai=
l
> instead):
> > +PATCHRESOLVE =3D "noop"
> > +
> > +# By default the machine configuration file sets the IMAGE_FSTYPES.  B=
ut if
> you
> > +# would like to add additional file system types you can uncomment the
> > +# following line and add the additional IMAGE_FSTYPES you want created
> > +# as part of the build flow.  Some common types are listed below and y=
ou
> > +# can remove the ones you do not want.
> > +# IMAGE_FSTYPES +=3D "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz
> tar.bz2 cpio"
> > +
> > +#
> > +# Parallelism Options
> > +#
> > +# These two options control how much parallelism BitBake should use. T=
he
> first
> > +# option determines how many tasks bitbake should run in parallel:
> > +#
> > +# BB_NUMBER_THREADS ?=3D "1"
> > +#
> > +# The second option controls how many processes make should run in par=
allel
> when
> > +# running compile tasks:
> > +#
> > +# PARALLEL_MAKE ?=3D "-j 1"
> > +#
> > +# For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =
=3D "-j 4"
> would
> > +# be appropriate for example
> > +#
> > +# NOTE: By default, bitbake will choose the number of processeors on y=
our
> host
> > +# so you should not need to set this unless you are wanting to lower t=
he
> number
> > +# allowed.
> > +#
> > +
> > +DISTRO   =3D "arago"
> > +
> > +# Set terminal types by default it expects gnome-terminal
> > +# but we chose xterm
> > +TERMCMD =3D "${XTERM_TERMCMD}"
> > +TERMCMDRUN =3D "${XTERM_TERMCMDRUN}"
> > +
> > +# Don't generate the mirror tarball for SCM repos, the snapshot is eno=
ugh
> > +BB_GENERATE_MIRROR_TARBALLS =3D "0"
> > +
> > +# Uncomment this to remove work directory after packaging to save disk
> space
> > +#INHERIT +=3D "rm_work"
> > +
> > +# Keep one set of images by default
> > +RM_OLD_IMAGE =3D "1"
> > +
> > +# Enable local PR service for binary feeds
> > +PRSERV_HOST =3D "localhost:0"
> > +
> > +# Enable hash equiv server
> > +BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> > +BB_HASHSERVE =3D "auto"
> > +
> > +# It is recommended to activate "buildhistory" for testing the PR serv=
ice
> > +INHERIT +=3D "buildhistory"
> > +BUILDHISTORY_COMMIT =3D "1"
> > diff --git
> b/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-conf=
ig.txt
> > new file mode 100644
> > index 0000000..dae4f9f
> > --- /dev/null
> > +++
> b/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-conf=
ig.txt
> > @@ -0,0 +1,21 @@
> > +# This file takes repo entries in the format
> > +# repo name,repo uri,repo branch,repo
> commit[,layers=3Dlayer1:layer2...:layern]
> > +
> >
> +bitbake,https://git.openembedded.org/bitbake,2.8,982645110a19ebb94d51992=
6a4e14c8a2a205cfd
> >
> +meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,=
11.01.12.10,layers=3Dmeta-ti-foundational:meta-ti-ml
> >
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.01.12,la=
yers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
> >
> +meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52=
f635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
> >
> +#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,0bb4a3=
4a5e102c5264215bfaedddb13703270afa,layers=3D
> >
> +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,2033d6b48e6f5258b101f=
e433c90ebdb9c22f643,layers=3D
> >
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,sca=
rthgap,02f72c96bf9acd0bd3ae0463f482bce8feabe749,layers=3D
> >
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthg=
ap,c29a18fa39ede952f3f6108ec007c1906e2d9a0d,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> >
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/r=
ust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
> >
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.01.12,layers=
=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
> >
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,8e0f8af90fefb03=
f08cd2228cde7a89902a6b37c,layers=3Dmeta-arm:meta-arm-toolchain
> >
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,6691e4bc47e20b90=
3dc3dd7684685086d2468b84,layers=3D
> >
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap=
,0bb4a34a5e102c5264215bfaedddb13703270afa,layers=3D.:meta-flutter-apps
> >
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,93c7489=
d843a0e46fe4fc685b356d0ae885300d7,layers=3Dmeta
> > +
> > +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> > +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> > +BITBAKE_INCLUSIVE_VARS=3Dyes
> > diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.y=
ml
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.y=
ml
> > new file mode 100644
> > index 0000000..e2353d4
> > --- /dev/null
> > +++
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.y=
ml
> > @@ -0,0 +1,96 @@
> > +---
> > +header:
> > +  version: 17
> > +  includes:
> > +    - ../templates/bblayers.conf.yml
> > +    - ../templates/local-arago64-v2.conf.yml
> > +
> > +target: tisdk-default-image
> > +
> > +repos:
> > +  bitbake:
> > +    url: "https://git.openembedded.org/bitbake"
> > +    branch: "2.8"
> > +    commit: "982645110a19ebb94d519926a4e14c8a2a205cfd"
> > +    layers:
> > +      .: disabled
> > +
> > +  meta-tisdk:
> > +    url: "https://github.com/TexasInstruments/meta-tisdk.git"
> > +    branch: "scarthgap"
> > +    commit: "11.01.12.10"
> > +    layers:
> > +      meta-ti-foundational:
> > +      meta-ti-ml:
> > +
> > +  meta-arago:
> > +    url: "https://git.yoctoproject.org/meta-arago"
> > +    branch: "scarthgap"
> > +    commit: "11.01.12"
> > +    layers:
> > +      meta-arago-distro:
> > +      meta-arago-extras:
> > +      meta-arago-test:
> > +
> > +  meta-browser:
> > +    url: "https://github.com/OSSystems/meta-browser.git"
> > +    branch: "master"
> > +    commit: "27ca52f635a31f5f9762813a8527dd31323549b7"
> > +    layers:
> > +      meta-chromium:
> > +
> > +  meta-qt6:
> > +    url: "https://code.qt.io/yocto/meta-qt6.git"
> > +    branch: "6.9"
> > +    commit: "2033d6b48e6f5258b101fe433c90ebdb9c22f643"
> > +
> > +  meta-virtualization:
> > +    url: "https://git.yoctoproject.org/meta-virtualization"
> > +    branch: "scarthgap"
> > +    commit: "02f72c96bf9acd0bd3ae0463f482bce8feabe749"
> > +
> > +  meta-openembedded:
> > +    url: "https://git.openembedded.org/meta-openembedded"
> > +    branch: "scarthgap"
> > +    commit: "c29a18fa39ede952f3f6108ec007c1906e2d9a0d"
> > +    layers:
> > +      meta-networking:
> > +      meta-python:
> > +      meta-oe:
> > +      meta-gnome:
> > +      meta-filesystems:
> > +      meta-multimedia:
> > +
> > +  meta-lts-mixins:
> > +    url: "https://git.yoctoproject.org/meta-lts-mixins"
> > +    branch: "scarthgap/rust"
> > +    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
> > +
> > +  meta-ti:
> > +    url: "https://git.yoctoproject.org/meta-ti"
> > +    branch: "scarthgap"
> > +    commit: "11.01.12"
> > +    layers:
> > +      meta-ti-extras:
> > +      meta-beagle:
> > +      meta-ti-bsp:
> > +
> > +  meta-arm:
> > +    url: "https://git.yoctoproject.org/meta-arm"
> > +    branch: "scarthgap"
> > +    commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
> > +    layers:
> > +      meta-arm:
> > +      meta-arm-toolchain:
> > +
> > +  meta-clang:
> > +    url: "https://github.com/kraj/meta-clang"
> > +    branch: "scarthgap"
> > +    commit: "6691e4bc47e20b903dc3dd7684685086d2468b84"
> > +
> > +  oe-core:
> > +    url: "https://git.openembedded.org/openembedded-core"
> > +    branch: "scarthgap"
> > +    commit: "93c7489d843a0e46fe4fc685b356d0ae885300d7"
> > +    layers:
> > +      meta:
> > diff --git
> b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-=
config.xml
> > new file mode 100644
> > index 0000000..5793c01
> > --- /dev/null
> > +++
> b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-=
config.xml
> > @@ -0,0 +1,86 @@
> > +<?xml version=3D'1.0'?>
> > +<config>
> > +    <description>TI Processor SDK vchromium-11.01.12.10</description>
> > +
> > +    <xi:include href=3D'../../common/targets_arago.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> > +    <xi:include href=3D'../../templates/bblayers.conf.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> > +    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> > +
> > +    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.=
8'
> commit=3D'982645110a19ebb94d519926a4e14c8a2a205cfd'/>
> > +
> > +    <repos>
> > +        <repo name=3D'meta-tisdk'
> url=3D'https://github.com/TexasInstruments/meta-tisdk.git' branch=3D'scar=
thgap'
> commit=3D'11.01.12.10'>
> > +            <layers>
> > +                <layer>meta-ti-foundational</layer>
> > +                <layer>meta-ti-ml</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-arago'
> url=3D'https://git.yoctoproject.org/meta-arago' branch=3D'scarthgap'
> commit=3D'11.01.12'>
> > +            <layers>
> > +                <layer>meta-arago-distro</layer>
> > +                <layer>meta-arago-extras</layer>
> > +                <layer>meta-arago-test</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-browser'
> url=3D'https://github.com/OSSystems/meta-browser.git' branch=3D'master'
> commit=3D'27ca52f635a31f5f9762813a8527dd31323549b7'>
> > +            <layers>
> > +                <layer>meta-chromium</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-selinux'
> url=3D'https://git.yoctoproject.org/meta-selinux' branch=3D'scarthgap'
> commit=3D'0bb4a34a5e102c5264215bfaedddb13703270afa' disabled=3D'true'>
> > +            <layers/>
> > +        </repo>
> > +        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-q=
t6.git'
> branch=3D'6.9' commit=3D'2033d6b48e6f5258b101fe433c90ebdb9c22f643'>
> > +            <layers/>
> > +        </repo>
> > +        <repo name=3D'meta-virtualization'
> url=3D'https://git.yoctoproject.org/meta-virtualization' branch=3D'scarth=
gap'
> commit=3D'02f72c96bf9acd0bd3ae0463f482bce8feabe749'>
> > +            <layers/>
> > +        </repo>
> > +        <repo name=3D'meta-openembedded'
> url=3D'https://git.openembedded.org/meta-openembedded' branch=3D'scarthga=
p'
> commit=3D'c29a18fa39ede952f3f6108ec007c1906e2d9a0d'>
> > +            <layers>
> > +                <layer>meta-networking</layer>
> > +                <layer>meta-python</layer>
> > +                <layer>meta-oe</layer>
> > +                <layer>meta-gnome</layer>
> > +                <layer>meta-filesystems</layer>
> > +                <layer>meta-multimedia</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-lts-mixins'
> url=3D'https://git.yoctoproject.org/meta-lts-mixins' branch=3D'scarthgap/=
rust'
> commit=3D'a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
> > +            <layers/>
> > +        </repo>
> > +        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/met=
a-ti'
> branch=3D'scarthgap' commit=3D'11.01.12'>
> > +            <layers>
> > +                <layer>meta-ti-extras</layer>
> > +                <layer>meta-beagle</layer>
> > +                <layer>meta-ti-bsp</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/me=
ta-arm'
> branch=3D'scarthgap' commit=3D'8e0f8af90fefb03f08cd2228cde7a89902a6b37c'>
> > +            <layers>
> > +                <layer>meta-arm</layer>
> > +                <layer>meta-arm-toolchain</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-=
clang'
> branch=3D'scarthgap' commit=3D'6691e4bc47e20b903dc3dd7684685086d2468b84'>
> > +            <layers/>
> > +        </repo>
> > +        <repo name=3D'meta-flutter'
> url=3D'https://github.com/meta-flutter/meta-flutter.git' branch=3D'scarth=
gap'
> commit=3D'0bb4a34a5e102c5264215bfaedddb13703270afa' disabled=3D'true'>
> > +            <layers>
> > +                <layer>.</layer>
> > +                <layer>meta-flutter-apps</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'oe-core'
> url=3D'https://git.openembedded.org/openembedded-core' branch=3D'scarthga=
p'
> commit=3D'93c7489d843a0e46fe4fc685b356d0ae885300d7'>
> > +            <layers>
> > +                <layer>meta</layer>
> > +            </layers>
> > +        </repo>
> > +    </repos>
> > +
> > +    <tools>
> > +        <tool type=3D'oe-layersetup'>
> > +            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
> > +        </tool>
> > +    </tools>
> > +</config>
> > --
> > 2.34.1
> >
> >
> >
> >=20
> >
> >
>=20
>=20
> --=20
> Jonathan Cormier
> Senior Software Engineer
>=20
> Voice:  315.425.4045 x222
>=20
> http://www.CriticalLink.com
> 6712 Brooklawn Parkway, Syracuse, NY 13211
>

