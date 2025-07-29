Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3D7C87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 17:57:23 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.14815.1753811835044879714
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 10:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=XDiN+Mzl;
 spf=pass (domain: criticallink.com, ip: 209.85.128.172, mailfrom: jcormier@criticallink.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-719fe335186so26526467b3.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 29 Jul 2025 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1753811834; x=1754416634; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNGaxeCG/mRuPMHkoO+qafW93GLI0995M/vM58gWDnc=;
        b=XDiN+MzlrRRWVK/Qyojmou6EU7hMNvNejt9MjL8Ho/Y/3/PTOq9PFQhV8KuTf7uU4h
         SH8l+Jre+v/JroIy2GUqMEWciVOhXM0KfwD2P/VQLjYaDsXsjjiXoYOVN+TtSjRpc1Tu
         jF3x4EqVQ4NPVogVrBs+f/MFUByq8NSA8jotZjMxYV/+2WIX2E0cQR4+d71XTpL5HG5R
         hDPBkQkMKPUz0dkkAJbf7Rpq1GsR+7aIiCAaRkTrjVNxQZ3vAbE13Q/UwIamJo9YPlMU
         pEBAbc+AB7hxSKgZL84HPLSesbAhxhQDd2S879axWsNKuuMhPQQW2pmGgT36I45Y9X+N
         EvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753811834; x=1754416634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNGaxeCG/mRuPMHkoO+qafW93GLI0995M/vM58gWDnc=;
        b=VYlOJwuEsVw0kU0MFLrIWLQYn1WdeE/mC+WYnvSMFy8kDZU67NRwNCXhf1pjleYrwN
         qjTA43aS1dUCnA2RoAgvM6TaSuuPRMsWPgRmGsGsB4I14w0GPGFlQOoon1k7LaqLTn8g
         lMXlYecNl2YUMm48/eur1GRsMOpRSPVFQ3nQFO+2taMhLDd9fKveWr54ypbX/EM+wydj
         S6sT5f/poslPHdBcQMyrXtzRCPJreodKcXYRtNZOXZTvcv5NFr+TSL60RY6F2sjji0Zc
         kjsuOiX0ngp5un3wGufp9HwTKKWDNqmVOXn11ZPzyAYSNDyaL2S48wz8NRsSvtH5A4gL
         N36w==
X-Forwarded-Encrypted: i=1; AJvYcCU9+vJfFetMfWAvOW68D24uEkZkka/KaQuoRR8QiFRxzXna+0vtkECZYCLRVpvgbbmrGWhXyV7Lgv+r@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxG1rif/YN06IzcCRxJLyrzctnhUHlgMnroRdmb41cqSPFNrqKX
	i6ojMMYLPSK7OulQiIe702E86o/n4XEsxEH8GfwewnIM7FCJC5vq5GAHVxfdOfYwmVxPhg6yQdy
	FZ8bb4LNGTB/iHXwiXEgKQFpwiBGez8KIe/mSEVlS
X-Gm-Gg: ASbGnctLLgbCizQhVlvQBulxNH3cvnSQoihOOalBY/qdM9DCXW5n9dYNOeO22XsYHOC
	f49eqIXlj1HQ0+/EQJtBmNXfbAnRdI8xpz/ROeCwTSg5WIYXRNkRJl7c4gsZ7ed+K9y8Yw9AZrI
	HZ+vSMZ7V1vA2Vu8j1G956pOL+f2OHRiSyfdhNKHWDAVp27I8y+DXla9hZcXx87Fr72jUfyVZ/V
	LTc8Q==
X-Google-Smtp-Source: AGHT+IF45RdL2tLCPRxoFag+ERO4H0liTFK2RdkUtVRT+WbyGjwAEFzOsvI57FYFEJWVaOREf+3M7qVZBFx2c6tepEY=
X-Received: by 2002:a05:690c:6887:b0:719:5175:3091 with SMTP id
 00721157ae682-71a46a391a6mr11065017b3.40.1753811834121; Tue, 29 Jul 2025
 10:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250728183922.580652-1-afd@ti.com> <20250728183922.580652-2-afd@ti.com>
 <1856C8B7ECE2833E.21808@lists.yoctoproject.org> <CADL8D3bcdi28+yXCfnz1_Z_ExtAJjCpOHQSdyK9-vyhyhYdEYg@mail.gmail.com>
 <efcd584f-a46e-41bf-bf08-b705dc492fc6@ti.com>
In-Reply-To: <efcd584f-a46e-41bf-bf08-b705dc492fc6@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 29 Jul 2025 13:57:02 -0400
X-Gm-Features: Ac12FXxkvrbRbbPynARHRIf7POiAX8z0tfSayddVxCmOFhsN0SzFzRj_IYNEHVo
Message-ID: <CADL8D3agM=aCyzOZNC8MGn5_-Gc7e38-BmW2BnCsvA1tDtnymQ@mail.gmail.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH 2/2] packagegroup-arago-tisdk-amsdk-sdk-host:
 Remove this recipe
To: Andrew Davis <afd@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>, 
	meta-arago@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Jul 2025 17:57:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16339

On Tue, Jul 29, 2025 at 1:47=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
>
>
> On 7/29/25 12:26 PM, Jon Cormier wrote:
> > On Tue, Jul 29, 2025 at 1:23=E2=80=AFPM Jon Cormier via lists.yoctoproj=
ect.org
> > <jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:
> >>
> >> On Mon, Jul 28, 2025 at 2:39=E2=80=AFPM Andrew Davis via
> >> lists.yoctoproject.org <afd=3Dti.com@lists.yoctoproject.org> wrote:
> >>>
> >>> This recipe only now exists to add "tisdk-uenv" to tisdk-core-bundle
> >>> images so uEnv.txt can be packaged into prebuilt-images. We only need
> >>> to package the uEnv.txt as a "prebuilt-image" if some bundled image
> >>> includes it, no need to manually add this for all images.
> >> Does this mean the tisdk-base/default images will no longer include
> >> the example empty uEnv.txt file?
> > Specifically the wic images.  The other image formats don't include
> > the boot files.
>
> For most images, adding that example uEnv.txt file is done with this
> code here in arago.conf[0]. So the wic images will still have this
> file added even after this patchset, for now..
>
> I say "for now" as I'm not a fan of how these get added to the images
> unconditionally in a .conf file, vs added explicitly in the image's .bb
> files.
This is fair. It does make it tricky to remove the uEnv if a customer
doesn't want it. Or if they want to replace it with their own recipe.
Currently are forced to bbappend the ti recipe.
> Even longer term, U-Boot is moving more towards boot script
> files (boot.scr), which are more flexible and standard (uEnv.txt is
> rather TI specific).
Hmm at least for development, having the config file being text is
pretty desirable.
>
> Andrew
>
> [0] https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/d=
istro/arago.conf#n35
>
> >>>
> >>> Signed-off-by: Andrew Davis <afd@ti.com>
> >>> ---
> >>>   .../recipes-core/images/tisdk-core-bundle.inc    |  4 ----
> >>>   .../packagegroup-arago-tisdk-amsdk-sdk-host.bb   | 16 -------------=
---
> >>>   2 files changed, 20 deletions(-)
> >>>   delete mode 100644 meta-arago-distro/recipes-core/packagegroups/pac=
kagegroup-arago-tisdk-amsdk-sdk-host.bb
> >>>
> >>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.=
inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> >>> index 43b1ef5f..5f72e7b0 100644
> >>> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> >>> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> >>> @@ -33,7 +33,3 @@ TARGET_IMAGES =3D "tisdk-base-image tisdk-default-i=
mage tisdk-thinlinux-image tisd
> >>>
> >>>   TISDK_TOOLCHAIN =3D "meta-toolchain-arago-tisdk"
> >>>   TOOLCHAIN_SUFFIX =3D "-tisdk"
> >>> -
> >>> -IMAGE_INSTALL =3D "\
> >>> -    packagegroup-arago-tisdk-amsdk-sdk-host \
> >>> -"
> >>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegro=
ups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> >>> deleted file mode 100644
> >>> index 9562310f..00000000
> >>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-amsdk-sdk-host.bb
> >>> +++ /dev/null
> >>> @@ -1,16 +0,0 @@
> >>> -SUMMARY =3D "Task to install additional scripts and applications int=
o the SDK"
> >>> -LICENSE =3D "MIT"
> >>> -PR =3D "r30"
> >>> -
> >>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>> -
> >>> -inherit packagegroup
> >>> -
> >>> -EXTRA_FILES =3D ""
> >>> -EXTRA_FILES:ti43x =3D "tisdk-uenv"
> >>> -EXTRA_FILES:omap-a15 =3D "tisdk-uenv"
> >>> -EXTRA_FILES:k3 =3D "tisdk-uenv"
> >>> -
> >>> -RDEPENDS:${PN} =3D "\
> >>> -    ${EXTRA_FILES} \
> >>> -"
> >>> --
> >>> 2.39.2
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>
> >>
> >> --
> >> Jonathan Cormier
> >> Senior Software Engineer
> >>
> >> Voice:  315.425.4045 x222
> >>
> >> http://www.CriticalLink.com
> >> 6712 Brooklawn Parkway, Syracuse, NY 13211
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#16336): https://lists.yoctoproject.org/g/meta-arag=
o/message/16336
> >> Mute This Topic: https://lists.yoctoproject.org/mt/114418842/7902621
> >> Group Owner: meta-arago+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [jcormi=
er@criticallink.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >>
> >
> >
>


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

