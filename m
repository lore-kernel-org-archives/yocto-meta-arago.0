Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711C3CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 14:15:31 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.40451.1756995322749176974
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Sep 2025 07:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=WGlxeP/O;
 spf=pass (domain: criticallink.com, ip: 209.85.128.176, mailfrom: jcormier@criticallink.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-724974fc5f8so10146277b3.3
        for <meta-arago@lists.yoctoproject.org>; Thu, 04 Sep 2025 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1756995322; x=1757600122; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4/GuzFLzTiT4M7aCtNZALT4sNivrbPqUEY5WD6Rmzo=;
        b=WGlxeP/OFkp4sh9+FyQRPdLV54T765NL/aQh3cqQOTEM6oRCRvus0pGNp67PLimGwq
         QBv26YmOo3TgSaoHvrSOtbyaVCD4PgLlRicgo0+dD2c6zWsK9YGCAmCWMyNRKiI9LXwu
         2r81A51ZY8osqBDhOcLETy66OfeBPNGIsS7dVk7Hn3c6vpKT7Pc/5Ucz7mLTgDFnAFH/
         1ZBTaavmfsPKo0YKriXUFAQRub94WZgGqZCFRMkMcbRaMdTfRcAAuAmWggy29nRuOniI
         sJEpHxCVFwAqmQP6UpHWAX8qdhcPRykPyyMbTLOlz7VupGWYEx+0zsYtYBPgfyfzCw3G
         o1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756995322; x=1757600122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4/GuzFLzTiT4M7aCtNZALT4sNivrbPqUEY5WD6Rmzo=;
        b=iyvc1A0NrsXR2tmctmCXZ8FxKMLhBPq+b4tFm7ol3sjhHqVbOp97Zi5Z6/WwtmBYKL
         gQA0RQyUfkFyWdVRmZf17sEHByD5EZ5125E8PFh/cnfFke9vmAauyXY80iV0OVgGIb+W
         PBWCUgOh5unqsmeqOg2aJ7H1p8BgfiL4bNI9UhMLnNz4FX20dVU9J7qy6kdy5err0TYD
         QVdcHJZRIdRVFG/SycG/kvskn70+UFqDD7SrNVItLhKLJJp6h7HUKLLqEQFPcGuJN2IE
         txwZFkZgVOPPTvTFE4NPpGoksfsoyYqb4zRiFz1WRvNy/Nwen/k1eX+sgiEobNyl/4kM
         ODHg==
X-Forwarded-Encrypted: i=1; AJvYcCU/5+PLnjX73FFdG/wDQH6lU+ChaIpACWO2npm1zIaLEfW5RLFuEqZq5yIGkELz/cCXCSbVvcjEexQK@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxbEPOX+dqlgTW+wLJDMb1bkUQ4Zt6K0vnaI3/6HfFOHqQfJL9d
	/NakcGbVibUTEeKOI4PJjs5MoIDGHfas0FV8+L7/VC89WFECA7XuSeDJBnm0J68VP2eAJR9hPnK
	AAHx3D5vwKl23RNoh8S2qD2PMrxiKVpyr2IW3F41L
X-Gm-Gg: ASbGncsj1Sc9WH8bFNfLTn1hFd8A18DqI6kyeZB8e/9yyV7/o9t2+vWRZiSFMseGBGt
	duP7LyGQdKJXlP53htbv0j5GOZ0mW2d0FQoz1MrP8deITiu2rAV+H8F5jcpaOMvxdY/J8M1xBxa
	/pvuqR67Io8swDz0eCZTlUoCGaBGSMr4Qzsfu6euVLcTmuLZ82ZQLXRWYODXQoqUqXwzeL9XCjO
	lVDUVa8k+94Ims/
X-Google-Smtp-Source: AGHT+IFi8OTS9Bi6U4o9pW9zicpzYBpt7iHCAn4Jo+1WyK8jST+uBpNbEOP9o8MQV+P/zuGIIES+Q7pIXjoUh2jd4hs=
X-Received: by 2002:a05:690c:3809:b0:721:10a3:6584 with SMTP id
 00721157ae682-7227635cce7mr206296267b3.11.1756995320367; Thu, 04 Sep 2025
 07:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250902073630.878912-1-s-sinha@ti.com> <7e5bdd16-990a-485b-a9b6-bd0a43d2ef17@ti.com>
In-Reply-To: <7e5bdd16-990a-485b-a9b6-bd0a43d2ef17@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 4 Sep 2025 10:15:07 -0400
X-Gm-Features: Ac12FXz7aWBAGIA7lMR586c41t7FzuFLmAhgKqNr3FXZWvb7hKjfNblqy_Kz4_A
Message-ID: <CADL8D3ab2B6PX3q91k6f_L6pb1uJTx-vuu=DmKH5AP6GT62f9g@mail.gmail.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH v2] configs:
 processor-sdk-linux: Add 11.0 release config
To: reatmon@ti.com
Cc: Shreyash Sinha <s-sinha@ti.com>, meta-arago@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 04 Sep 2025 14:15:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16524

On Thu, Sep 4, 2025 at 9:48=E2=80=AFAM Ryan Eatmon via lists.yoctoproject.o=
rg
<reatmon=3Dti.com@lists.yoctoproject.org> wrote:
>
>
>
> On 9/2/2025 2:36 AM, Shreyash Sinha wrote:
> > Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
> > ---
> >   .../processor-sdk-linux-11_00_10_01.json      | 147 ++++++++++++++
> >   .../bblayers.conf.sample                      |  33 ++++
> >   .../conf-notes.txt                            |  22 +++
> >   .../conf-summary.txt                          |   1 +
> >   .../local.conf.sample                         | 185 +++++++++++++++++=
+
> >   .../processor-sdk-linux-11_00_10_01.txt       |  22 +++
> >   kas/processor-sdk-linux-11_00_10_01.yml       |  95 +++++++++
> >   .../processor-sdk-linux-11_00_10_01.xml       |  81 ++++++++
> >   8 files changed, 586 insertions(+)
> >   create mode 100644 bitbake-setup/processor-sdk-linux-11_00_10_01.json
> >   create mode 100644 conf/templates/processor-sdk-linux-11_00_10_01/bbl=
ayers.conf.sample
> >   create mode 100644 conf/templates/processor-sdk-linux-11_00_10_01/con=
f-notes.txt
> >   create mode 100644 conf/templates/processor-sdk-linux-11_00_10_01/con=
f-summary.txt
> >   create mode 100644 conf/templates/processor-sdk-linux-11_00_10_01/loc=
al.conf.sample
> >   create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-11=
_00_10_01.txt
> >   create mode 100644 kas/processor-sdk-linux-11_00_10_01.yml
> >   create mode 100644 src/configs/processor-sdk-linux-11_00_10_01.xml
>
> You are missing a file in the patch:
>
> configs/processor-sdk-linux-11_00_10_01.txt
Isn't it right here:
configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.txt
>
> Please send a v3 and include it.
>
>
> >
> > diff --git a/bitbake-setup/processor-sdk-linux-11_00_10_01.json b/bitba=
ke-setup/processor-sdk-linux-11_00_10_01.json
> > new file mode 100644
> > index 0000000..b7b0066
> > --- /dev/null
> > +++ b/bitbake-setup/processor-sdk-linux-11_00_10_01.json
> > @@ -0,0 +1,147 @@
> > +{
> > +  "version": "1.0",
> > +  "description": "",
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
> > +    },
> > +    "meta-tisdk": {
> > +      "git-remote": {
> > +        "remotes": {
> > +          "origin": {
> > +            "uri": "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git=
"
> > +          }
> > +        },
> > +        "rev": "scarthgap"
> > +      },
> > +      "path": "meta-tisdk"
> > +    }
> > +  },
> > +  "configuration": {
> > +    "bitbake-setup": {
> > +      "default": {
> > +        "description": "Default build configuration",
> > +         "template": "oe-layersetup-processor-sdk-linux-11_00_10_01",
> > +         "targets": [ "bitbake -k tisdk-default-image" ]
> > +      }
> > +    }
> > +  }
> > +}
> > diff --git a/conf/templates/processor-sdk-linux-11_00_10_01/bblayers.co=
nf.sample b/conf/templates/processor-sdk-linux-11_00_10_01/bblayers.conf.sa=
mple
> > new file mode 100644
> > index 0000000..f48ab87
> > --- /dev/null
> > +++ b/conf/templates/processor-sdk-linux-11_00_10_01/bblayers.conf.samp=
le
> > @@ -0,0 +1,33 @@
> > +# This template file was created by taking the oe-core/meta/conf/bblay=
ers.conf
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
> > +    ##OEROOT##/../meta-ti/meta-ti-extras
> > +    ##OEROOT##/../meta-ti/meta-beagle
> > +    ##OEROOT##/../meta-ti/meta-ti-bsp
> > +    ##OEROOT##/../meta-arm/meta-arm
> > +    ##OEROOT##/../meta-arm/meta-arm-toolchain
> > +    ##OEROOT##/../meta-clang
> > +    ##OEROOT##/../oe-core/meta
> > +    ##OEROOT##/../meta-tisdk/meta-ti-foundational
> > +    ##OEROOT##/../oe-layersetup
> > +"
> > diff --git a/conf/templates/processor-sdk-linux-11_00_10_01/conf-notes.=
txt b/conf/templates/processor-sdk-linux-11_00_10_01/conf-notes.txt
> > new file mode 100644
> > index 0000000..1880460
> > --- /dev/null
> > +++ b/conf/templates/processor-sdk-linux-11_00_10_01/conf-notes.txt
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
> > +You can also run generated qemu images with a command like 'runqemu qe=
mux86-64'.
> > +
> > +Other commonly useful commands are:
> > + - 'devtool' and 'recipetool' handle common recipe tasks
> > + - 'bitbake-layers' handles common layer tasks
> > + - 'oe-pkgdata-util' handles common target package tasks
> > diff --git a/conf/templates/processor-sdk-linux-11_00_10_01/conf-summar=
y.txt b/conf/templates/processor-sdk-linux-11_00_10_01/conf-summary.txt
> > new file mode 100644
> > index 0000000..8b13789
> > --- /dev/null
> > +++ b/conf/templates/processor-sdk-linux-11_00_10_01/conf-summary.txt
> > @@ -0,0 +1 @@
> > +
> > diff --git a/conf/templates/processor-sdk-linux-11_00_10_01/local.conf.=
sample b/conf/templates/processor-sdk-linux-11_00_10_01/local.conf.sample
> > new file mode 100644
> > index 0000000..b973a25
> > --- /dev/null
> > +++ b/conf/templates/processor-sdk-linux-11_00_10_01/local.conf.sample
> > @@ -0,0 +1,185 @@
> > +# CONF_VERSION is increased each time build/conf/ changes incompatibly
> > +CONF_VERSION =3D "2"
> > +
> > +#
> > +# Where to place downloads
> > +#
> > +# During a first build the system will download many different source =
code
> > +# tarballs from various upstream projects. This can take a while, part=
icularly
> > +# if your network connection is slow. These are all stored in DL_DIR. =
When
> > +# wiping and rebuilding you can preserve this directory to speed up th=
is part
> > +# of subsequent builds. This directory is safe to share between multip=
le builds
> > +# on the same machine too.
> > +DL_DIR =3D "${TOPDIR}/../downloads"
> > +
> > +#
> > +# Where to place shared-state files
> > +#
> > +# BitBake has the capability to accelerate builds based on previously =
built
> > +# output. This is done using "shared state" files which can be thought=
 of as
> > +# cache objects and this option determines where those files are place=
d.
> > +#
> > +# You can wipe out TMPDIR leaving this directory intact and the build =
would
> > +# regenerate from these files if no changes were made to the configura=
tion.
> > +# If changes were made to the configuration, only shared state files w=
here the
> > +# state was still valid would be used (done using checksums).
> > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > +
> > +#
> > +# Shared-state files from other locations
> > +#
> > +# As mentioned above, shared state files are prebuilt cache data objec=
ts which
> > +# can be used to accelerate build time. This variable can be used to c=
onfigure
> > +# the system to search other mirror locations for these objects before=
 it
> > +# builds the data itself.
> > +#
> > +# This can be a filesystem directory, or a remote url such as http or =
ftp.
> > +# These would contain the sstate-cache results from previous builds (p=
ossibly
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
done and
> > +# where BitBake should place its temporary files and output. Keep in m=
ind that
> > +# this includes the extraction and compilation of many applications an=
d the toolchain
> > +# which can use Gigabytes of hard disk space.
> > +TMPDIR =3D "${TOPDIR}/arago-tmp"
> > +
> > +# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to =
be outside
> > +#DEPLOY_DIR =3D "${TOPDIR}/deploy"
> > +
> > +#
> > +# Machine Selection
> > +#
> > +# You need to select a specific machine to target the build with. Ther=
e are a selection
> > +# of emulated machines available which can boot and run in the QEMU em=
ulator:
> > +#
> > +#MACHINE ?=3D "arago"
> > +
> > +#
> > +# Package Management configuration
> > +#
> > +# This variable lists which packaging formats to enable. Multiple pack=
age backends
> > +# can be enabled at once and the first item listed in the variable wil=
l be used
> > +# to generate the root filesystems.
> > +# Options are:
> > +#  - 'package_deb' for debian style deb files
> > +#  - 'package_ipk' for ipk files are used by opkg (a debian style embe=
dded package manager)
> > +#  - 'package_rpm' for rpm style packages
> > +# E.g.: PACKAGE_CLASSES ?=3D "package_rpm package_deb package_ipk"
> > +# We default to ipk:
> > +PACKAGE_CLASSES ?=3D "package_ipk"
> > +
> > +#
> > +# SDK/ADT target architecture
> > +#
> > +# This variable specified the architecture to build SDK/ADT items for =
and means
> > +# you can build the SDK packages for architectures other than the mach=
ine you are
> > +# running the build on (i.e. building i686 packages on an x86_64 host.=
_
> > +# Supported values are i686 and x86_64
> > +SDKMACHINE ?=3D "x86_64"
> > +
> > +#
> > +# Extra image configuration defaults
> > +#
> > +# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added =
to the generated
> > +# images. Some of these options are added to certain image types autom=
atically. The
> > +# variable can contain the following options:
> > +#  "dbg-pkgs"       - add -dbg packages for all installed packages
> > +#                     (adds symbol information for debugging/profiling=
)
> > +#  "dev-pkgs"       - add -dev packages for all installed packages
> > +#                     (useful if you want to develop against libs in t=
he image)
> > +#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.=
)
> > +#  "tools-debug"    - add debugging tools (gdb, strace)
> > +#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valg=
rind (x86 only))
> > +#  "tools-testapps" - add useful testing tools (ts_print, aplay, areco=
rd etc.)
> > +#  "debug-tweaks"   - make an image suitable for development
> > +#                     e.g. ssh root access has a blank password
> > +# There are other application targets that can be used here too, see
> > +# meta/classes/image.bbclass and meta/classes/core-image.bbclass for m=
ore details.
> > +# We default to enabling the debugging tweaks.
> > +EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> > +
> > +#
> > +# Additional image features
> > +#
> > +# The following is a list of additional classes to use when building i=
mages which
> > +# enable extra features. Some available options which can be included =
in this variable
> > +# are:
> > +#   - 'buildstats' collect build statistics
> > +#   - 'image-swab' to perform host system intrusion detection
> > +# NOTE: mklibs also needs to be explicitly enabled for a given image, =
see local.conf.extended
> > +USER_CLASSES ?=3D "buildstats"
> > +
> > +# By default disable interactive patch resolution (tasks will just fai=
l instead):
> > +PATCHRESOLVE =3D "noop"
> > +
> > +# By default the machine configuration file sets the IMAGE_FSTYPES.  B=
ut if you
> > +# would like to add additional file system types you can uncomment the
> > +# following line and add the additional IMAGE_FSTYPES you want created
> > +# as part of the build flow.  Some common types are listed below and y=
ou
> > +# can remove the ones you do not want.
> > +# IMAGE_FSTYPES +=3D "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz=
 tar.bz2 cpio"
> > +
> > +#
> > +# Parallelism Options
> > +#
> > +# These two options control how much parallelism BitBake should use. T=
he first
> > +# option determines how many tasks bitbake should run in parallel:
> > +#
> > +# BB_NUMBER_THREADS ?=3D "1"
> > +#
> > +# The second option controls how many processes make should run in par=
allel when
> > +# running compile tasks:
> > +#
> > +# PARALLEL_MAKE ?=3D "-j 1"
> > +#
> > +# For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =
=3D "-j 4" would
> > +# be appropriate for example
> > +#
> > +# NOTE: By default, bitbake will choose the number of processeors on y=
our host
> > +# so you should not need to set this unless you are wanting to lower t=
he number
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
> > +# Uncomment this to remove work directory after packaging to save disk=
 space
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
> > +
> > +
> > +#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +# Settings from oe-layersetup config file: processor-sdk-linux-11_00_1=
0_01
> > +#
> > +# Do not remove.
> > +#--------------------------------------------------------------------
> > +DISTRO_FEATURES:append =3D " virtualization"
> > +DISTROOVERRIDES:append =3D ":foundational"
> > +#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/configs/processor-sdk-linux/processor-sdk-linux-11_00_10_0=
1.txt b/configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.txt
> > new file mode 100644
> > index 0000000..2a52cd8
> > --- /dev/null
> > +++ b/configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.txt
> > @@ -0,0 +1,22 @@
> > +# This file takes repo entries in the format
> > +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2..=
.:layern]
> > +
> > +bitbake,https://git.openembedded.org/bitbake,2.8,696c2c1ef095f8b11c7d2=
eff36fae50f58c62e5e
> > +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,c04e85dd2=
07dd24387edac10526b9ec971df9496,layers=3Dmeta-arago-distro:meta-arago-extra=
s:meta-arago-test
> > +meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8=
cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=3Dmeta-chromium
> > +#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD=
,layers=3D
> > +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,338aefa1572bb49e236=
fc0e2c5a565ffbf6b309f,layers=3D
> > +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,s=
carthgap,9287a355b338361e42027ce371444111a791d64f,layers=3D
> > +meta-openembedded,https://git.openembedded.org/meta-openembedded,scart=
hgap,67ad83dd7c2485dae0c90eac345007af6195b84d,layers=3Dmeta-networking:meta=
-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> > +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,a98a2e1029870b2=
5e117d4c9410e75bfd955f35a,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
> > +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,f3640941c600d=
03ea53ce5b9254f0fead18f8bc0,layers=3Dmeta-arm:meta-arm-toolchain
> > +meta-clang,https://github.com/kraj/meta-clang,scarthgap,b9ef0228219738=
0ef05edbd0eb852e1934ceb59b,layers=3D
> > +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,4003b=
5faa1e5acfa025e1d0df4e021e06cf8724c,layers=3Dmeta
> > +
> > +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> > +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> > +BITBAKE_INCLUSIVE_VARS=3Dyes
> > +
> > +meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthga=
p,73aae47bf953dd4cf06e448367135b1cac0869a1,layers=3Dmeta-ti-foundational
> > +LOCALCONF:DISTRO_FEATURES:append =3D " virtualization"
> > +LOCALCONF:DISTROOVERRIDES:append =3D ":foundational"
> > diff --git a/kas/processor-sdk-linux-11_00_10_01.yml b/kas/processor-sd=
k-linux-11_00_10_01.yml
> > new file mode 100644
> > index 0000000..8b5b8d3
> > --- /dev/null
> > +++ b/kas/processor-sdk-linux-11_00_10_01.yml
> > @@ -0,0 +1,95 @@
> > +---
> > +header:
> > +  version: 17
> > +  includes:
> > +    - ./templates/bblayers.conf.yml
> > +    - ./templates/local-arago64-v2.conf.yml
> > +
> > +target: tisdk-default-image
> > +
> > +repos:
> > +  bitbake:
> > +    url: "https://git.openembedded.org/bitbake"
> > +    branch: "2.8"
> > +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> > +    layers:
> > +      .: disabled
> > +
> > +  meta-arago:
> > +    url: "https://git.yoctoproject.org/meta-arago"
> > +    branch: "scarthgap"
> > +    commit: "c04e85dd207dd24387edac10526b9ec971df9496"
> > +    layers:
> > +      meta-arago-distro:
> > +      meta-arago-extras:
> > +      meta-arago-test:
> > +
> > +  meta-browser:
> > +    url: "https://github.com/OSSystems/meta-browser.git"
> > +    branch: "master"
> > +    commit: "68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4"
> > +    layers:
> > +      meta-chromium:
> > +
> > +  meta-qt6:
> > +    url: "https://code.qt.io/yocto/meta-qt6.git"
> > +    branch: "6.9"
> > +    commit: "338aefa1572bb49e236fc0e2c5a565ffbf6b309f"
> > +
> > +  meta-virtualization:
> > +    url: "https://git.yoctoproject.org/meta-virtualization"
> > +    branch: "scarthgap"
> > +    commit: "9287a355b338361e42027ce371444111a791d64f"
> > +
> > +  meta-openembedded:
> > +    url: "https://git.openembedded.org/meta-openembedded"
> > +    branch: "scarthgap"
> > +    commit: "67ad83dd7c2485dae0c90eac345007af6195b84d"
> > +    layers:
> > +      meta-networking:
> > +      meta-python:
> > +      meta-oe:
> > +      meta-gnome:
> > +      meta-filesystems:
> > +      meta-multimedia:
> > +
> > +  meta-ti:
> > +    url: "https://git.yoctoproject.org/meta-ti"
> > +    branch: "scarthgap"
> > +    commit: "a98a2e1029870b25e117d4c9410e75bfd955f35a"
> > +    layers:
> > +      meta-ti-extras:
> > +      meta-beagle:
> > +      meta-ti-bsp:
> > +
> > +  meta-arm:
> > +    url: "https://git.yoctoproject.org/meta-arm"
> > +    branch: "scarthgap"
> > +    commit: "f3640941c600d03ea53ce5b9254f0fead18f8bc0"
> > +    layers:
> > +      meta-arm:
> > +      meta-arm-toolchain:
> > +
> > +  meta-clang:
> > +    url: "https://github.com/kraj/meta-clang"
> > +    branch: "scarthgap"
> > +    commit: "b9ef02282197380ef05edbd0eb852e1934ceb59b"
> > +
> > +  oe-core:
> > +    url: "https://git.openembedded.org/openembedded-core"
> > +    branch: "scarthgap"
> > +    commit: "4003b5faa1e5acfa025e1d0df4e021e06cf8724c"
> > +    layers:
> > +      meta:
> > +
> > +  meta-tisdk:
> > +    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
> > +    branch: "scarthgap"
> > +    commit: "73aae47bf953dd4cf06e448367135b1cac0869a1"
> > +    layers:
> > +      meta-ti-foundational:
> > +
> > +local_conf_header:
> > +  oe-layersetup-local-conf-config-specific: |
> > +    DISTRO_FEATURES:append =3D " virtualization"
> > +    DISTROOVERRIDES:append =3D ":foundational"
> > diff --git a/src/configs/processor-sdk-linux-11_00_10_01.xml b/src/conf=
igs/processor-sdk-linux-11_00_10_01.xml
> > new file mode 100644
> > index 0000000..1f42cb0
> > --- /dev/null
> > +++ b/src/configs/processor-sdk-linux-11_00_10_01.xml
> > @@ -0,0 +1,81 @@
> > +<?xml version=3D'1.0'?>
> > +<config>
> > +    <description></description>
> > +
> > +    <xi:include href=3D'../common/targets_arago.xml' xmlns:xi=3D'http:=
//www.w3.org/2001/XInclude'/>
> > +    <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'ht=
tp://www.w3.org/2001/XInclude'/>
> > +    <xi:include href=3D'../templates/local-arago64-v2.conf.xml' xmlns:=
xi=3D'http://www.w3.org/2001/XInclude'/>
> > +
> > +    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.=
8' commit=3D'696c2c1ef095f8b11c7d2eff36fae50f58c62e5e'/>
> > +
> > +    <repos>
> > +        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/=
meta-arago' branch=3D'scarthgap' commit=3D'c04e85dd207dd24387edac10526b9ec9=
71df9496'>
> > +            <layers>
> > +                <layer>meta-arago-distro</layer>
> > +                <layer>meta-arago-extras</layer>
> > +                <layer>meta-arago-test</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystem=
s/meta-browser.git' branch=3D'master' commit=3D'68e8cbf51ac46c8c1b3923ee2b2=
0e27ba9d3faa4'>
> > +            <layers>
> > +                <layer>meta-chromium</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.or=
g/meta-selinux' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
> > +            <layers/>
> > +        </repo>
> > +        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-q=
t6.git' branch=3D'6.9' commit=3D'338aefa1572bb49e236fc0e2c5a565ffbf6b309f'>
> > +            <layers/>
> > +        </repo>
> > +        <repo name=3D'meta-virtualization' url=3D'https://git.yoctopro=
ject.org/meta-virtualization' branch=3D'scarthgap' commit=3D'9287a355b33836=
1e42027ce371444111a791d64f'>
> > +            <layers/>
> > +        </repo>
> > +        <repo name=3D'meta-openembedded' url=3D'https://git.openembedd=
ed.org/meta-openembedded' branch=3D'scarthgap' commit=3D'67ad83dd7c2485dae0=
c90eac345007af6195b84d'>
> > +            <layers>
> > +                <layer>meta-networking</layer>
> > +                <layer>meta-python</layer>
> > +                <layer>meta-oe</layer>
> > +                <layer>meta-gnome</layer>
> > +                <layer>meta-filesystems</layer>
> > +                <layer>meta-multimedia</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/met=
a-ti' branch=3D'scarthgap' commit=3D'a98a2e1029870b25e117d4c9410e75bfd955f3=
5a'>
> > +            <layers>
> > +                <layer>meta-ti-extras</layer>
> > +                <layer>meta-beagle</layer>
> > +                <layer>meta-ti-bsp</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/me=
ta-arm' branch=3D'scarthgap' commit=3D'f3640941c600d03ea53ce5b9254f0fead18f=
8bc0'>
> > +            <layers>
> > +                <layer>meta-arm</layer>
> > +                <layer>meta-arm-toolchain</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-=
clang' branch=3D'scarthgap' commit=3D'b9ef02282197380ef05edbd0eb852e1934ceb=
59b'>
> > +            <layers/>
> > +        </repo>
> > +        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/ope=
nembedded-core' branch=3D'scarthgap' commit=3D'4003b5faa1e5acfa025e1d0df4e0=
21e06cf8724c'>
> > +            <layers>
> > +                <layer>meta</layer>
> > +            </layers>
> > +        </repo>
> > +        <repo name=3D'meta-tisdk' url=3D'https://git.ti.com/git/ti-sdk=
-linux/meta-tisdk.git' branch=3D'scarthgap' commit=3D'73aae47bf953dd4cf06e4=
48367135b1cac0869a1'>
> > +            <layers>
> > +                <layer>meta-ti-foundational</layer>
> > +            </layers>
> > +        </repo>
> > +    </repos>
> > +
> > +    <local-conf>
> > +        <line>DISTRO_FEATURES:append =3D " virtualization"</line>
> > +        <line>DISTROOVERRIDES:append =3D ":foundational"</line>
> > +    </local-conf>
> > +
> > +    <tools>
> > +        <tool type=3D'oe-layersetup'>
> > +            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
> > +        </tool>
> > +    </tools>
> > +</config>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16523): https://lists.yoctoproject.org/g/meta-arago/m=
essage/16523
> Mute This Topic: https://lists.yoctoproject.org/mt/115022620/7902621
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

