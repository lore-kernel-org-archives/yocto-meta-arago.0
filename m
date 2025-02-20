Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42653C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 19:19:58 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.5721.1740079190611289703
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 11:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=MxNzXwKO;
 spf=pass (domain: criticallink.com, ip: 209.85.167.42, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-545fed4642aso1373382e87.0
        for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 11:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1740079189; x=1740683989; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNKt0HM81xurB3OhvsDHU/Pivs7C1tsGbXgkJ/01b6M=;
        b=MxNzXwKOD9XJ9eTpZyxp5P22M7fi8SSOI+4hSf7doGefeBSHXu2+G9+JXz/QbJ0KVN
         /r75X+thgS73pw4H+LKY/g4KC33WZHuHWpBJ6xg4CCQ9EN1UR/lGzvSLNouXzTVNZB+S
         Gy464t1krzsoe4U0yFgCH/JE3yjHOZ9x1SHD3Ug1vN3ScwyBMOjuvvFr9wgbEg3U7x4a
         qzMm5+Qa+RbAEXY/09YvkW/sFyx0BWC/DTfcTg2BnBPzp3va4IH7VwJdp5DVwy0xpgiB
         SjA1f0/chqSlCLZNCbzhEGuMQgnixjd9vI7w+zQ8vcwiy7Qh4PPXsNMDxqDj1S0Pmuig
         FX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740079189; x=1740683989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNKt0HM81xurB3OhvsDHU/Pivs7C1tsGbXgkJ/01b6M=;
        b=TjH31gLvdNRD8wvR6zmXk9QDLBmbY8f68tawJdxzk32VWEGqJqxk/e8+gqn4Tkd9vy
         H/p+UhxMzOd1Z15yc0yLVRj48FyzV8shB+mOvfkuhd5Z78n8VwTP2EcNrEvX5shOeKcl
         dMbZLOxb/ISX4+ipCRCU7REQUw+PsuhwQJiGfO+sidpDBXpj7D1Nkk3CvAyP5Fy+qRqs
         dhZlPAPfPYGrJLUpD3o0tz/B3c7rkuFoBPh/NCplfLFyBpkEFgEEQb3a4FLJ1D4uroTP
         04VX+UKHA+6Idr4FtxpFqcaiXJv4ggYuZYyBQg7fRYz8u3GiYS8R2ve+vXtPLsyYmQOt
         ncQg==
X-Forwarded-Encrypted: i=1; AJvYcCW7dx0vE7l7VFiXlq9fEQbCJ6n9ebcRIPGtWCJ93KdOu7ChzrKiymec+3iqwEQG38Qe7665705bClyI@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwwaIeDnKc/xCDlKByBrRLcmqZ1d7TgVnvO4EwkzTxLe1cEfHVe
	tJDqUJ1T1MjOVJOyt9FFrsJZv6kVTnktzEW8k6C5p63OlIH9EdTxH/qQadZ/VqjsuVxMLlxiuuZ
	r4k9Mpm9A9aJKmVjA8Oy0TxNWbS3tYq3KyERI
X-Gm-Gg: ASbGncvpmK/wHosaTkCElZ1sV1QeY/t5icpC2ByplVuZIkavs743DKlABlRPOVGXp6j
	I/uru/eu1/XFWohNREq03sYXvqUdfUaxuCfdP6nKk+OZuOUV6lXUxMPNbXUYIJNIDnLlovko=
X-Google-Smtp-Source: AGHT+IHm0Q9yC7+vHCay/DNVP1ADWrrlSpiAdEDYP/p6jifJmuS2zh961K1jGx2A1TvDeM07KQbMa8fE90HVET5UhmQ=
X-Received: by 2002:a05:6512:159b:b0:545:8a1:5381 with SMTP id
 2adb3069b0e04-54838eddc2amr96598e87.11.1740079188658; Thu, 20 Feb 2025
 11:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20241219163417.4155600-1-c-shilwant@ti.com> <CADL8D3b7x9ou1uBcVqwYLUwM2sA-ucLx80NPRMG_tBf3cepGvA@mail.gmail.com>
 <0863605c-9b7f-4c50-9b64-04f9eef0b44c@ti.com>
In-Reply-To: <0863605c-9b7f-4c50-9b64-04f9eef0b44c@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 20 Feb 2025 14:19:36 -0500
X-Gm-Features: AWEUYZnmbE9BboDjjDn5D0gcaP_YIAilVOILBpKpilzjWjIxCzQNWRJUbqqe3V4
Message-ID: <CADL8D3ah7Mk3O_TmpQ7MHK7x-tizpLpdz-CQ0Ctncie5AK1hVw@mail.gmail.com>
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] processor-sdk: Add new
 configs for Sitara SDK 10.1 Release
To: Ryan Eatmon <reatmon@ti.com>
Cc: c-shilwant@ti.com, meta-arago@lists.yoctoproject.org, 
	Denys <denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 19:19:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15872

On Thu, Feb 20, 2025 at 12:59=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wrote=
:
>
>
> Having refreshed my memory from that time...
>
> I auto converted OEBASE to TOPDIR because OEBASE is not a defined
> variable.  I'm not sure what the history of that variable was, but it is
> not being set by any tool in the bitbake universe that I could find.  So
> before the conversion that was just getting expanded to "".
So it looks like OEBASE is setup by the oe-layersetup script and gets
inserted into the build/conf/setenv file:

setenv:
# Set OEBASE to where the build and source directories reside
# NOTE: Do NOT place a trailing / on the end of OEBASE.
export OEBASE=3D"/work"
...

This presumably wouldn't work for the other config systems (kas,
bitbake-setup, etc) since they don't run oe-layersetup...

>
> Where as TOPDIR is a defined variable in bitbake that points to the dir
> where the build was launched from.
>
> I didn't even think of it being a side effect, I was just fixing
> something that seemed broken.  Our build scripts are explicitly setting
> DL_DIR and SSTATE_DIR because the scripts need to upload the files in
> those dirs to our NAS for better reuse, so we were not impacted by this
> change.
Hmm thats a interesting, unrelated: I currently network share our
SSTATE_DIR but don't do it for DL_DIR, I just rsync it at the end of
the build.  Do you host your own BB_HASHSERVE and PRSERV?
>
> I can change it back if people want it, but OEBASE is not even really a
> variable as far as I can tell.
>
> Or I could change it to:
>
> DL_DIR =3D "${TOPDIR}/../downloads"
> SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
>
> Does that match the previous behavior?
It does look like TOPDIR points to the build directory instead of one
directory up like before.  sstate-cache is currently being put in
build/build/sstate-cache

jcormier@jcormier-MS-7A93:/export/space/jcormier/yocto/yocto_scarthgap/oe-l=
ayersetup$
ls build/
arago-tmp-default-baremetal-k3r5  build         conf
arago-tmp-default-glibc           buildhistory  deploy-ti
bitbake-cookerdaemon.log          cache         downloads
jcormier@jcormier-MS-7A93:/export/space/jcormier/yocto/yocto_scarthgap/oe-l=
ayersetup$
ls build/build
sstate-cache
>
> Any preferences?
I assume keeping OEBASE isn't an option since it won't exist for these
other setup systems.  So I guess your second option.
>
>
> On 2/20/2025 10:58 AM, Jon Cormier wrote:
> > After build processor-sdk-scarthgap-chromium-10.01.10.04-config, I
> > noticed the downloads directory has moved to the build/downloads folder=
,
> > instead of being at the top of the build directory.  Was this
> > intentional?  I suspect it probably happened when everything was
> > converted to xml configs. But the commit doesn't mention that as a know=
n
> > side effect.
> >
> > commit aea8e0f53cb05e2d80056b3568f3376741c90853
> > Author: Ryan Eatmon <reatmon@ti.com <mailto:reatmon@ti.com>>
> > Date:   Thu Oct 10 11:43:57 2024 -0500
> >
> >      Initial conversion of new XML configs
> > ...
> > -DL_DIR =3D "${OEBASE}/downloads"
> > +DL_DIR =3D "${TOPDIR}/downloads"
> > ...
> > -SSTATE_DIR =3D "${OEBASE}/build/sstate-cache"
> > +SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> >
> > SSTATE_DIR was also updated and it still looks to be put in the same
> > place as ever...
> >
> > On Thu, Dec 19, 2024 at 11:34=E2=80=AFAM Chirag Shilwant via
> > lists.yoctoproject.org <http://lists.yoctoproject.org>
> > <c-shilwant=3Dti.com@lists.yoctoproject.org
> > <mailto:ti.com@lists.yoctoproject.org>> wrote:
> >
> >     - Add processor-sdk-scarthgap-10.01.10.04-config used for
> >     building AM62SIP & AM64x.
> >
> >     - Add processor-sdk-scarthgap-chromium-10.01.10.04-config
> >     used for building AM62P, AM62x, AM62LP & Beagleplay.
> >
> >     Signed-off-by: Chirag Shilwant <c-shilwant@ti.com
> >     <mailto:c-shilwant@ti.com>>
> >     ---
> ...
> >
> >
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#15673):
> >     https://lists.yoctoproject.org/g/meta-arago/message/15673
> >     <https://lists.yoctoproject.org/g/meta-arago/message/15673>
> >     Mute This Topic: https://lists.yoctoproject.org/mt/110200559/790262=
1
> >     <https://lists.yoctoproject.org/mt/110200559/7902621>
> >     Group Owner: meta-arago+owner@lists.yoctoproject.org
> >     <mailto:meta-arago%2Bowner@lists.yoctoproject.org>
> >     Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub
> >     <https://lists.yoctoproject.org/g/meta-arago/unsub>
> >     [jcormier@criticallink.com <mailto:jcormier@criticallink.com>]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
> >
> >
> > --
> > Jonathan Cormier
> > Senior Software Engineer
> >
> > Voice: 315.425.4045 x222
> >
> > http://www.CriticalLink.com <http://www.criticallink.com/>
> > 6712 Brooklawn Parkway, Syracuse, NY 13211
> > <https://twitter.com/Critical_Link>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS



--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

