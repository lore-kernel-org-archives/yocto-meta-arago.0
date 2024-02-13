Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E50C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 09:28:03 +0000 (UTC)
Received: from egress-ip43b.ess.de.barracuda.com (egress-ip43b.ess.de.barracuda.com [18.185.115.247])
 by mx.groups.io with SMTP id smtpd.web10.7765.1707816481039628133
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 01:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=V3AFd6/j;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.247, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198]) by mx-outbound17-60.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 13 Feb 2024 09:27:58 +0000
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2d0cbdb1900so39666141fa.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 01:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1707816477; x=1708421277; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxStgW1tuIbpdp9AWT5EmgROHxhYV8b6jNzRcM3FxZ4=;
        b=V3AFd6/j5DUp1x7s6cSB3L90WXQbMvbSD2lLkwfMfGoUeazYn68JGe2mOG5HaU7O1u
         sTgPqxIRLyid7dh4C+eowRfceVmEhS3tAhIWL/POrUOxH8xf8LErGjfaZxWpxeEtuSr8
         dgGLnnFRkS6ZUDpsRai6RxxzoB3bF3qYILO8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707816477; x=1708421277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxStgW1tuIbpdp9AWT5EmgROHxhYV8b6jNzRcM3FxZ4=;
        b=h+D+cxN0PLP11l+eZ5boaFpLEqIVQV4Pxt1LZPwiMzCJP2kpob7cqdph3WaS+1h/Gj
         azEobucPKRREELlNssSSMJO6o9CmofXLIle0XHA+dWGxd/wdYJR1Qnv1MTYBLtZYE+6i
         Fei67O0bR4Wt5cNvpXPFsgFjEpFlmy4lrQ8lNmaze0jxpCd4pgKHcqE2EaoL0KkTYAeZ
         dAYy0yPne1VMC+f9ZD4GW2XJundDaWZ+Qu87QtsiU1wVuT9auOor8wMtVo70lRtYpXzc
         enxwaG+zJWXV6nr/mtbny0pLqSqX30btYtvkJ5M6sRmnfWwseeAXLT7DPn3qcrd0HWqy
         HERA==
X-Forwarded-Encrypted: i=1; AJvYcCWpHdEF5jccS160YZ5x1RNTrqeBsx1MqyiRizXUvAnddzMwlny6l+29i5dpr+ClXFH0pB5e1AMmztollaMmxa23fijgh7jglWgCqnRJYj97SRY=
X-Gm-Message-State: AOJu0YwtLXYIB0sqmKcuLJUGf9kdBldvWbziPgs5UW2RuD8xr4o+cOyO
	Gw9B/+3nMCmvVk6vYBBPa2tX3pCMFnTMF0AGb77Qgw2qE7D/jXMMSFp+zw2sZ17P3bcgWj+ixMx
	XWGzkH59WFVvXyx4tqw0h0hS7oTIhCYyH3Ds/N47OMOJTiFxJnRQLYPqpxheN4+x8mocEiVSX/Z
	O+DzkEMgs+VjNjq+h+4wPu22MOVLuBrwbgkRTLZtdfofg4tBs/BDxuf9sLeo7ktVqJYWimcSjuq
	aXI3Q==
X-Received: by 2002:a05:651c:2115:b0:2d0:f62b:cdca with SMTP id a21-20020a05651c211500b002d0f62bcdcamr5250068ljq.1.1707816477662;
        Tue, 13 Feb 2024 01:27:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJv1nGeOitsa8a0PuDFq6tbspzfTSIMN760m5iwoKMfBPbVIK1MGZyCU25taJ4fG+A8B5l6eofBbK9UEgm3dk=
X-Received: by 2002:a05:651c:2115:b0:2d0:f62b:cdca with SMTP id
 a21-20020a05651c211500b002d0f62bcdcamr5250031ljq.1.1707816477145; Tue, 13 Feb
 2024 01:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20240212163122.20728-1-sinthu.raja@ti.com> <0bf9ab21-a7dd-478f-b406-888115e9c727@ti.com>
 <CAEd-yTR7K3cDcuVQsV-hoebfF-sHumyXf3mnkK+FWHu1tg=pZQ@mail.gmail.com>
 <528407e1-99a9-eae2-e195-927afce038f3@ti.com> <d4f5ddee-8e59-48d9-83fb-120f63dbd84f@ideasonboard.com>
In-Reply-To: <d4f5ddee-8e59-48d9-83fb-120f63dbd84f@ideasonboard.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Tue, 13 Feb 2024 14:57:45 +0530
Message-ID: <CAEd-yTTdV5U+xwE=qOSsFtSpPT-f_kYtihx=vzY5nGxZQbqLhQ@mail.gmail.com>
Subject: Re: [meta-arago][kirkstone][PATCH] graphics: kms++: Enable OmapCard
 support in pykms library
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, afd@ti.com, "Kumar, Udit" <u-kumar1@ti.com>, 
	meta-arago@lists.yoctoproject.org, reatmon@ti.com, 
	Denys Dmytriyenko <denis@denix.org>, Sinthu Raja <sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1707816478-304412-12714-1340-1
X-BESS-VER: 2019.1_20240212.2144
X-BESS-Apparent-Source-IP: 209.85.208.198
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVpYGJuZAVgZQMM3cxMDS3NDEzN
	zYxDw51TzF1CAlLTHZIsnSwDjJ2MJMqTYWABwRhEJBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.254180 [from 
	cloudscan11-186.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 09:28:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15175

On Tue, Feb 13, 2024 at 2:17=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 13/02/2024 10:28, Devarsh Thakkar wrote:
> > +Tomi.
> >
> > Hi Sinthu, Andrew,
> >
> > On 13/02/24 12:11, Sinthu Raja M wrote:
> >> On Mon, Feb 12, 2024 at 10:36=E2=80=AFPM Andrew Davis via
> >> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoproje=
ct.org&c=3DE,1,2DS7l4Ll0Z71XJHz-8l2SWUjg27KV1rvg3XF0AMYsnwQk1_ugC9LSBcJkDKP=
bky1ukBO3cDGKWYMyz4aGetIoLWygeMbGXIVsFLmFXec-9wrwA,,&typo=3D1 <afd=3Dti.com=
@lists.yoctoproject.org> wrote:
> >>>
> >>> On 2/12/24 10:31 AM, Sinthu Raja M via https://linkprotect.cudasvc.co=
m/url?a=3Dhttps%3a%2f%2flists.yoctoproject.org&c=3DE,1,kscN3qPdyfL8tn7Fw-OJ=
J9CSmKtK9jbcAAMJp2zK3KmVWYUG53IuOFVHam_hakwWdc6Wz-dhlHPCRsgWyFh-wNcu5rYmRVF=
vsvOAzklEyTdmmp7vwy5aHK4QNX0,&typo=3D1 wrote:
> >>>> From: Sinthu Raja <sinthu.raja@ti.com>
> >>>>
> >>>> AM57x platform supports OMAP DRM. By default the pykms library
> >>>> disabled the OmapCard support. Enable the same by defining the
> >>>> HAS_LIBDRM_OMAP as a compiler flags
> >>>
> >>> What project uses this feature? I didn't think there were any
> >>> remaining users of the libdrm OMAP specific framebuffers.
> >>>
> >> I am not sure about the users of the libdrm, As mentioned AM57x SDK
> >> uses OMAP DRM and all the DSS test cases from LTP that use the PYKMS
> >> library are failing due to the OmapCard property being unavailable.
> >> Devarsh/Udit,
> >> Please help in understanding the project that uses this feature.
>
> The only reason to use OmapCard and OmapFramebuffer is to use the TILER.
> If none of the users need TILER, there's no reason to enable the OMAP
> support. But no harm either.
>
> That said, kms++ automatically builds in the omap support if the
> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flibdrm_omap.so&c=3D=
E,1,F-fI2ZgbaQwMkyR6160HbqwP2KIOJTL1ocsF1DbtMr1q-ikrrR7qt-6RBMAiodzw_sRQMFE=
oBWSLDqy1FRCACt9HWnTxKqq0f8ylrjtF-_o-kw,,&typo=3D1 is found, and it also en=
ables the OMAP support for the
> python bindings. So it should "just work". However, the kms++ meson
> files had a bug and the OMAP support for py bindings was not enabled
> correctly. This has been fixed quite a while ago in upstream kms++.
>
> Looking at the patch, if I read it right, it doesn't look correct as it
> unconditionally enables HAS_LIBDRM_OMAP. HAS_LIBDRM_OMAP should only be
> set if the libdrm_omap is available.
>
>   Tomi

Thanks, Tomi.

Denys/Andrew,
As Tomi mentioned the fix is available in the below commit of  [1].
2236a8ccacdfed5ff5f6873ed6618eccf570193d. Please suggest in that case
if is it fine to change the SRCREV of this recipe or just backport the
patch.

[1]:  https://github.com/tomba/kmsxx

Sinthu Raja.
>
> >>> Andrew
> >
> > I am not sure I got the question but to elaborate libdrm is a basic com=
ponent
> > required and enabled for all TI platforms involving display as it provi=
des
> > test utilities and drm/kms helper libs.
> > I think there are multiple package-groups referring this package along =
with
> > some other packages viz gstreamer.
> >
> > Coming back to kms++, this too is being used for all TI platforms invol=
ving
> > display, it is referring to https://github.com/tomba/kmsxx and as Sinth=
u
> > mentioned it is being used internally for ltp-ddt based tests and exter=
nally
> > for SDK they provide some test utilities viz. kmstest which are already=
 being
> > referred in SDK [1]
> >
> >>>
> >>>> The patch looks, ok to me as it only enables/impacts AM57x.
> >
> >>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >
> > Reviewed-by" Devarsh Thakkar <devarsht@ti.com>
> >
> > [1] :
> > https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/ex=
ports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Display/DSS7=
.html?highlight=3Dkmstest
> >
> > Regards
> > Devarsh
> >>>> ---
> >>>>    ...-Add-OMAP-Card-support-for-AM57x-DRM.patch | 26 ++++++++++++++=
+++++
> >>>>    .../recipes-graphics/kms++/kms++https://linkprotect.cudasvc.com/u=
rl?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Vzf5PFTG5SYCJ06T3yo-D9goAOsCzXx6j38cES=
yqUKm6bW2m0vjadcXFO4tYk7Z4AoCEzcxMcfH2yWcmR7AGAI3iS8908081V99Qp3OI&typo=3D1=
       |  2 ++
> >>>>    2 files changed, 28 insertions(+)
> >>>>    create mode 100644 meta-arago-extras/recipes-graphics/kms++/kms++=
/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
> >>>>
> >>>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add=
-OMAP-Card-support-for-AM57x-DRM.patch b/meta-arago-extras/recipes-graphics=
/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
> >>>> new file mode 100644
> >>>> index 00000000..48c9068d
> >>>> --- /dev/null
> >>>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-C=
ard-support-for-AM57x-DRM.patch
> >>>> @@ -0,0 +1,26 @@
> >>>> +From bc6e89ea8695c7e94eb6892755e47781682e28a7 Mon Sep 17 00:00:00 2=
001
> >>>> +From: Sinthu Raja <sinthu.raja@ti.com>
> >>>> +Date: Mon, 12 Feb 2024 21:47:52 +0530
> >>>> +Subject: [PATCH] Add OMAP Card support for AM57x DRM
> >>>> +
> >>>> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >>>> +---
> >>>> + py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmes=
on.build&c=3DE,1,3VCAN204TlXYB924QYhLMMEmS93WM1kI_7WmS3ER9jLN5pLix8cagolTrE=
vejlCBBH-6kJs1N3t2LVtFoPbZ4xidt6HUBa1uunFPxUjOug,,&typo=3D1 | 2 +-
> >>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>> +
> >>>> +diff --git a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps=
%3a%2f%2fmeson.build&c=3DE,1,o8lmqQiC6J9IgNrnPW02TiqhU9slv8AROCpl-FW_llYTMZ=
RIt7B9DNgXlwyTsVRybqt9JrdnUp4lFj2mnvG1JorIq2frQLUKKiSQMRkVSQ,,&typo=3D1 b/p=
y/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmeson.build&c=
=3DE,1,7abaHpO_lRHPBP8JIr9MMmwEJgbhJGQvzEk94uebIZ78HMKGvnPd6AJXiQWn3o9mvRW1=
9xJfgDPCCtq6B8meJ2GtWsdRyTyaY91OqtPxm_kCY0fu&typo=3D1
> >>>> +index de05d12..ce6c013 100644
> >>>> +--- a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%=
2fmeson.build&c=3DE,1,CTfRZi_8_1fCYZFyzQLhaCWcgOvqcoQSrttD13hjpdCtg7LH0rbAp=
gfkSXMafnXyhTGtYbRdKqEDzSyZdI6MR-TAodV5cz3gE0IVAe_48k4,&typo=3D1
> >>>> ++++ b/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%=
2fmeson.build&c=3DE,1,ap4x9zvJd5ZfQQuzZtnoEYjDrKN8fm30VUvYKc4WBVkCj_QiawTvI=
R955h0RVe68z90BAoT47PzbUKGf-lahu3TSAco_s1ek0G5jY6j5KVUxOF9fxIXAdw,,&typo=3D=
1
> >>>> +@@ -49,7 +49,7 @@ if get_option('libutils')
> >>>> +     pykms_deps +=3D [ libkmsxxutil_dep ]
> >>>> + endif
> >>>> +
> >>>> +-pykms_args =3D [ '-fvisibility=3Dhidden' ]
> >>>> ++pykms_args =3D [ '-fvisibility=3Dhidden' , '-DHAS_LIBDRM_OMAP' ]
> >>>> +
> >>>> + destdir =3D get_option('libdir') / 'python' + py3_dep.version() / =
'site-packages/pykms'
> >>>> +
> >>>> +--
> >>>> +2.36.1
> >>>> +
> >>>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++https://l=
inkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,kFBJhILkClnWLQ=
Z1VsDVvzHIYdIol8wO3afczk4Uen3PzHc7X2U3cFd80w0DSM49pPdFlDU1Dh9UqRonCd0KwAF9P=
RrOlUGk2T9QBEpNdkvMcV2HHHoauGuo&typo=3D1 b/meta-arago-extras/recipes-graphi=
cs/kms++/kms++https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb=
&c=3DE,1,kPor2mDuLLEo3MFONlyaNkM5rbbv6jkGQwmvO4IObk5bECLVJ0_YL9LvEe9tr9h6Bu=
BgSYfYwGvRguwCdZ4UYFwMr0tGWXeGYUGzjohMtLQQ7Jbk&typo=3D1
> >>>> index 2c0abaa7..010a1f0a 100644
> >>>> --- a/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprot=
ect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,mK1lB4bE0aDJdjlv1Dc85=
5v3V2yeoxk-ddZjn4hISG1jQ5RjqUCrJVFni5oTDgDY2hpB_L3vmOnB8HNgySj_Zm9H4RBaPurZ=
v74MrbJVEDVgJrQ9ZRHYQvtR-fE,&typo=3D1
> >>>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprot=
ect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Edi_h690Q45x6mNZKj7Hq=
8nO-rj_27k6LCB1QwLmJcs-f2MrjyyZVMPUAoOftvQrGsG6noSFYTuJ_lKzyZ1rVw1oOfqOPvRP=
3sJAIW5uSzCZCdiX4g,,&typo=3D1
> >>>> @@ -28,3 +28,5 @@ inherit python3native meson pkgconfig update-alter=
natives
> >>>>    ALTERNATIVE_PRIORITY =3D "100"
> >>>>    ALTERNATIVE:${PN} =3D "kmstest"
> >>>>    ALTERNATIVE_LINK_NAME[kmstest] =3D "${bindir}/kmstest"
> >>>> +
> >>>> +SRC_URI:append:am57xx =3D "file://0001-Add-OMAP-Card-support-for-AM=
57x-DRM.patch"
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#15167): https://linkprotect.cudasvc.com/url?a=3Dh=
ttps%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2fmessage%2f15167&c=3D=
E,1,JtVExiEgzitnnI9qeraGw9E_SzOz72-2Q2QM8GZFdv0pOYZMu3uO-r7hBg82htXSocj3VT8=
POE6u5-g4AVaWL5GwtLF-iHfIODgin99aYA,,&typo=3D1
> >>> Mute This Topic: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%=
2flists.yoctoproject.org%2fmt%2f104314617%2f6034914&c=3DE,1,-WBOvjwcnZv0seo=
vJR_eJVo3cUVK4g8QVlqMZb4F0nk2HYj9rqWNk965AyXgwUCTXOp0JTjb1-1S4nNv6Hh9HrRoCt=
-KW5KQL7-c_V7zed4uT9nvwQmgrMs6s-I,&typo=3D1
> >>> Group Owner: meta-arago+owner@lists.yoctoproject.org
> >>> Unsubscribe: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fli=
sts.yoctoproject.org%2fg%2fmeta-arago%2funsub&c=3DE,1,feMuc5YJja6GtaJWPLw0g=
p3grSLOOzxqhyzvpUa2rttsNG0zGo1TX2Z3LSqkSj_zI91F2aRQZ0Rbx_MrEnWld-9WP_qHdL6b=
C8aDsj1jUo7txAauSwnZsqCdyg,,&typo=3D1 [sinthu.raja@mistralsolutions.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>
> >>>
> >>
> >>
> >> --
> >> With Regards
> >> Sinthu Raja
>


--=20
With Regards
Sinthu Raja

