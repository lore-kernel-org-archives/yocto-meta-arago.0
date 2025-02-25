Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189E0C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 22:50:35 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.1513.1740523828195434330
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 14:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=mELODM+Q;
 spf=pass (domain: criticallink.com, ip: 209.85.167.45, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5452ed5b5b2so6182552e87.0
        for <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 14:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1740523826; x=1741128626; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SSA8nZ5Iv9rJTt6n75dO85OqLWT/Kra5x+elwWQWdSY=;
        b=mELODM+QzlJwMPlaxn77ddIzOzqEIzXJdMcmq3RN/3wDEw9LZ6mDwYsiiSbka/PduI
         fNl36AbyEcZ0juOZMN1Zmm7Qc7cN41/h4eoTVdKVEDGXixJrcsae3EXtRa8NrIoIH1XR
         EoTkQxfdmZZkDTHtqu/nyaz5o08780lYTwKxBw5LdZcTH8nozLy+m+wr/QDTsFL7w+eC
         Mv3T3VAxR4L5hWTpnt4Q6yJDhJFEnBlp8aDH2/0Kl+g+OV/bQjZp6x/wT9+SDPzOKk4T
         Rxw1pJSlT4g4xt4rBTa3tyLcEyHbr3jtsI4vHxoZ19F3fOFygbzPsw/qrV/bJubqiyUZ
         flWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740523826; x=1741128626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSA8nZ5Iv9rJTt6n75dO85OqLWT/Kra5x+elwWQWdSY=;
        b=Xhp2ezjUDP2OceiPex2Dsu+d3G+33u3SDZk1qyivpkwJXC+BSlV/fLFrO3m1XuMafT
         et3MghqCsSsy3XGgoIVmYyghVPRpwvSwK9mBBc8R9exoFYTq5GkUypMicxjKtkWeKene
         ii2pYxidJXQsvM59O74efO6HG5Hx2EY3spistzkc/jJUHScIL8Nk4zAFboWrsVChDg+h
         hcAhBRzohJgws90EO4vkyjPEw+7ahCvP6x84tnlrJOdFHThmhquAlVx6F0s0w8j5UTXQ
         c6o9jz+7Z0lBFGSWxgpo5+CCRZimECKkjVmZ0aH90S6/L9FCHbb75LgCQJy3oJgEL49c
         HLjw==
X-Forwarded-Encrypted: i=1; AJvYcCW3wvZz4QqKHEtpgUNGYoythLepYjm5gow9ixHoTLGUGKvG7TKlxg8NWtEVqV8KhFPxDEBwuq3rn/7e@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwE+sl4LjbkqSI9Mugdt70rcop2p290SLwqcUdoqB3J0jhXYGss
	hkvVpEU9ubdNC3d1FTeHnfV03LhteSJw9KIClPsmqRQO6Z5PpAQ1TeiGirSqIL9c4DvPXjcTICC
	rQGK2RvSA3NS7t4YkNe/98FFdwg5+5u17UZHV
X-Gm-Gg: ASbGnctGSIAwZIkYXvo2VSLTJacFBOHonMRMSA332d/EbJQ8bTrHAGHKlzBE+IjHWmh
	d8LO5WqMnIhPlsZi+SwTWx+QBx21+hGJgX3No6ofBXHzLMNr+jWApqRvCVx6rYjTMw78i4Z0YOT
	Mn1wUMJw==
X-Google-Smtp-Source: AGHT+IEF9kt4tf/if7k7RsuTEhTQKRmQcgXaOM22Rx5YATg5GFDbZuB4jg/HLqhQTJOiy3yfWJZZpdSagl2gLj0xkO4=
X-Received: by 2002:a05:6512:3f05:b0:545:c33:4099 with SMTP id
 2adb3069b0e04-548510d8334mr3210627e87.27.1740523825757; Tue, 25 Feb 2025
 14:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20250221163150.3367-1-reatmon@ti.com> <CADL8D3aHkzaCiQQUaSA+L6OkxH=_RkzW07FTs_Yv0gMM7XdR+w@mail.gmail.com>
 <18272C9B4C413796.25123@lists.yoctoproject.org> <182732AD24AFBC44.20721@lists.yoctoproject.org>
 <CADL8D3Z0+TXv=2wRSRrWg_mErHnF0qcxY=hUk-WBLxhQR-Ba_w@mail.gmail.com> <2c36a856-dbd7-496b-ad26-36905ac0de50@ti.com>
In-Reply-To: <2c36a856-dbd7-496b-ad26-36905ac0de50@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 25 Feb 2025 17:50:13 -0500
X-Gm-Features: AQ5f1JrR-7LYvjo9uSOQgU5tN7SJvsFLvUmoZ6gFTjra6u7zbmEu4_5jU5zfNOs
Message-ID: <CADL8D3ax8EKSbpzKUTHHzqNhmfZP-aUGy2vNERStVpnHDkQYZQ@mail.gmail.com>
Subject: Re: [meta-arago] [oe-layersetup][master][PATCH v2] templates: Fix
 paths for DL_DIR and SSTATE_DIR
To: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, 
	meta-arago@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005ba0a8062eff4810"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 22:50:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15917

--0000000000005ba0a8062eff4810
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 5:02=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wrote:

> Those lines were that way before.  Only the lines that get converted
> from OEBASE to TOPDIR were fixed.  So those should all be ok.
>
Ah okay.  Whoever uses those configs can fix them later if it's an issue.

>
>
>
> On 2/25/2025 12:11 PM, Jon Cormier wrote:
> > Looks like this got accepted, however there are several TMPDIR =3D line=
s
> > which use TOPDIR and have build in the path. These should be fixed as
> > well.
> >
> > src/templates/local-poky-v2.conf.xml
> > 52:    <line>TMPDIR =3D "${TOPDIR}/build/poky-tmp"</line>
> >
> > src/templates/local-v2.conf.xml
> > 52:    <line>TMPDIR =3D "${TOPDIR}/build/arago-tmp"</line>
> >
> > src/templates/local-poky-v3.conf.xml
> > 52:    <line>TMPDIR =3D "${TOPDIR}/build/poky-tmp"</line>
> >
> > src/templates/local-v3.conf.xml
> > 52:    <line>TMPDIR =3D "${TOPDIR}/build/arago-tmp"</line>
> >
> >
> > On Mon, Feb 24, 2025 at 11:45=E2=80=AFAM Jon Cormier via
> > lists.yoctoproject.org
> > <jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:
> >>
> >> On Mon, Feb 24, 2025 at 9:53=E2=80=AFAM Jon Cormier via lists.yoctopro=
ject.org
> >> <jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:
> >>
> >>> Ryan, I also had a question about the bitbake-setup configs.  Is ther=
e
> some
> >>> documentation on this setup tool?  Googling this is tricky since the
> name
> >>> is so generic. The other tools docs pop right up in google.
> >>>
> >> Nevermind, looks like the work is being done here:
> >> https://github.com/kanavin/bitbake
> >>
> >>>
> >>> On Fri, Feb 21, 2025 at 2:18=E2=80=AFPM Jon Cormier <jcormier@critica=
llink.com
> >
> >>> wrote:
> >>>
> >>>> Ryan, I think you also need to touch TMPDIR in a few of the local.co=
nf
> >>>> files
> >>>>
> >>>>
> >>>> On Fri, Feb 21, 2025 at 11:31=E2=80=AFAM Ryan Eatmon via
> >>>> lists.yoctoproject.org <reatmon=3Dti.com@lists.yoctoproject.org> wro=
te:
> >>>>>
> >>>>> When the conversion to the new XML/XSLT system was done, the
> reference
> >>>>> to OEBASE was converted to TOPDIR.  The value for OEBASE was
> >>>>> historically the directory above the bitbake run dir which is what
> >>>>> TOPDIR is set to.  This made the downloads and sstate_cache
> directories
> >>>>> appear down a level of directory that was unintended.
> >>>>>
> >>>>> This change updates the values for DL_DIR and SSTATE_DIR to be
> relative
> >>>>> to TOPDIR but back in the same location they were originally meant =
to
> >>> be
> >>>>> in.
> >>>>>
> >>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>>> ---
> >>>>> v2: I ran a make clean and make and a lot more configs got updated
> with
> >>>>> the change.  Clearly I need to rework the make system.
> >>>>>
> >>>>>   bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json    | 2
> +-
> >>>>>   .../arago-kirkstone-chromium-config/local.conf.sample         | 4
> ++--
> >>>>>   conf/templates/arago-kirkstone-config/local.conf.sample       | 4
> ++--
> >>>>>   conf/templates/arago-kirkstone-next-config/local.conf.sample  | 4
> ++--
> >>>>>   conf/templates/arago-kirkstone-wip-config/local.conf.sample   | 4
> ++--
> >>>>>   conf/templates/arago-master-chromium-config/local.conf.sample | 4
> ++--
> >>>>>   conf/templates/arago-master-config/local.conf.sample          | 4
> ++--
> >>>>>   conf/templates/arago-master-next-config/local.conf.sample     | 4
> ++--
> >>>>>   conf/templates/arago-master-selinux-config/local.conf.sample  | 4
> ++--
> >>>>>   conf/templates/arago-master-wip-config/local.conf.sample      | 4
> ++--
> >>>>>   .../arago-scarthgap-chromium-config/local.conf.sample         | 4
> ++--
> >>>>>   conf/templates/arago-scarthgap-config/local.conf.sample       | 4
> ++--
> >>>>>   conf/templates/arago-scarthgap-next-config/local.conf.sample  | 4
> ++--
> >>>>>   .../arago-scarthgap-selinux-config/local.conf.sample          | 4
> ++--
> >>>>>   conf/templates/arago-scarthgap-wip-config/local.conf.sample   | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.00.00.006-config/local.conf.sample     | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.00.00.007-config/local.conf.sample     | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.00.00.011-config/local.conf.sample     | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.01.00.001-config/local.conf.sample     | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.01.00.003-config/local.conf.sample     | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.01.00.007-config/local.conf.sample     | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.01.00.008-config/local.conf.sample     | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.02.00.008-config/local.conf.sample     | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.02.00.009-config/local.conf.sample     | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.02.00.010-config/local.conf.sample     | 4
> ++--
> >>>>>   .../coresdk_coresdk-09.03.05-config/local.conf.sample         | 4
> ++--
> >>>>>   .../coresdk_coresdk-10.00.07-config/local.conf.sample         | 4
> ++--
> >>>>>   .../coresdk_coresdk-10.01.08-config/local.conf.sample         | 4
> ++--
> >>>>>   .../coresdk_coresdk-10.01.10-config/local.conf.sample         | 4
> ++--
> >>>>>   .../coresdk_coresdk-10.01.10-selinux-config/local.conf.sample | 4
> ++--
> >>>>>   conf/templates/distroless-kirkstone-config/local.conf.sample  | 4
> ++--
> >>>>>   conf/templates/distroless-master-config/local.conf.sample     | 4
> ++--
> >>>>>   conf/templates/distroless-scarthgap-config/local.conf.sample  | 4
> ++--
> >>>>>   conf/templates/poky-kirkstone-config/local.conf.sample        | 4
> ++--
> >>>>>   conf/templates/poky-master-config/local.conf.sample           | 4
> ++--
> >>>>>   conf/templates/poky-master-wip-config/local.conf.sample       | 4
> ++--
> >>>>>   conf/templates/poky-scarthgap-config/local.conf.sample        | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   .../local.conf.sample                                         | 4
> ++--
> >>>>>   configs/arago-master-wip-config.txt                           | 2
> +-
> >>>>>   .../processor-sdk-scarthgap-10.01.10.04-config.yml            | 1=
 +
> >>>>>   .../processor-sdk-scarthgap-chromium-10.01.10.04-config.yml   | 1=
 +
> >>>>>   kas/templates/local-arago64-v2.conf.yml                       | 4
> ++--
> >>>>>   kas/templates/local-arago64-v3.conf.yml                       | 4
> ++--
> >>>>>   kas/templates/local-poky-v2.conf.yml                          | 4
> ++--
> >>>>>   kas/templates/local-poky-v3.conf.yml                          | 4
> ++--
> >>>>>   kas/templates/local-v2.conf.yml                               | 4
> ++--
> >>>>>   kas/templates/local-v3.conf.yml                               | 4
> ++--
> >>>>>   sample-files/local-arago64-v2.conf.sample                     | 4
> ++--
> >>>>>   sample-files/local-arago64-v3.conf.sample                     | 4
> ++--
> >>>>>   sample-files/local-poky-v2.conf.sample                        | 4
> ++--
> >>>>>   sample-files/local-poky-v3.conf.sample                        | 4
> ++--
> >>>>>   sample-files/local-v2.conf.sample                             | 4
> ++--
> >>>>>   sample-files/local-v3.conf.sample                             | 4
> ++--
> >>>>>   src/bin/convert.pl                                            | 2
> +-
> >>>>>   src/templates/local-arago64-v2.conf.xml                       | 4
> ++--
> >>>>>   src/templates/local-arago64-v3.conf.xml                       | 4
> ++--
> >>>>>   src/templates/local-poky-v2.conf.xml                          | 4
> ++--
> >>>>>   src/templates/local-poky-v3.conf.xml                          | 4
> ++--
> >>>>>   src/templates/local-v2.conf.xml                               | 4
> ++--
> >>>>>   src/templates/local-v3.conf.xml                               | 4
> ++--
> >>>>>   90 files changed, 175 insertions(+), 173 deletions(-)
> >>>>>
> >>>>> diff --git
> a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
> >>>> b/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
> >>>>> index 1cc2962..8acd24a 100644
> >>>>> --- a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
> >>>>> +++ b/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
> >>>>> @@ -9,7 +9,7 @@
> >>>>>               "uri": "
> >>>> https://git.ti.com/git/arago-project/oe-layersetup.git"
> >>>>>             }
> >>>>>           },
> >>>>> -        "rev": "wip"
> >>>>> +        "rev": "master"
> >>>>>         },
> >>>>>         "path": "oe-layersetup"
> >>>>>       },
> >>>>> diff --git
> >>>> a/conf/templates/arago-kirkstone-chromium-config/local.conf.sample
> >>>> b/conf/templates/arago-kirkstone-chromium-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> a/conf/templates/arago-kirkstone-chromium-config/local.conf.sample
> >>>>> +++
> b/conf/templates/arago-kirkstone-chromium-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/conf/templates/arago-kirkstone-config/local.conf.sampl=
e
> >>>> b/conf/templates/arago-kirkstone-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> --- a/conf/templates/arago-kirkstone-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-kirkstone-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/arago-kirkstone-next-config/local.conf.sample
> >>>> b/conf/templates/arago-kirkstone-next-config/local.conf.sample
> >>>>> index cb76dd8..d97939a 100644
> >>>>> --- a/conf/templates/arago-kirkstone-next-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-kirkstone-next-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>> a/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> >>>> b/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> --- a/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-kirkstone-wip-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/arago-master-chromium-config/local.conf.sample
> >>>> b/conf/templates/arago-master-chromium-config/local.conf.sample
> >>>>> index f2e9587..720ce11 100644
> >>>>> --- a/conf/templates/arago-master-chromium-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-master-chromium-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/conf/templates/arago-master-config/local.conf.sample
> >>>> b/conf/templates/arago-master-config/local.conf.sample
> >>>>> index f2e9587..720ce11 100644
> >>>>> --- a/conf/templates/arago-master-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-master-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> a/conf/templates/arago-master-next-config/local.conf.sample
> >>>> b/conf/templates/arago-master-next-config/local.conf.sample
> >>>>> index 6c32f4b..c1549ac 100644
> >>>>> --- a/conf/templates/arago-master-next-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-master-next-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/arago-master-selinux-config/local.conf.sample
> >>>> b/conf/templates/arago-master-selinux-config/local.conf.sample
> >>>>> index 5cc19d4..dfb4873 100644
> >>>>> --- a/conf/templates/arago-master-selinux-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-master-selinux-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/conf/templates/arago-master-wip-config/local.conf.samp=
le
> >>>> b/conf/templates/arago-master-wip-config/local.conf.sample
> >>>>> index f2e9587..720ce11 100644
> >>>>> --- a/conf/templates/arago-master-wip-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-master-wip-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
> >>>> b/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> a/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
> >>>>> +++
> b/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/conf/templates/arago-scarthgap-config/local.conf.sampl=
e
> >>>> b/conf/templates/arago-scarthgap-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> --- a/conf/templates/arago-scarthgap-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-scarthgap-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/arago-scarthgap-next-config/local.conf.sample
> >>>> b/conf/templates/arago-scarthgap-next-config/local.conf.sample
> >>>>> index dbb184b..3ad6481 100644
> >>>>> --- a/conf/templates/arago-scarthgap-next-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-scarthgap-next-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
> >>>> b/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
> >>>>> index 46869ad..c862657 100644
> >>>>> --- a/conf/templates/arago-scarthgap-selinux-config/local.conf.samp=
le
> >>>>> +++ b/conf/templates/arago-scarthgap-selinux-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>> a/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> >>>> b/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> --- a/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> >>>>> +++ b/conf/templates/arago-scarthgap-wip-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.samp=
le
> >>>> b/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.samp=
le
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>> a/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.samp=
le
> >>>>> +++
> >>>> b/conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.samp=
le
> >>>> b/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.samp=
le
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>> a/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.samp=
le
> >>>>> +++
> >>>> b/conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.samp=
le
> >>>> b/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.samp=
le
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>> a/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.samp=
le
> >>>>> +++
> >>>> b/conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.samp=
le
> >>>> b/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.samp=
le
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>> a/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.samp=
le
> >>>>> +++
> >>>> b/conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.samp=
le
> >>>> b/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.samp=
le
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>> a/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.samp=
le
> >>>>> +++
> >>>> b/conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.samp=
le
> >>>> b/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.samp=
le
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>> a/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.samp=
le
> >>>>> +++
> >>>> b/conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.samp=
le
> >>>> b/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.samp=
le
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>> a/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.samp=
le
> >>>>> +++
> >>>> b/conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.samp=
le
> >>>> b/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.samp=
le
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>> a/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.samp=
le
> >>>>> +++
> >>>> b/conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.samp=
le
> >>>> b/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.samp=
le
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>> a/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.samp=
le
> >>>>> +++
> >>>> b/conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.samp=
le
> >>>> b/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.samp=
le
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>> a/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.samp=
le
> >>>>> +++
> >>>> b/conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.samp=
le
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample
> >>>> b/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> a/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample
> >>>>> +++
> b/conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample
> >>>> b/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> a/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample
> >>>>> +++
> b/conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample
> >>>> b/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> a/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample
> >>>>> +++
> b/conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample
> >>>> b/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> a/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample
> >>>>> +++
> b/conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sampl=
e
> >>>>
> >>>
> b/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sampl=
e
> >>>>> index e45417c..27f1704 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sampl=
e
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sampl=
e
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/distroless-kirkstone-config/local.conf.sample
> >>>> b/conf/templates/distroless-kirkstone-config/local.conf.sample
> >>>>> index 46cb253..b499977 100644
> >>>>> --- a/conf/templates/distroless-kirkstone-config/local.conf.sample
> >>>>> +++ b/conf/templates/distroless-kirkstone-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> a/conf/templates/distroless-master-config/local.conf.sample
> >>>> b/conf/templates/distroless-master-config/local.conf.sample
> >>>>> index bcdaaa4..7d218e8 100644
> >>>>> --- a/conf/templates/distroless-master-config/local.conf.sample
> >>>>> +++ b/conf/templates/distroless-master-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>> a/conf/templates/distroless-scarthgap-config/local.conf.sample
> >>>> b/conf/templates/distroless-scarthgap-config/local.conf.sample
> >>>>> index 46cb253..b499977 100644
> >>>>> --- a/conf/templates/distroless-scarthgap-config/local.conf.sample
> >>>>> +++ b/conf/templates/distroless-scarthgap-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/conf/templates/poky-kirkstone-config/local.conf.sample
> >>>> b/conf/templates/poky-kirkstone-config/local.conf.sample
> >>>>> index e67385d..12eacfc 100644
> >>>>> --- a/conf/templates/poky-kirkstone-config/local.conf.sample
> >>>>> +++ b/conf/templates/poky-kirkstone-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/conf/templates/poky-master-config/local.conf.sample
> >>>> b/conf/templates/poky-master-config/local.conf.sample
> >>>>> index 1fe5688..e0112c7 100644
> >>>>> --- a/conf/templates/poky-master-config/local.conf.sample
> >>>>> +++ b/conf/templates/poky-master-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/conf/templates/poky-master-wip-config/local.conf.sampl=
e
> >>>> b/conf/templates/poky-master-wip-config/local.conf.sample
> >>>>> index 1fe5688..e0112c7 100644
> >>>>> --- a/conf/templates/poky-master-wip-config/local.conf.sample
> >>>>> +++ b/conf/templates/poky-master-wip-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/conf/templates/poky-scarthgap-config/local.conf.sample
> >>>> b/conf/templates/poky-scarthgap-config/local.conf.sample
> >>>>> index e67385d..12eacfc 100644
> >>>>> --- a/conf/templates/poky-scarthgap-config/local.conf.sample
> >>>>> +++ b/conf/templates/poky-scarthgap-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00=
-config/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00=
-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00=
-config/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00=
-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01=
-config/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01=
-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01=
-config/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01=
-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00=
-config/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00=
-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00=
-config/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00=
-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00=
-config/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00=
-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00=
-config/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00=
-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00=
-config/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00=
-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00=
-config/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00=
-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00=
-config/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00=
-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00=
-config/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00=
-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.co=
nf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.co=
nf.sample
> >>>>> index 6b91881..1149e85 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.co=
nf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.co=
nf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/loca=
l.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/loca=
l.conf.sample
> >>>>> index e4f04f3..a0d9b30 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/loca=
l.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/loca=
l.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/loca=
l.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/loca=
l.conf.sample
> >>>>> index 32a6cfb..9dd0dfa 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/loca=
l.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/loca=
l.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/loca=
l.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/loca=
l.conf.sample
> >>>>> index ee23c20..a83b490 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/loca=
l.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/loca=
l.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/loca=
l.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/loca=
l.conf.sample
> >>>>> index c29b416..e743654 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/loca=
l.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/loca=
l.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/loca=
l.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/loca=
l.conf.sample
> >>>>> index 34afc91..8096a3b 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/loca=
l.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/loca=
l.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/loca=
l.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/loca=
l.conf.sample
> >>>>> index f592ad9..31bfec8 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/loca=
l.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/loca=
l.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/loca=
l.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/loca=
l.conf.sample
> >>>>> index 0df5360..145aed2 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/loca=
l.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/loca=
l.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/loca=
l.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/loca=
l.conf.sample
> >>>>> index 5e39ec4..016f942 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/loca=
l.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/loca=
l.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/loca=
l.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/loca=
l.conf.sample
> >>>>> index 689e5d8..e627f36 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/loca=
l.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/loca=
l.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/lo=
cal.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/lo=
cal.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/lo=
cal.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/lo=
cal.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf.s=
ample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf.s=
ample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf.s=
ample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf.s=
ample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/local=
.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/local=
.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/local=
.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/local=
.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf.s=
ample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf.s=
ample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf.s=
ample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf.s=
ample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/local=
.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/local=
.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/local=
.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/local=
.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/loc=
al.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/loc=
al.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/loc=
al.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/loc=
al.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/lo=
cal.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/lo=
cal.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/lo=
cal.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/lo=
cal.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config=
/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config=
/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config=
/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config=
/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config=
/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config=
/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config=
/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config=
/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
09-config/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
09-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
09-config/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
09-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
10-config/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
10-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
10-config/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.=
10-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config=
/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config=
/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config=
/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config=
/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.=
04-config/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.=
04-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.=
04-config/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.=
04-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> ---
> >>>>
> >>>
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> >>>>> +++
> >>>>
> >>>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/configs/arago-master-wip-config.txt
> >>>> b/configs/arago-master-wip-config.txt
> >>>>> index eb9c49d..165a3d1 100644
> >>>>> --- a/configs/arago-master-wip-config.txt
> >>>>> +++ b/configs/arago-master-wip-config.txt
> >>>>> @@ -5,7 +5,7 @@ bitbake,
> >>> https://git.openembedded.org/bitbake,master,HEAD
> >>>>>   meta-arago,
> >>>>
> >>>
> https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=3Dmeta-ara=
go-distro:meta-arago-extras:meta-arago-test
> >>>>>   #meta-browser,
> >>>>
> >>>
> https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=3Dmeta-c=
hromium
> >>>>>   #meta-selinux,
> >>>> https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=3D
> >>>>> -meta-qt5,
> https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=3D
> >>>>> +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
> >>>>>   meta-virtualization,
> >>>> https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
=3D
> >>>>>   meta-openembedded,
> >>>>
> >>>
> https://git.openembedded.org/meta-openembedded,master,HEAD,layers=3Dmeta-=
networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> >>>>>   meta-ti,
> >>>>
> >>>
> https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta-ti-ext=
ras:meta-beagle:meta-ti-bsp
> >>>>> diff --git
> >>>> a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> >>>> b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> >>>>> index 5ced779..2dc2f5c 100644
> >>>>> ---
> a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> >>>>> +++
> b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> >>>>> @@ -71,3 +71,4 @@ repos:
> >>>>>       commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
> >>>>>       layers:
> >>>>>         meta:
> >>>>> +
> >>>>> diff --git
> >>>>
> >>>
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> >>>>
> >>>
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> >>>>> index 405fa3b..351d9ea 100644
> >>>>> ---
> >>>>
> >>>
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> >>>>> +++
> >>>>
> >>>
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> >>>>> @@ -83,3 +83,4 @@ repos:
> >>>>>       url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
> >>>>>       branch: "scarthgap"
> >>>>>       commit: "10.01.10.04"
> >>>>> +
> >>>>> diff --git a/kas/templates/local-arago64-v2.conf.yml
> >>>> b/kas/templates/local-arago64-v2.conf.yml
> >>>>> index c79388d..c6781be 100644
> >>>>> --- a/kas/templates/local-arago64-v2.conf.yml
> >>>>> +++ b/kas/templates/local-arago64-v2.conf.yml
> >>>>> @@ -15,7 +15,7 @@ local_conf_header:
> >>>>>       # wiping and rebuilding you can preserve this directory to
> speed
> >>> up
> >>>> this part
> >>>>>       # of subsequent builds. This directory is safe to share betwe=
en
> >>>> multiple builds
> >>>>>       # on the same machine too.
> >>>>> -    DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +    DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>       #
> >>>>>       # Where to place shared-state files
> >>>>> @@ -28,7 +28,7 @@ local_conf_header:
> >>>>>       # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>       # If changes were made to the configuration, only shared stat=
e
> >>>> files where the
> >>>>>       # state was still valid would be used (done using checksums).
> >>>>> -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>       #
> >>>>>       # Shared-state files from other locations
> >>>>> diff --git a/kas/templates/local-arago64-v3.conf.yml
> >>>> b/kas/templates/local-arago64-v3.conf.yml
> >>>>> index b182483..3fa683e 100644
> >>>>> --- a/kas/templates/local-arago64-v3.conf.yml
> >>>>> +++ b/kas/templates/local-arago64-v3.conf.yml
> >>>>> @@ -15,7 +15,7 @@ local_conf_header:
> >>>>>       # wiping and rebuilding you can preserve this directory to
> speed
> >>> up
> >>>> this part
> >>>>>       # of subsequent builds. This directory is safe to share betwe=
en
> >>>> multiple builds
> >>>>>       # on the same machine too.
> >>>>> -    DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +    DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>       #
> >>>>>       # Where to place shared-state files
> >>>>> @@ -28,7 +28,7 @@ local_conf_header:
> >>>>>       # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>       # If changes were made to the configuration, only shared stat=
e
> >>>> files where the
> >>>>>       # state was still valid would be used (done using checksums).
> >>>>> -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>       #
> >>>>>       # Shared-state files from other locations
> >>>>> diff --git a/kas/templates/local-poky-v2.conf.yml
> >>>> b/kas/templates/local-poky-v2.conf.yml
> >>>>> index 91995fe..075f535 100644
> >>>>> --- a/kas/templates/local-poky-v2.conf.yml
> >>>>> +++ b/kas/templates/local-poky-v2.conf.yml
> >>>>> @@ -15,7 +15,7 @@ local_conf_header:
> >>>>>       # wiping and rebuilding you can preserve this directory to
> speed
> >>> up
> >>>> this part
> >>>>>       # of subsequent builds. This directory is safe to share betwe=
en
> >>>> multiple builds
> >>>>>       # on the same machine too.
> >>>>> -    DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +    DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>       #
> >>>>>       # Where to place shared-state files
> >>>>> @@ -28,7 +28,7 @@ local_conf_header:
> >>>>>       # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>       # If changes were made to the configuration, only shared stat=
e
> >>>> files where the
> >>>>>       # state was still valid would be used (done using checksums).
> >>>>> -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>       #
> >>>>>       # Shared-state files from other locations
> >>>>> diff --git a/kas/templates/local-poky-v3.conf.yml
> >>>> b/kas/templates/local-poky-v3.conf.yml
> >>>>> index 7368fb0..193a1ce 100644
> >>>>> --- a/kas/templates/local-poky-v3.conf.yml
> >>>>> +++ b/kas/templates/local-poky-v3.conf.yml
> >>>>> @@ -15,7 +15,7 @@ local_conf_header:
> >>>>>       # wiping and rebuilding you can preserve this directory to
> speed
> >>> up
> >>>> this part
> >>>>>       # of subsequent builds. This directory is safe to share betwe=
en
> >>>> multiple builds
> >>>>>       # on the same machine too.
> >>>>> -    DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +    DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>       #
> >>>>>       # Where to place shared-state files
> >>>>> @@ -28,7 +28,7 @@ local_conf_header:
> >>>>>       # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>       # If changes were made to the configuration, only shared stat=
e
> >>>> files where the
> >>>>>       # state was still valid would be used (done using checksums).
> >>>>> -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>       #
> >>>>>       # Shared-state files from other locations
> >>>>> diff --git a/kas/templates/local-v2.conf.yml
> >>>> b/kas/templates/local-v2.conf.yml
> >>>>> index 3d666e4..f33fd45 100644
> >>>>> --- a/kas/templates/local-v2.conf.yml
> >>>>> +++ b/kas/templates/local-v2.conf.yml
> >>>>> @@ -15,7 +15,7 @@ local_conf_header:
> >>>>>       # wiping and rebuilding you can preserve this directory to
> speed
> >>> up
> >>>> this part
> >>>>>       # of subsequent builds. This directory is safe to share betwe=
en
> >>>> multiple builds
> >>>>>       # on the same machine too.
> >>>>> -    DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +    DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>       #
> >>>>>       # Where to place shared-state files
> >>>>> @@ -28,7 +28,7 @@ local_conf_header:
> >>>>>       # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>       # If changes were made to the configuration, only shared stat=
e
> >>>> files where the
> >>>>>       # state was still valid would be used (done using checksums).
> >>>>> -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>       #
> >>>>>       # Shared-state files from other locations
> >>>>> diff --git a/kas/templates/local-v3.conf.yml
> >>>> b/kas/templates/local-v3.conf.yml
> >>>>> index 063b863..07eb5af 100644
> >>>>> --- a/kas/templates/local-v3.conf.yml
> >>>>> +++ b/kas/templates/local-v3.conf.yml
> >>>>> @@ -15,7 +15,7 @@ local_conf_header:
> >>>>>       # wiping and rebuilding you can preserve this directory to
> speed
> >>> up
> >>>> this part
> >>>>>       # of subsequent builds. This directory is safe to share betwe=
en
> >>>> multiple builds
> >>>>>       # on the same machine too.
> >>>>> -    DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +    DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>       #
> >>>>>       # Where to place shared-state files
> >>>>> @@ -28,7 +28,7 @@ local_conf_header:
> >>>>>       # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>       # If changes were made to the configuration, only shared stat=
e
> >>>> files where the
> >>>>>       # state was still valid would be used (done using checksums).
> >>>>> -    SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +    SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>       #
> >>>>>       # Shared-state files from other locations
> >>>>> diff --git a/sample-files/local-arago64-v2.conf.sample
> >>>> b/sample-files/local-arago64-v2.conf.sample
> >>>>> index 7575b4b..8ad6f26 100644
> >>>>> --- a/sample-files/local-arago64-v2.conf.sample
> >>>>> +++ b/sample-files/local-arago64-v2.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/sample-files/local-arago64-v3.conf.sample
> >>>> b/sample-files/local-arago64-v3.conf.sample
> >>>>> index f2e9587..720ce11 100644
> >>>>> --- a/sample-files/local-arago64-v3.conf.sample
> >>>>> +++ b/sample-files/local-arago64-v3.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/sample-files/local-poky-v2.conf.sample
> >>>> b/sample-files/local-poky-v2.conf.sample
> >>>>> index e67385d..12eacfc 100644
> >>>>> --- a/sample-files/local-poky-v2.conf.sample
> >>>>> +++ b/sample-files/local-poky-v2.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/sample-files/local-poky-v3.conf.sample
> >>>> b/sample-files/local-poky-v3.conf.sample
> >>>>> index 1fe5688..e0112c7 100644
> >>>>> --- a/sample-files/local-poky-v3.conf.sample
> >>>>> +++ b/sample-files/local-poky-v3.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/sample-files/local-v2.conf.sample
> >>>> b/sample-files/local-v2.conf.sample
> >>>>> index 46cb253..b499977 100644
> >>>>> --- a/sample-files/local-v2.conf.sample
> >>>>> +++ b/sample-files/local-v2.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/sample-files/local-v3.conf.sample
> >>>> b/sample-files/local-v3.conf.sample
> >>>>> index bcdaaa4..7d218e8 100644
> >>>>> --- a/sample-files/local-v3.conf.sample
> >>>>> +++ b/sample-files/local-v3.conf.sample
> >>>>> @@ -10,7 +10,7 @@ CONF_VERSION =3D "2"
> >>>>>   # wiping and rebuilding you can preserve this directory to speed =
up
> >>>> this part
> >>>>>   # of subsequent builds. This directory is safe to share between
> >>>> multiple builds
> >>>>>   # on the same machine too.
> >>>>> -DL_DIR =3D "${TOPDIR}/downloads"
> >>>>> +DL_DIR =3D "${TOPDIR}/../downloads"
> >>>>>
> >>>>>   #
> >>>>>   # Where to place shared-state files
> >>>>> @@ -23,7 +23,7 @@ DL_DIR =3D "${TOPDIR}/downloads"
> >>>>>   # regenerate from these files if no changes were made to the
> >>>> configuration.
> >>>>>   # If changes were made to the configuration, only shared state
> files
> >>>> where the
> >>>>>   # state was still valid would be used (done using checksums).
> >>>>> -SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >>>>> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >>>>>
> >>>>>   #
> >>>>>   # Shared-state files from other locations
> >>>>> diff --git a/src/bin/convert.pl b/src/bin/convert.pl
> >>>>> index 2787b86..42b9c2c 100755
> >>>>> --- a/src/bin/convert.pl
> >>>>> +++ b/src/bin/convert.pl
> >>>>> @@ -501,7 +501,7 @@ sub convert_local_conf_template
> >>>>>       {
> >>>>>           chomp($lpLine);
> >>>>>
> >>>>> -        $lpLine =3D~ s/OEBASE/TOPDIR/;
> >>>>> +        $lpLine =3D~ s/OEBASE/TOPDIR\/\.\./;
> >>>>>           $lpLine =3D~ s/^MACHINE/#MACHINE/;
> >>>>>
> >>>>>           $lpLine =3D~ s/&/&amp;/g;
> >>>>> diff --git a/src/templates/local-arago64-v2.conf.xml
> >>>> b/src/templates/local-arago64-v2.conf.xml
> >>>>> index b49f702..d9d2ae7 100644
> >>>>> --- a/src/templates/local-arago64-v2.conf.xml
> >>>>> +++ b/src/templates/local-arago64-v2.conf.xml
> >>>>> @@ -11,7 +11,7 @@
> >>>>>       <line># wiping and rebuilding you can preserve this directory
> to
> >>>> speed up this part</line>
> >>>>>       <line># of subsequent builds. This directory is safe to share
> >>>> between multiple builds</line>
> >>>>>       <line># on the same machine too.</line>
> >>>>> -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> >>>>> +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Where to place shared-state files</line>
> >>>>> @@ -24,7 +24,7 @@
> >>>>>       <line># regenerate from these files if no changes were made t=
o
> the
> >>>> configuration.</line>
> >>>>>       <line># If changes were made to the configuration, only share=
d
> >>>> state files where the</line>
> >>>>>       <line># state was still valid would be used (done using
> >>>> checksums).</line>
> >>>>> -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> >>>>> +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Shared-state files from other locations</line>
> >>>>> diff --git a/src/templates/local-arago64-v3.conf.xml
> >>>> b/src/templates/local-arago64-v3.conf.xml
> >>>>> index 35d151f..c8a5d51 100644
> >>>>> --- a/src/templates/local-arago64-v3.conf.xml
> >>>>> +++ b/src/templates/local-arago64-v3.conf.xml
> >>>>> @@ -11,7 +11,7 @@
> >>>>>       <line># wiping and rebuilding you can preserve this directory
> to
> >>>> speed up this part</line>
> >>>>>       <line># of subsequent builds. This directory is safe to share
> >>>> between multiple builds</line>
> >>>>>       <line># on the same machine too.</line>
> >>>>> -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> >>>>> +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Where to place shared-state files</line>
> >>>>> @@ -24,7 +24,7 @@
> >>>>>       <line># regenerate from these files if no changes were made t=
o
> the
> >>>> configuration.</line>
> >>>>>       <line># If changes were made to the configuration, only share=
d
> >>>> state files where the</line>
> >>>>>       <line># state was still valid would be used (done using
> >>>> checksums).</line>
> >>>>> -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> >>>>> +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Shared-state files from other locations</line>
> >>>>> diff --git a/src/templates/local-poky-v2.conf.xml
> >>>> b/src/templates/local-poky-v2.conf.xml
> >>>>> index 72160c9..b45d6c2 100644
> >>>>> --- a/src/templates/local-poky-v2.conf.xml
> >>>>> +++ b/src/templates/local-poky-v2.conf.xml
> >>>>> @@ -11,7 +11,7 @@
> >>>>>       <line># wiping and rebuilding you can preserve this directory
> to
> >>>> speed up this part</line>
> >>>>>       <line># of subsequent builds. This directory is safe to share
> >>>> between multiple builds</line>
> >>>>>       <line># on the same machine too.</line>
> >>>>> -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> >>>>> +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Where to place shared-state files</line>
> >>>>> @@ -24,7 +24,7 @@
> >>>>>       <line># regenerate from these files if no changes were made t=
o
> the
> >>>> configuration.</line>
> >>>>>       <line># If changes were made to the configuration, only share=
d
> >>>> state files where the</line>
> >>>>>       <line># state was still valid would be used (done using
> >>>> checksums).</line>
> >>>>> -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> >>>>> +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Shared-state files from other locations</line>
> >>>>> diff --git a/src/templates/local-poky-v3.conf.xml
> >>>> b/src/templates/local-poky-v3.conf.xml
> >>>>> index 1e66478..fa313eb 100644
> >>>>> --- a/src/templates/local-poky-v3.conf.xml
> >>>>> +++ b/src/templates/local-poky-v3.conf.xml
> >>>>> @@ -11,7 +11,7 @@
> >>>>>       <line># wiping and rebuilding you can preserve this directory
> to
> >>>> speed up this part</line>
> >>>>>       <line># of subsequent builds. This directory is safe to share
> >>>> between multiple builds</line>
> >>>>>       <line># on the same machine too.</line>
> >>>>> -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> >>>>> +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Where to place shared-state files</line>
> >>>>> @@ -24,7 +24,7 @@
> >>>>>       <line># regenerate from these files if no changes were made t=
o
> the
> >>>> configuration.</line>
> >>>>>       <line># If changes were made to the configuration, only share=
d
> >>>> state files where the</line>
> >>>>>       <line># state was still valid would be used (done using
> >>>> checksums).</line>
> >>>>> -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> >>>>> +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Shared-state files from other locations</line>
> >>>>> diff --git a/src/templates/local-v2.conf.xml
> >>>> b/src/templates/local-v2.conf.xml
> >>>>> index 40f30e7..49e060c 100644
> >>>>> --- a/src/templates/local-v2.conf.xml
> >>>>> +++ b/src/templates/local-v2.conf.xml
> >>>>> @@ -11,7 +11,7 @@
> >>>>>       <line># wiping and rebuilding you can preserve this directory
> to
> >>>> speed up this part</line>
> >>>>>       <line># of subsequent builds. This directory is safe to share
> >>>> between multiple builds</line>
> >>>>>       <line># on the same machine too.</line>
> >>>>> -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> >>>>> +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Where to place shared-state files</line>
> >>>>> @@ -24,7 +24,7 @@
> >>>>>       <line># regenerate from these files if no changes were made t=
o
> the
> >>>> configuration.</line>
> >>>>>       <line># If changes were made to the configuration, only share=
d
> >>>> state files where the</line>
> >>>>>       <line># state was still valid would be used (done using
> >>>> checksums).</line>
> >>>>> -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> >>>>> +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Shared-state files from other locations</line>
> >>>>> diff --git a/src/templates/local-v3.conf.xml
> >>>> b/src/templates/local-v3.conf.xml
> >>>>> index d0c9d92..e300aaf 100644
> >>>>> --- a/src/templates/local-v3.conf.xml
> >>>>> +++ b/src/templates/local-v3.conf.xml
> >>>>> @@ -11,7 +11,7 @@
> >>>>>       <line># wiping and rebuilding you can preserve this directory
> to
> >>>> speed up this part</line>
> >>>>>       <line># of subsequent builds. This directory is safe to share
> >>>> between multiple builds</line>
> >>>>>       <line># on the same machine too.</line>
> >>>>> -    <line>DL_DIR =3D "${TOPDIR}/downloads"</line>
> >>>>> +    <line>DL_DIR =3D "${TOPDIR}/../downloads"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Where to place shared-state files</line>
> >>>>> @@ -24,7 +24,7 @@
> >>>>>       <line># regenerate from these files if no changes were made t=
o
> the
> >>>> configuration.</line>
> >>>>>       <line># If changes were made to the configuration, only share=
d
> >>>> state files where the</line>
> >>>>>       <line># state was still valid would be used (done using
> >>>> checksums).</line>
> >>>>> -    <line>SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"</line>
> >>>>> +    <line>SSTATE_DIR =3D "${TOPDIR}/sstate-cache"</line>
> >>>>>       <line></line>
> >>>>>       <line>#</line>
> >>>>>       <line># Shared-state files from other locations</line>
> >>>>> --
> >>>>> 2.17.1
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>
> >>>>
> >>>> --
> >>>> Jonathan Cormier
> >>>> Senior Software Engineer
> >>>>
> >>>> Voice:  315.425.4045 x222
> >>>>
> >>>> http://www.CriticalLink.com
> >>>> 6712 Brooklawn Parkway, Syracuse, NY 13211
> >>>>
> >>>
> >>>
> >>> --
> >>> Jonathan Cormier
> >>> Senior Software Engineer
> >>>
> >>> Voice:  315.425.4045 x222
> >>>
> >>> http://www.CriticalLink.com <http://www.criticallink.com/>
> >>> 6712 Brooklawn Parkway, Syracuse, NY 13211
> >>> <https://twitter.com/Critical_Link>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>
> >> --
> >> Jonathan Cormier
> >> Senior Software Engineer
> >>
> >> Voice:  315.425.4045 x222
> >>
> >> http://www.CriticalLink.com <http://www.criticallink.com/>
> >> 6712 Brooklawn Parkway, Syracuse, NY 13211
> >> <https://twitter.com/Critical_Link>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#15904):
> https://lists.yoctoproject.org/g/meta-arago/message/15904
> >> Mute This Topic: https://lists.yoctoproject.org/mt/111311276/7902621
> >> Group Owner: meta-arago+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >>
> >
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211
<https://twitter.com/Critical_Link>

--0000000000005ba0a8062eff4810
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 25,=
 2025 at 5:02=E2=80=AFPM Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com">=
reatmon@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Those lines were that way before.=C2=A0 Only the lines that g=
et converted <br>
from OEBASE to TOPDIR were fixed.=C2=A0 So those should all be ok.<br></blo=
ckquote><div>Ah okay.=C2=A0 Whoever uses those configs can fix them later i=
f it&#39;s an issue. <br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
<br>
<br>
On 2/25/2025 12:11 PM, Jon Cormier wrote:<br>
&gt; Looks like this got accepted, however there are several TMPDIR =3D lin=
es<br>
&gt; which use TOPDIR and have build in the path. These should be fixed as<=
br>
&gt; well.<br>
&gt; <br>
&gt; src/templates/local-poky-v2.conf.xml<br>
&gt; 52:=C2=A0 =C2=A0 &lt;line&gt;TMPDIR =3D &quot;${TOPDIR}/build/poky-tmp=
&quot;&lt;/line&gt;<br>
&gt; <br>
&gt; src/templates/local-v2.conf.xml<br>
&gt; 52:=C2=A0 =C2=A0 &lt;line&gt;TMPDIR =3D &quot;${TOPDIR}/build/arago-tm=
p&quot;&lt;/line&gt;<br>
&gt; <br>
&gt; src/templates/local-poky-v3.conf.xml<br>
&gt; 52:=C2=A0 =C2=A0 &lt;line&gt;TMPDIR =3D &quot;${TOPDIR}/build/poky-tmp=
&quot;&lt;/line&gt;<br>
&gt; <br>
&gt; src/templates/local-v3.conf.xml<br>
&gt; 52:=C2=A0 =C2=A0 &lt;line&gt;TMPDIR =3D &quot;${TOPDIR}/build/arago-tm=
p&quot;&lt;/line&gt;<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Feb 24, 2025 at 11:45=E2=80=AFAM Jon Cormier via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a><br>
&gt; &lt;jcormier=3D<a href=3D"mailto:criticallink.com@lists.yoctoproject.o=
rg" target=3D"_blank">criticallink.com@lists.yoctoproject.org</a>&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Feb 24, 2025 at 9:53=E2=80=AFAM Jon Cormier via <a href=3D=
"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.=
yoctoproject.org</a><br>
&gt;&gt; &lt;jcormier=3D<a href=3D"mailto:criticallink.com@lists.yoctoproje=
ct.org" target=3D"_blank">criticallink.com@lists.yoctoproject.org</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Ryan, I also had a question about the bitbake-setup configs.=
=C2=A0 Is there some<br>
&gt;&gt;&gt; documentation on this setup tool?=C2=A0 Googling this is trick=
y since the name<br>
&gt;&gt;&gt; is so generic. The other tools docs pop right up in google.<br=
>
&gt;&gt;&gt;<br>
&gt;&gt; Nevermind, looks like the work is being done here:<br>
&gt;&gt; <a href=3D"https://github.com/kanavin/bitbake" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/kanavin/bitbake</a><br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, Feb 21, 2025 at 2:18=E2=80=AFPM Jon Cormier &lt;<a hre=
f=3D"mailto:jcormier@criticallink.com" target=3D"_blank">jcormier@criticall=
ink.com</a>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Ryan, I think you also need to touch TMPDIR in a few of th=
e local.conf<br>
&gt;&gt;&gt;&gt; files<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Fri, Feb 21, 2025 at 11:31=E2=80=AFAM Ryan Eatmon via<b=
r>
&gt;&gt;&gt;&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferre=
r" target=3D"_blank">lists.yoctoproject.org</a> &lt;reatmon=3D<a href=3D"ma=
ilto:ti.com@lists.yoctoproject.org" target=3D"_blank">ti.com@lists.yoctopro=
ject.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; When the conversion to the new XML/XSLT system was don=
e, the reference<br>
&gt;&gt;&gt;&gt;&gt; to OEBASE was converted to TOPDIR.=C2=A0 The value for=
 OEBASE was<br>
&gt;&gt;&gt;&gt;&gt; historically the directory above the bitbake run dir w=
hich is what<br>
&gt;&gt;&gt;&gt;&gt; TOPDIR is set to.=C2=A0 This made the downloads and ss=
tate_cache directories<br>
&gt;&gt;&gt;&gt;&gt; appear down a level of directory that was unintended.<=
br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; This change updates the values for DL_DIR and SSTATE_D=
IR to be relative<br>
&gt;&gt;&gt;&gt;&gt; to TOPDIR but back in the same location they were orig=
inally meant to<br>
&gt;&gt;&gt; be<br>
&gt;&gt;&gt;&gt;&gt; in.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatm=
on@ti.com" target=3D"_blank">reatmon@ti.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; v2: I ran a make clean and make and a lot more configs=
 got updated with<br>
&gt;&gt;&gt;&gt;&gt; the change.=C2=A0 Clearly I need to rework the make sy=
stem.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0bitbake-setup/coresdk_coresdk-10.01.10-sel=
inux-config.json=C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../arago-kirkstone-chromium-config/local.=
conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-kirkstone-config/loca=
l.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-kirkstone-next-config=
/local.conf.sample=C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-kirkstone-wip-config/=
local.conf.sample=C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-master-chromium-confi=
g/local.conf.sample | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-master-config/local.c=
onf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-master-next-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-master-selinux-config=
/local.conf.sample=C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-master-wip-config/loc=
al.conf.sample=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../arago-scarthgap-chromium-config/local.=
conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-scarthgap-config/loca=
l.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-scarthgap-next-config=
/local.conf.sample=C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../arago-scarthgap-selinux-config/local.c=
onf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/arago-scarthgap-wip-config/=
local.conf.sample=C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.00.00.006-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.00.00.007-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.00.00.011-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.01.00.001-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.01.00.003-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.01.00.007-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.01.00.008-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.02.00.008-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.02.00.009-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.02.00.010-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-09.03.05-config/local.=
conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-10.00.07-config/local.=
conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-10.01.08-config/local.=
conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-10.01.10-config/local.=
conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../coresdk_coresdk-10.01.10-selinux-confi=
g/local.conf.sample | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/distroless-kirkstone-config=
/local.conf.sample=C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/distroless-master-config/lo=
cal.conf.sample=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/distroless-scarthgap-config=
/local.conf.sample=C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/poky-kirkstone-config/local=
.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/poky-master-config/local.co=
nf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/poky-master-wip-config/loca=
l.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0conf/templates/poky-scarthgap-config/local=
.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0configs/arago-master-wip-config.txt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../processor-sdk-scarthgap-10.01.10.04-co=
nfig.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../processor-sdk-scarthgap-chromium-10.01=
.10.04-config.yml=C2=A0 =C2=A0| 1 +<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0kas/templates/local-arago64-v2.conf.yml=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0kas/templates/local-arago64-v3.conf.yml=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0kas/templates/local-poky-v2.conf.yml=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0kas/templates/local-poky-v3.conf.yml=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0kas/templates/local-v2.conf.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0kas/templates/local-v3.conf.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0sample-files/local-arago64-v2.conf.sample=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0sample-files/local-arago64-v3.conf.sample=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0sample-files/local-poky-v2.conf.sample=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0sample-files/local-poky-v3.conf.sample=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0sample-files/local-v2.conf.sample=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0sample-files/local-v3.conf.sample=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0src/bin/<a href=3D"http://convert.pl" rel=
=3D"noreferrer" target=3D"_blank">convert.pl</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0src/templates/local-arago64-v2.conf.xml=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0src/templates/local-arago64-v3.conf.xml=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0src/templates/local-poky-v2.conf.xml=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0src/templates/local-poky-v3.conf.xml=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0src/templates/local-v2.conf.xml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0src/templates/local-v3.conf.xml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A090 files changed, 175 insertions(+), 173 d=
eletions(-)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/bitbake-setup/coresdk_coresdk-10.01.10-se=
linux-config.json<br>
&gt;&gt;&gt;&gt; b/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.js=
on<br>
&gt;&gt;&gt;&gt;&gt; index 1cc2962..8acd24a 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-c=
onfig.json<br>
&gt;&gt;&gt;&gt;&gt; +++ b/bitbake-setup/coresdk_coresdk-10.01.10-selinux-c=
onfig.json<br>
&gt;&gt;&gt;&gt;&gt; @@ -9,7 +9,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;uri&quot;: &quot;<br>
&gt;&gt;&gt;&gt; <a href=3D"https://git.ti.com/git/arago-project/oe-layerse=
tup.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/git/arago-=
project/oe-layersetup.git</a>&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;wi=
p&quot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;ma=
ster&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;path&quot;: &qu=
ot;oe-layersetup&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/arago-kirkstone-chromium-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-kirkstone-chromium-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-kirkstone-chromium-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-kirkstone-chromium-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/conf/templates/arago-kirkstone-config/loc=
al.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-kirkstone-config/local.conf.sample<=
br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-kirkstone-config/local.conf=
.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-kirkstone-config/local.conf=
.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/arago-kirkstone-next-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-kirkstone-next-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt;&gt; index cb76dd8..d97939a 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-kirkstone-next-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-kirkstone-next-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt; a/conf/templates/arago-kirkstone-wip-config/local.conf.sample<=
br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-kirkstone-wip-config/local.conf.sam=
ple<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-kirkstone-wip-config/local.=
conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-kirkstone-wip-config/local.=
conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/arago-master-chromium-config/local.conf.s=
ample<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-master-chromium-config/local.conf.s=
ample<br>
&gt;&gt;&gt;&gt;&gt; index f2e9587..720ce11 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-master-chromium-config/loca=
l.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-master-chromium-config/loca=
l.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/conf/templates/arago-master-config/local.=
conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-master-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index f2e9587..720ce11 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-master-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-master-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/conf/templates/arago-master-next-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-master-next-config/local.conf.sampl=
e<br>
&gt;&gt;&gt;&gt;&gt; index 6c32f4b..c1549ac 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-master-next-config/local.co=
nf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-master-next-config/local.co=
nf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/arago-master-selinux-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-master-selinux-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt;&gt; index 5cc19d4..dfb4873 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-master-selinux-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-master-selinux-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/conf/templates/arago-master-wip-config/lo=
cal.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-master-wip-config/local.conf.sample=
<br>
&gt;&gt;&gt;&gt;&gt; index f2e9587..720ce11 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-master-wip-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-master-wip-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/arago-scarthgap-chromium-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-scarthgap-chromium-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-scarthgap-chromium-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-scarthgap-chromium-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/conf/templates/arago-scarthgap-config/loc=
al.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-scarthgap-config/local.conf.sample<=
br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-scarthgap-config/local.conf=
.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-scarthgap-config/local.conf=
.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/arago-scarthgap-next-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-scarthgap-next-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt;&gt; index dbb184b..3ad6481 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-scarthgap-next-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-scarthgap-next-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/arago-scarthgap-selinux-config/local.conf=
.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-scarthgap-selinux-config/local.conf=
.sample<br>
&gt;&gt;&gt;&gt;&gt; index 46869ad..c862657 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-scarthgap-selinux-config/lo=
cal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-scarthgap-selinux-config/lo=
cal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt; a/conf/templates/arago-scarthgap-wip-config/local.conf.sample<=
br>
&gt;&gt;&gt;&gt; b/conf/templates/arago-scarthgap-wip-config/local.conf.sam=
ple<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/arago-scarthgap-wip-config/local.=
conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/arago-scarthgap-wip-config/local.=
conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.00.00.006-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.00.00.006-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.00.00.006-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.00.00.006-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.00.00.007-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.00.00.007-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.00.00.007-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.00.00.007-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.00.00.011-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.00.00.011-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.00.00.011-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.00.00.011-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.01.00.001-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.01.00.001-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.01.00.001-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.01.00.001-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.01.00.003-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.01.00.003-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.01.00.003-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.01.00.003-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.01.00.007-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.01.00.007-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.01.00.007-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.01.00.007-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.01.00.008-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.01.00.008-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.01.00.008-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.01.00.008-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.02.00.008-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.02.00.008-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.02.00.008-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.02.00.008-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.02.00.009-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.02.00.009-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.02.00.009-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.02.00.009-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.02.00.010-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.02.00.010-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.02.00.010-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.02.00.010-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-09.03.05-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-09.03.05-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/coresdk_coresdk-09.03.05-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/coresdk_coresdk-09.03.05-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-10.00.07-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-10.00.07-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/coresdk_coresdk-10.00.07-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/coresdk_coresdk-10.00.07-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-10.01.08-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-10.01.08-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/coresdk_coresdk-10.01.08-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/coresdk_coresdk-10.01.08-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-10.01.10-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-10.01.10-config/local.con=
f.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/coresdk_coresdk-10.01.10-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/coresdk_coresdk-10.01.10-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index e45417c..27f1704 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/coresdk_coresdk-10.01.10-selinux-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/distroless-kirkstone-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt; b/conf/templates/distroless-kirkstone-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt;&gt; index 46cb253..b499977 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/distroless-kirkstone-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/distroless-kirkstone-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/conf/templates/distroless-master-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/distroless-master-config/local.conf.sampl=
e<br>
&gt;&gt;&gt;&gt;&gt; index bcdaaa4..7d218e8 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/distroless-master-config/local.co=
nf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/distroless-master-config/local.co=
nf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/conf/templates/distroless-scarthgap-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt; b/conf/templates/distroless-scarthgap-config/local.conf.sa=
mple<br>
&gt;&gt;&gt;&gt;&gt; index 46cb253..b499977 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/distroless-scarthgap-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/distroless-scarthgap-config/local=
.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/conf/templates/poky-kirkstone-config/loca=
l.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/poky-kirkstone-config/local.conf.sample<b=
r>
&gt;&gt;&gt;&gt;&gt; index e67385d..12eacfc 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/poky-kirkstone-config/local.conf.=
sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/poky-kirkstone-config/local.conf.=
sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/conf/templates/poky-master-config/local.c=
onf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/poky-master-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 1fe5688..e0112c7 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/poky-master-config/local.conf.sam=
ple<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/poky-master-config/local.conf.sam=
ple<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/conf/templates/poky-master-wip-config/loc=
al.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/poky-master-wip-config/local.conf.sample<=
br>
&gt;&gt;&gt;&gt;&gt; index 1fe5688..e0112c7 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/poky-master-wip-config/local.conf=
.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/poky-master-wip-config/local.conf=
.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/conf/templates/poky-scarthgap-config/loca=
l.conf.sample<br>
&gt;&gt;&gt;&gt; b/conf/templates/poky-scarthgap-config/local.conf.sample<b=
r>
&gt;&gt;&gt;&gt;&gt; index e67385d..12eacfc 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/conf/templates/poky-scarthgap-config/local.conf.=
sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/conf/templates/poky-scarthgap-config/local.conf.=
sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.00.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.00.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.00.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.00.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.00.01-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.00.01-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.00.01-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.00.01-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.01.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.01.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.01.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.01.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.02.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.02.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.02.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-09.02.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-10.00.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-10.00.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-10.00.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-10.00.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-10.01.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-10.01.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-10.01.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-analytics_processor-sdk-analyti=
cs-10.01.00-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_=
00/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_=
00/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 6b91881..1149e85 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_=
00/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-gateway-10_=
00/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00=
_00_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00=
_00_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index e4f04f3..a0d9b30 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00=
_00_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00=
_00_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00=
_00_07/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00=
_00_07/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 32a6cfb..9dd0dfa 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00=
_00_07/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_00=
_00_07/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01=
_00_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01=
_00_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index ee23c20..a83b490 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01=
_00_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01=
_00_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01=
_00_07/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01=
_00_07/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index c29b416..e743654 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01=
_00_07/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_01=
_00_07/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02=
_00_04/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02=
_00_04/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 34afc91..8096a3b 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02=
_00_04/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02=
_00_04/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02=
_00_05/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02=
_00_05/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index f592ad9..31bfec8 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02=
_00_05/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-09_02=
_00_05/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00=
_07_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00=
_07_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 0df5360..145aed2 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00=
_07_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00=
_07_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00=
_08_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00=
_08_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 5e39ec4..016f942 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00=
_08_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_00=
_08_06/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01=
_08_01/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01=
_08_01/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 689e5d8..e627f36 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01=
_08_01/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk-linux_processor-sdk-linux-10_01=
_08_01/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsi=
p-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsi=
p-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsi=
p-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsi=
p-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.00.00-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.00.00-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.00.00-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.00.00-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-c=
onfig/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-c=
onfig/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-c=
onfig/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-c=
onfig/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-config/l=
ocal.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-c=
onfig/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-c=
onfig/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-c=
onfig/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-c=
onfig/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x=
-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x=
-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x=
-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x=
-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legac=
y-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legac=
y-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legac=
y-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-09.03.05.02-legac=
y-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.0=
1.09-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.0=
1.09-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.0=
1.09-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.0=
1.09-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.0=
1.10-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.0=
1.10-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.0=
1.10-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.0=
1.10-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromiu=
m-09.02.01.09-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromiu=
m-09.02.01.09-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromiu=
m-09.02.01.09-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromiu=
m-09.02.01.09-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromiu=
m-09.02.01.10-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromiu=
m-09.02.01.10-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-kirkstone-chromiu=
m-09.02.01.10-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-kirkstone-chromiu=
m-09.02.01.10-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.0=
7.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.0=
7.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.0=
7.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.0=
7.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.1=
0.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.1=
0.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.1=
0.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.1=
0.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromiu=
m-10.00.07.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromiu=
m-10.00.07.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromiu=
m-10.00.07.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromiu=
m-10.00.07.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromiu=
m-10.01.10.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromiu=
m-10.01.10.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromiu=
m-10.01.10.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromiu=
m-10.01.10.04-config/local.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/configs/arago-master-wip-config.txt<br>
&gt;&gt;&gt;&gt; b/configs/arago-master-wip-config.txt<br>
&gt;&gt;&gt;&gt;&gt; index eb9c49d..165a3d1 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/configs/arago-master-wip-config.txt<br>
&gt;&gt;&gt;&gt;&gt; +++ b/configs/arago-master-wip-config.txt<br>
&gt;&gt;&gt;&gt;&gt; @@ -5,7 +5,7 @@ bitbake,<br>
&gt;&gt;&gt; <a href=3D"https://git.openembedded.org/bitbake,master,HEAD" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/bitbake,ma=
ster,HEAD</a><br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta-arago,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://git.yoctoproject.org/meta-arago,master-wip,=
HEAD,layers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test" rel=3D"n=
oreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-arago,master=
-wip,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test</a><=
br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#meta-browser,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://github.com/OSSystems/meta-browser.git,maste=
r,HEAD,layers=3Dmeta-chromium" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/OSSystems/meta-browser.git,master,HEAD,layers=3Dmeta-chromium</=
a><br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#meta-selinux,<br>
&gt;&gt;&gt;&gt; <a href=3D"https://git.yoctoproject.org/meta-selinux,maste=
r,HEAD,layers=3D" rel=3D"noreferrer" target=3D"_blank">https://git.yoctopro=
ject.org/meta-selinux,master,HEAD,layers=3D</a><br>
&gt;&gt;&gt;&gt;&gt; -meta-qt5,<a href=3D"https://github.com/meta-qt5/meta-=
qt5.git,master,HEAD,layers=3D" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=3D</a><br>
&gt;&gt;&gt;&gt;&gt; +meta-qt6,<a href=3D"https://code.qt.io/yocto/meta-qt6=
.git,dev,HEAD,layers=3D" rel=3D"noreferrer" target=3D"_blank">https://code.=
qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D</a><br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta-virtualization,<br>
&gt;&gt;&gt;&gt; <a href=3D"https://git.yoctoproject.org/meta-virtualizatio=
n,master,HEAD,layers=3D" rel=3D"noreferrer" target=3D"_blank">https://git.y=
octoproject.org/meta-virtualization,master,HEAD,layers=3D</a><br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta-openembedded,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://git.openembedded.org/meta-openembedded,mast=
er,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesy=
stems:meta-multimedia" rel=3D"noreferrer" target=3D"_blank">https://git.ope=
nembedded.org/meta-openembedded,master,HEAD,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems:meta-multimedia</a><br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta-ti,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://git.yoctoproject.org/meta-ti,master-wip,HEA=
D,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3D=
meta-ti-extras:meta-beagle:meta-ti-bsp</a><br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-co=
nfig.yml<br>
&gt;&gt;&gt;&gt; b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-co=
nfig.yml<br>
&gt;&gt;&gt;&gt;&gt; index 5ced779..2dc2f5c 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-10.01.=
10.04-config.yml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.=
10.04-config.yml<br>
&gt;&gt;&gt;&gt;&gt; @@ -71,3 +71,4 @@ repos:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0commit: &quot;dac630ab5ee7aa=
6c5c7c294093adbd11b116c765&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0layers:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta:<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.=
04-config.yml<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.=
04-config.yml<br>
&gt;&gt;&gt;&gt;&gt; index 405fa3b..351d9ea 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.=
04-config.yml<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.=
04-config.yml<br>
&gt;&gt;&gt;&gt;&gt; @@ -83,3 +83,4 @@ repos:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0url: &quot;<a href=3D"https:=
//git.ti.com/git/edgeai/meta-edgeai.git" rel=3D"noreferrer" target=3D"_blan=
k">https://git.ti.com/git/edgeai/meta-edgeai.git</a>&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0branch: &quot;scarthgap&quot=
;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0commit: &quot;10.01.10.04&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/kas/templates/local-arago64-v2.conf.yml<b=
r>
&gt;&gt;&gt;&gt; b/kas/templates/local-arago64-v2.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; index c79388d..c6781be 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/kas/templates/local-arago64-v2.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/kas/templates/local-arago64-v2.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# wiping and rebuilding you =
can preserve this directory to speed<br>
&gt;&gt;&gt; up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# of subsequent builds. This=
 directory is safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# on the same machine too.<b=
r>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Where to place shared-stat=
e files<br>
&gt;&gt;&gt;&gt;&gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# regenerate from these file=
s if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# If changes were made to th=
e configuration, only shared state<br>
&gt;&gt;&gt;&gt; files where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# state was still valid woul=
d be used (done using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/ss=
tate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-c=
ache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Shared-state files from ot=
her locations<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/kas/templates/local-arago64-v3.conf.yml<b=
r>
&gt;&gt;&gt;&gt; b/kas/templates/local-arago64-v3.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; index b182483..3fa683e 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/kas/templates/local-arago64-v3.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/kas/templates/local-arago64-v3.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# wiping and rebuilding you =
can preserve this directory to speed<br>
&gt;&gt;&gt; up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# of subsequent builds. This=
 directory is safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# on the same machine too.<b=
r>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Where to place shared-stat=
e files<br>
&gt;&gt;&gt;&gt;&gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# regenerate from these file=
s if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# If changes were made to th=
e configuration, only shared state<br>
&gt;&gt;&gt;&gt; files where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# state was still valid woul=
d be used (done using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/ss=
tate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-c=
ache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Shared-state files from ot=
her locations<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/kas/templates/local-poky-v2.conf.yml<br>
&gt;&gt;&gt;&gt; b/kas/templates/local-poky-v2.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; index 91995fe..075f535 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/kas/templates/local-poky-v2.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/kas/templates/local-poky-v2.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# wiping and rebuilding you =
can preserve this directory to speed<br>
&gt;&gt;&gt; up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# of subsequent builds. This=
 directory is safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# on the same machine too.<b=
r>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Where to place shared-stat=
e files<br>
&gt;&gt;&gt;&gt;&gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# regenerate from these file=
s if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# If changes were made to th=
e configuration, only shared state<br>
&gt;&gt;&gt;&gt; files where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# state was still valid woul=
d be used (done using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/ss=
tate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-c=
ache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Shared-state files from ot=
her locations<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/kas/templates/local-poky-v3.conf.yml<br>
&gt;&gt;&gt;&gt; b/kas/templates/local-poky-v3.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; index 7368fb0..193a1ce 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/kas/templates/local-poky-v3.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/kas/templates/local-poky-v3.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# wiping and rebuilding you =
can preserve this directory to speed<br>
&gt;&gt;&gt; up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# of subsequent builds. This=
 directory is safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# on the same machine too.<b=
r>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Where to place shared-stat=
e files<br>
&gt;&gt;&gt;&gt;&gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# regenerate from these file=
s if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# If changes were made to th=
e configuration, only shared state<br>
&gt;&gt;&gt;&gt; files where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# state was still valid woul=
d be used (done using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/ss=
tate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-c=
ache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Shared-state files from ot=
her locations<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/kas/templates/local-v2.conf.yml<br>
&gt;&gt;&gt;&gt; b/kas/templates/local-v2.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; index 3d666e4..f33fd45 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/kas/templates/local-v2.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/kas/templates/local-v2.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# wiping and rebuilding you =
can preserve this directory to speed<br>
&gt;&gt;&gt; up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# of subsequent builds. This=
 directory is safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# on the same machine too.<b=
r>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Where to place shared-stat=
e files<br>
&gt;&gt;&gt;&gt;&gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# regenerate from these file=
s if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# If changes were made to th=
e configuration, only shared state<br>
&gt;&gt;&gt;&gt; files where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# state was still valid woul=
d be used (done using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/ss=
tate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-c=
ache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Shared-state files from ot=
her locations<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/kas/templates/local-v3.conf.yml<br>
&gt;&gt;&gt;&gt; b/kas/templates/local-v3.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; index 063b863..07eb5af 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/kas/templates/local-v3.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/kas/templates/local-v3.conf.yml<br>
&gt;&gt;&gt;&gt;&gt; @@ -15,7 +15,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# wiping and rebuilding you =
can preserve this directory to speed<br>
&gt;&gt;&gt; up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# of subsequent builds. This=
 directory is safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# on the same machine too.<b=
r>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/downloads&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 DL_DIR =3D &quot;${TOPDIR}/../downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Where to place shared-stat=
e files<br>
&gt;&gt;&gt;&gt;&gt; @@ -28,7 +28,7 @@ local_conf_header:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# regenerate from these file=
s if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# If changes were made to th=
e configuration, only shared state<br>
&gt;&gt;&gt;&gt; files where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# state was still valid woul=
d be used (done using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/build/ss=
tate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 SSTATE_DIR =3D &quot;${TOPDIR}/sstate-c=
ache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Shared-state files from ot=
her locations<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/sample-files/local-arago64-v2.conf.sample=
<br>
&gt;&gt;&gt;&gt; b/sample-files/local-arago64-v2.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 7575b4b..8ad6f26 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/sample-files/local-arago64-v2.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/sample-files/local-arago64-v2.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/sample-files/local-arago64-v3.conf.sample=
<br>
&gt;&gt;&gt;&gt; b/sample-files/local-arago64-v3.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index f2e9587..720ce11 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/sample-files/local-arago64-v3.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/sample-files/local-arago64-v3.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/sample-files/local-poky-v2.conf.sample<br=
>
&gt;&gt;&gt;&gt; b/sample-files/local-poky-v2.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index e67385d..12eacfc 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/sample-files/local-poky-v2.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/sample-files/local-poky-v2.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/sample-files/local-poky-v3.conf.sample<br=
>
&gt;&gt;&gt;&gt; b/sample-files/local-poky-v3.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 1fe5688..e0112c7 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/sample-files/local-poky-v3.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/sample-files/local-poky-v3.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/sample-files/local-v2.conf.sample<br>
&gt;&gt;&gt;&gt; b/sample-files/local-v2.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index 46cb253..b499977 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/sample-files/local-v2.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/sample-files/local-v2.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/sample-files/local-v3.conf.sample<br>
&gt;&gt;&gt;&gt; b/sample-files/local-v3.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; index bcdaaa4..7d218e8 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/sample-files/local-v3.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; +++ b/sample-files/local-v3.conf.sample<br>
&gt;&gt;&gt;&gt;&gt; @@ -10,7 +10,7 @@ CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# wiping and rebuilding you can preserve t=
his directory to speed up<br>
&gt;&gt;&gt;&gt; this part<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# of subsequent builds. This directory is =
safe to share between<br>
&gt;&gt;&gt;&gt; multiple builds<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# on the same machine too.<br>
&gt;&gt;&gt;&gt;&gt; -DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DL_DIR =3D &quot;${TOPDIR}/../downloads&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Where to place shared-state files<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,7 +23,7 @@ DL_DIR =3D &quot;${TOPDIR}/downloads=
&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# regenerate from these files if no change=
s were made to the<br>
&gt;&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# If changes were made to the configuratio=
n, only shared state files<br>
&gt;&gt;&gt;&gt; where the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# state was still valid would be used (don=
e using checksums).<br>
&gt;&gt;&gt;&gt;&gt; -SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt; +SSTATE_DIR =3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Shared-state files from other locations<=
br>
&gt;&gt;&gt;&gt;&gt; diff --git a/src/bin/<a href=3D"http://convert.pl" rel=
=3D"noreferrer" target=3D"_blank">convert.pl</a> b/src/bin/<a href=3D"http:=
//convert.pl" rel=3D"noreferrer" target=3D"_blank">convert.pl</a><br>
&gt;&gt;&gt;&gt;&gt; index 2787b86..42b9c2c 100755<br>
&gt;&gt;&gt;&gt;&gt; --- a/src/bin/<a href=3D"http://convert.pl" rel=3D"nor=
eferrer" target=3D"_blank">convert.pl</a><br>
&gt;&gt;&gt;&gt;&gt; +++ b/src/bin/<a href=3D"http://convert.pl" rel=3D"nor=
eferrer" target=3D"_blank">convert.pl</a><br>
&gt;&gt;&gt;&gt;&gt; @@ -501,7 +501,7 @@ sub convert_local_conf_template<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chomp($lpLine)=
;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 $lpLine =3D~ s/OEBASE/TOP=
DIR/;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 $lpLine =3D~ s/OEBASE/TOP=
DIR\/\.\./;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$lpLine =3D~ s=
/^MACHINE/#MACHINE/;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$lpLine =3D~ s=
/&amp;/&amp;amp;/g;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/src/templates/local-arago64-v2.conf.xml<b=
r>
&gt;&gt;&gt;&gt; b/src/templates/local-arago64-v2.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; index b49f702..d9d2ae7 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/src/templates/local-arago64-v2.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/src/templates/local-arago64-v2.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; @@ -11,7 +11,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# wiping and reb=
uilding you can preserve this directory to<br>
&gt;&gt;&gt;&gt; speed up this part&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# of subsequent =
builds. This directory is safe to share<br>
&gt;&gt;&gt;&gt; between multiple builds&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# on the same ma=
chine too.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
../downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Where to place=
 shared-state files&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; @@ -24,7 +24,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# regenerate fro=
m these files if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# If changes wer=
e made to the configuration, only shared<br>
&gt;&gt;&gt;&gt; state files where the&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# state was stil=
l valid would be used (done using<br>
&gt;&gt;&gt;&gt; checksums).&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/build/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Shared-state f=
iles from other locations&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/src/templates/local-arago64-v3.conf.xml<b=
r>
&gt;&gt;&gt;&gt; b/src/templates/local-arago64-v3.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; index 35d151f..c8a5d51 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/src/templates/local-arago64-v3.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/src/templates/local-arago64-v3.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; @@ -11,7 +11,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# wiping and reb=
uilding you can preserve this directory to<br>
&gt;&gt;&gt;&gt; speed up this part&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# of subsequent =
builds. This directory is safe to share<br>
&gt;&gt;&gt;&gt; between multiple builds&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# on the same ma=
chine too.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
../downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Where to place=
 shared-state files&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; @@ -24,7 +24,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# regenerate fro=
m these files if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# If changes wer=
e made to the configuration, only shared<br>
&gt;&gt;&gt;&gt; state files where the&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# state was stil=
l valid would be used (done using<br>
&gt;&gt;&gt;&gt; checksums).&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/build/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Shared-state f=
iles from other locations&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/src/templates/local-poky-v2.conf.xml<br>
&gt;&gt;&gt;&gt; b/src/templates/local-poky-v2.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; index 72160c9..b45d6c2 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/src/templates/local-poky-v2.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/src/templates/local-poky-v2.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; @@ -11,7 +11,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# wiping and reb=
uilding you can preserve this directory to<br>
&gt;&gt;&gt;&gt; speed up this part&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# of subsequent =
builds. This directory is safe to share<br>
&gt;&gt;&gt;&gt; between multiple builds&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# on the same ma=
chine too.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
../downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Where to place=
 shared-state files&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; @@ -24,7 +24,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# regenerate fro=
m these files if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# If changes wer=
e made to the configuration, only shared<br>
&gt;&gt;&gt;&gt; state files where the&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# state was stil=
l valid would be used (done using<br>
&gt;&gt;&gt;&gt; checksums).&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/build/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Shared-state f=
iles from other locations&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/src/templates/local-poky-v3.conf.xml<br>
&gt;&gt;&gt;&gt; b/src/templates/local-poky-v3.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; index 1e66478..fa313eb 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/src/templates/local-poky-v3.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/src/templates/local-poky-v3.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; @@ -11,7 +11,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# wiping and reb=
uilding you can preserve this directory to<br>
&gt;&gt;&gt;&gt; speed up this part&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# of subsequent =
builds. This directory is safe to share<br>
&gt;&gt;&gt;&gt; between multiple builds&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# on the same ma=
chine too.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
../downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Where to place=
 shared-state files&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; @@ -24,7 +24,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# regenerate fro=
m these files if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# If changes wer=
e made to the configuration, only shared<br>
&gt;&gt;&gt;&gt; state files where the&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# state was stil=
l valid would be used (done using<br>
&gt;&gt;&gt;&gt; checksums).&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/build/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Shared-state f=
iles from other locations&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/src/templates/local-v2.conf.xml<br>
&gt;&gt;&gt;&gt; b/src/templates/local-v2.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; index 40f30e7..49e060c 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/src/templates/local-v2.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/src/templates/local-v2.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; @@ -11,7 +11,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# wiping and reb=
uilding you can preserve this directory to<br>
&gt;&gt;&gt;&gt; speed up this part&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# of subsequent =
builds. This directory is safe to share<br>
&gt;&gt;&gt;&gt; between multiple builds&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# on the same ma=
chine too.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
../downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Where to place=
 shared-state files&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; @@ -24,7 +24,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# regenerate fro=
m these files if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# If changes wer=
e made to the configuration, only shared<br>
&gt;&gt;&gt;&gt; state files where the&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# state was stil=
l valid would be used (done using<br>
&gt;&gt;&gt;&gt; checksums).&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/build/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Shared-state f=
iles from other locations&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/src/templates/local-v3.conf.xml<br>
&gt;&gt;&gt;&gt; b/src/templates/local-v3.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; index d0c9d92..e300aaf 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/src/templates/local-v3.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; +++ b/src/templates/local-v3.conf.xml<br>
&gt;&gt;&gt;&gt;&gt; @@ -11,7 +11,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# wiping and reb=
uilding you can preserve this directory to<br>
&gt;&gt;&gt;&gt; speed up this part&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# of subsequent =
builds. This directory is safe to share<br>
&gt;&gt;&gt;&gt; between multiple builds&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# on the same ma=
chine too.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;DL_DIR =3D &quot;${TOPDIR}/=
../downloads&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Where to place=
 shared-state files&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; @@ -24,7 +24,7 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# regenerate fro=
m these files if no changes were made to the<br>
&gt;&gt;&gt;&gt; configuration.&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# If changes wer=
e made to the configuration, only shared<br>
&gt;&gt;&gt;&gt; state files where the&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# state was stil=
l valid would be used (done using<br>
&gt;&gt;&gt;&gt; checksums).&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/build/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 &lt;line&gt;SSTATE_DIR =3D &quot;${TOPD=
IR}/sstate-cache&quot;&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;&lt;/line&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;#&lt;/line&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;line&gt;# Shared-state f=
iles from other locations&lt;/line&gt;<br>
&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt; 2.17.1<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; Jonathan Cormier<br>
&gt;&gt;&gt;&gt; Senior Software Engineer<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Voice:=C2=A0 315.425.4045 x222<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; <a href=3D"http://www.CriticalLink.com" rel=3D"noreferrer"=
 target=3D"_blank">http://www.CriticalLink.com</a><br>
&gt;&gt;&gt;&gt; 6712 Brooklawn Parkway, Syracuse, NY 13211<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Jonathan Cormier<br>
&gt;&gt;&gt; Senior Software Engineer<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Voice:=C2=A0 315.425.4045 x222<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"http://www.CriticalLink.com" rel=3D"noreferrer" tar=
get=3D"_blank">http://www.CriticalLink.com</a> &lt;<a href=3D"http://www.cr=
iticallink.com/" rel=3D"noreferrer" target=3D"_blank">http://www.criticalli=
nk.com/</a>&gt;<br>
&gt;&gt;&gt; 6712 Brooklawn Parkway, Syracuse, NY 13211<br>
&gt;&gt;&gt; &lt;<a href=3D"https://twitter.com/Critical_Link" rel=3D"noref=
errer" target=3D"_blank">https://twitter.com/Critical_Link</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Jonathan Cormier<br>
&gt;&gt; Senior Software Engineer<br>
&gt;&gt;<br>
&gt;&gt; Voice:=C2=A0 315.425.4045 x222<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://www.CriticalLink.com" rel=3D"noreferrer" target=
=3D"_blank">http://www.CriticalLink.com</a> &lt;<a href=3D"http://www.criti=
callink.com/" rel=3D"noreferrer" target=3D"_blank">http://www.criticallink.=
com/</a>&gt;<br>
&gt;&gt; 6712 Brooklawn Parkway, Syracuse, NY 13211<br>
&gt;&gt; &lt;<a href=3D"https://twitter.com/Critical_Link" rel=3D"noreferre=
r" target=3D"_blank">https://twitter.com/Critical_Link</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#15904): <a href=3D"https://lists.yoctoproject.=
org/g/meta-arago/message/15904" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.yoctoproject.org/g/meta-arago/message/15904</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/1113=
11276/7902621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/mt/111311276/7902621</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-arago+owner@lists.yoctoproject.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arag=
o/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-arago/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" targ=
et=3D"_blank">jcormier@criticallink.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
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

--0000000000005ba0a8062eff4810--

