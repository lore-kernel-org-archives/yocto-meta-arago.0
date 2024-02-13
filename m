Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22C2C48BC3
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 06:41:22 +0000 (UTC)
Received: from egress-ip12a.ess.de.barracuda.com (egress-ip12a.ess.de.barracuda.com [18.184.203.235])
 by mx.groups.io with SMTP id smtpd.web10.6020.1707806476201882263
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 22:41:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=FthUr95D;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.235, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199]) by mx-outbound14-215.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 13 Feb 2024 06:41:13 +0000
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2d0e2ff7d8eso27319841fa.2
        for <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 22:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1707806473; x=1708411273; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPJWH7qg6X6h30YTOFG2pgRwCsgjnLNQrRLLEWFuEIw=;
        b=FthUr95DNPFNiRWNAJvWsyaOle7SRAnA/42N9UWOPLywyEunC8DfgK/s+PQF9cy3x7
         Xy0W3kpMHAGzavessq5gpZ/uTnInFl4rIlSE6ItM2mDgbtFNYUQCTJJFWhs4I7PNx6t7
         9IYnj0pqRysFCB9pXJ2qyRrkX4bcG1ULDKk4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707806473; x=1708411273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPJWH7qg6X6h30YTOFG2pgRwCsgjnLNQrRLLEWFuEIw=;
        b=hPXXD6bbgQvEuJvk/IxKwXeWGmHCSfb/zKvWlhZmAr4C4XG+5ew5Ztc9dKjFkdeUMM
         MOTMk7pNYCyUezwsy8YDRM7st00Sr36E5r3K/d0cuSQCfqBotwtIiwViGLSxFcrBQ3lj
         IV7pQpl6XKQjBiIwysEGagVKWStAnFiJeXQkDLuHSa9D26iQ2HX17YAriF4uK1UzFqpQ
         7Sh3ofRTp6ZsVHANIyTTxePaocL4o+kZduMykPHNRVDsJd4c8Ag8G5qxWwH8qXRUMJlz
         V0ifo8Ck9RV/QLWvSon1CPRMjqGuZtMpJtypKSQ//Hdf9k1OiGdv4uzkyfLESmM9XFwC
         Bo0Q==
X-Gm-Message-State: AOJu0Ywvr33Bw+WYPrWF4nwW4BtUBAv/bPZo9VNdyJiAyVA6RnbuixLa
	FMwdsbfIJ2DtAP9mb7H8hpg3z42yCc5bBt/wEiB1oh+1/c0KWQsQuo/cMYH5zUASqGKOUcB8dK1
	u/R5uMLT+hGdU+E6aEWeUqbDs5s61tXsj5hR/QV0/1gIf2AOU7Cpq1sBEdI4yTWOC8ZFKBSud0M
	1dTg9NoqLNHgzHhW2xtpKU+S1bjqQkrEC/uD3xIYi/V5mTOOckzcOqenX63osMUYYTgUBAh9yqu
	MblLg==
X-Received: by 2002:a05:651c:2128:b0:2d1:d2b:aad3 with SMTP id a40-20020a05651c212800b002d10d2baad3mr266818ljq.17.1707806473209;
        Mon, 12 Feb 2024 22:41:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbHY2dzSl7GBmmKgE8jEpIYK/cX75AeNYfcLFO+oYiQIxNS+yUKnPUTRtB48wUoj92Ysjy8oVIMA/PLak2ZRM=
X-Received: by 2002:a05:651c:2128:b0:2d1:d2b:aad3 with SMTP id
 a40-20020a05651c212800b002d10d2baad3mr266802ljq.17.1707806472858; Mon, 12 Feb
 2024 22:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20240212163122.20728-1-sinthu.raja@ti.com> <0bf9ab21-a7dd-478f-b406-888115e9c727@ti.com>
In-Reply-To: <0bf9ab21-a7dd-478f-b406-888115e9c727@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Tue, 13 Feb 2024 12:11:01 +0530
Message-ID: <CAEd-yTR7K3cDcuVQsV-hoebfF-sHumyXf3mnkK+FWHu1tg=pZQ@mail.gmail.com>
Subject: Re: [meta-arago][kirkstone][PATCH] graphics: kms++: Enable OmapCard
 support in pykms library
To: afd@ti.com, devarsht@ti.com, "Kumar, Udit" <u-kumar1@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, 
	Denys Dmytriyenko <denis@denix.org>, Sinthu Raja <sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1707806473-303799-8956-20268-1
X-BESS-VER: 2019.1_20240212.2144
X-BESS-Apparent-Source-IP: 209.85.208.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVmYGFoZAVgZQ0DLFIDklJS3FwN
	DE0CDR0DDRNDXRPNEyxSLZ0CDV3CxFqTYWAI9L7MZBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.254177 [from 
	cloudscan21-126.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 06:41:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15172

On Mon, Feb 12, 2024 at 10:36=E2=80=AFPM Andrew Davis via
lists.yoctoproject.org <afd=3Dti.com@lists.yoctoproject.org> wrote:
>
> On 2/12/24 10:31 AM, Sinthu Raja M via https://linkprotect.cudasvc.com/ur=
l?a=3Dhttps%3a%2f%2flists.yoctoproject.org&c=3DE,1,kscN3qPdyfL8tn7Fw-OJJ9CS=
mKtK9jbcAAMJp2zK3KmVWYUG53IuOFVHam_hakwWdc6Wz-dhlHPCRsgWyFh-wNcu5rYmRVFvsvO=
AzklEyTdmmp7vwy5aHK4QNX0,&typo=3D1 wrote:
> > From: Sinthu Raja <sinthu.raja@ti.com>
> >
> > AM57x platform supports OMAP DRM. By default the pykms library
> > disabled the OmapCard support. Enable the same by defining the
> > HAS_LIBDRM_OMAP as a compiler flags
>
> What project uses this feature? I didn't think there were any
> remaining users of the libdrm OMAP specific framebuffers.
>
I am not sure about the users of the libdrm, As mentioned AM57x SDK
uses OMAP DRM and all the DSS test cases from LTP that use the PYKMS
library are failing due to the OmapCard property being unavailable.
Devarsh/Udit,
Please help in understanding the project that uses this feature.
> Andrew
>
> >
> > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > ---
> >   ...-Add-OMAP-Card-support-for-AM57x-DRM.patch | 26 ++++++++++++++++++=
+
> >   .../recipes-graphics/kms++/kms++https://linkprotect.cudasvc.com/url?a=
=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Vzf5PFTG5SYCJ06T3yo-D9goAOsCzXx6j38cESyqUK=
m6bW2m0vjadcXFO4tYk7Z4AoCEzcxMcfH2yWcmR7AGAI3iS8908081V99Qp3OI&typo=3D1    =
   |  2 ++
> >   2 files changed, 28 insertions(+)
> >   create mode 100644 meta-arago-extras/recipes-graphics/kms++/kms++/000=
1-Add-OMAP-Card-support-for-AM57x-DRM.patch
> >
> > diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OM=
AP-Card-support-for-AM57x-DRM.patch b/meta-arago-extras/recipes-graphics/km=
s++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
> > new file mode 100644
> > index 00000000..48c9068d
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card=
-support-for-AM57x-DRM.patch
> > @@ -0,0 +1,26 @@
> > +From bc6e89ea8695c7e94eb6892755e47781682e28a7 Mon Sep 17 00:00:00 2001
> > +From: Sinthu Raja <sinthu.raja@ti.com>
> > +Date: Mon, 12 Feb 2024 21:47:52 +0530
> > +Subject: [PATCH] Add OMAP Card support for AM57x DRM
> > +
> > +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > +---
> > + py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmeson.=
build&c=3DE,1,3VCAN204TlXYB924QYhLMMEmS93WM1kI_7WmS3ER9jLN5pLix8cagolTrEvej=
lCBBH-6kJs1N3t2LVtFoPbZ4xidt6HUBa1uunFPxUjOug,,&typo=3D1 | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a=
%2f%2fmeson.build&c=3DE,1,o8lmqQiC6J9IgNrnPW02TiqhU9slv8AROCpl-FW_llYTMZRIt=
7B9DNgXlwyTsVRybqt9JrdnUp4lFj2mnvG1JorIq2frQLUKKiSQMRkVSQ,,&typo=3D1 b/py/p=
ykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmeson.build&c=3D=
E,1,7abaHpO_lRHPBP8JIr9MMmwEJgbhJGQvzEk94uebIZ78HMKGvnPd6AJXiQWn3o9mvRW19xJ=
fgDPCCtq6B8meJ2GtWsdRyTyaY91OqtPxm_kCY0fu&typo=3D1
> > +index de05d12..ce6c013 100644
> > +--- a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fm=
eson.build&c=3DE,1,CTfRZi_8_1fCYZFyzQLhaCWcgOvqcoQSrttD13hjpdCtg7LH0rbApgfk=
SXMafnXyhTGtYbRdKqEDzSyZdI6MR-TAodV5cz3gE0IVAe_48k4,&typo=3D1
> > ++++ b/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fm=
eson.build&c=3DE,1,ap4x9zvJd5ZfQQuzZtnoEYjDrKN8fm30VUvYKc4WBVkCj_QiawTvIR95=
5h0RVe68z90BAoT47PzbUKGf-lahu3TSAco_s1ek0G5jY6j5KVUxOF9fxIXAdw,,&typo=3D1
> > +@@ -49,7 +49,7 @@ if get_option('libutils')
> > +     pykms_deps +=3D [ libkmsxxutil_dep ]
> > + endif
> > +
> > +-pykms_args =3D [ '-fvisibility=3Dhidden' ]
> > ++pykms_args =3D [ '-fvisibility=3Dhidden' , '-DHAS_LIBDRM_OMAP' ]
> > +
> > + destdir =3D get_option('libdir') / 'python' + py3_dep.version() / 'si=
te-packages/pykms'
> > +
> > +--
> > +2.36.1
> > +
> > diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++https://link=
protect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,kFBJhILkClnWLQZ1V=
sDVvzHIYdIol8wO3afczk4Uen3PzHc7X2U3cFd80w0DSM49pPdFlDU1Dh9UqRonCd0KwAF9PRrO=
lUGk2T9QBEpNdkvMcV2HHHoauGuo&typo=3D1 b/meta-arago-extras/recipes-graphics/=
kms++/kms++https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=
=3DE,1,kPor2mDuLLEo3MFONlyaNkM5rbbv6jkGQwmvO4IObk5bECLVJ0_YL9LvEe9tr9h6BuBg=
SYfYwGvRguwCdZ4UYFwMr0tGWXeGYUGzjohMtLQQ7Jbk&typo=3D1
> > index 2c0abaa7..010a1f0a 100644
> > --- a/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprotect=
.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,mK1lB4bE0aDJdjlv1Dc855v3=
V2yeoxk-ddZjn4hISG1jQ5RjqUCrJVFni5oTDgDY2hpB_L3vmOnB8HNgySj_Zm9H4RBaPurZv74=
MrbJVEDVgJrQ9ZRHYQvtR-fE,&typo=3D1
> > +++ b/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprotect=
.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Edi_h690Q45x6mNZKj7Hq8nO=
-rj_27k6LCB1QwLmJcs-f2MrjyyZVMPUAoOftvQrGsG6noSFYTuJ_lKzyZ1rVw1oOfqOPvRP3sJ=
AIW5uSzCZCdiX4g,,&typo=3D1
> > @@ -28,3 +28,5 @@ inherit python3native meson pkgconfig update-alternat=
ives
> >   ALTERNATIVE_PRIORITY =3D "100"
> >   ALTERNATIVE:${PN} =3D "kmstest"
> >   ALTERNATIVE_LINK_NAME[kmstest] =3D "${bindir}/kmstest"
> > +
> > +SRC_URI:append:am57xx =3D "file://0001-Add-OMAP-Card-support-for-AM57x=
-DRM.patch"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15167): https://linkprotect.cudasvc.com/url?a=3Dhttps=
%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2fmessage%2f15167&c=3DE,1,=
JtVExiEgzitnnI9qeraGw9E_SzOz72-2Q2QM8GZFdv0pOYZMu3uO-r7hBg82htXSocj3VT8POE6=
u5-g4AVaWL5GwtLF-iHfIODgin99aYA,,&typo=3D1
> Mute This Topic: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fli=
sts.yoctoproject.org%2fmt%2f104314617%2f6034914&c=3DE,1,-WBOvjwcnZv0seovJR_=
eJVo3cUVK4g8QVlqMZb4F0nk2HYj9rqWNk965AyXgwUCTXOp0JTjb1-1S4nNv6Hh9HrRoCt-KW5=
KQL7-c_V7zed4uT9nvwQmgrMs6s-I,&typo=3D1
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.=
yoctoproject.org%2fg%2fmeta-arago%2funsub&c=3DE,1,feMuc5YJja6GtaJWPLw0gp3gr=
SLOOzxqhyzvpUa2rttsNG0zGo1TX2Z3LSqkSj_zI91F2aRQZ0Rbx_MrEnWld-9WP_qHdL6bC8aD=
sj1jUo7txAauSwnZsqCdyg,,&typo=3D1 [sinthu.raja@mistralsolutions.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>


--
With Regards
Sinthu Raja

