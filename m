Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352E1C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 18:11:49 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.15979.1740507103529119263
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 10:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=c/3C+tWZ;
 spf=pass (domain: criticallink.com, ip: 209.85.167.44, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5462a2b9dedso7030773e87.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 10:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1740507101; x=1741111901; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgkmPu04LaUKlafFfeQX/o3DVIqjZbu3PD6NOwW4Yig=;
        b=c/3C+tWZZDLere7PhFomLZCRSZYURhz2/jCvfqcwar6Bad4pm/EgOp57+pwsFIxFiz
         oXsHj4YLV0r3VVP5OD17lBrI7TbsOBhIZXyknb2UtuxLUia78Qw0knoD9+UkTs134eso
         2GFjwN2UqdUwnQUqsogFtkFgjIrzXNvbrruFHWzTFa350WpnjNqbW1sG5uVhpv2yYsTI
         vJWhN/mHhuu2NcNy2jHjmRhspfY71t0NfJGkLxl4ZjrF5TSTUVIMwXXDsqzda1GjbgzM
         1p1eSQEM87K6DBU+kewh9SMfRhJi/B328ta2CnIVQCGsJwbck5T6WoMlFt8ERdvQMipy
         YOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740507101; x=1741111901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgkmPu04LaUKlafFfeQX/o3DVIqjZbu3PD6NOwW4Yig=;
        b=qk/EQuigNWt58DIT7UT6paFWKA+/Md3KkzwESH+TZnSrsqZy7yTjeLnpAy6x43qFzT
         8RTGIR8Cf4qpkjrGlOR+HNYa8yxkR66dMQpy4jMk2XFOT8FgsgTRu7W257N/G5yeVqsm
         RdEJmXRD5I+A2Sn+wnY2beNX1KXfuMVuVxvy52us/oXiVUtRLNmh9/oLklOWQWAnUPfA
         G5SdhPDxW+FEh6iEdb5Ieoi6DpR3bumqCK5Swbjs1RsweUG5YCX73qcNs8SF08M3VKgh
         ovrXzHjlhdXJIXqB6+Uo1aalM8IPsk/JMuOQo58m2LX7G5g2FpN1MzD8hO4zvoWtKvo+
         9V6A==
X-Forwarded-Encrypted: i=1; AJvYcCUR+H8JhS/8A65fIgvErSXaeDBEiprSRNSoZ9yq7BHx5I18FdpQefCruBAHpLwykfLI0pvQLdJdIq1F@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxpoOHwoRxLHP/yuG/N57zi1C93yhhC5E0j/5BjjBmB8h41FCyi
	xt3ntEGPw0i3M4L+RSja1DBVSpB5BurCWaBVCdz4bSOFEwb8JCaXHC1y5N1cMJo00LBs4eG+xMG
	oCOrLA4QZTlvfO2ekBBj5N9Oi4GUOtj8FOEa/
X-Gm-Gg: ASbGncuIVJg4XzIyA9WsyItvSvWJ5bK46coESRHZij7JN/TXd140gKOJUwLHy7oi/+U
	6hWO9r1oCMB06+usJLW/GsDs0UQ6OsNxWTTkKYUDtES8FQgOToYJviCFDFstAen9qg7zu2w0Jrn
	Qvx1odRQ==
X-Google-Smtp-Source: AGHT+IGNjg36rMFqLGjlF2Fxm4Z8lsmkrUZ8U9CSS1R5LvDNz/EpzhJdmXZaeOcUazOgfQJS4vcH7CMTD1ePj2QJ5Fc=
X-Received: by 2002:a05:6512:3b82:b0:545:9e:bed4 with SMTP id
 2adb3069b0e04-54839271802mr7400084e87.52.1740507099126; Tue, 25 Feb 2025
 10:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20250221163150.3367-1-reatmon@ti.com> <CADL8D3aHkzaCiQQUaSA+L6OkxH=_RkzW07FTs_Yv0gMM7XdR+w@mail.gmail.com>
 <18272C9B4C413796.25123@lists.yoctoproject.org> <182732AD24AFBC44.20721@lists.yoctoproject.org>
In-Reply-To: <182732AD24AFBC44.20721@lists.yoctoproject.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 25 Feb 2025 13:11:26 -0500
X-Gm-Features: AQ5f1JqObGucCM0PoodTu74bqEgT_1MVYSnk68iD3MODuR1SOa31iAUjf7eM72A
Message-ID: <CADL8D3Z0+TXv=2wRSRrWg_mErHnF0qcxY=hUk-WBLxhQR-Ba_w@mail.gmail.com>
Subject: Re: [meta-arago] [oe-layersetup][master][PATCH v2] templates: Fix
 paths for DL_DIR and SSTATE_DIR
To: jcormier@criticallink.com
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, 
	meta-arago@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 18:11:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15913

Looks like this got accepted, however there are several TMPDIR =3D lines
which use TOPDIR and have build in the path. These should be fixed as
well.

src/templates/local-poky-v2.conf.xml
52:    <line>TMPDIR =3D "${TOPDIR}/build/poky-tmp"</line>

src/templates/local-v2.conf.xml
52:    <line>TMPDIR =3D "${TOPDIR}/build/arago-tmp"</line>

src/templates/local-poky-v3.conf.xml
52:    <line>TMPDIR =3D "${TOPDIR}/build/poky-tmp"</line>

src/templates/local-v3.conf.xml
52:    <line>TMPDIR =3D "${TOPDIR}/build/arago-tmp"</line>


On Mon, Feb 24, 2025 at 11:45=E2=80=AFAM Jon Cormier via
lists.yoctoproject.org
<jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:
>
> On Mon, Feb 24, 2025 at 9:53=E2=80=AFAM Jon Cormier via lists.yoctoprojec=
t.org
> <jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:
>
> > Ryan, I also had a question about the bitbake-setup configs.  Is there =
some
> > documentation on this setup tool?  Googling this is tricky since the na=
me
> > is so generic. The other tools docs pop right up in google.
> >
> Nevermind, looks like the work is being done here:
> https://github.com/kanavin/bitbake
>
> >
> > On Fri, Feb 21, 2025 at 2:18=E2=80=AFPM Jon Cormier <jcormier@criticall=
ink.com>
> > wrote:
> >
> > > Ryan, I think you also need to touch TMPDIR in a few of the local.con=
f
> > > files
> > >
> > >
> > > On Fri, Feb 21, 2025 at 11:31=E2=80=AFAM Ryan Eatmon via
> > > lists.yoctoproject.org <reatmon=3Dti.com@lists.yoctoproject.org> wrot=
e:
> > > >
> > > > When the conversion to the new XML/XSLT system was done, the refere=
nce
> > > > to OEBASE was converted to TOPDIR.  The value for OEBASE was
> > > > historically the directory above the bitbake run dir which is what
> > > > TOPDIR is set to.  This made the downloads and sstate_cache directo=
ries
> > > > appear down a level of directory that was unintended.
> > > >
> > > > This change updates the values for DL_DIR and SSTATE_DIR to be rela=
tive
> > > > to TOPDIR but back in the same location they were originally meant =
to
> > be
> > > > in.
> > > >
> > > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > > ---
> > > > v2: I ran a make clean and make and a lot more configs got updated =
with
> > > > the change.  Clearly I need to rework the make system.
> > > >
> > > >  bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json    | 2 =
+-
> > > >  .../arago-kirkstone-chromium-config/local.conf.sample         | 4 =
++--
> > > >  conf/templates/arago-kirkstone-config/local.conf.sample       | 4 =
++--
> > > >  conf/templates/arago-kirkstone-next-config/local.conf.sample  | 4 =
++--
> > > >  conf/templates/arago-kirkstone-wip-config/local.conf.sample   | 4 =
++--
> > > >  conf/templates/arago-master-chromium-config/local.conf.sample | 4 =
++--
> > > >  conf/templates/arago-master-config/local.conf.sample          | 4 =
++--
> > > >  conf/templates/arago-master-next-config/local.conf.sample     | 4 =
++--
> > > >  conf/templates/arago-master-selinux-config/local.conf.sample  | 4 =
++--
> > > >  conf/templates/arago-master-wip-config/local.conf.sample      | 4 =
++--
> > > >  .../arago-scarthgap-chromium-config/local.conf.sample         | 4 =
++--
> > > >  conf/templates/arago-scarthgap-config/local.conf.sample       | 4 =
++--
> > > >  conf/templates/arago-scarthgap-next-config/local.conf.sample  | 4 =
++--
> > > >  .../arago-scarthgap-selinux-config/local.conf.sample          | 4 =
++--
> > > >  conf/templates/arago-scarthgap-wip-config/local.conf.sample   | 4 =
++--
> > > >  .../coresdk_coresdk-09.00.00.006-config/local.conf.sample     | 4 =
++--
> > > >  .../coresdk_coresdk-09.00.00.007-config/local.conf.sample     | 4 =
++--
> > > >  .../coresdk_coresdk-09.00.00.011-config/local.conf.sample     | 4 =
++--
> > > >  .../coresdk_coresdk-09.01.00.001-config/local.conf.sample     | 4 =
++--
> > > >  .../coresdk_coresdk-09.01.00.003-config/local.conf.sample     | 4 =
++--
> > > >  .../coresdk_coresdk-09.01.00.007-config/local.conf.sample     | 4 =
++--
> > > >  .../coresdk_coresdk-09.01.00.008-config/local.conf.sample     | 4 =
++--
> > > >  .../coresdk_coresdk-09.02.00.008-config/local.conf.sample     | 4 =
++--
> > > >  .../coresdk_coresdk-09.02.00.009-config/local.conf.sample     | 4 =
++--
> > > >  .../coresdk_coresdk-09.02.00.010-config/local.conf.sample     | 4 =
++--
> > > >  .../coresdk_coresdk-09.03.05-config/local.conf.sample         | 4 =
++--
> > > >  .../coresdk_coresdk-10.00.07-config/local.conf.sample         | 4 =
++--
> > > >  .../coresdk_coresdk-10.01.08-config/local.conf.sample         | 4 =
++--
> > > >  .../coresdk_coresdk-10.01.10-config/local.conf.sample         | 4 =
++--
> > > >  .../coresdk_coresdk-10.01.10-selinux-config/local.conf.sample | 4 =
++--
> > > >  conf/templates/distroless-kirkstone-config/local.conf.sample  | 4 =
++--
> > > >  conf/templates/distroless-master-config/local.conf.sample     | 4 =
++--
> > > >  conf/templates/distroless-scarthgap-config/local.conf.sample  | 4 =
++--
> > > >  conf/templates/poky-kirkstone-config/local.conf.sample        | 4 =
++--
> > > >  conf/templates/poky-master-config/local.conf.sample           | 4 =
++--
> > > >  conf/templates/poky-master-wip-config/local.conf.sample       | 4 =
++--
> > > >  conf/templates/poky-scarthgap-config/local.conf.sample        | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  .../local.conf.sample                                         | 4 =
++--
> > > >  configs/arago-master-wip-config.txt                           | 2 =
+-
> > > >  .../processor-sdk-scarthgap-10.01.10.04-config.yml            | 1 =
+
> > > >  .../processor-sdk-scarthgap-chromium-10.01.10.04-config.yml   | 1 =
+
> > > >  kas/templates/local-arago64-v2.conf.yml                       | 4 =
++--
> > > >  kas/templates/local-arago64-v3.conf.yml                       | 4 =
++--
> > > >  kas/templates/local-poky-v2.conf.yml                          | 4 =
++--
> > > >  kas/templates/local-poky-v3.conf.yml                          | 4 =
++--
> > > >  kas/templates/local-v2.conf.yml                               | 4 =
++--
> > > >  kas/templates/local-v3.conf.yml                               | 4 =
++--
> > > >  sample-files/local-arago64-v2.conf.sample                     | 4 =
++--
> > > >  sample-files/local-arago64-v3.conf.sample                     | 4 =
++--
> > > >  sample-files/local-poky-v2.conf.sample                        | 4 =
++--
> > > >  sample-files/local-poky-v3.conf.sample                        | 4 =
++--
> > > >  sample-files/local-v2.conf.sample                             | 4 =
++--
> > > >  sample-files/local-v3.conf.sample                             | 4 =
++--
> > > >  src/bin/convert.pl                                            | 2 =
+-
> > > >  src/templates/local-arago64-v2.conf.xml                       | 4 =
++--
> > > >  src/templates/local-arago64-v3.conf.xml                       | 4 =
++--
> > > >  src/templates/local-poky-v2.conf.xml                          | 4 =
++--
> > > >  src/templates/local-poky-v3.conf.xml                          | 4 =
++--
> > > >  src/templates/local-v2.conf.xml                               | 4 =
++--
> > > >  src/templates/local-v3.conf.xml                               | 4 =
++--
> > > >  90 files changed, 175 insertions(+), 173 deletions(-)
> > > >
> > > > diff --git a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.=
json
> > > b/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
> > > > index 1cc2962..8acd24a 100644
> > > > --- a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
> > > > +++ b/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
> > > > @@ -9,7 +9,7 @@
> > > >              "uri": "
> > > https://git.ti.com/git/arago-project/oe-layersetup.git"
> > > >            }
> > > >          },
> > > > -        "rev": "wip"
> > > > +        "rev": "master"
> > > >        },
> > > >        "path": "oe-layersetup"
> > > >      },
> > > > diff --git
> > > a/conf/templates/arago-kirkstone-chromium-config/local.conf.sample
> > > b/conf/templates/arago-kirkstone-chromium-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/conf/templates/arago-kirkstone-chromium-config/local.conf.sam=
ple
> > > > +++ b/conf/templates/arago-kirkstone-chromium-config/local.conf.sam=
ple
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/conf/templates/arago-kirkstone-config/local.conf.sampl=
e
> > > b/conf/templates/arago-kirkstone-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/conf/templates/arago-kirkstone-config/local.conf.sample
> > > > +++ b/conf/templates/arago-kirkstone-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/arago-kirkstone-next-config/local.conf.sample
> > > b/conf/templates/arago-kirkstone-next-config/local.conf.sample
> > > > index cb76dd8..d97939a 100644
> > > > --- a/conf/templates/arago-kirkstone-next-config/local.conf.sample
> > > > +++ b/conf/templates/arago-kirkstone-next-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > a/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> > > b/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> > > > +++ b/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/arago-master-chromium-config/local.conf.sample
> > > b/conf/templates/arago-master-chromium-config/local.conf.sample
> > > > index f2e9587..720ce11 100644
> > > > --- a/conf/templates/arago-master-chromium-config/local.conf.sample
> > > > +++ b/conf/templates/arago-master-chromium-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/conf/templates/arago-master-config/local.conf.sample
> > > b/conf/templates/arago-master-config/local.conf.sample
> > > > index f2e9587..720ce11 100644
> > > > --- a/conf/templates/arago-master-config/local.conf.sample
> > > > +++ b/conf/templates/arago-master-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/conf/templates/arago-master-next-config/local.conf.sam=
ple
> > > b/conf/templates/arago-master-next-config/local.conf.sample
> > > > index 6c32f4b..c1549ac 100644
> > > > --- a/conf/templates/arago-master-next-config/local.conf.sample
> > > > +++ b/conf/templates/arago-master-next-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/arago-master-selinux-config/local.conf.sample
> > > b/conf/templates/arago-master-selinux-config/local.conf.sample
> > > > index 5cc19d4..dfb4873 100644
> > > > --- a/conf/templates/arago-master-selinux-config/local.conf.sample
> > > > +++ b/conf/templates/arago-master-selinux-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/conf/templates/arago-master-wip-config/local.conf.samp=
le
> > > b/conf/templates/arago-master-wip-config/local.conf.sample
> > > > index f2e9587..720ce11 100644
> > > > --- a/conf/templates/arago-master-wip-config/local.conf.sample
> > > > +++ b/conf/templates/arago-master-wip-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
> > > b/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/conf/templates/arago-scarthgap-chromium-config/local.conf.sam=
ple
> > > > +++ b/conf/templates/arago-scarthgap-chromium-config/local.conf.sam=
ple
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/conf/templates/arago-scarthgap-config/local.conf.sampl=
e
> > > b/conf/templates/arago-scarthgap-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/conf/templates/arago-scarthgap-config/local.conf.sample
> > > > +++ b/conf/templates/arago-scarthgap-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/arago-scarthgap-next-config/local.conf.sample
> > > b/conf/templates/arago-scarthgap-next-config/local.conf.sample
> > > > index dbb184b..3ad6481 100644
> > > > --- a/conf/templates/arago-scarthgap-next-config/local.conf.sample
> > > > +++ b/conf/templates/arago-scarthgap-next-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
> > > b/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
> > > > index 46869ad..c862657 100644
> > > > --- a/conf/templates/arago-scarthgap-selinux-config/local.conf.samp=
le
> > > > +++ b/conf/templates/arago-scarthgap-selinux-config/local.conf.samp=
le
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > a/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> > > b/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> > > > +++ b/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sampl=
e
> > > b/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sampl=
e
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > > a/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sampl=
e
> > > > +++
> > > b/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sampl=
e
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sampl=
e
> > > b/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sampl=
e
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > > a/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sampl=
e
> > > > +++
> > > b/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sampl=
e
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sampl=
e
> > > b/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sampl=
e
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > > a/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sampl=
e
> > > > +++
> > > b/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sampl=
e
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sampl=
e
> > > b/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sampl=
e
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > > a/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sampl=
e
> > > > +++
> > > b/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sampl=
e
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sampl=
e
> > > b/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sampl=
e
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > > a/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sampl=
e
> > > > +++
> > > b/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sampl=
e
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sampl=
e
> > > b/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sampl=
e
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > > a/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sampl=
e
> > > > +++
> > > b/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sampl=
e
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sampl=
e
> > > b/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sampl=
e
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > > a/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sampl=
e
> > > > +++
> > > b/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sampl=
e
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sampl=
e
> > > b/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sampl=
e
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > > a/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sampl=
e
> > > > +++
> > > b/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sampl=
e
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sampl=
e
> > > b/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sampl=
e
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > > a/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sampl=
e
> > > > +++
> > > b/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sampl=
e
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sampl=
e
> > > b/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sampl=
e
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > > a/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sampl=
e
> > > > +++
> > > b/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sampl=
e
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample
> > > b/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sam=
ple
> > > > +++ b/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sam=
ple
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample
> > > b/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sam=
ple
> > > > +++ b/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sam=
ple
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample
> > > b/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sam=
ple
> > > > +++ b/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sam=
ple
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample
> > > b/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sam=
ple
> > > > +++ b/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sam=
ple
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sam=
ple
> > >
> > b/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sam=
ple
> > > > index e45417c..27f1704 100644
> > > > ---
> > >
> > a/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sam=
ple
> > > > +++
> > >
> > b/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sam=
ple
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/distroless-kirkstone-config/local.conf.sample
> > > b/conf/templates/distroless-kirkstone-config/local.conf.sample
> > > > index 46cb253..b499977 100644
> > > > --- a/conf/templates/distroless-kirkstone-config/local.conf.sample
> > > > +++ b/conf/templates/distroless-kirkstone-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/conf/templates/distroless-master-config/local.conf.sam=
ple
> > > b/conf/templates/distroless-master-config/local.conf.sample
> > > > index bcdaaa4..7d218e8 100644
> > > > --- a/conf/templates/distroless-master-config/local.conf.sample
> > > > +++ b/conf/templates/distroless-master-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > > a/conf/templates/distroless-scarthgap-config/local.conf.sample
> > > b/conf/templates/distroless-scarthgap-config/local.conf.sample
> > > > index 46cb253..b499977 100644
> > > > --- a/conf/templates/distroless-scarthgap-config/local.conf.sample
> > > > +++ b/conf/templates/distroless-scarthgap-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/conf/templates/poky-kirkstone-config/local.conf.sample
> > > b/conf/templates/poky-kirkstone-config/local.conf.sample
> > > > index e67385d..12eacfc 100644
> > > > --- a/conf/templates/poky-kirkstone-config/local.conf.sample
> > > > +++ b/conf/templates/poky-kirkstone-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/conf/templates/poky-master-config/local.conf.sample
> > > b/conf/templates/poky-master-config/local.conf.sample
> > > > index 1fe5688..e0112c7 100644
> > > > --- a/conf/templates/poky-master-config/local.conf.sample
> > > > +++ b/conf/templates/poky-master-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/conf/templates/poky-master-wip-config/local.conf.sampl=
e
> > > b/conf/templates/poky-master-wip-config/local.conf.sample
> > > > index 1fe5688..e0112c7 100644
> > > > --- a/conf/templates/poky-master-wip-config/local.conf.sample
> > > > +++ b/conf/templates/poky-master-wip-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/conf/templates/poky-scarthgap-config/local.conf.sample
> > > b/conf/templates/poky-scarthgap-config/local.conf.sample
> > > > index e67385d..12eacfc 100644
> > > > --- a/conf/templates/poky-scarthgap-config/local.conf.sample
> > > > +++ b/conf/templates/poky-scarthgap-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.=
00-config/local.conf.sample
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.=
00-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.=
00-config/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.=
00-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.=
01-config/local.conf.sample
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.=
01-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.=
01-config/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.=
01-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.=
00-config/local.conf.sample
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.=
00-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.=
00-config/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.=
00-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.=
00-config/local.conf.sample
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.=
00-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.=
00-config/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.=
00-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.=
00-config/local.conf.sample
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.=
00-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.=
00-config/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.=
00-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.=
00-config/local.conf.sample
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.=
00-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.=
00-config/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.=
00-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.=
conf.sample
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.=
conf.sample
> > > > index 6b91881..1149e85 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.=
conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.=
conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/lo=
cal.conf.sample
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/lo=
cal.conf.sample
> > > > index e4f04f3..a0d9b30 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/lo=
cal.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/lo=
cal.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/lo=
cal.conf.sample
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/lo=
cal.conf.sample
> > > > index 32a6cfb..9dd0dfa 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/lo=
cal.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/lo=
cal.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/lo=
cal.conf.sample
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/lo=
cal.conf.sample
> > > > index ee23c20..a83b490 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/lo=
cal.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/lo=
cal.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/lo=
cal.conf.sample
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/lo=
cal.conf.sample
> > > > index c29b416..e743654 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/lo=
cal.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/lo=
cal.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/lo=
cal.conf.sample
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/lo=
cal.conf.sample
> > > > index 34afc91..8096a3b 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/lo=
cal.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/lo=
cal.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/lo=
cal.conf.sample
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/lo=
cal.conf.sample
> > > > index f592ad9..31bfec8 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/lo=
cal.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/lo=
cal.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/lo=
cal.conf.sample
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/lo=
cal.conf.sample
> > > > index 0df5360..145aed2 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/lo=
cal.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/lo=
cal.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/lo=
cal.conf.sample
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/lo=
cal.conf.sample
> > > > index 5e39ec4..016f942 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/lo=
cal.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/lo=
cal.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/lo=
cal.conf.sample
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/lo=
cal.conf.sample
> > > > index 689e5d8..e627f36 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/lo=
cal.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/lo=
cal.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/=
local.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/=
local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/=
local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/=
local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf=
.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf=
.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf=
.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf=
.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/loc=
al.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/loc=
al.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/loc=
al.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/loc=
al.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf=
.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf=
.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf=
.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf=
.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/loc=
al.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/loc=
al.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/loc=
al.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/loc=
al.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/l=
ocal.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/l=
ocal.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/l=
ocal.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/l=
ocal.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/=
local.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/=
local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/=
local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/=
local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-conf=
ig/local.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-conf=
ig/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-conf=
ig/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-conf=
ig/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-conf=
ig/local.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-conf=
ig/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-conf=
ig/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-conf=
ig/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.0=
1.09-config/local.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.0=
1.09-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.0=
1.09-config/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.0=
1.09-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.0=
1.10-config/local.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.0=
1.10-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.0=
1.10-config/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.0=
1.10-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-conf=
ig/local.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-conf=
ig/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-conf=
ig/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-conf=
ig/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-conf=
ig/local.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-conf=
ig/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-conf=
ig/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-conf=
ig/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.0=
7.04-config/local.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.0=
7.04-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.0=
7.04-config/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.0=
7.04-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git
> > >
> > a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.1=
0.04-config/local.conf.sample
> > >
> > b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.1=
0.04-config/local.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > ---
> > >
> > a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.1=
0.04-config/local.conf.sample
> > > > +++
> > >
> > b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.1=
0.04-config/local.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/configs/arago-master-wip-config.txt
> > > b/configs/arago-master-wip-config.txt
> > > > index eb9c49d..165a3d1 100644
> > > > --- a/configs/arago-master-wip-config.txt
> > > > +++ b/configs/arago-master-wip-config.txt
> > > > @@ -5,7 +5,7 @@ bitbake,
> > https://git.openembedded.org/bitbake,master,HEAD
> > > >  meta-arago,
> > >
> > https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=3Dmeta-a=
rago-distro:meta-arago-extras:meta-arago-test
> > > >  #meta-browser,
> > >
> > https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=3Dmeta=
-chromium
> > > >  #meta-selinux,
> > > https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=3D
> > > > -meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,laye=
rs=3D
> > > > +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
> > > >  meta-virtualization,
> > > https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
=3D
> > > >  meta-openembedded,
> > >
> > https://git.openembedded.org/meta-openembedded,master,HEAD,layers=3Dmet=
a-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedi=
a
> > > >  meta-ti,
> > >
> > https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta-ti-e=
xtras:meta-beagle:meta-ti-bsp
> > > > diff --git
> > > a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> > > b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> > > > index 5ced779..2dc2f5c 100644
> > > > --- a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.=
yml
> > > > +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.=
yml
> > > > @@ -71,3 +71,4 @@ repos:
> > > >      commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
> > > >      layers:
> > > >        meta:
> > > > +
> > > > diff --git
> > >
> > a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config=
.yml
> > >
> > b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config=
.yml
> > > > index 405fa3b..351d9ea 100644
> > > > ---
> > >
> > a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config=
.yml
> > > > +++
> > >
> > b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config=
.yml
> > > > @@ -83,3 +83,4 @@ repos:
> > > >      url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
> > > >      branch: "scarthgap"
> > > >      commit: "10.01.10.04"
> > > > +
> > > > diff --git a/kas/templates/local-arago64-v2.conf.yml
> > > b/kas/templates/local-arago64-v2.conf.yml
> > > > index c79388d..c6781be 100644
> > > > --- a/kas/templates/local-arago64-v2.conf.yml
> > > > +++ b/kas/templates/local-arago64-v2.conf.yml
> > > > @@ -15,7 +15,7 @@ local_conf_header:
> > > >      # wiping and rebuilding you can preserve this directory to spe=
ed
> > up
> > > this part
> > > >      # of subsequent builds. This directory is safe to share betwee=
n
> > > multiple builds
> > > >      # on the same machine too.
> > > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >      #
> > > >      # Where to place shared-state files
> > > > @@ -28,7 +28,7 @@ local_conf_header:
> > > >      # regenerate from these files if no changes were made to the
> > > configuration.
> > > >      # If changes were made to the configuration, only shared state
> > > files where the
> > > >      # state was still valid would be used (done using checksums).
> > > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >      #
> > > >      # Shared-state files from other locations
> > > > diff --git a/kas/templates/local-arago64-v3.conf.yml
> > > b/kas/templates/local-arago64-v3.conf.yml
> > > > index b182483..3fa683e 100644
> > > > --- a/kas/templates/local-arago64-v3.conf.yml
> > > > +++ b/kas/templates/local-arago64-v3.conf.yml
> > > > @@ -15,7 +15,7 @@ local_conf_header:
> > > >      # wiping and rebuilding you can preserve this directory to spe=
ed
> > up
> > > this part
> > > >      # of subsequent builds. This directory is safe to share betwee=
n
> > > multiple builds
> > > >      # on the same machine too.
> > > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >      #
> > > >      # Where to place shared-state files
> > > > @@ -28,7 +28,7 @@ local_conf_header:
> > > >      # regenerate from these files if no changes were made to the
> > > configuration.
> > > >      # If changes were made to the configuration, only shared state
> > > files where the
> > > >      # state was still valid would be used (done using checksums).
> > > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >      #
> > > >      # Shared-state files from other locations
> > > > diff --git a/kas/templates/local-poky-v2.conf.yml
> > > b/kas/templates/local-poky-v2.conf.yml
> > > > index 91995fe..075f535 100644
> > > > --- a/kas/templates/local-poky-v2.conf.yml
> > > > +++ b/kas/templates/local-poky-v2.conf.yml
> > > > @@ -15,7 +15,7 @@ local_conf_header:
> > > >      # wiping and rebuilding you can preserve this directory to spe=
ed
> > up
> > > this part
> > > >      # of subsequent builds. This directory is safe to share betwee=
n
> > > multiple builds
> > > >      # on the same machine too.
> > > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >      #
> > > >      # Where to place shared-state files
> > > > @@ -28,7 +28,7 @@ local_conf_header:
> > > >      # regenerate from these files if no changes were made to the
> > > configuration.
> > > >      # If changes were made to the configuration, only shared state
> > > files where the
> > > >      # state was still valid would be used (done using checksums).
> > > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >      #
> > > >      # Shared-state files from other locations
> > > > diff --git a/kas/templates/local-poky-v3.conf.yml
> > > b/kas/templates/local-poky-v3.conf.yml
> > > > index 7368fb0..193a1ce 100644
> > > > --- a/kas/templates/local-poky-v3.conf.yml
> > > > +++ b/kas/templates/local-poky-v3.conf.yml
> > > > @@ -15,7 +15,7 @@ local_conf_header:
> > > >      # wiping and rebuilding you can preserve this directory to spe=
ed
> > up
> > > this part
> > > >      # of subsequent builds. This directory is safe to share betwee=
n
> > > multiple builds
> > > >      # on the same machine too.
> > > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >      #
> > > >      # Where to place shared-state files
> > > > @@ -28,7 +28,7 @@ local_conf_header:
> > > >      # regenerate from these files if no changes were made to the
> > > configuration.
> > > >      # If changes were made to the configuration, only shared state
> > > files where the
> > > >      # state was still valid would be used (done using checksums).
> > > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >      #
> > > >      # Shared-state files from other locations
> > > > diff --git a/kas/templates/local-v2.conf.yml
> > > b/kas/templates/local-v2.conf.yml
> > > > index 3d666e4..f33fd45 100644
> > > > --- a/kas/templates/local-v2.conf.yml
> > > > +++ b/kas/templates/local-v2.conf.yml
> > > > @@ -15,7 +15,7 @@ local_conf_header:
> > > >      # wiping and rebuilding you can preserve this directory to spe=
ed
> > up
> > > this part
> > > >      # of subsequent builds. This directory is safe to share betwee=
n
> > > multiple builds
> > > >      # on the same machine too.
> > > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >      #
> > > >      # Where to place shared-state files
> > > > @@ -28,7 +28,7 @@ local_conf_header:
> > > >      # regenerate from these files if no changes were made to the
> > > configuration.
> > > >      # If changes were made to the configuration, only shared state
> > > files where the
> > > >      # state was still valid would be used (done using checksums).
> > > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >      #
> > > >      # Shared-state files from other locations
> > > > diff --git a/kas/templates/local-v3.conf.yml
> > > b/kas/templates/local-v3.conf.yml
> > > > index 063b863..07eb5af 100644
> > > > --- a/kas/templates/local-v3.conf.yml
> > > > +++ b/kas/templates/local-v3.conf.yml
> > > > @@ -15,7 +15,7 @@ local_conf_header:
> > > >      # wiping and rebuilding you can preserve this directory to spe=
ed
> > up
> > > this part
> > > >      # of subsequent builds. This directory is safe to share betwee=
n
> > > multiple builds
> > > >      # on the same machine too.
> > > > -    DL_DIR =3D "${TOPDIR}/downloads"
> > > > +    DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >      #
> > > >      # Where to place shared-state files
> > > > @@ -28,7 +28,7 @@ local_conf_header:
> > > >      # regenerate from these files if no changes were made to the
> > > configuration.
> > > >      # If changes were made to the configuration, only shared state
> > > files where the
> > > >      # state was still valid would be used (done using checksums).
> > > > -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >      #
> > > >      # Shared-state files from other locations
> > > > diff --git a/sample-files/local-arago64-v2.conf.sample
> > > b/sample-files/local-arago64-v2.conf.sample
> > > > index 7575b4b..8ad6f26 100644
> > > > --- a/sample-files/local-arago64-v2.conf.sample
> > > > +++ b/sample-files/local-arago64-v2.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/sample-files/local-arago64-v3.conf.sample
> > > b/sample-files/local-arago64-v3.conf.sample
> > > > index f2e9587..720ce11 100644
> > > > --- a/sample-files/local-arago64-v3.conf.sample
> > > > +++ b/sample-files/local-arago64-v3.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/sample-files/local-poky-v2.conf.sample
> > > b/sample-files/local-poky-v2.conf.sample
> > > > index e67385d..12eacfc 100644
> > > > --- a/sample-files/local-poky-v2.conf.sample
> > > > +++ b/sample-files/local-poky-v2.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/sample-files/local-poky-v3.conf.sample
> > > b/sample-files/local-poky-v3.conf.sample
> > > > index 1fe5688..e0112c7 100644
> > > > --- a/sample-files/local-poky-v3.conf.sample
> > > > +++ b/sample-files/local-poky-v3.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/sample-files/local-v2.conf.sample
> > > b/sample-files/local-v2.conf.sample
> > > > index 46cb253..b499977 100644
> > > > --- a/sample-files/local-v2.conf.sample
> > > > +++ b/sample-files/local-v2.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/sample-files/local-v3.conf.sample
> > > b/sample-files/local-v3.conf.sample
> > > > index bcdaaa4..7d218e8 100644
> > > > --- a/sample-files/local-v3.conf.sample
> > > > +++ b/sample-files/local-v3.conf.sample
> > > > @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> > > >  # wiping and rebuilding you can preserve this directory to speed u=
p
> > > this part
> > > >  # of subsequent builds. This directory is safe to share between
> > > multiple builds
> > > >  # on the same machine too.
> > > > -DL_DIR =3D "${TOPDIR}/downloads"
> > > > +DL_DIR =3D "${TOPDIR}/../downloads"
> > > >
> > > >  #
> > > >  # Where to place shared-state files
> > > > @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> > > >  # regenerate from these files if no changes were made to the
> > > configuration.
> > > >  # If changes were made to the configuration, only shared state fil=
es
> > > where the
> > > >  # state was still valid would be used (done using checksums).
> > > > -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> > > > +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> > > >
> > > >  #
> > > >  # Shared-state files from other locations
> > > > diff --git a/src/bin/convert.pl b/src/bin/convert.pl
> > > > index 2787b86..42b9c2c 100755
> > > > --- a/src/bin/convert.pl
> > > > +++ b/src/bin/convert.pl
> > > > @@ -501,7 +501,7 @@ sub convert_local_conf_template
> > > >      {
> > > >          chomp($lpLine);
> > > >
> > > > -        $lpLine =3D~ s/OEBASE/TOPDIR/;
> > > > +        $lpLine =3D~ s/OEBASE/TOPDIR\/\.\./;
> > > >          $lpLine =3D~ s/^MACHINE/#MACHINE/;
> > > >
> > > >          $lpLine =3D~ s/&/&amp;/g;
> > > > diff --git a/src/templates/local-arago64-v2.conf.xml
> > > b/src/templates/local-arago64-v2.conf.xml
> > > > index b49f702..d9d2ae7 100644
> > > > --- a/src/templates/local-arago64-v2.conf.xml
> > > > +++ b/src/templates/local-arago64-v2.conf.xml
> > > > @@ -11,7 +11,7 @@
> > > >      <line># wiping and rebuilding you can preserve this directory =
to
> > > speed up this part</line>
> > > >      <line># of subsequent builds. This directory is safe to share
> > > between multiple builds</line>
> > > >      <line># on the same machine too.</line>
> > > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Where to place shared-state files</line>
> > > > @@ -24,7 +24,7 @@
> > > >      <line># regenerate from these files if no changes were made to=
 the
> > > configuration.</line>
> > > >      <line># If changes were made to the configuration, only shared
> > > state files where the</line>
> > > >      <line># state was still valid would be used (done using
> > > checksums).</line>
> > > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Shared-state files from other locations</line>
> > > > diff --git a/src/templates/local-arago64-v3.conf.xml
> > > b/src/templates/local-arago64-v3.conf.xml
> > > > index 35d151f..c8a5d51 100644
> > > > --- a/src/templates/local-arago64-v3.conf.xml
> > > > +++ b/src/templates/local-arago64-v3.conf.xml
> > > > @@ -11,7 +11,7 @@
> > > >      <line># wiping and rebuilding you can preserve this directory =
to
> > > speed up this part</line>
> > > >      <line># of subsequent builds. This directory is safe to share
> > > between multiple builds</line>
> > > >      <line># on the same machine too.</line>
> > > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Where to place shared-state files</line>
> > > > @@ -24,7 +24,7 @@
> > > >      <line># regenerate from these files if no changes were made to=
 the
> > > configuration.</line>
> > > >      <line># If changes were made to the configuration, only shared
> > > state files where the</line>
> > > >      <line># state was still valid would be used (done using
> > > checksums).</line>
> > > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Shared-state files from other locations</line>
> > > > diff --git a/src/templates/local-poky-v2.conf.xml
> > > b/src/templates/local-poky-v2.conf.xml
> > > > index 72160c9..b45d6c2 100644
> > > > --- a/src/templates/local-poky-v2.conf.xml
> > > > +++ b/src/templates/local-poky-v2.conf.xml
> > > > @@ -11,7 +11,7 @@
> > > >      <line># wiping and rebuilding you can preserve this directory =
to
> > > speed up this part</line>
> > > >      <line># of subsequent builds. This directory is safe to share
> > > between multiple builds</line>
> > > >      <line># on the same machine too.</line>
> > > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Where to place shared-state files</line>
> > > > @@ -24,7 +24,7 @@
> > > >      <line># regenerate from these files if no changes were made to=
 the
> > > configuration.</line>
> > > >      <line># If changes were made to the configuration, only shared
> > > state files where the</line>
> > > >      <line># state was still valid would be used (done using
> > > checksums).</line>
> > > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Shared-state files from other locations</line>
> > > > diff --git a/src/templates/local-poky-v3.conf.xml
> > > b/src/templates/local-poky-v3.conf.xml
> > > > index 1e66478..fa313eb 100644
> > > > --- a/src/templates/local-poky-v3.conf.xml
> > > > +++ b/src/templates/local-poky-v3.conf.xml
> > > > @@ -11,7 +11,7 @@
> > > >      <line># wiping and rebuilding you can preserve this directory =
to
> > > speed up this part</line>
> > > >      <line># of subsequent builds. This directory is safe to share
> > > between multiple builds</line>
> > > >      <line># on the same machine too.</line>
> > > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Where to place shared-state files</line>
> > > > @@ -24,7 +24,7 @@
> > > >      <line># regenerate from these files if no changes were made to=
 the
> > > configuration.</line>
> > > >      <line># If changes were made to the configuration, only shared
> > > state files where the</line>
> > > >      <line># state was still valid would be used (done using
> > > checksums).</line>
> > > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Shared-state files from other locations</line>
> > > > diff --git a/src/templates/local-v2.conf.xml
> > > b/src/templates/local-v2.conf.xml
> > > > index 40f30e7..49e060c 100644
> > > > --- a/src/templates/local-v2.conf.xml
> > > > +++ b/src/templates/local-v2.conf.xml
> > > > @@ -11,7 +11,7 @@
> > > >      <line># wiping and rebuilding you can preserve this directory =
to
> > > speed up this part</line>
> > > >      <line># of subsequent builds. This directory is safe to share
> > > between multiple builds</line>
> > > >      <line># on the same machine too.</line>
> > > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Where to place shared-state files</line>
> > > > @@ -24,7 +24,7 @@
> > > >      <line># regenerate from these files if no changes were made to=
 the
> > > configuration.</line>
> > > >      <line># If changes were made to the configuration, only shared
> > > state files where the</line>
> > > >      <line># state was still valid would be used (done using
> > > checksums).</line>
> > > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Shared-state files from other locations</line>
> > > > diff --git a/src/templates/local-v3.conf.xml
> > > b/src/templates/local-v3.conf.xml
> > > > index d0c9d92..e300aaf 100644
> > > > --- a/src/templates/local-v3.conf.xml
> > > > +++ b/src/templates/local-v3.conf.xml
> > > > @@ -11,7 +11,7 @@
> > > >      <line># wiping and rebuilding you can preserve this directory =
to
> > > speed up this part</line>
> > > >      <line># of subsequent builds. This directory is safe to share
> > > between multiple builds</line>
> > > >      <line># on the same machine too.</line>
> > > > -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> > > > +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Where to place shared-state files</line>
> > > > @@ -24,7 +24,7 @@
> > > >      <line># regenerate from these files if no changes were made to=
 the
> > > configuration.</line>
> > > >      <line># If changes were made to the configuration, only shared
> > > state files where the</line>
> > > >      <line># state was still valid would be used (done using
> > > checksums).</line>
> > > > -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> > > > +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> > > >      <line></line>
> > > >      <line>#</line>
> > > >      <line># Shared-state files from other locations</line>
> > > > --
> > > > 2.17.1
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > Jonathan Cormier
> > > Senior Software Engineer
> > >
> > > Voice:  315.425.4045 x222
> > >
> > > http://www.CriticalLink.com
> > > 6712 Brooklawn Parkway, Syracuse, NY 13211
> > >
> >
> >
> > --
> > Jonathan Cormier
> > Senior Software Engineer
> >
> > Voice:  315.425.4045 x222
> >
> > http://www.CriticalLink.com <http://www.criticallink.com/>
> > 6712 Brooklawn Parkway, Syracuse, NY 13211
> > <https://twitter.com/Critical_Link>
> >
> >
> >
> >
> >
> >
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
> View/Reply Online (#15904): https://lists.yoctoproject.org/g/meta-arago/m=
essage/15904
> Mute This Topic: https://lists.yoctoproject.org/mt/111311276/7902621
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

