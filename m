Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD08C021BB
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 16:45:08 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.95081.1740415498657760174
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 08:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=Bfwr3VwU;
 spf=pass (domain: criticallink.com, ip: 209.85.208.179, mailfrom: jcormier@criticallink.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30613802a6bso48258501fa.1
        for <meta-arago@lists.yoctoproject.org>; Mon, 24 Feb 2025 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1740415497; x=1741020297; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GQX52RCIP+xS+UAtyCOqhAOdsEqA7EagLKhQsPIIjNY=;
        b=Bfwr3VwUIh3VtGUCERErvzxDu2BSSLZJ1bl/ELpYMHIDi9dKjHTYWUgAkhmoHMqVwW
         pTARgsYPkbXfKnNczVePseUEDQLzsYT34mt4IghYvWuQIW0Bc2FlAejvu4XR88Y7/FSM
         WG+pxgA9rPZMMPQzhaMSb7ekmNJqhd6qnd8bCEdvNEUUUpMQDFP5lDitO3L3s/mqFLtn
         AE/ckbBRh/ywvGfCURrYxA9FF4cBO+XoN637TxHjFThZnGdJFpqZ6mWXhiR/rDxrg0uS
         ML9rhes247gV+pXX+6sa++z5BPkDRIrEebVPaDkHbTS+w4mtvp2IhCsKEe1j4EiR4Fr4
         HRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740415497; x=1741020297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQX52RCIP+xS+UAtyCOqhAOdsEqA7EagLKhQsPIIjNY=;
        b=u+IyH4d6uMPRhLE7OO1Yn+PKAyApCOVR9SDdfYO5UuGu3Gn41xlaJ+Ggi1C7EZclwg
         1OPknrGBC6QxDaoEtab76GEb+OIwufDzxhtbzdsCOIgt8Iy72BgyR+2WnzOe41ReuiiG
         3FwGrF5doON8ZZ6nHiZaHghTwF0XbmfIApBFGgpVNzf8jwPeKK5XmlHreUBDsrHhD1kn
         mco+IPKm83a5oU27AgYIgjD/w9Ld9VP7DscyzDo6HBKgQqGXLcmQGO/fqZk9cqrtxfz2
         aIxXOCGwL/iLzdR06V4XQYZ4iBz/+M6TYVx5AgIHRiPLGWa2HE1oUAajdJvVg1BD8FkO
         ISvg==
X-Forwarded-Encrypted: i=1; AJvYcCX2twLwl4ue7nut5D6S4AIX419dldg79LKHgeKFmpPz4hVxlfFr7jr1FoJszeHZuX5b2B1q0CtzZ96+@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwFVJJX84+vmeeEyYothr1lj7qOy39Rld2e/gTCJbG0nqIzWUz3
	43cIeqF5Nbj7p37mAdRw56BuOXX3Yzafsiec+xWxOB1n4i89H+tpONLbAzljohb8DfRVWi64SPT
	cBpT/gsJHUStrqD3SpIL2xixsHjC1nvi5yUWl
X-Gm-Gg: ASbGnctEehRN8x5XAboPCYPiVaYoPJPWhqRl6IgCu5q//lc/DgvT/Eh1f1083ek1eu0
	LMa+OQR79sqov+rMds6nKJmtIoAiSImSFPK8JfeqCMndAtnBZ6HNxs6sDqONwGJFqIhm6LGiUxK
	sjwjMgvQ==
X-Google-Smtp-Source: AGHT+IHQ7DMPGVxdy9FiLBJZNOlzBWaNwDPu5e51OOHAAa/CfJKUh39tWvXlo7kP0i3dwsJQH4c1DNRkX3spGKljWBA=
X-Received: by 2002:a2e:9cd5:0:b0:300:1ea5:1655 with SMTP id
 38308e7fff4ca-30a598de36emr45261871fa.15.1740415495990; Mon, 24 Feb 2025
 08:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20250221163150.3367-1-reatmon@ti.com> <CADL8D3aHkzaCiQQUaSA+L6OkxH=_RkzW07FTs_Yv0gMM7XdR+w@mail.gmail.com>
 <18272C9B4C413796.25123@lists.yoctoproject.org>
In-Reply-To: <18272C9B4C413796.25123@lists.yoctoproject.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 24 Feb 2025 11:44:43 -0500
X-Gm-Features: AWEUYZnd6ZkMdZEO2MdYTGkSqGUw5tqS_MAzTHBQfdEXl7j2qt3WhQdvBLmfaS0
Message-ID: <CADL8D3b6eh2+WMLX1SC_yR=8yUL2hD4F7cfPGTEPtML-BVvjLg@mail.gmail.com>
Subject: Re: [meta-arago] [oe-layersetup][master][PATCH v2] templates: Fix
 paths for DL_DIR and SSTATE_DIR
To: jcormier@criticallink.com
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, 
	meta-arago@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000668fee062ee60f2e"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Feb 2025 16:45:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15904

--000000000000668fee062ee60f2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 9:53=E2=80=AFAM Jon Cormier via lists.yoctoproject.=
org
<jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:

> Ryan, I also had a question about the bitbake-setup configs.  Is there so=
me
> documentation on this setup tool?  Googling this is tricky since the name
> is so generic. The other tools docs pop right up in google.
>
Nevermind, looks like the work is being done here:
https://github.com/kanavin/bitbake

>
> On Fri, Feb 21, 2025 at 2:18=E2=80=AFPM Jon Cormier <jcormier@criticallin=
k.com>
> wrote:
>
> > Ryan, I think you also need to touch TMPDIR in a few of the local.conf
> > files
> >
> >
> > On Fri, Feb 21, 2025 at 11:31=E2=80=AFAM Ryan Eatmon via
> > lists.yoctoproject.org <reatmon=3Dti.com@lists.yoctoproject.org> wrote:
> > >
> > > When the conversion to the new XML/XSLT system was done, the referenc=
e
> > > to OEBASE was converted to TOPDIR.  The value for OEBASE was
> > > historically the directory above the bitbake run dir which is what
> > > TOPDIR is set to.  This made the downloads and sstate_cache directori=
es
> > > appear down a level of directory that was unintended.
> > >
> > > This change updates the values for DL_DIR and SSTATE_DIR to be relati=
ve
> > > to TOPDIR but back in the same location they were originally meant to
> be
> > > in.
> > >
> > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > ---
> > > v2: I ran a make clean and make and a lot more configs got updated wi=
th
> > > the change.  Clearly I need to rework the make system.
> > >
> > >  bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json    | 2 +-
> > >  .../arago-kirkstone-chromium-config/local.conf.sample         | 4 ++=
--
> > >  conf/templates/arago-kirkstone-config/local.conf.sample       | 4 ++=
--
> > >  conf/templates/arago-kirkstone-next-config/local.conf.sample  | 4 ++=
--
> > >  conf/templates/arago-kirkstone-wip-config/local.conf.sample   | 4 ++=
--
> > >  conf/templates/arago-master-chromium-config/local.conf.sample | 4 ++=
--
> > >  conf/templates/arago-master-config/local.conf.sample          | 4 ++=
--
> > >  conf/templates/arago-master-next-config/local.conf.sample     | 4 ++=
--
> > >  conf/templates/arago-master-selinux-config/local.conf.sample  | 4 ++=
--
> > >  conf/templates/arago-master-wip-config/local.conf.sample      | 4 ++=
--
> > >  .../arago-scarthgap-chromium-config/local.conf.sample         | 4 ++=
--
> > >  conf/templates/arago-scarthgap-config/local.conf.sample       | 4 ++=
--
> > >  conf/templates/arago-scarthgap-next-config/local.conf.sample  | 4 ++=
--
> > >  .../arago-scarthgap-selinux-config/local.conf.sample          | 4 ++=
--
> > >  conf/templates/arago-scarthgap-wip-config/local.conf.sample   | 4 ++=
--
> > >  .../coresdk_coresdk-09.00.00.006-config/local.conf.sample     | 4 ++=
--
> > >  .../coresdk_coresdk-09.00.00.007-config/local.conf.sample     | 4 ++=
--
> > >  .../coresdk_coresdk-09.00.00.011-config/local.conf.sample     | 4 ++=
--
> > >  .../coresdk_coresdk-09.01.00.001-config/local.conf.sample     | 4 ++=
--
> > >  .../coresdk_coresdk-09.01.00.003-config/local.conf.sample     | 4 ++=
--
> > >  .../coresdk_coresdk-09.01.00.007-config/local.conf.sample     | 4 ++=
--
> > >  .../coresdk_coresdk-09.01.00.008-config/local.conf.sample     | 4 ++=
--
> > >  .../coresdk_coresdk-09.02.00.008-config/local.conf.sample     | 4 ++=
--
> > >  .../coresdk_coresdk-09.02.00.009-config/local.conf.sample     | 4 ++=
--
> > >  .../coresdk_coresdk-09.02.00.010-config/local.conf.sample     | 4 ++=
--
> > >  .../coresdk_coresdk-09.03.05-config/local.conf.sample         | 4 ++=
--
> > >  .../coresdk_coresdk-10.00.07-config/local.conf.sample         | 4 ++=
--
> > >  .../coresdk_coresdk-10.01.08-config/local.conf.sample         | 4 ++=
--
> > >  .../coresdk_coresdk-10.01.10-config/local.conf.sample         | 4 ++=
--
> > >  .../coresdk_coresdk-10.01.10-selinux-config/local.conf.sample | 4 ++=
--
> > >  conf/templates/distroless-kirkstone-config/local.conf.sample  | 4 ++=
--
> > >  conf/templates/distroless-master-config/local.conf.sample     | 4 ++=
--
> > >  conf/templates/distroless-scarthgap-config/local.conf.sample  | 4 ++=
--
> > >  conf/templates/poky-kirkstone-config/local.conf.sample        | 4 ++=
--
> > >  conf/templates/poky-master-config/local.conf.sample           | 4 ++=
--
> > >  conf/templates/poky-master-wip-config/local.conf.sample       | 4 ++=
--
> > >  conf/templates/poky-scarthgap-config/local.conf.sample        | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  .../local.conf.sample                                         | 4 ++=
--
> > >  configs/arago-master-wip-config.txt                           | 2 +-
> > >  .../processor-sdk-scarthgap-10.01.10.04-config.yml            | 1 +
> > >  .../processor-sdk-scarthgap-chromium-10.01.10.04-config.yml   | 1 +
> > >  kas/templates/local-arago64-v2.conf.yml                       | 4 ++=
--
> > >  kas/templates/local-arago64-v3.conf.yml                       | 4 ++=
--
> > >  kas/templates/local-poky-v2.conf.yml                          | 4 ++=
--
> > >  kas/templates/local-poky-v3.conf.yml                          | 4 ++=
--
> > >  kas/templates/local-v2.conf.yml                               | 4 ++=
--
> > >  kas/templates/local-v3.conf.yml                               | 4 ++=
--
> > >  sample-files/local-arago64-v2.conf.sample                     | 4 ++=
--
> > >  sample-files/local-arago64-v3.conf.sample                     | 4 ++=
--
> > >  sample-files/local-poky-v2.conf.sample                        | 4 ++=
--
> > >  sample-files/local-poky-v3.conf.sample                        | 4 ++=
--
> > >  sample-files/local-v2.conf.sample                             | 4 ++=
--
> > >  sample-files/local-v3.conf.sample                             | 4 ++=
--
> > >  src/bin/convert.pl                                            | 2 +-
> > >  src/templates/local-arago64-v2.conf.xml                       | 4 ++=
--
> > >  src/templates/local-arago64-v3.conf.xml                       | 4 ++=
--
> > >  src/templates/local-poky-v2.conf.xml                          | 4 ++=
--
> > >  src/templates/local-poky-v3.conf.xml                          | 4 ++=
--
> > >  src/templates/local-v2.conf.xml                               | 4 ++=
--
> > >  src/templates/local-v3.conf.xml                               | 4 ++=
--
> > >  90 files changed, 175 insertions(+), 173 deletions(-)
> > >
> > > diff --git a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.js=
on
> > b/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
> > > index 1cc2962..8acd24a 100644
> > > --- a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
> > > +++ b/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
> > > @@ -9,7 +9,7 @@
> > >              "uri": "
> > https://git.ti.com/git/arago-project/oe-layersetup.git"
> > >            }
> > >          },
> > > -        "rev": "wip"
> > > +        "rev": "master"
> > >        },
> > >        "path": "oe-layersetup"
> > >      },
> > > diff --git
> > a/conf/templates/arago-kirkstone-chromium-config/local.conf.sample
> > b/conf/templates/arago-kirkstone-chromium-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/conf/templates/arago-kirkstone-chromium-config/local.conf.sampl=
e
> > > +++ b/conf/templates/arago-kirkstone-chromium-config/local.conf.sampl=
e
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/conf/templates/arago-kirkstone-config/local.conf.sample
> > b/conf/templates/arago-kirkstone-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/conf/templates/arago-kirkstone-config/local.conf.sample
> > > +++ b/conf/templates/arago-kirkstone-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/arago-kirkstone-next-config/local.conf.sample
> > b/conf/templates/arago-kirkstone-next-config/local.conf.sample
> > > index cb76dd8..d97939a 100644
> > > --- a/conf/templates/arago-kirkstone-next-config/local.conf.sample
> > > +++ b/conf/templates/arago-kirkstone-next-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> a/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> > b/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> > > +++ b/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/arago-master-chromium-config/local.conf.sample
> > b/conf/templates/arago-master-chromium-config/local.conf.sample
> > > index f2e9587..720ce11 100644
> > > --- a/conf/templates/arago-master-chromium-config/local.conf.sample
> > > +++ b/conf/templates/arago-master-chromium-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/conf/templates/arago-master-config/local.conf.sample
> > b/conf/templates/arago-master-config/local.conf.sample
> > > index f2e9587..720ce11 100644
> > > --- a/conf/templates/arago-master-config/local.conf.sample
> > > +++ b/conf/templates/arago-master-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/conf/templates/arago-master-next-config/local.conf.sampl=
e
> > b/conf/templates/arago-master-next-config/local.conf.sample
> > > index 6c32f4b..c1549ac 100644
> > > --- a/conf/templates/arago-master-next-config/local.conf.sample
> > > +++ b/conf/templates/arago-master-next-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/arago-master-selinux-config/local.conf.sample
> > b/conf/templates/arago-master-selinux-config/local.conf.sample
> > > index 5cc19d4..dfb4873 100644
> > > --- a/conf/templates/arago-master-selinux-config/local.conf.sample
> > > +++ b/conf/templates/arago-master-selinux-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/conf/templates/arago-master-wip-config/local.conf.sample
> > b/conf/templates/arago-master-wip-config/local.conf.sample
> > > index f2e9587..720ce11 100644
> > > --- a/conf/templates/arago-master-wip-config/local.conf.sample
> > > +++ b/conf/templates/arago-master-wip-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
> > b/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/conf/templates/arago-scarthgap-chromium-config/local.conf.sampl=
e
> > > +++ b/conf/templates/arago-scarthgap-chromium-config/local.conf.sampl=
e
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/conf/templates/arago-scarthgap-config/local.conf.sample
> > b/conf/templates/arago-scarthgap-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/conf/templates/arago-scarthgap-config/local.conf.sample
> > > +++ b/conf/templates/arago-scarthgap-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/arago-scarthgap-next-config/local.conf.sample
> > b/conf/templates/arago-scarthgap-next-config/local.conf.sample
> > > index dbb184b..3ad6481 100644
> > > --- a/conf/templates/arago-scarthgap-next-config/local.conf.sample
> > > +++ b/conf/templates/arago-scarthgap-next-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
> > b/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
> > > index 46869ad..c862657 100644
> > > --- a/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
> > > +++ b/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> a/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> > b/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> > > +++ b/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> > a/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sample
> > > +++
> > b/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> > a/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sample
> > > +++
> > b/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> > a/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sample
> > > +++
> > b/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> > a/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sample
> > > +++
> > b/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> > a/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sample
> > > +++
> > b/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> > a/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sample
> > > +++
> > b/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> > a/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sample
> > > +++
> > b/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> > a/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sample
> > > +++
> > b/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> > a/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sample
> > > +++
> > b/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> > a/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sample
> > > +++
> > b/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sampl=
e
> > > +++ b/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sampl=
e
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sampl=
e
> > > +++ b/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sampl=
e
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sampl=
e
> > > +++ b/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sampl=
e
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample
> > b/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sampl=
e
> > > +++ b/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sampl=
e
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sampl=
e
> >
> b/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sampl=
e
> > > index e45417c..27f1704 100644
> > > ---
> >
> a/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sampl=
e
> > > +++
> >
> b/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sampl=
e
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/distroless-kirkstone-config/local.conf.sample
> > b/conf/templates/distroless-kirkstone-config/local.conf.sample
> > > index 46cb253..b499977 100644
> > > --- a/conf/templates/distroless-kirkstone-config/local.conf.sample
> > > +++ b/conf/templates/distroless-kirkstone-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/conf/templates/distroless-master-config/local.conf.sampl=
e
> > b/conf/templates/distroless-master-config/local.conf.sample
> > > index bcdaaa4..7d218e8 100644
> > > --- a/conf/templates/distroless-master-config/local.conf.sample
> > > +++ b/conf/templates/distroless-master-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> > a/conf/templates/distroless-scarthgap-config/local.conf.sample
> > b/conf/templates/distroless-scarthgap-config/local.conf.sample
> > > index 46cb253..b499977 100644
> > > --- a/conf/templates/distroless-scarthgap-config/local.conf.sample
> > > +++ b/conf/templates/distroless-scarthgap-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/conf/templates/poky-kirkstone-config/local.conf.sample
> > b/conf/templates/poky-kirkstone-config/local.conf.sample
> > > index e67385d..12eacfc 100644
> > > --- a/conf/templates/poky-kirkstone-config/local.conf.sample
> > > +++ b/conf/templates/poky-kirkstone-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/conf/templates/poky-master-config/local.conf.sample
> > b/conf/templates/poky-master-config/local.conf.sample
> > > index 1fe5688..e0112c7 100644
> > > --- a/conf/templates/poky-master-config/local.conf.sample
> > > +++ b/conf/templates/poky-master-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/conf/templates/poky-master-wip-config/local.conf.sample
> > b/conf/templates/poky-master-wip-config/local.conf.sample
> > > index 1fe5688..e0112c7 100644
> > > --- a/conf/templates/poky-master-wip-config/local.conf.sample
> > > +++ b/conf/templates/poky-master-wip-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/conf/templates/poky-scarthgap-config/local.conf.sample
> > b/conf/templates/poky-scarthgap-config/local.conf.sample
> > > index e67385d..12eacfc 100644
> > > --- a/conf/templates/poky-scarthgap-config/local.conf.sample
> > > +++ b/conf/templates/poky-scarthgap-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00=
-config/local.conf.sample
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00=
-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00=
-config/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00=
-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01=
-config/local.conf.sample
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01=
-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01=
-config/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01=
-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00=
-config/local.conf.sample
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00=
-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00=
-config/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00=
-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00=
-config/local.conf.sample
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00=
-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00=
-config/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00=
-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00=
-config/local.conf.sample
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00=
-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00=
-config/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00=
-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00=
-config/local.conf.sample
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00=
-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00=
-config/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00=
-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.co=
nf.sample
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.co=
nf.sample
> > > index 6b91881..1149e85 100644
> > > ---
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.co=
nf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.co=
nf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/loca=
l.conf.sample
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/loca=
l.conf.sample
> > > index e4f04f3..a0d9b30 100644
> > > ---
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/loca=
l.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/loca=
l.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/loca=
l.conf.sample
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/loca=
l.conf.sample
> > > index 32a6cfb..9dd0dfa 100644
> > > ---
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/loca=
l.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/loca=
l.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/loca=
l.conf.sample
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/loca=
l.conf.sample
> > > index ee23c20..a83b490 100644
> > > ---
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/loca=
l.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/loca=
l.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/loca=
l.conf.sample
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/loca=
l.conf.sample
> > > index c29b416..e743654 100644
> > > ---
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/loca=
l.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/loca=
l.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/loca=
l.conf.sample
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/loca=
l.conf.sample
> > > index 34afc91..8096a3b 100644
> > > ---
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/loca=
l.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/loca=
l.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/loca=
l.conf.sample
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/loca=
l.conf.sample
> > > index f592ad9..31bfec8 100644
> > > ---
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/loca=
l.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/loca=
l.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/loca=
l.conf.sample
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/loca=
l.conf.sample
> > > index 0df5360..145aed2 100644
> > > ---
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/loca=
l.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/loca=
l.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/loca=
l.conf.sample
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/loca=
l.conf.sample
> > > index 5e39ec4..016f942 100644
> > > ---
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/loca=
l.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/loca=
l.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/loca=
l.conf.sample
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/loca=
l.conf.sample
> > > index 689e5d8..e627f36 100644
> > > ---
> >
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/loca=
l.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/loca=
l.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/lo=
cal.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/lo=
cal.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/lo=
cal.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/lo=
cal.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf.s=
ample
> >
> b/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf.s=
ample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf.s=
ample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf.s=
ample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/local=
.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/local=
.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/local=
.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/local=
.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf.s=
ample
> >
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf.s=
ample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf.s=
ample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf.s=
ample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/local=
.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/local=
.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/local=
.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/local=
.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/loc=
al.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/loc=
al.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/loc=
al.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/loc=
al.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/lo=
cal.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/lo=
cal.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/lo=
cal.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/lo=
cal.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config=
/local.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config=
/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config=
/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config=
/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config=
/local.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config=
/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config=
/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config=
/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
09-config/local.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
09-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
09-config/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
09-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
10-config/local.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
10-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
10-config/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
10-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config=
/local.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config=
/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config=
/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config=
/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.=
04-config/local.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.=
04-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.=
04-config/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.=
04-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git
> >
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> >
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > ---
> >
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> > > +++
> >
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/configs/arago-master-wip-config.txt
> > b/configs/arago-master-wip-config.txt
> > > index eb9c49d..165a3d1 100644
> > > --- a/configs/arago-master-wip-config.txt
> > > +++ b/configs/arago-master-wip-config.txt
> > > @@ -5,7 +5,7 @@ bitbake,
> https://git.openembedded.org/bitbake,master,HEAD
> > >  meta-arago,
> >
> https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=3Dmeta-ara=
go-distro:meta-arago-extras:meta-arago-test
> > >  #meta-browser,
> >
> https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=3Dmeta-c=
hromium
> > >  #meta-selinux,
> > https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=3D
> > > -meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
=3D
> > > +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
> > >  meta-virtualization,
> > https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=3D
> > >  meta-openembedded,
> >
> https://git.openembedded.org/meta-openembedded,master,HEAD,layers=3Dmeta-=
networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> > >  meta-ti,
> >
> https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta-ti-ext=
ras:meta-beagle:meta-ti-bsp
> > > diff --git
> > a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> > b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> > > index 5ced779..2dc2f5c 100644
> > > --- a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.ym=
l
> > > +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.ym=
l
> > > @@ -71,3 +71,4 @@ repos:
> > >      commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
> > >      layers:
> > >        meta:
> > > +
> > > diff --git
> >
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> >
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> > > index 405fa3b..351d9ea 100644
> > > ---
> >
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> > > +++
> >
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> > > @@ -83,3 +83,4 @@ repos:
> > >      url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
> > >      branch: "scarthgap"
> > >      commit: "10.01.10.04"
> > > +
> > > diff --git a/kas/templates/local-arago64-v2.conf.yml
> > b/kas/templates/local-arago64-v2.conf.yml
> > > index c79388d..c6781be 100644
> > > --- a/kas/templates/local-arago64-v2.conf.yml
> > > +++ b/kas/templates/local-arago64-v2.conf.yml
> > > @@ -15,7 +15,7 @@ local_conf_header:
> > >      # wiping and rebuilding you can preserve this directory to speed
> up
> > this part
> > >      # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >      # on the same machine too.
> > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >      #
> > >      # Where to place shared-state files
> > > @@ -28,7 +28,7 @@ local_conf_header:
> > >      # regenerate from these files if no changes were made to the
> > configuration.
> > >      # If changes were made to the configuration, only shared state
> > files where the
> > >      # state was still valid would be used (done using checksums).
> > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >      #
> > >      # Shared-state files from other locations
> > > diff --git a/kas/templates/local-arago64-v3.conf.yml
> > b/kas/templates/local-arago64-v3.conf.yml
> > > index b182483..3fa683e 100644
> > > --- a/kas/templates/local-arago64-v3.conf.yml
> > > +++ b/kas/templates/local-arago64-v3.conf.yml
> > > @@ -15,7 +15,7 @@ local_conf_header:
> > >      # wiping and rebuilding you can preserve this directory to speed
> up
> > this part
> > >      # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >      # on the same machine too.
> > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >      #
> > >      # Where to place shared-state files
> > > @@ -28,7 +28,7 @@ local_conf_header:
> > >      # regenerate from these files if no changes were made to the
> > configuration.
> > >      # If changes were made to the configuration, only shared state
> > files where the
> > >      # state was still valid would be used (done using checksums).
> > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >      #
> > >      # Shared-state files from other locations
> > > diff --git a/kas/templates/local-poky-v2.conf.yml
> > b/kas/templates/local-poky-v2.conf.yml
> > > index 91995fe..075f535 100644
> > > --- a/kas/templates/local-poky-v2.conf.yml
> > > +++ b/kas/templates/local-poky-v2.conf.yml
> > > @@ -15,7 +15,7 @@ local_conf_header:
> > >      # wiping and rebuilding you can preserve this directory to speed
> up
> > this part
> > >      # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >      # on the same machine too.
> > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >      #
> > >      # Where to place shared-state files
> > > @@ -28,7 +28,7 @@ local_conf_header:
> > >      # regenerate from these files if no changes were made to the
> > configuration.
> > >      # If changes were made to the configuration, only shared state
> > files where the
> > >      # state was still valid would be used (done using checksums).
> > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >      #
> > >      # Shared-state files from other locations
> > > diff --git a/kas/templates/local-poky-v3.conf.yml
> > b/kas/templates/local-poky-v3.conf.yml
> > > index 7368fb0..193a1ce 100644
> > > --- a/kas/templates/local-poky-v3.conf.yml
> > > +++ b/kas/templates/local-poky-v3.conf.yml
> > > @@ -15,7 +15,7 @@ local_conf_header:
> > >      # wiping and rebuilding you can preserve this directory to speed
> up
> > this part
> > >      # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >      # on the same machine too.
> > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >      #
> > >      # Where to place shared-state files
> > > @@ -28,7 +28,7 @@ local_conf_header:
> > >      # regenerate from these files if no changes were made to the
> > configuration.
> > >      # If changes were made to the configuration, only shared state
> > files where the
> > >      # state was still valid would be used (done using checksums).
> > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >      #
> > >      # Shared-state files from other locations
> > > diff --git a/kas/templates/local-v2.conf.yml
> > b/kas/templates/local-v2.conf.yml
> > > index 3d666e4..f33fd45 100644
> > > --- a/kas/templates/local-v2.conf.yml
> > > +++ b/kas/templates/local-v2.conf.yml
> > > @@ -15,7 +15,7 @@ local_conf_header:
> > >      # wiping and rebuilding you can preserve this directory to speed
> up
> > this part
> > >      # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >      # on the same machine too.
> > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >      #
> > >      # Where to place shared-state files
> > > @@ -28,7 +28,7 @@ local_conf_header:
> > >      # regenerate from these files if no changes were made to the
> > configuration.
> > >      # If changes were made to the configuration, only shared state
> > files where the
> > >      # state was still valid would be used (done using checksums).
> > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >      #
> > >      # Shared-state files from other locations
> > > diff --git a/kas/templates/local-v3.conf.yml
> > b/kas/templates/local-v3.conf.yml
> > > index 063b863..07eb5af 100644
> > > --- a/kas/templates/local-v3.conf.yml
> > > +++ b/kas/templates/local-v3.conf.yml
> > > @@ -15,7 +15,7 @@ local_conf_header:
> > >      # wiping and rebuilding you can preserve this directory to speed
> up
> > this part
> > >      # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >      # on the same machine too.
> > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >      #
> > >      # Where to place shared-state files
> > > @@ -28,7 +28,7 @@ local_conf_header:
> > >      # regenerate from these files if no changes were made to the
> > configuration.
> > >      # If changes were made to the configuration, only shared state
> > files where the
> > >      # state was still valid would be used (done using checksums).
> > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >      #
> > >      # Shared-state files from other locations
> > > diff --git a/sample-files/local-arago64-v2.conf.sample
> > b/sample-files/local-arago64-v2.conf.sample
> > > index 7575b4b..8ad6f26 100644
> > > --- a/sample-files/local-arago64-v2.conf.sample
> > > +++ b/sample-files/local-arago64-v2.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/sample-files/local-arago64-v3.conf.sample
> > b/sample-files/local-arago64-v3.conf.sample
> > > index f2e9587..720ce11 100644
> > > --- a/sample-files/local-arago64-v3.conf.sample
> > > +++ b/sample-files/local-arago64-v3.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/sample-files/local-poky-v2.conf.sample
> > b/sample-files/local-poky-v2.conf.sample
> > > index e67385d..12eacfc 100644
> > > --- a/sample-files/local-poky-v2.conf.sample
> > > +++ b/sample-files/local-poky-v2.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/sample-files/local-poky-v3.conf.sample
> > b/sample-files/local-poky-v3.conf.sample
> > > index 1fe5688..e0112c7 100644
> > > --- a/sample-files/local-poky-v3.conf.sample
> > > +++ b/sample-files/local-poky-v3.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/sample-files/local-v2.conf.sample
> > b/sample-files/local-v2.conf.sample
> > > index 46cb253..b499977 100644
> > > --- a/sample-files/local-v2.conf.sample
> > > +++ b/sample-files/local-v2.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/sample-files/local-v3.conf.sample
> > b/sample-files/local-v3.conf.sample
> > > index bcdaaa4..7d218e8 100644
> > > --- a/sample-files/local-v3.conf.sample
> > > +++ b/sample-files/local-v3.conf.sample
> > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > >  # wiping and rebuilding you can preserve this directory to speed up
> > this part
> > >  # of subsequent builds. This directory is safe to share between
> > multiple builds
> > >  # on the same machine too.
> > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > >
> > >  #
> > >  # Where to place shared-state files
> > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > >  # regenerate from these files if no changes were made to the
> > configuration.
> > >  # If changes were made to the configuration, only shared state files
> > where the
> > >  # state was still valid would be used (done using checksums).
> > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > >
> > >  #
> > >  # Shared-state files from other locations
> > > diff --git a/src/bin/convert.pl b/src/bin/convert.pl
> > > index 2787b86..42b9c2c 100755
> > > --- a/src/bin/convert.pl
> > > +++ b/src/bin/convert.pl
> > > @@ -501,7 +501,7 @@ sub convert_local_conf_template
> > >      {
> > >          chomp($lpLine);
> > >
> > > -        $lpLine =3D~ s/OEBASE/TOPDIR/;
> > > +        $lpLine =3D~ s/OEBASE/TOPDIR\/\.\./;
> > >          $lpLine =3D~ s/^MACHINE/#MACHINE/;
> > >
> > >          $lpLine =3D~ s/&/&amp;/g;
> > > diff --git a/src/templates/local-arago64-v2.conf.xml
> > b/src/templates/local-arago64-v2.conf.xml
> > > index b49f702..d9d2ae7 100644
> > > --- a/src/templates/local-arago64-v2.conf.xml
> > > +++ b/src/templates/local-arago64-v2.conf.xml
> > > @@ -11,7 +11,7 @@
> > >      <line># wiping and rebuilding you can preserve this directory to
> > speed up this part</line>
> > >      <line># of subsequent builds. This directory is safe to share
> > between multiple builds</line>
> > >      <line># on the same machine too.</line>
> > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Where to place shared-state files</line>
> > > @@ -24,7 +24,7 @@
> > >      <line># regenerate from these files if no changes were made to t=
he
> > configuration.</line>
> > >      <line># If changes were made to the configuration, only shared
> > state files where the</line>
> > >      <line># state was still valid would be used (done using
> > checksums).</line>
> > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Shared-state files from other locations</line>
> > > diff --git a/src/templates/local-arago64-v3.conf.xml
> > b/src/templates/local-arago64-v3.conf.xml
> > > index 35d151f..c8a5d51 100644
> > > --- a/src/templates/local-arago64-v3.conf.xml
> > > +++ b/src/templates/local-arago64-v3.conf.xml
> > > @@ -11,7 +11,7 @@
> > >      <line># wiping and rebuilding you can preserve this directory to
> > speed up this part</line>
> > >      <line># of subsequent builds. This directory is safe to share
> > between multiple builds</line>
> > >      <line># on the same machine too.</line>
> > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Where to place shared-state files</line>
> > > @@ -24,7 +24,7 @@
> > >      <line># regenerate from these files if no changes were made to t=
he
> > configuration.</line>
> > >      <line># If changes were made to the configuration, only shared
> > state files where the</line>
> > >      <line># state was still valid would be used (done using
> > checksums).</line>
> > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Shared-state files from other locations</line>
> > > diff --git a/src/templates/local-poky-v2.conf.xml
> > b/src/templates/local-poky-v2.conf.xml
> > > index 72160c9..b45d6c2 100644
> > > --- a/src/templates/local-poky-v2.conf.xml
> > > +++ b/src/templates/local-poky-v2.conf.xml
> > > @@ -11,7 +11,7 @@
> > >      <line># wiping and rebuilding you can preserve this directory to
> > speed up this part</line>
> > >      <line># of subsequent builds. This directory is safe to share
> > between multiple builds</line>
> > >      <line># on the same machine too.</line>
> > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Where to place shared-state files</line>
> > > @@ -24,7 +24,7 @@
> > >      <line># regenerate from these files if no changes were made to t=
he
> > configuration.</line>
> > >      <line># If changes were made to the configuration, only shared
> > state files where the</line>
> > >      <line># state was still valid would be used (done using
> > checksums).</line>
> > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Shared-state files from other locations</line>
> > > diff --git a/src/templates/local-poky-v3.conf.xml
> > b/src/templates/local-poky-v3.conf.xml
> > > index 1e66478..fa313eb 100644
> > > --- a/src/templates/local-poky-v3.conf.xml
> > > +++ b/src/templates/local-poky-v3.conf.xml
> > > @@ -11,7 +11,7 @@
> > >      <line># wiping and rebuilding you can preserve this directory to
> > speed up this part</line>
> > >      <line># of subsequent builds. This directory is safe to share
> > between multiple builds</line>
> > >      <line># on the same machine too.</line>
> > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Where to place shared-state files</line>
> > > @@ -24,7 +24,7 @@
> > >      <line># regenerate from these files if no changes were made to t=
he
> > configuration.</line>
> > >      <line># If changes were made to the configuration, only shared
> > state files where the</line>
> > >      <line># state was still valid would be used (done using
> > checksums).</line>
> > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Shared-state files from other locations</line>
> > > diff --git a/src/templates/local-v2.conf.xml
> > b/src/templates/local-v2.conf.xml
> > > index 40f30e7..49e060c 100644
> > > --- a/src/templates/local-v2.conf.xml
> > > +++ b/src/templates/local-v2.conf.xml
> > > @@ -11,7 +11,7 @@
> > >      <line># wiping and rebuilding you can preserve this directory to
> > speed up this part</line>
> > >      <line># of subsequent builds. This directory is safe to share
> > between multiple builds</line>
> > >      <line># on the same machine too.</line>
> > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Where to place shared-state files</line>
> > > @@ -24,7 +24,7 @@
> > >      <line># regenerate from these files if no changes were made to t=
he
> > configuration.</line>
> > >      <line># If changes were made to the configuration, only shared
> > state files where the</line>
> > >      <line># state was still valid would be used (done using
> > checksums).</line>
> > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Shared-state files from other locations</line>
> > > diff --git a/src/templates/local-v3.conf.xml
> > b/src/templates/local-v3.conf.xml
> > > index d0c9d92..e300aaf 100644
> > > --- a/src/templates/local-v3.conf.xml
> > > +++ b/src/templates/local-v3.conf.xml
> > > @@ -11,7 +11,7 @@
> > >      <line># wiping and rebuilding you can preserve this directory to
> > speed up this part</line>
> > >      <line># of subsequent builds. This directory is safe to share
> > between multiple builds</line>
> > >      <line># on the same machine too.</line>
> > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Where to place shared-state files</line>
> > > @@ -24,7 +24,7 @@
> > >      <line># regenerate from these files if no changes were made to t=
he
> > configuration.</line>
> > >      <line># If changes were made to the configuration, only shared
> > state files where the</line>
> > >      <line># state was still valid would be used (done using
> > checksums).</line>
> > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > >      <line></line>
> > >      <line>#</line>
> > >      <line># Shared-state files from other locations</line>
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > >
> > >
> > >
> >
> >
> > --
> > Jonathan Cormier
> > Senior Software Engineer
> >
> > Voice:  315.425.4045 x222
> >
> > http://www.CriticalLink.com
> > 6712 Brooklawn Parkway, Syracuse, NY 13211
> >
>
>
> --
> Jonathan Cormier
> Senior Software Engineer
>
> Voice:  315.425.4045 x222
>
> http://www.CriticalLink.com <http://www.criticallink.com/>
> 6712 Brooklawn Parkway, Syracuse, NY 13211
> <https://twitter.com/Critical_Link>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15903):
> https://lists.yoctoproject.org/g/meta-arago/message/15903
> Mute This Topic: https://lists.yoctoproject.org/mt/111311276/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211
<https://twitter.com/Critical_Link>

--000000000000668fee062ee60f2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 24,=
 2025 at 9:53=E2=80=AFAM Jon Cormier via <a href=3D"http://lists.yoctoproje=
ct.org">lists.yoctoproject.org</a> &lt;jcormier=3D<a href=3D"mailto:critica=
llink.com@lists.yoctoproject.org">criticallink.com@lists.yoctoproject.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ry=
an, I also had a question about the bitbake-setup configs.=C2=A0 Is there s=
ome<br>
documentation on this setup tool?=C2=A0 Googling this is tricky since the n=
ame<br>
is so generic. The other tools docs pop right up in google.<br></blockquote=
><div>Nevermind, looks like the work is being done here:=C2=A0<a href=3D"ht=
tps://github.com/kanavin/bitbake">https://github.com/kanavin/bitbake</a> </=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On Fri, Feb 21, 2025 at 2:18=E2=80=AFPM Jon Cormier &lt;<a href=3D"mailto:j=
cormier@criticallink.com" target=3D"_blank">jcormier@criticallink.com</a>&g=
t;<br>
wrote:<br>
<br>
&gt; Ryan, I think you also need to touch TMPDIR in a few of the local.conf=
<br>
&gt; files<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Feb 21, 2025 at 11:31=E2=80=AFAM Ryan Eatmon via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a> &lt;reatmon=3D<a href=3D"mailto:ti.com@=
lists.yoctoproject.org" target=3D"_blank">ti.com@lists.yoctoproject.org</a>=
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; When the conversion to the new XML/XSLT system was done, the refe=
rence<br>
&gt; &gt; to OEBASE was converted to TOPDIR.=C2=A0 The value for OEBASE was=
<br>
&gt; &gt; historically the directory above the bitbake run dir which is wha=
t<br>
&gt; &gt; TOPDIR is set to.=C2=A0 This made the downloads and sstate_cache =
directories<br>
&gt; &gt; appear down a level of directory that was unintended.<br>
&gt; &gt;<br>
&gt; &gt; This change updates the values for DL_DIR and SSTATE_DIR to be re=
lative<br>
&gt; &gt; to TOPDIR but back in the same location they were originally mean=
t to be<br>
&gt; &gt; in.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" =
target=3D"_blank">reatmon@ti.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v2: I ran a make clean and make and a lot more configs got update=
d with<br>
&gt; &gt; the change.=C2=A0 Clearly I need to rework the make system.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json=
=C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;=C2=A0 .../arago-kirkstone-chromium-config/local.conf.sample=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-kirkstone-config/local.conf.sample=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-kirkstone-next-config/local.conf.sampl=
e=C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-kirkstone-wip-config/local.conf.sample=
=C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-master-chromium-config/local.conf.samp=
le | 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-master-config/local.conf.sample=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-master-next-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-master-selinux-config/local.conf.sampl=
e=C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-master-wip-config/local.conf.sample=C2=
=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 .../arago-scarthgap-chromium-config/local.conf.sample=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-scarthgap-config/local.conf.sample=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-scarthgap-next-config/local.conf.sampl=
e=C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 .../arago-scarthgap-selinux-config/local.conf.sample=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/arago-scarthgap-wip-config/local.conf.sample=
=C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.00.00.006-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.00.00.007-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.00.00.011-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.01.00.001-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.01.00.003-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.01.00.007-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.01.00.008-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.02.00.008-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.02.00.009-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.02.00.010-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-09.03.05-config/local.conf.sample=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-10.00.07-config/local.conf.sample=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-10.01.08-config/local.conf.sample=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-10.01.10-config/local.conf.sample=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../coresdk_coresdk-10.01.10-selinux-config/local.conf.samp=
le | 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/distroless-kirkstone-config/local.conf.sampl=
e=C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/distroless-master-config/local.conf.sample=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/distroless-scarthgap-config/local.conf.sampl=
e=C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/poky-kirkstone-config/local.conf.sample=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/poky-master-config/local.conf.sample=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/poky-master-wip-config/local.conf.sample=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 conf/templates/poky-scarthgap-config/local.conf.sample=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 .../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 configs/arago-master-wip-config.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-<br>
&gt; &gt;=C2=A0 .../processor-sdk-scarthgap-10.01.10.04-config.yml=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt; &gt;=C2=A0 .../processor-sdk-scarthgap-chromium-10.01.10.04-config.yml=
=C2=A0 =C2=A0| 1 +<br>
&gt; &gt;=C2=A0 kas/templates/local-arago64-v2.conf.yml=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 kas/templates/local-arago64-v3.conf.yml=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 kas/templates/local-poky-v2.conf.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +=
+--<br>
&gt; &gt;=C2=A0 kas/templates/local-poky-v3.conf.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +=
+--<br>
&gt; &gt;=C2=A0 kas/templates/local-v2.conf.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 kas/templates/local-v3.conf.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 sample-files/local-arago64-v2.conf.sample=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 sample-files/local-arago64-v3.conf.sample=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 sample-files/local-poky-v2.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 sample-files/local-poky-v3.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 sample-files/local-v2.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 sample-files/local-v3.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 src/bin/<a href=3D"http://convert.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">convert.pl</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;=C2=A0 src/templates/local-arago64-v2.conf.xml=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 src/templates/local-arago64-v3.conf.xml=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 src/templates/local-poky-v2.conf.xml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +=
+--<br>
&gt; &gt;=C2=A0 src/templates/local-poky-v3.conf.xml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +=
+--<br>
&gt; &gt;=C2=A0 src/templates/local-v2.conf.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 src/templates/local-v3.conf.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 90 files changed, 175 insertions(+), 173 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-confi=
g.json<br>
&gt; b/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json<br>
&gt; &gt; index 1cc2962..8acd24a 100644<br>
&gt; &gt; --- a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json<=
br>
&gt; &gt; +++ b/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json<=
br>
&gt; &gt; @@ -9,7 +9,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: =
&quot;<br>
&gt; <a href=3D"https://git.ti.com/git/arago-project/oe-layersetup.git" rel=
=3D"noreferrer" target=3D"_blank">https://git.ti.com/git/arago-project/oe-l=
ayersetup.git</a>&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;wip&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;master&quot;<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;oe-layersetup&=
quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/arago-kirkstone-chromium-config/local.conf.sample<br>
&gt; b/conf/templates/arago-kirkstone-chromium-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/conf/templates/arago-kirkstone-chromium-config/local.conf.s=
ample<br>
&gt; &gt; +++ b/conf/templates/arago-kirkstone-chromium-config/local.conf.s=
ample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/arago-kirkstone-config/local.conf.sam=
ple<br>
&gt; b/conf/templates/arago-kirkstone-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/conf/templates/arago-kirkstone-config/local.conf.sample<br>
&gt; &gt; +++ b/conf/templates/arago-kirkstone-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/arago-kirkstone-next-config/local.conf.sample<br>
&gt; b/conf/templates/arago-kirkstone-next-config/local.conf.sample<br>
&gt; &gt; index cb76dd8..d97939a 100644<br>
&gt; &gt; --- a/conf/templates/arago-kirkstone-next-config/local.conf.sampl=
e<br>
&gt; &gt; +++ b/conf/templates/arago-kirkstone-next-config/local.conf.sampl=
e<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/arago-kirkstone-wip-config/local.conf=
.sample<br>
&gt; b/conf/templates/arago-kirkstone-wip-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/conf/templates/arago-kirkstone-wip-config/local.conf.sample=
<br>
&gt; &gt; +++ b/conf/templates/arago-kirkstone-wip-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/arago-master-chromium-config/local.conf.sample<br>
&gt; b/conf/templates/arago-master-chromium-config/local.conf.sample<br>
&gt; &gt; index f2e9587..720ce11 100644<br>
&gt; &gt; --- a/conf/templates/arago-master-chromium-config/local.conf.samp=
le<br>
&gt; &gt; +++ b/conf/templates/arago-master-chromium-config/local.conf.samp=
le<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/arago-master-config/local.conf.sample=
<br>
&gt; b/conf/templates/arago-master-config/local.conf.sample<br>
&gt; &gt; index f2e9587..720ce11 100644<br>
&gt; &gt; --- a/conf/templates/arago-master-config/local.conf.sample<br>
&gt; &gt; +++ b/conf/templates/arago-master-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/arago-master-next-config/local.conf.s=
ample<br>
&gt; b/conf/templates/arago-master-next-config/local.conf.sample<br>
&gt; &gt; index 6c32f4b..c1549ac 100644<br>
&gt; &gt; --- a/conf/templates/arago-master-next-config/local.conf.sample<b=
r>
&gt; &gt; +++ b/conf/templates/arago-master-next-config/local.conf.sample<b=
r>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/arago-master-selinux-config/local.conf.sample<br>
&gt; b/conf/templates/arago-master-selinux-config/local.conf.sample<br>
&gt; &gt; index 5cc19d4..dfb4873 100644<br>
&gt; &gt; --- a/conf/templates/arago-master-selinux-config/local.conf.sampl=
e<br>
&gt; &gt; +++ b/conf/templates/arago-master-selinux-config/local.conf.sampl=
e<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/arago-master-wip-config/local.conf.sa=
mple<br>
&gt; b/conf/templates/arago-master-wip-config/local.conf.sample<br>
&gt; &gt; index f2e9587..720ce11 100644<br>
&gt; &gt; --- a/conf/templates/arago-master-wip-config/local.conf.sample<br=
>
&gt; &gt; +++ b/conf/templates/arago-master-wip-config/local.conf.sample<br=
>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/arago-scarthgap-chromium-config/local.conf.sample<br>
&gt; b/conf/templates/arago-scarthgap-chromium-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/conf/templates/arago-scarthgap-chromium-config/local.conf.s=
ample<br>
&gt; &gt; +++ b/conf/templates/arago-scarthgap-chromium-config/local.conf.s=
ample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/arago-scarthgap-config/local.conf.sam=
ple<br>
&gt; b/conf/templates/arago-scarthgap-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/conf/templates/arago-scarthgap-config/local.conf.sample<br>
&gt; &gt; +++ b/conf/templates/arago-scarthgap-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/arago-scarthgap-next-config/local.conf.sample<br>
&gt; b/conf/templates/arago-scarthgap-next-config/local.conf.sample<br>
&gt; &gt; index dbb184b..3ad6481 100644<br>
&gt; &gt; --- a/conf/templates/arago-scarthgap-next-config/local.conf.sampl=
e<br>
&gt; &gt; +++ b/conf/templates/arago-scarthgap-next-config/local.conf.sampl=
e<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/arago-scarthgap-selinux-config/local.conf.sample<br>
&gt; b/conf/templates/arago-scarthgap-selinux-config/local.conf.sample<br>
&gt; &gt; index 46869ad..c862657 100644<br>
&gt; &gt; --- a/conf/templates/arago-scarthgap-selinux-config/local.conf.sa=
mple<br>
&gt; &gt; +++ b/conf/templates/arago-scarthgap-selinux-config/local.conf.sa=
mple<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/arago-scarthgap-wip-config/local.conf=
.sample<br>
&gt; b/conf/templates/arago-scarthgap-wip-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/conf/templates/arago-scarthgap-wip-config/local.conf.sample=
<br>
&gt; &gt; +++ b/conf/templates/arago-scarthgap-wip-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sample=
<br>
&gt; b/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sample=
<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sample=
<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sample=
<br>
&gt; b/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sample=
<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sample=
<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sample=
<br>
&gt; b/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sample=
<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sample=
<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sample=
<br>
&gt; b/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sample=
<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sample=
<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sample=
<br>
&gt; b/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sample=
<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sample=
<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sample=
<br>
&gt; b/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sample=
<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sample=
<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sample=
<br>
&gt; b/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sample=
<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sample=
<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sample=
<br>
&gt; b/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sample=
<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sample=
<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sample=
<br>
&gt; b/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sample=
<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sample=
<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sample=
<br>
&gt; b/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sample=
<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sample=
<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sample=
<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample<br>
&gt; b/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.s=
ample<br>
&gt; &gt; +++ b/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.s=
ample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample<br>
&gt; b/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.s=
ample<br>
&gt; &gt; +++ b/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.s=
ample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample<br>
&gt; b/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.s=
ample<br>
&gt; &gt; +++ b/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.s=
ample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample<br>
&gt; b/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.s=
ample<br>
&gt; &gt; +++ b/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.s=
ample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sa=
mple<br>
&gt; b/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sa=
mple<br>
&gt; &gt; index e45417c..27f1704 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sa=
mple<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sa=
mple<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/distroless-kirkstone-config/local.conf.sample<br>
&gt; b/conf/templates/distroless-kirkstone-config/local.conf.sample<br>
&gt; &gt; index 46cb253..b499977 100644<br>
&gt; &gt; --- a/conf/templates/distroless-kirkstone-config/local.conf.sampl=
e<br>
&gt; &gt; +++ b/conf/templates/distroless-kirkstone-config/local.conf.sampl=
e<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/distroless-master-config/local.conf.s=
ample<br>
&gt; b/conf/templates/distroless-master-config/local.conf.sample<br>
&gt; &gt; index bcdaaa4..7d218e8 100644<br>
&gt; &gt; --- a/conf/templates/distroless-master-config/local.conf.sample<b=
r>
&gt; &gt; +++ b/conf/templates/distroless-master-config/local.conf.sample<b=
r>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/distroless-scarthgap-config/local.conf.sample<br>
&gt; b/conf/templates/distroless-scarthgap-config/local.conf.sample<br>
&gt; &gt; index 46cb253..b499977 100644<br>
&gt; &gt; --- a/conf/templates/distroless-scarthgap-config/local.conf.sampl=
e<br>
&gt; &gt; +++ b/conf/templates/distroless-scarthgap-config/local.conf.sampl=
e<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/poky-kirkstone-config/local.conf.samp=
le<br>
&gt; b/conf/templates/poky-kirkstone-config/local.conf.sample<br>
&gt; &gt; index e67385d..12eacfc 100644<br>
&gt; &gt; --- a/conf/templates/poky-kirkstone-config/local.conf.sample<br>
&gt; &gt; +++ b/conf/templates/poky-kirkstone-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/poky-master-config/local.conf.sample<=
br>
&gt; b/conf/templates/poky-master-config/local.conf.sample<br>
&gt; &gt; index 1fe5688..e0112c7 100644<br>
&gt; &gt; --- a/conf/templates/poky-master-config/local.conf.sample<br>
&gt; &gt; +++ b/conf/templates/poky-master-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/poky-master-wip-config/local.conf.sam=
ple<br>
&gt; b/conf/templates/poky-master-wip-config/local.conf.sample<br>
&gt; &gt; index 1fe5688..e0112c7 100644<br>
&gt; &gt; --- a/conf/templates/poky-master-wip-config/local.conf.sample<br>
&gt; &gt; +++ b/conf/templates/poky-master-wip-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/conf/templates/poky-scarthgap-config/local.conf.samp=
le<br>
&gt; b/conf/templates/poky-scarthgap-config/local.conf.sample<br>
&gt; &gt; index e67385d..12eacfc 100644<br>
&gt; &gt; --- a/conf/templates/poky-scarthgap-config/local.conf.sample<br>
&gt; &gt; +++ b/conf/templates/poky-scarthgap-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00=
.00-config/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00=
.00-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00=
.00-config/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00=
.00-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00=
.01-config/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00=
.01-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00=
.01-config/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00=
.01-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01=
.00-config/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01=
.00-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01=
.00-config/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01=
.00-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02=
.00-config/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02=
.00-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02=
.00-config/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02=
.00-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00=
.00-config/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00=
.00-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00=
.00-config/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00=
.00-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01=
.00-config/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01=
.00-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01=
.00-config/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01=
.00-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local=
.conf.sample<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local=
.conf.sample<br>
&gt; &gt; index 6b91881..1149e85 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local=
.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local=
.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/l=
ocal.conf.sample<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/l=
ocal.conf.sample<br>
&gt; &gt; index e4f04f3..a0d9b30 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/l=
ocal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/l=
ocal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/l=
ocal.conf.sample<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/l=
ocal.conf.sample<br>
&gt; &gt; index 32a6cfb..9dd0dfa 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/l=
ocal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/l=
ocal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/l=
ocal.conf.sample<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/l=
ocal.conf.sample<br>
&gt; &gt; index ee23c20..a83b490 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/l=
ocal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/l=
ocal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/l=
ocal.conf.sample<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/l=
ocal.conf.sample<br>
&gt; &gt; index c29b416..e743654 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/l=
ocal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/l=
ocal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/l=
ocal.conf.sample<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/l=
ocal.conf.sample<br>
&gt; &gt; index 34afc91..8096a3b 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/l=
ocal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/l=
ocal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/l=
ocal.conf.sample<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/l=
ocal.conf.sample<br>
&gt; &gt; index f592ad9..31bfec8 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/l=
ocal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/l=
ocal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/l=
ocal.conf.sample<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/l=
ocal.conf.sample<br>
&gt; &gt; index 0df5360..145aed2 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/l=
ocal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/l=
ocal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/l=
ocal.conf.sample<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/l=
ocal.conf.sample<br>
&gt; &gt; index 5e39ec4..016f942 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/l=
ocal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/l=
ocal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/l=
ocal.conf.sample<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/l=
ocal.conf.sample<br>
&gt; &gt; index 689e5d8..e627f36 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/l=
ocal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/l=
ocal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config=
/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config=
/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config=
/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config=
/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.con=
f.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.con=
f.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.con=
f.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.con=
f.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/lo=
cal.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/lo=
cal.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/lo=
cal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/lo=
cal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.con=
f.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.con=
f.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.con=
f.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.con=
f.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/lo=
cal.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/lo=
cal.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/lo=
cal.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/lo=
cal.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/=
local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/=
local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/=
local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/=
local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config=
/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config=
/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config=
/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config=
/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-con=
fig/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-con=
fig/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-con=
fig/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-con=
fig/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-con=
fig/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-con=
fig/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-con=
fig/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-con=
fig/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.=
01.09-config/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.=
01.09-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.=
01.09-config/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.=
01.09-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.=
01.10-config/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.=
01.10-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.=
01.10-config/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.=
01.10-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-con=
fig/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-con=
fig/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-con=
fig/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-con=
fig/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-con=
fig/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-con=
fig/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-con=
fig/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-con=
fig/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.=
07.04-config/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.=
07.04-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.=
07.04-config/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.=
07.04-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.=
10.04-config/local.conf.sample<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.=
10.04-config/local.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; ---<br>
&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.=
10.04-config/local.conf.sample<br>
&gt; &gt; +++<br>
&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.=
10.04-config/local.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/configs/arago-master-wip-config.txt<br>
&gt; b/configs/arago-master-wip-config.txt<br>
&gt; &gt; index eb9c49d..165a3d1 100644<br>
&gt; &gt; --- a/configs/arago-master-wip-config.txt<br>
&gt; &gt; +++ b/configs/arago-master-wip-config.txt<br>
&gt; &gt; @@ -5,7 +5,7 @@ bitbake,<a href=3D"https://git.openembedded.org/b=
itbake,master,HEAD" rel=3D"noreferrer" target=3D"_blank">https://git.openem=
bedded.org/bitbake,master,HEAD</a><br>
&gt; &gt;=C2=A0 meta-arago,<br>
&gt; <a href=3D"https://git.yoctoproject.org/meta-arago,master-wip,HEAD,lay=
ers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test" rel=3D"noreferre=
r" target=3D"_blank">https://git.yoctoproject.org/meta-arago,master-wip,HEA=
D,layers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test</a><br>
&gt; &gt;=C2=A0 #meta-browser,<br>
&gt; <a href=3D"https://github.com/OSSystems/meta-browser.git,master,HEAD,l=
ayers=3Dmeta-chromium" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/OSSystems/meta-browser.git,master,HEAD,layers=3Dmeta-chromium</a><br>
&gt; &gt;=C2=A0 #meta-selinux,<br>
&gt; <a href=3D"https://git.yoctoproject.org/meta-selinux,master,HEAD,layer=
s=3D" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/met=
a-selinux,master,HEAD,layers=3D</a><br>
&gt; &gt; -meta-qt5,<a href=3D"https://github.com/meta-qt5/meta-qt5.git,mas=
ter,HEAD,layers=3D" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/meta-qt5/meta-qt5.git,master,HEAD,layers=3D</a><br>
&gt; &gt; +meta-qt6,<a href=3D"https://code.qt.io/yocto/meta-qt6.git,dev,HE=
AD,layers=3D" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/yocto=
/meta-qt6.git,dev,HEAD,layers=3D</a><br>
&gt; &gt;=C2=A0 meta-virtualization,<br>
&gt; <a href=3D"https://git.yoctoproject.org/meta-virtualization,master,HEA=
D,layers=3D" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.=
org/meta-virtualization,master,HEAD,layers=3D</a><br>
&gt; &gt;=C2=A0 meta-openembedded,<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded,master,HEAD,=
layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:me=
ta-multimedia" rel=3D"noreferrer" target=3D"_blank">https://git.openembedde=
d.org/meta-openembedded,master,HEAD,layers=3Dmeta-networking:meta-python:me=
ta-oe:meta-gnome:meta-filesystems:meta-multimedia</a><br>
&gt; &gt;=C2=A0 meta-ti,<br>
&gt; <a href=3D"https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=
=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp" rel=3D"noreferrer" target=3D"_bl=
ank">https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp</a><br>
&gt; &gt; diff --git<br>
&gt; a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml<br>
&gt; b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml<br>
&gt; &gt; index 5ced779..2dc2f5c 100644<br>
&gt; &gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-confi=
g.yml<br>
&gt; &gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-confi=
g.yml<br>
&gt; &gt; @@ -71,3 +71,4 @@ repos:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 commit: &quot;dac630ab5ee7aa6c5c7c294093adbd1=
1b116c765&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 layers:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta:<br>
&gt; &gt; +<br>
&gt; &gt; diff --git<br>
&gt; a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-confi=
g.yml<br>
&gt; b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-confi=
g.yml<br>
&gt; &gt; index 405fa3b..351d9ea 100644<br>
&gt; &gt; ---<br>
&gt; a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-confi=
g.yml<br>
&gt; &gt; +++<br>
&gt; b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-confi=
g.yml<br>
&gt; &gt; @@ -83,3 +83,4 @@ repos:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/=
edgeai/meta-edgeai.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti=
.com/git/edgeai/meta-edgeai.git</a>&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 commit: &quot;10.01.10.04&quot;<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/kas/templates/local-arago64-v2.conf.yml<br>
&gt; b/kas/templates/local-arago64-v2.conf.yml<br>
&gt; &gt; index c79388d..c6781be 100644<br>
&gt; &gt; --- a/kas/templates/local-arago64-v2.conf.yml<br>
&gt; &gt; +++ b/kas/templates/local-arago64-v2.conf.yml<br>
&gt; &gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # wiping and rebuilding you can preserve this=
 directory to speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # of subsequent builds. This directory is saf=
e to share between<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # on the same machine too.<br>
&gt; &gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # regenerate from these files if no changes w=
ere made to the<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # If changes were made to the configuration, =
only shared state<br>
&gt; files where the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # state was still valid would be used (done u=
sing checksums).<br>
&gt; &gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&=
quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/kas/templates/local-arago64-v3.conf.yml<br>
&gt; b/kas/templates/local-arago64-v3.conf.yml<br>
&gt; &gt; index b182483..3fa683e 100644<br>
&gt; &gt; --- a/kas/templates/local-arago64-v3.conf.yml<br>
&gt; &gt; +++ b/kas/templates/local-arago64-v3.conf.yml<br>
&gt; &gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # wiping and rebuilding you can preserve this=
 directory to speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # of subsequent builds. This directory is saf=
e to share between<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # on the same machine too.<br>
&gt; &gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # regenerate from these files if no changes w=
ere made to the<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # If changes were made to the configuration, =
only shared state<br>
&gt; files where the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # state was still valid would be used (done u=
sing checksums).<br>
&gt; &gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&=
quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/kas/templates/local-poky-v2.conf.yml<br>
&gt; b/kas/templates/local-poky-v2.conf.yml<br>
&gt; &gt; index 91995fe..075f535 100644<br>
&gt; &gt; --- a/kas/templates/local-poky-v2.conf.yml<br>
&gt; &gt; +++ b/kas/templates/local-poky-v2.conf.yml<br>
&gt; &gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # wiping and rebuilding you can preserve this=
 directory to speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # of subsequent builds. This directory is saf=
e to share between<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # on the same machine too.<br>
&gt; &gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # regenerate from these files if no changes w=
ere made to the<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # If changes were made to the configuration, =
only shared state<br>
&gt; files where the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # state was still valid would be used (done u=
sing checksums).<br>
&gt; &gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&=
quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/kas/templates/local-poky-v3.conf.yml<br>
&gt; b/kas/templates/local-poky-v3.conf.yml<br>
&gt; &gt; index 7368fb0..193a1ce 100644<br>
&gt; &gt; --- a/kas/templates/local-poky-v3.conf.yml<br>
&gt; &gt; +++ b/kas/templates/local-poky-v3.conf.yml<br>
&gt; &gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # wiping and rebuilding you can preserve this=
 directory to speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # of subsequent builds. This directory is saf=
e to share between<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # on the same machine too.<br>
&gt; &gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # regenerate from these files if no changes w=
ere made to the<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # If changes were made to the configuration, =
only shared state<br>
&gt; files where the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # state was still valid would be used (done u=
sing checksums).<br>
&gt; &gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&=
quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/kas/templates/local-v2.conf.yml<br>
&gt; b/kas/templates/local-v2.conf.yml<br>
&gt; &gt; index 3d666e4..f33fd45 100644<br>
&gt; &gt; --- a/kas/templates/local-v2.conf.yml<br>
&gt; &gt; +++ b/kas/templates/local-v2.conf.yml<br>
&gt; &gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # wiping and rebuilding you can preserve this=
 directory to speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # of subsequent builds. This directory is saf=
e to share between<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # on the same machine too.<br>
&gt; &gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # regenerate from these files if no changes w=
ere made to the<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # If changes were made to the configuration, =
only shared state<br>
&gt; files where the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # state was still valid would be used (done u=
sing checksums).<br>
&gt; &gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&=
quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/kas/templates/local-v3.conf.yml<br>
&gt; b/kas/templates/local-v3.conf.yml<br>
&gt; &gt; index 063b863..07eb5af 100644<br>
&gt; &gt; --- a/kas/templates/local-v3.conf.yml<br>
&gt; &gt; +++ b/kas/templates/local-v3.conf.yml<br>
&gt; &gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # wiping and rebuilding you can preserve this=
 directory to speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # of subsequent builds. This directory is saf=
e to share between<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # on the same machine too.<br>
&gt; &gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # regenerate from these files if no changes w=
ere made to the<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # If changes were made to the configuration, =
only shared state<br>
&gt; files where the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # state was still valid would be used (done u=
sing checksums).<br>
&gt; &gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&=
quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/sample-files/local-arago64-v2.conf.sample<br>
&gt; b/sample-files/local-arago64-v2.conf.sample<br>
&gt; &gt; index 7575b4b..8ad6f26 100644<br>
&gt; &gt; --- a/sample-files/local-arago64-v2.conf.sample<br>
&gt; &gt; +++ b/sample-files/local-arago64-v2.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/sample-files/local-arago64-v3.conf.sample<br>
&gt; b/sample-files/local-arago64-v3.conf.sample<br>
&gt; &gt; index f2e9587..720ce11 100644<br>
&gt; &gt; --- a/sample-files/local-arago64-v3.conf.sample<br>
&gt; &gt; +++ b/sample-files/local-arago64-v3.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/sample-files/local-poky-v2.conf.sample<br>
&gt; b/sample-files/local-poky-v2.conf.sample<br>
&gt; &gt; index e67385d..12eacfc 100644<br>
&gt; &gt; --- a/sample-files/local-poky-v2.conf.sample<br>
&gt; &gt; +++ b/sample-files/local-poky-v2.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/sample-files/local-poky-v3.conf.sample<br>
&gt; b/sample-files/local-poky-v3.conf.sample<br>
&gt; &gt; index 1fe5688..e0112c7 100644<br>
&gt; &gt; --- a/sample-files/local-poky-v3.conf.sample<br>
&gt; &gt; +++ b/sample-files/local-poky-v3.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/sample-files/local-v2.conf.sample<br>
&gt; b/sample-files/local-v2.conf.sample<br>
&gt; &gt; index 46cb253..b499977 100644<br>
&gt; &gt; --- a/sample-files/local-v2.conf.sample<br>
&gt; &gt; +++ b/sample-files/local-v2.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/sample-files/local-v3.conf.sample<br>
&gt; b/sample-files/local-v3.conf.sample<br>
&gt; &gt; index bcdaaa4..7d218e8 100644<br>
&gt; &gt; --- a/sample-files/local-v3.conf.sample<br>
&gt; &gt; +++ b/sample-files/local-v3.conf.sample<br>
&gt; &gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt;=C2=A0 # wiping and rebuilding you can preserve this directory to =
speed up<br>
&gt; this part<br>
&gt; &gt;=C2=A0 # of subsequent builds. This directory is safe to share bet=
ween<br>
&gt; multiple builds<br>
&gt; &gt;=C2=A0 # on the same machine too.<br>
&gt; &gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Where to place shared-state files<br>
&gt; &gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt; &gt;=C2=A0 # regenerate from these files if no changes were made to th=
e<br>
&gt; configuration.<br>
&gt; &gt;=C2=A0 # If changes were made to the configuration, only shared st=
ate files<br>
&gt; where the<br>
&gt; &gt;=C2=A0 # state was still valid would be used (done using checksums=
).<br>
&gt; &gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
&gt; &gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Shared-state files from other locations<br>
&gt; &gt; diff --git a/src/bin/<a href=3D"http://convert.pl" rel=3D"norefer=
rer" target=3D"_blank">convert.pl</a> b/src/bin/<a href=3D"http://convert.p=
l" rel=3D"noreferrer" target=3D"_blank">convert.pl</a><br>
&gt; &gt; index 2787b86..42b9c2c 100755<br>
&gt; &gt; --- a/src/bin/<a href=3D"http://convert.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">convert.pl</a><br>
&gt; &gt; +++ b/src/bin/<a href=3D"http://convert.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">convert.pl</a><br>
&gt; &gt; @@ -501,7 +501,7 @@ sub convert_local_conf_template<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chomp($lpLine);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 $lpLine =3D~ s/OEBASE/TOPDIR/;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 $lpLine =3D~ s/OEBASE/TOPDIR\/\.\./;=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $lpLine =3D~ s/^MACHINE/#MACHIN=
E/;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $lpLine =3D~ s/&amp;/&amp;amp;/=
g;<br>
&gt; &gt; diff --git a/src/templates/local-arago64-v2.conf.xml<br>
&gt; b/src/templates/local-arago64-v2.conf.xml<br>
&gt; &gt; index b49f702..d9d2ae7 100644<br>
&gt; &gt; --- a/src/templates/local-arago64-v2.conf.xml<br>
&gt; &gt; +++ b/src/templates/local-arago64-v2.conf.xml<br>
&gt; &gt; @@ -11,7 +11,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# wiping and rebuilding you can p=
reserve this directory to<br>
&gt; speed up this part&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# of subsequent builds. This dire=
ctory is safe to share<br>
&gt; between multiple builds&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# on the same machine too.&lt;/li=
ne&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/downloads&q=
uot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/../download=
s&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Where to place shared-state fil=
es&lt;/line&gt;<br>
&gt; &gt; @@ -24,7 +24,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# regenerate from these files if =
no changes were made to the<br>
&gt; configuration.&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# If changes were made to the con=
figuration, only shared<br>
&gt; state files where the&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# state was still valid would be =
used (done using<br>
&gt; checksums).&lt;/line&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/build/s=
state-cache&quot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/sstate-=
cache&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Shared-state files from other l=
ocations&lt;/line&gt;<br>
&gt; &gt; diff --git a/src/templates/local-arago64-v3.conf.xml<br>
&gt; b/src/templates/local-arago64-v3.conf.xml<br>
&gt; &gt; index 35d151f..c8a5d51 100644<br>
&gt; &gt; --- a/src/templates/local-arago64-v3.conf.xml<br>
&gt; &gt; +++ b/src/templates/local-arago64-v3.conf.xml<br>
&gt; &gt; @@ -11,7 +11,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# wiping and rebuilding you can p=
reserve this directory to<br>
&gt; speed up this part&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# of subsequent builds. This dire=
ctory is safe to share<br>
&gt; between multiple builds&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# on the same machine too.&lt;/li=
ne&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/downloads&q=
uot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/../download=
s&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Where to place shared-state fil=
es&lt;/line&gt;<br>
&gt; &gt; @@ -24,7 +24,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# regenerate from these files if =
no changes were made to the<br>
&gt; configuration.&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# If changes were made to the con=
figuration, only shared<br>
&gt; state files where the&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# state was still valid would be =
used (done using<br>
&gt; checksums).&lt;/line&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/build/s=
state-cache&quot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/sstate-=
cache&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Shared-state files from other l=
ocations&lt;/line&gt;<br>
&gt; &gt; diff --git a/src/templates/local-poky-v2.conf.xml<br>
&gt; b/src/templates/local-poky-v2.conf.xml<br>
&gt; &gt; index 72160c9..b45d6c2 100644<br>
&gt; &gt; --- a/src/templates/local-poky-v2.conf.xml<br>
&gt; &gt; +++ b/src/templates/local-poky-v2.conf.xml<br>
&gt; &gt; @@ -11,7 +11,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# wiping and rebuilding you can p=
reserve this directory to<br>
&gt; speed up this part&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# of subsequent builds. This dire=
ctory is safe to share<br>
&gt; between multiple builds&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# on the same machine too.&lt;/li=
ne&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/downloads&q=
uot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/../download=
s&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Where to place shared-state fil=
es&lt;/line&gt;<br>
&gt; &gt; @@ -24,7 +24,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# regenerate from these files if =
no changes were made to the<br>
&gt; configuration.&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# If changes were made to the con=
figuration, only shared<br>
&gt; state files where the&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# state was still valid would be =
used (done using<br>
&gt; checksums).&lt;/line&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/build/s=
state-cache&quot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/sstate-=
cache&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Shared-state files from other l=
ocations&lt;/line&gt;<br>
&gt; &gt; diff --git a/src/templates/local-poky-v3.conf.xml<br>
&gt; b/src/templates/local-poky-v3.conf.xml<br>
&gt; &gt; index 1e66478..fa313eb 100644<br>
&gt; &gt; --- a/src/templates/local-poky-v3.conf.xml<br>
&gt; &gt; +++ b/src/templates/local-poky-v3.conf.xml<br>
&gt; &gt; @@ -11,7 +11,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# wiping and rebuilding you can p=
reserve this directory to<br>
&gt; speed up this part&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# of subsequent builds. This dire=
ctory is safe to share<br>
&gt; between multiple builds&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# on the same machine too.&lt;/li=
ne&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/downloads&q=
uot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/../download=
s&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Where to place shared-state fil=
es&lt;/line&gt;<br>
&gt; &gt; @@ -24,7 +24,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# regenerate from these files if =
no changes were made to the<br>
&gt; configuration.&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# If changes were made to the con=
figuration, only shared<br>
&gt; state files where the&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# state was still valid would be =
used (done using<br>
&gt; checksums).&lt;/line&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/build/s=
state-cache&quot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/sstate-=
cache&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Shared-state files from other l=
ocations&lt;/line&gt;<br>
&gt; &gt; diff --git a/src/templates/local-v2.conf.xml<br>
&gt; b/src/templates/local-v2.conf.xml<br>
&gt; &gt; index 40f30e7..49e060c 100644<br>
&gt; &gt; --- a/src/templates/local-v2.conf.xml<br>
&gt; &gt; +++ b/src/templates/local-v2.conf.xml<br>
&gt; &gt; @@ -11,7 +11,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# wiping and rebuilding you can p=
reserve this directory to<br>
&gt; speed up this part&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# of subsequent builds. This dire=
ctory is safe to share<br>
&gt; between multiple builds&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# on the same machine too.&lt;/li=
ne&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/downloads&q=
uot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/../download=
s&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Where to place shared-state fil=
es&lt;/line&gt;<br>
&gt; &gt; @@ -24,7 +24,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# regenerate from these files if =
no changes were made to the<br>
&gt; configuration.&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# If changes were made to the con=
figuration, only shared<br>
&gt; state files where the&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# state was still valid would be =
used (done using<br>
&gt; checksums).&lt;/line&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/build/s=
state-cache&quot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/sstate-=
cache&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Shared-state files from other l=
ocations&lt;/line&gt;<br>
&gt; &gt; diff --git a/src/templates/local-v3.conf.xml<br>
&gt; b/src/templates/local-v3.conf.xml<br>
&gt; &gt; index d0c9d92..e300aaf 100644<br>
&gt; &gt; --- a/src/templates/local-v3.conf.xml<br>
&gt; &gt; +++ b/src/templates/local-v3.conf.xml<br>
&gt; &gt; @@ -11,7 +11,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# wiping and rebuilding you can p=
reserve this directory to<br>
&gt; speed up this part&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# of subsequent builds. This dire=
ctory is safe to share<br>
&gt; between multiple builds&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# on the same machine too.&lt;/li=
ne&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/downloads&q=
uot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/../download=
s&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Where to place shared-state fil=
es&lt;/line&gt;<br>
&gt; &gt; @@ -24,7 +24,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# regenerate from these files if =
no changes were made to the<br>
&gt; configuration.&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# If changes were made to the con=
figuration, only shared<br>
&gt; state files where the&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# state was still valid would be =
used (done using<br>
&gt; checksums).&lt;/line&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/build/s=
state-cache&quot;&lt;/line&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPDIR}/sstate-=
cache&quot;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;#&lt;/line&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &lt;line&gt;# Shared-state files from other l=
ocations&lt;/line&gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Jonathan Cormier<br>
&gt; Senior Software Engineer<br>
&gt;<br>
&gt; Voice:=C2=A0 315.425.4045 x222<br>
&gt;<br>
&gt; <a href=3D"http://www.CriticalLink.com" rel=3D"noreferrer" target=3D"_=
blank">http://www.CriticalLink.com</a><br>
&gt; 6712 Brooklawn Parkway, Syracuse, NY 13211<br>
&gt;<br>
<br>
<br>
-- <br>
Jonathan Cormier<br>
Senior Software Engineer<br>
<br>
Voice:=C2=A0 315.425.4045 x222<br>
<br>
<a href=3D"http://www.CriticalLink.com" rel=3D"noreferrer" target=3D"_blank=
">http://www.CriticalLink.com</a> &lt;<a href=3D"http://www.criticallink.co=
m/" rel=3D"noreferrer" target=3D"_blank">http://www.criticallink.com/</a>&g=
t;<br>
6712 Brooklawn Parkway, Syracuse, NY 13211<br>
&lt;<a href=3D"https://twitter.com/Critical_Link" rel=3D"noreferrer" target=
=3D"_blank">https://twitter.com/Critical_Link</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15903): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/15903" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-arago/message/15903</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111311276/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111311276/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproject.org" t=
arget=3D"_blank">meta-arago+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arago/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-=
arago/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_bl=
ank">jcormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D=
"ltr"><div><div dir=3D"ltr"><div>Jonathan Cormier<br>Senior Software Engine=
er<div><div><div><div><br></div><div><div><font color=3D"#000000">Voice:=C2=
=A0=C2=A0<a value=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><=
div><div><div style=3D"color:rgb(32,33,36)"><div><div><img src=3D"https://c=
i3.googleusercontent.com/mail-sig/AIorK4yQnmPDndAobohgnFohw9o8lcMLmEVCOkbl-=
k9wp4xfgM_Qz53XJlRK_dxYVNdYFLq8DCe6bY4Zl_a0"><br></div><div><div><a href=3D=
"http://www.criticallink.com/" target=3D"_blank">http://www.CriticalLink.co=
m</a></div></div></div><div>6712 Brooklawn Parkway,=C2=A0Syracuse, NY 13211=
 <font color=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://twitter=
.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=3D"https://docs.goo=
gle.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1yWERrLXE0SnM&amp;revi=
d=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ"></a></font></font>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div>

--000000000000668fee062ee60f2e--

