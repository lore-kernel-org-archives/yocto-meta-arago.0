Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A65C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 17:27:13 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.14191.1753810028313694236
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 10:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=XQps7LLN;
 spf=pass (domain: criticallink.com, ip: 209.85.219.176, mailfrom: jcormier@criticallink.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8e2a260926so146920276.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 29 Jul 2025 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1753810027; x=1754414827; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75gNRIrCEGVe56dipuEscmZeD3wuJRRJpuKhKuqzfAA=;
        b=XQps7LLNcIB7XWoIXBxfIDFQFci7iiWQ+B65p09mqkucfpZu9M7WluyWVB7OMoMTml
         kstrzBHxVqQEvJQsCqLUSmGxKHSn7T791Jq4b5jnHrkTt0HV4zhuOL4r9gR1TqEQmYS3
         vnQ/gjwuEND2ouxZV9KsNOFUC5oGPHu5JiCEvAh9zuXR3Qumi+83o1D+geXAbO8VbkSe
         wGzw9RxSEG+O652/LpYtUvmJueNmRbNDXUVXzC5Mc9D8OBMrWiLUuGVzVxjPqzcwr0KY
         Fe4+GQaegEPVC+PSz4uCnDyTfLONRs6RCXYPtQsfIcyXd5Fy5itxeV5xP6tMm+efMTH/
         /KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810027; x=1754414827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75gNRIrCEGVe56dipuEscmZeD3wuJRRJpuKhKuqzfAA=;
        b=sjNZwxVroE8U+KeLgA9nk/qhHYsbWv5pzwLwOmbMSxjUB0x+v6dsF26KwLyBZ4NNmM
         nzDFblOlJS3/Ero3LAsYgDweOLB9WhF1GZ5BxirGBiiKV92wi1wAaaPgyDrYOWj7+/7T
         +FaKz1pSE1M9ikuYTdgk/EZugU7i/j0gyz/pgMpbgc6F/VL6ek19pARAzJm6enlsJDIv
         pdrAQR+wt8LdcyDa0QX164VzaQcVPL3xAYr2lwnqFoLkq07CTY2U6/q9YAS3j/AxUlsT
         PCLtsGCjNyGaLBA1A8J/8Q/GnmRjxLkttGvsi4OslIBh1l63qoYbyHYA8pEU/P92PnKg
         mBIA==
X-Forwarded-Encrypted: i=1; AJvYcCV+uo9yYSAYJ3f1SkVXRyROwA4flKRSv/AXRA4jAG8aQOgHOGQYOjUz07hCq+WjVandl2gEyDWA+4lj@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwSxOXg0aqEFjMoL6iGFU5SdY8zWNaGqLytA3pJ33UpCje/A1sh
	VwQYnALb3vknqGKTeJkJoINErUs+05Nd1gu7aoSN3Xezf52VC+XATdCNwIgvv10KgCQa1HrMwd5
	p0/wNEI7fM+9lOCtPl9BZoeM3tQLBK23YNxSdZyfo
X-Gm-Gg: ASbGncvDopoH/WJOdCHIszOPKvDdkQ9WGiKyQefq1WOFnhpHq+/VjU8/aRbTtXecdCV
	wjOdOmdTynCzxyQ5UYRU2zgY5FTKxoFKJsIK/EmOuxhWPJjitySxqWhPd1QqcEReI2je5wJ728C
	kGJJE9zBzfsyaj6CqDDNpIXC1b9OU2PC7OXkFng34Akq/ZOv/XLdS9OjgJCx3gfaOGa/bZz3FPH
	4guxg==
X-Google-Smtp-Source: AGHT+IEMLUVqyXS+HdGNB1mrTIJZBobQ5KlylmZTcxNAVOMU4gLDwUkM0l+fpH9deSc7lxqi3TJVZL0Ol13p8XyKEMg=
X-Received: by 2002:a05:6902:488d:b0:e8e:1141:2dc4 with SMTP id
 3f1490d57ef6-e8e31570de6mr527950276.28.1753810026906; Tue, 29 Jul 2025
 10:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250728183922.580652-1-afd@ti.com> <20250728183922.580652-2-afd@ti.com>
 <1856C8B7ECE2833E.21808@lists.yoctoproject.org>
In-Reply-To: <1856C8B7ECE2833E.21808@lists.yoctoproject.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 29 Jul 2025 13:26:55 -0400
X-Gm-Features: Ac12FXzNmeEbCVd7B2rQ1fNL10jQba_iXWow-DBxVmAGfvEftCRdrN5SGLIVKqs
Message-ID: <CADL8D3bcdi28+yXCfnz1_Z_ExtAJjCpOHQSdyK9-vyhyhYdEYg@mail.gmail.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH 2/2] packagegroup-arago-tisdk-amsdk-sdk-host:
 Remove this recipe
To: jcormier@criticallink.com
Cc: afd@ti.com, Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>, 
	meta-arago@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Jul 2025 17:27:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16337

On Tue, Jul 29, 2025 at 1:23=E2=80=AFPM Jon Cormier via lists.yoctoproject.=
org
<jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:
>
> On Mon, Jul 28, 2025 at 2:39=E2=80=AFPM Andrew Davis via
> lists.yoctoproject.org <afd=3Dti.com@lists.yoctoproject.org> wrote:
> >
> > This recipe only now exists to add "tisdk-uenv" to tisdk-core-bundle
> > images so uEnv.txt can be packaged into prebuilt-images. We only need
> > to package the uEnv.txt as a "prebuilt-image" if some bundled image
> > includes it, no need to manually add this for all images.
> Does this mean the tisdk-base/default images will no longer include
> the example empty uEnv.txt file?
Specifically the wic images.  The other image formats don't include
the boot files.
> >
> > Signed-off-by: Andrew Davis <afd@ti.com>
> > ---
> >  .../recipes-core/images/tisdk-core-bundle.inc    |  4 ----
> >  .../packagegroup-arago-tisdk-amsdk-sdk-host.bb   | 16 ----------------
> >  2 files changed, 20 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-amsdk-sdk-host.bb
> >
> > diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.in=
c b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> > index 43b1ef5f..5f72e7b0 100644
> > --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> > +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> > @@ -33,7 +33,3 @@ TARGET_IMAGES =3D "tisdk-base-image tisdk-default-ima=
ge tisdk-thinlinux-image tisd
> >
> >  TISDK_TOOLCHAIN =3D "meta-toolchain-arago-tisdk"
> >  TOOLCHAIN_SUFFIX =3D "-tisdk"
> > -
> > -IMAGE_INSTALL =3D "\
> > -    packagegroup-arago-tisdk-amsdk-sdk-host \
> > -"
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> > deleted file mode 100644
> > index 9562310f..00000000
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-t=
isdk-amsdk-sdk-host.bb
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -SUMMARY =3D "Task to install additional scripts and applications into =
the SDK"
> > -LICENSE =3D "MIT"
> > -PR =3D "r30"
> > -
> > -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > -
> > -inherit packagegroup
> > -
> > -EXTRA_FILES =3D ""
> > -EXTRA_FILES:ti43x =3D "tisdk-uenv"
> > -EXTRA_FILES:omap-a15 =3D "tisdk-uenv"
> > -EXTRA_FILES:k3 =3D "tisdk-uenv"
> > -
> > -RDEPENDS:${PN} =3D "\
> > -    ${EXTRA_FILES} \
> > -"
> > --
> > 2.39.2
> >
> >
> >
> >
> >
> >
>
>
> --
> Jonathan Cormier
> Senior Software Engineer
>
> Voice:  315.425.4045 x222
>
> http://www.CriticalLink.com
> 6712 Brooklawn Parkway, Syracuse, NY 13211
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16336): https://lists.yoctoproject.org/g/meta-arago/m=
essage/16336
> Mute This Topic: https://lists.yoctoproject.org/mt/114418842/7902621
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

