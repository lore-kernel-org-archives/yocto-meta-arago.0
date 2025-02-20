Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECBBC021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 19:37:28 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.6112.1740080239130890697
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 11:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=FkR6ccC6;
 spf=pass (domain: criticallink.com, ip: 209.85.167.42, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-545284eac3bso1351221e87.0
        for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 11:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1740080237; x=1740685037; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHiv+F2r09rMoWK6SOZkNuUrwvw7Dyjthdwv8WpLSlU=;
        b=FkR6ccC65bNf/E8XWbgJ3tw8rCQYm4Y//S6tO3YUOfAwKzNqkpVFDLouopmBcIT+Dq
         ymAvPdnlTip2yEin3N7sRbwhoE8oNiAOoH4Hzl5jlyiAjopfuDep2HHzxFRU3SyAd4iW
         kk5hS5re6KxQqyVWi4TOb0oqRAR7pkFU4yuVrA2XwQzM+0sK1EY8gB70ukm0Bz1zPOh3
         Gj+xaD1M1URjTPz6vjERJJz3NfmHNTFu8LP7bqae8gNtqs7+dTaECkBp7P1PPULngDN0
         fYCRSp+0IhhhjkKjRwKzmyEBeviyPxPp8N5CaWsnrYplkrIH5pVaoZZfVqnu8ya/0qrB
         B8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740080237; x=1740685037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHiv+F2r09rMoWK6SOZkNuUrwvw7Dyjthdwv8WpLSlU=;
        b=KHi6hhV8YDIwLRjUCIQ8T1LGsQQ5GmOIa3vwXo/65hg64jWa412tPn8MZ57IcCPljN
         D/il3IDOX5Kw2keBIomVt5Ig0dWxAHP97FWPBybQ+ekZGzIcYCovPuvnHCDeZRIfL3if
         SmGkYGOE8VonxawQsXXRpktcjfqxOZtHAvC8CqfsJkV9vgBl7sQS6HtCLFLGnIu+JbYA
         Qkc2DQ9s6frERrQV6VBtWjDl5eNkf0vOBD1HooU8X7Ex8MtX/kC0lIDvwPMlnbUwOnKL
         tXjiIolkt+vnjKBdqdglA8lr7tqCqNNkXMSlc/58usF8Ob4iuSy1MpAYPqzPnYY/UJUC
         3cew==
X-Gm-Message-State: AOJu0Yy1Af6046rIbnAcYTjFxZQpLFKo1oQLBXDEFgsVfRunAEn91ofA
	pt5VjIV0Fukl59YNZdVJz8MGfN0CXY0N9eormued/iXzoBbhdl5fz+lGnHCZ8e9jfirty+u4NQg
	oeg/qOoLGMb/K061x4sZrgMXbNnFysfJ/lrjD
X-Gm-Gg: ASbGncvtiwQCB8UA82UwuH5Vtsms37hZMBqF53jvL0S2Zs7PCUsXVle+c7M/4feV+Io
	qJtc2/AZI5KJ9XpHiy5/8zxVR512vGpR37IaRbzq8KKn0lk2nhjaJxb5EqoSOFOVhtzYdjoM=
X-Google-Smtp-Source: AGHT+IFcstptuzO2dfzJCz7kly0cL7cu93Xd/TT2CwIoCbBkjqKwOCQY5+Jm4p0PWSJzb7sa91v6vsIE69WAapbAgAE=
X-Received: by 2002:a05:6512:3ca5:b0:545:d35:6bf2 with SMTP id
 2adb3069b0e04-54838ee912emr110712e87.15.1740080237048; Thu, 20 Feb 2025
 11:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20250220174303.3316411-1-a-limaye@ti.com>
In-Reply-To: <20250220174303.3316411-1-a-limaye@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 20 Feb 2025 14:37:04 -0500
X-Gm-Features: AWEUYZlyAlwzH13DXqgPqZ6BGy7elvrXdU-w_mQlMXcSK4qjLhcGbLUBBrhrj78
Message-ID: <CADL8D3YxAk8rZTNPh861YTAiwZva5Fnf8Qhvb4E+j5jLbtwQ0A@mail.gmail.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add new
 configs for AM57X 09.03 release
To: a-limaye@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 19:37:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15873

Awesome, appreciate it @Aniket Limaye


On Thu, Feb 20, 2025 at 12:43=E2=80=AFPM Aniket Limaye via
lists.yoctoproject.org <a-limaye=3Dti.com@lists.yoctoproject.org> wrote:
>
> - Add new config files for the Processor SDK Linux 09.03 release for
>   AM57X device
>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>  ...linux_processor-sdk-linux-09_03_06_05.json | 136 ++++++++++++++
>  .../bblayers.conf.sample                      |  31 ++++
>  .../conf-notes.txt                            |  22 +++
>  .../conf-summary.txt                          |   1 +
>  .../local.conf.sample                         | 175 ++++++++++++++++++
>  .../processor-sdk-linux-09_03_06_05.txt       |  18 ++
>  .../processor-sdk-linux-09_03_06_05.yml       |  73 ++++++++
>  .../processor-sdk-linux-09_03_06_05.xml       |  70 +++++++
>  8 files changed, 526 insertions(+)
>  create mode 100644 bitbake-setup/processor-sdk-linux_processor-sdk-linux=
-09_03_06_05.json
>  create mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linu=
x-09_03_06_05/bblayers.conf.sample
>  create mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linu=
x-09_03_06_05/conf-notes.txt
>  create mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linu=
x-09_03_06_05/conf-summary.txt
>  create mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linu=
x-09_03_06_05/local.conf.sample
>  create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-09_03=
_06_05.txt
>  create mode 100644 kas/processor-sdk-linux/processor-sdk-linux-09_03_06_=
05.yml
>  create mode 100644 src/configs/processor-sdk-linux/processor-sdk-linux-0=
9_03_06_05.xml
>
> diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_03_=
06_05.json b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_03_06=
_05.json
> new file mode 100644
> index 0000000..785408f
> --- /dev/null
> +++ b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_03_06_05.j=
son
> @@ -0,0 +1,136 @@
> +{
> +  "version": "1.0",
> +  "description": "TI Processor SDK Linux v09_03_06_05",
> +  "sources": {
> +    "oe-layersetup": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.g=
it"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "oe-layersetup"
> +    },
> +    "bitbake": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/bitbake"
> +          }
> +        },
> +        "rev": "2.0"
> +      },
> +      "path": "bitbake"
> +    },
> +    "meta-arago": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-arago"
> +          }
> +        },
> +        "rev": "kirkstone"
> +      },
> +      "path": "meta-arago"
> +    },
> +    "meta-qt5": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://github.com/meta-qt5/meta-qt5.git"
> +          }
> +        },
> +        "rev": "kirkstone"
> +      },
> +      "path": "meta-qt5"
> +    },
> +    "meta-virtualization": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-virtualization"
> +          }
> +        },
> +        "rev": "kirkstone"
> +      },
> +      "path": "meta-virtualization"
> +    },
> +    "meta-openembedded": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/meta-openembedded"
> +          }
> +        },
> +        "rev": "kirkstone"
> +      },
> +      "path": "meta-openembedded"
> +    },
> +    "meta-ti": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-ti"
> +          }
> +        },
> +        "rev": "kirkstone"
> +      },
> +      "path": "meta-ti"
> +    },
> +    "meta-arm": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-arm"
> +          }
> +        },
> +        "rev": "kirkstone"
> +      },
> +      "path": "meta-arm"
> +    },
> +    "meta-clang": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://github.com/kraj/meta-clang"
> +          }
> +        },
> +        "rev": "kirkstone-clang12"
> +      },
> +      "path": "meta-clang"
> +    },
> +    "oe-core": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/openembedded-core"
> +          }
> +        },
> +        "rev": "kirkstone"
> +      },
> +      "path": "oe-core"
> +    },
> +    "meta-tisdk": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
> +          }
> +        },
> +        "rev": "am57x-9.x"
> +      },
> +      "path": "meta-tisdk"
> +    }
> +  },
> +  "configuration": {
> +    "bitbake-setup": {
> +      "default": {
> +        "description": "Default build configuration",
> +         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-li=
nux-09_03_06_05",
> +         "targets": [ "bitbake -k tisdk-default-image" ]
> +      }
> +    }
> +  }
> +}
> diff --git a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_03=
_06_05/bblayers.conf.sample b/conf/templates/processor-sdk-linux_processor-=
sdk-linux-09_03_06_05/bblayers.conf.sample
> new file mode 100644
> index 0000000..bba71a6
> --- /dev/null
> +++ b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_03_06_05/=
bblayers.conf.sample
> @@ -0,0 +1,31 @@
> +# This template file was created by taking the oe-core/meta/conf/bblayer=
s.conf
> +# file and removing the BBLAYERS section at the end.
> +
> +# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> +# changes incompatibly
> +LCONF_VERSION =3D "5"
> +
> +BBPATH =3D "${TOPDIR}"
> +BBFILES ?=3D ""
> +
> +BBLAYERS ?=3D " \
> +    ##OEROOT##/../meta-arago/meta-arago-distro
> +    ##OEROOT##/../meta-arago/meta-arago-extras
> +    ##OEROOT##/../meta-arago/meta-arago-demos
> +    ##OEROOT##/../meta-arago/meta-arago-test
> +    ##OEROOT##/../meta-qt5
> +    ##OEROOT##/../meta-virtualization
> +    ##OEROOT##/../meta-openembedded/meta-networking
> +    ##OEROOT##/../meta-openembedded/meta-python
> +    ##OEROOT##/../meta-openembedded/meta-oe
> +    ##OEROOT##/../meta-openembedded/meta-gnome
> +    ##OEROOT##/../meta-openembedded/meta-filesystems
> +    ##OEROOT##/../meta-ti/meta-ti-extras
> +    ##OEROOT##/../meta-ti/meta-ti-bsp
> +    ##OEROOT##/../meta-arm/meta-arm
> +    ##OEROOT##/../meta-arm/meta-arm-toolchain
> +    ##OEROOT##/../meta-clang
> +    ##OEROOT##/../oe-core/meta
> +    ##OEROOT##/../meta-tisdk
> +    ##OEROOT##/../oe-layersetup
> +"
> diff --git a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_03=
_06_05/conf-notes.txt b/conf/templates/processor-sdk-linux_processor-sdk-li=
nux-09_03_06_05/conf-notes.txt
> new file mode 100644
> index 0000000..1880460
> --- /dev/null
> +++ b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_03_06_05/=
conf-notes.txt
> @@ -0,0 +1,22 @@
> +
> +### Shell environment set up for builds. ###
> +
> +You can now run 'bitbake <target>'
> +
> +If you have not set MACHINE in your local.conf you can run
> +'MACHINE=3Dxxxxx bitbake <target>'
> +
> +Common targets are:
> +    tisdk-default-image
> +    tisdk-base-image
> +    tisdk-bootstrap-base-image
> +    tisdk-bootstrap-image
> +    tisdk-thinlinux-image
> +    tisdk-tiny-image
> +
> +You can also run generated qemu images with a command like 'runqemu qemu=
x86-64'.
> +
> +Other commonly useful commands are:
> + - 'devtool' and 'recipetool' handle common recipe tasks
> + - 'bitbake-layers' handles common layer tasks
> + - 'oe-pkgdata-util' handles common target package tasks
> diff --git a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_03=
_06_05/conf-summary.txt b/conf/templates/processor-sdk-linux_processor-sdk-=
linux-09_03_06_05/conf-summary.txt
> new file mode 100644
> index 0000000..ea37a14
> --- /dev/null
> +++ b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_03_06_05/=
conf-summary.txt
> @@ -0,0 +1 @@
> +TI Processor SDK Linux v09_03_06_05
> diff --git a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_03=
_06_05/local.conf.sample b/conf/templates/processor-sdk-linux_processor-sdk=
-linux-09_03_06_05/local.conf.sample
> new file mode 100644
> index 0000000..7575b4b
> --- /dev/null
> +++ b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_03_06_05/=
local.conf.sample
> @@ -0,0 +1,175 @@
> +# CONF_VERSION is increased each time build/conf/ changes incompatibly
> +CONF_VERSION =3D "2"
> +
> +#
> +# Where to place downloads
> +#
> +# During a first build the system will download many different source co=
de
> +# tarballs from various upstream projects. This can take a while, partic=
ularly
> +# if your network connection is slow. These are all stored in DL_DIR. Wh=
en
> +# wiping and rebuilding you can preserve this directory to speed up this=
 part
> +# of subsequent builds. This directory is safe to share between multiple=
 builds
> +# on the same machine too.
> +DL_DIR =3D "${TOPDIR}/downloads"
> +
> +#
> +# Where to place shared-state files
> +#
> +# BitBake has the capability to accelerate builds based on previously bu=
ilt
> +# output. This is done using "shared state" files which can be thought o=
f as
> +# cache objects and this option determines where those files are placed.
> +#
> +# You can wipe out TMPDIR leaving this directory intact and the build wo=
uld
> +# regenerate from these files if no changes were made to the configurati=
on.
> +# If changes were made to the configuration, only shared state files whe=
re the
> +# state was still valid would be used (done using checksums).
> +SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> +
> +#
> +# Shared-state files from other locations
> +#
> +# As mentioned above, shared state files are prebuilt cache data objects=
 which
> +# can be used to accelerate build time. This variable can be used to con=
figure
> +# the system to search other mirror locations for these objects before i=
t
> +# builds the data itself.
> +#
> +# This can be a filesystem directory, or a remote url such as http or ft=
p.
> +# These would contain the sstate-cache results from previous builds (pos=
sibly
> +# from other machines). This variable works like fetcher MIRRORS/PREMIRR=
ORS
> +# and points to the cache locations to check for the shared objects.
> +#SSTATE_MIRRORS ?=3D "\
> +#file://.* http://someserver.tld/share/sstate/ \n \
> +#file://.* file:///some/local/dir/sstate/"
> +
> +#
> +# Where to place the build output
> +#
> +# This option specifies where the bulk of the building work should be do=
ne and
> +# where BitBake should place its temporary files and output. Keep in min=
d that
> +# this includes the extraction and compilation of many applications and =
the toolchain
> +# which can use Gigabytes of hard disk space.
> +TMPDIR =3D "${TOPDIR}/arago-tmp"
> +
> +# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be=
 outside
> +#DEPLOY_DIR =3D "${TOPDIR}/deploy"
> +
> +#
> +# Machine Selection
> +#
> +# You need to select a specific machine to target the build with. There =
are a selection
> +# of emulated machines available which can boot and run in the QEMU emul=
ator:
> +#
> +#MACHINE ?=3D "arago"
> +
> +#
> +# Package Management configuration
> +#
> +# This variable lists which packaging formats to enable. Multiple packag=
e backends
> +# can be enabled at once and the first item listed in the variable will =
be used
> +# to generate the root filesystems.
> +# Options are:
> +#  - 'package_deb' for debian style deb files
> +#  - 'package_ipk' for ipk files are used by opkg (a debian style embedd=
ed package manager)
> +#  - 'package_rpm' for rpm style packages
> +# E.g.: PACKAGE_CLASSES ?=3D "package_rpm package_deb package_ipk"
> +# We default to ipk:
> +PACKAGE_CLASSES ?=3D "package_ipk"
> +
> +#
> +# SDK/ADT target architecture
> +#
> +# This variable specified the architecture to build SDK/ADT items for an=
d means
> +# you can build the SDK packages for architectures other than the machin=
e you are
> +# running the build on (i.e. building i686 packages on an x86_64 host._
> +# Supported values are i686 and x86_64
> +SDKMACHINE ?=3D "x86_64"
> +
> +#
> +# Extra image configuration defaults
> +#
> +# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to=
 the generated
> +# images. Some of these options are added to certain image types automat=
ically. The
> +# variable can contain the following options:
> +#  "dbg-pkgs"       - add -dbg packages for all installed packages
> +#                     (adds symbol information for debugging/profiling)
> +#  "dev-pkgs"       - add -dev packages for all installed packages
> +#                     (useful if you want to develop against libs in the=
 image)
> +#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
> +#  "tools-debug"    - add debugging tools (gdb, strace)
> +#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgri=
nd (x86 only))
> +#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord=
 etc.)
> +#  "debug-tweaks"   - make an image suitable for development
> +#                     e.g. ssh root access has a blank password
> +# There are other application targets that can be used here too, see
> +# meta/classes/image.bbclass and meta/classes/core-image.bbclass for mor=
e details.
> +# We default to enabling the debugging tweaks.
> +EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> +
> +#
> +# Additional image features
> +#
> +# The following is a list of additional classes to use when building ima=
ges which
> +# enable extra features. Some available options which can be included in=
 this variable
> +# are:
> +#   - 'buildstats' collect build statistics
> +#   - 'image-swab' to perform host system intrusion detection
> +# NOTE: mklibs also needs to be explicitly enabled for a given image, se=
e local.conf.extended
> +USER_CLASSES ?=3D "buildstats"
> +
> +# By default disable interactive patch resolution (tasks will just fail =
instead):
> +PATCHRESOLVE =3D "noop"
> +
> +# By default the machine configuration file sets the IMAGE_FSTYPES.  But=
 if you
> +# would like to add additional file system types you can uncomment the
> +# following line and add the additional IMAGE_FSTYPES you want created
> +# as part of the build flow.  Some common types are listed below and you
> +# can remove the ones you do not want.
> +# IMAGE_FSTYPES +=3D "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz t=
ar.bz2 cpio"
> +
> +#
> +# Parallelism Options
> +#
> +# These two options control how much parallelism BitBake should use. The=
 first
> +# option determines how many tasks bitbake should run in parallel:
> +#
> +# BB_NUMBER_THREADS ?=3D "1"
> +#
> +# The second option controls how many processes make should run in paral=
lel when
> +# running compile tasks:
> +#
> +# PARALLEL_MAKE ?=3D "-j 1"
> +#
> +# For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D =
"-j 4" would
> +# be appropriate for example
> +#
> +# NOTE: By default, bitbake will choose the number of processeors on you=
r host
> +# so you should not need to set this unless you are wanting to lower the=
 number
> +# allowed.
> +#
> +
> +DISTRO   =3D "arago"
> +
> +# Set terminal types by default it expects gnome-terminal
> +# but we chose xterm
> +TERMCMD =3D "${XTERM_TERMCMD}"
> +TERMCMDRUN =3D "${XTERM_TERMCMDRUN}"
> +
> +# Don't generate the mirror tarball for SCM repos, the snapshot is enoug=
h
> +BB_GENERATE_MIRROR_TARBALLS =3D "0"
> +
> +# Uncomment this to remove work directory after packaging to save disk s=
pace
> +#INHERIT +=3D "rm_work"
> +
> +# Keep one set of images by default
> +RM_OLD_IMAGE =3D "1"
> +
> +# Enable local PR service for binary feeds
> +PRSERV_HOST =3D "localhost:0"
> +
> +# Enable hash equiv server
> +BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> +BB_HASHSERVE =3D "auto"
> +
> +# It is recommended to activate "buildhistory" for testing the PR servic=
e
> +INHERIT +=3D "buildhistory"
> +BUILDHISTORY_COMMIT =3D "1"
> diff --git a/configs/processor-sdk-linux/processor-sdk-linux-09_03_06_05.=
txt b/configs/processor-sdk-linux/processor-sdk-linux-09_03_06_05.txt
> new file mode 100644
> index 0000000..e30f6c9
> --- /dev/null
> +++ b/configs/processor-sdk-linux/processor-sdk-linux-09_03_06_05.txt
> @@ -0,0 +1,18 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.0,3f88b005244a0afb5d5c726=
0e54a94a453ec9b3e
> +meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,f8ad2232a4e=
52b50aecc6c847ee7cfa24fc84070,layers=3Dmeta-arago-distro:meta-arago-extras:=
meta-arago-demos:meta-arago-test
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16=
b47e17dc899e5298cff698dc32e5e639ab4,layers=3Dmeta-chromium
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,644ebf220245=
bdc06e7696ccc90acc97a0dd2566,layers=3D
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kir=
kstone,a055d7dcafc58855081a5eac9a46b93b9b51012b,layers=3D
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,kirksto=
ne,7b3fdcdfaab2fc964bbf9eec2cce4e03001fa8cf,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,417233481d8daa466=
33045fac358260d07cf1670,layers=3Dmeta-ti-extras:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,936c02ec13661bd=
86a05f7f90e1b920d5092d670,layers=3Dmeta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,c2e89dc7=
e1dfcc1bbe432afca2dc43d6560cb007,layers=3D
> +oe-core,https://git.openembedded.org/openembedded-core,kirkstone,e42b6a4=
0a3a01e328966bb5ee1bb3e0993975b15,layers=3Dmeta
> +meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,am57x-9.x,=
0eed214c0ff621f4d03700a647a1b4f1a02b5a7c,layers=3D
> +
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
> new file mode 100644
> index 0000000..ffb709e
> --- /dev/null
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
> @@ -0,0 +1,73 @@
> +header:
> +  version: 17
> +  includes:
> +    - ../templates/bblayers.conf.yml
> +    - ../templates/local-arago64-v2.conf.yml
> +
> +target: tisdk-default-image
> +
> +repos:
> +  meta-arago:
> +    url: "https://git.yoctoproject.org/meta-arago"
> +    branch: "kirkstone"
> +    commit: "f8ad2232a4e52b50aecc6c847ee7cfa24fc84070"
> +    layers:
> +      meta-arago-distro:
> +      meta-arago-extras:
> +      meta-arago-demos:
> +      meta-arago-test:
> +
> +  meta-qt5:
> +    url: "https://github.com/meta-qt5/meta-qt5.git"
> +    branch: "kirkstone"
> +    commit: "644ebf220245bdc06e7696ccc90acc97a0dd2566"
> +
> +  meta-virtualization:
> +    url: "https://git.yoctoproject.org/meta-virtualization"
> +    branch: "kirkstone"
> +    commit: "a055d7dcafc58855081a5eac9a46b93b9b51012b"
> +
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "kirkstone"
> +    commit: "7b3fdcdfaab2fc964bbf9eec2cce4e03001fa8cf"
> +    layers:
> +      meta-networking:
> +      meta-python:
> +      meta-oe:
> +      meta-gnome:
> +      meta-filesystems:
> +
> +  meta-ti:
> +    url: "https://git.yoctoproject.org/meta-ti"
> +    branch: "kirkstone"
> +    commit: "417233481d8daa46633045fac358260d07cf1670"
> +    layers:
> +      meta-ti-extras:
> +      meta-ti-bsp:
> +
> +  meta-arm:
> +    url: "https://git.yoctoproject.org/meta-arm"
> +    branch: "kirkstone"
> +    commit: "936c02ec13661bd86a05f7f90e1b920d5092d670"
> +    layers:
> +      meta-arm:
> +      meta-arm-toolchain:
> +
> +  meta-clang:
> +    url: "https://github.com/kraj/meta-clang"
> +    branch: "kirkstone-clang12"
> +    commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
> +
> +  oe-core:
> +    url: "https://git.openembedded.org/openembedded-core"
> +    branch: "kirkstone"
> +    commit: "e42b6a40a3a01e328966bb5ee1bb3e0993975b15"
> +    layers:
> +      meta:
> +
> +  meta-tisdk:
> +    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
> +    branch: "am57x-9.x"
> +    commit: "0eed214c0ff621f4d03700a647a1b4f1a02b5a7c"
> +
> diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_03_06=
_05.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_03_06_05.x=
ml
> new file mode 100644
> index 0000000..a2efc86
> --- /dev/null
> +++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_03_06_05.xml
> @@ -0,0 +1,70 @@
> +<?xml version=3D'1.0'?>
> +<config>
> +    <description>TI Processor SDK Linux v09_03_06_05</description>
> +
> +    <xi:include href=3D'../../common/targets_arago.xml' xmlns:xi=3D'http=
://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'h=
ttp://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml' xmlns=
:xi=3D'http://www.w3.org/2001/XInclude'/>
> +
> +    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.0'=
 commit=3D'3f88b005244a0afb5d5c7260e54a94a453ec9b3e'/>
> +
> +    <repos>
> +        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/me=
ta-arago' branch=3D'kirkstone' commit=3D'f8ad2232a4e52b50aecc6c847ee7cfa24f=
c84070'>
> +            <layers>
> +                <layer>meta-arago-distro</layer>
> +                <layer>meta-arago-extras</layer>
> +                <layer>meta-arago-demos</layer>
> +                <layer>meta-arago-test</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/=
meta-browser.git' branch=3D'master' commit=3D'd3d16b47e17dc899e5298cff698dc=
32e5e639ab4' disabled=3D'true'>
> +            <layers>
> +                <layer>meta-chromium</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-qt5' url=3D'https://github.com/meta-qt5/meta-=
qt5.git' branch=3D'kirkstone' commit=3D'644ebf220245bdc06e7696ccc90acc97a0d=
d2566'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproje=
ct.org/meta-virtualization' branch=3D'kirkstone' commit=3D'a055d7dcafc58855=
081a5eac9a46b93b9b51012b'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded=
.org/meta-openembedded' branch=3D'kirkstone' commit=3D'7b3fdcdfaab2fc964bbf=
9eec2cce4e03001fa8cf'>
> +            <layers>
> +                <layer>meta-networking</layer>
> +                <layer>meta-python</layer>
> +                <layer>meta-oe</layer>
> +                <layer>meta-gnome</layer>
> +                <layer>meta-filesystems</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-=
ti' branch=3D'kirkstone' commit=3D'417233481d8daa46633045fac358260d07cf1670=
'>
> +            <layers>
> +                <layer>meta-ti-extras</layer>
> +                <layer>meta-ti-bsp</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta=
-arm' branch=3D'kirkstone' commit=3D'936c02ec13661bd86a05f7f90e1b920d5092d6=
70'>
> +            <layers>
> +                <layer>meta-arm</layer>
> +                <layer>meta-arm-toolchain</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-cl=
ang' branch=3D'kirkstone-clang12' commit=3D'c2e89dc7e1dfcc1bbe432afca2dc43d=
6560cb007'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/opene=
mbedded-core' branch=3D'kirkstone' commit=3D'e42b6a40a3a01e328966bb5ee1bb3e=
0993975b15'>
> +            <layers>
> +                <layer>meta</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-tisdk' url=3D'https://git.ti.com/git/ti-sdk-l=
inux/meta-tisdk.git' branch=3D'am57x-9.x' commit=3D'0eed214c0ff621f4d03700a=
647a1b4f1a02b5a7c'>
> +            <layers/>
> +        </repo>
> +    </repos>
> +
> +    <tools>
> +        <tool type=3D'oe-layersetup'>
> +            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
> +        </tool>
> +    </tools>
> +</config>
> --
> 2.48.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15870): https://lists.yoctoproject.org/g/meta-arago/m=
essage/15870
> Mute This Topic: https://lists.yoctoproject.org/mt/111293538/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [jcormier@=
criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

