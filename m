Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95197C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 12:20:24 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web11.7550.1707814078764486770
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 00:47:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ideasonboard.com header.s=mail header.b=weIcN+B9;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: tomi.valkeinen@ideasonboard.com)
Received: from [192.168.88.20] (91-154-35-128.elisa-laajakaista.fi [91.154.35.128])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8A31675;
	Tue, 13 Feb 2024 09:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707814074;
	bh=Sqjdr9DgxNIc0zYnKPPtctI8otWhAZ3Spot2m+hobBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=weIcN+B9ovNIXwuRpnWIWiyefjusiwR+AxUd6dbkY3u72k/L8SHD3xhb8Wd5dBvZu
	 1kqAKMrEND6ph1y3Gqy3mbAyAYfjiORBHsefN5KIBjdtHfUeLF+qbZTCqJaO4EEMZh
	 v5rL0IZasJOUQyCsxWrNyswFCgzkCQ9Q1aMpAOd0=
Message-ID: <d4f5ddee-8e59-48d9-83fb-120f63dbd84f@ideasonboard.com>
Date: Tue, 13 Feb 2024 10:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone][PATCH] graphics: kms++: Enable OmapCard support in pykms library
To: Devarsh Thakkar <devarsht@ti.com>,
 Sinthu Raja M <sinthu.raja@mistralsolutions.com>, afd@ti.com,
 "Kumar, Udit" <u-kumar1@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com,
 Denys Dmytriyenko <denis@denix.org>, Sinthu Raja <sinthu.raja@ti.com>
References: <20240212163122.20728-1-sinthu.raja@ti.com>
 <0bf9ab21-a7dd-478f-b406-888115e9c727@ti.com>
 <CAEd-yTR7K3cDcuVQsV-hoebfF-sHumyXf3mnkK+FWHu1tg=pZQ@mail.gmail.com>
 <528407e1-99a9-eae2-e195-927afce038f3@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <528407e1-99a9-eae2-e195-927afce038f3@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 12:20:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15176

On 13/02/2024 10:28, Devarsh Thakkar wrote:
> +Tomi.
>=20
> Hi Sinthu, Andrew,
>=20
> On 13/02/24 12:11, Sinthu Raja M wrote:
>> On Mon, Feb 12, 2024 at 10:36=E2=80=AFPM Andrew Davis via
>> lists.yoctoproject.org <afd=3Dti.com@lists.yoctoproject.org> wrote:
>>>
>>> On 2/12/24 10:31 AM, Sinthu Raja M via https://linkprotect.cudasvc.com/=
url?a=3Dhttps%3a%2f%2flists.yoctoproject.org&c=3DE,1,kscN3qPdyfL8tn7Fw-OJJ9=
CSmKtK9jbcAAMJp2zK3KmVWYUG53IuOFVHam_hakwWdc6Wz-dhlHPCRsgWyFh-wNcu5rYmRVFvs=
vOAzklEyTdmmp7vwy5aHK4QNX0,&typo=3D1 wrote:
>>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>>
>>>> AM57x platform supports OMAP DRM. By default the pykms library
>>>> disabled the OmapCard support. Enable the same by defining the
>>>> HAS_LIBDRM_OMAP as a compiler flags
>>>
>>> What project uses this feature? I didn't think there were any
>>> remaining users of the libdrm OMAP specific framebuffers.
>>>
>> I am not sure about the users of the libdrm, As mentioned AM57x SDK
>> uses OMAP DRM and all the DSS test cases from LTP that use the PYKMS
>> library are failing due to the OmapCard property being unavailable.
>> Devarsh/Udit,
>> Please help in understanding the project that uses this feature.

The only reason to use OmapCard and OmapFramebuffer is to use the TILER.=20
If none of the users need TILER, there's no reason to enable the OMAP=20
support. But no harm either.

That said, kms++ automatically builds in the omap support if the=20
libdrm_omap.so is found, and it also enables the OMAP support for the=20
python bindings. So it should "just work". However, the kms++ meson=20
files had a bug and the OMAP support for py bindings was not enabled=20
correctly. This has been fixed quite a while ago in upstream kms++.

Looking at the patch, if I read it right, it doesn't look correct as it=20
unconditionally enables HAS_LIBDRM_OMAP. HAS_LIBDRM_OMAP should only be=20
set if the libdrm_omap is available.

  Tomi

>>> Andrew
>=20
> I am not sure I got the question but to elaborate libdrm is a basic compo=
nent
> required and enabled for all TI platforms involving display as it provide=
s
> test utilities and drm/kms helper libs.
> I think there are multiple package-groups referring this package along wi=
th
> some other packages viz gstreamer.
>=20
> Coming back to kms++, this too is being used for all TI platforms involvi=
ng
> display, it is referring to https://github.com/tomba/kmsxx and as Sinthu
> mentioned it is being used internally for ltp-ddt based tests and externa=
lly
> for SDK they provide some test utilities viz. kmstest which are already b=
eing
> referred in SDK [1]
>=20
>>>
>>>> The patch looks, ok to me as it only enables/impacts AM57x.
>=20
>>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>=20
> Reviewed-by" Devarsh Thakkar <devarsht@ti.com>
>=20
> [1] :
> https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/expo=
rts/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Display/DSS7.h=
tml?highlight=3Dkmstest
>=20
> Regards
> Devarsh
>>>> ---
>>>>    ...-Add-OMAP-Card-support-for-AM57x-DRM.patch | 26 ++++++++++++++++=
+++
>>>>    .../recipes-graphics/kms++/kms++https://linkprotect.cudasvc.com/url=
?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Vzf5PFTG5SYCJ06T3yo-D9goAOsCzXx6j38cESyq=
UKm6bW2m0vjadcXFO4tYk7Z4AoCEzcxMcfH2yWcmR7AGAI3iS8908081V99Qp3OI&typo=3D1  =
     |  2 ++
>>>>    2 files changed, 28 insertions(+)
>>>>    create mode 100644 meta-arago-extras/recipes-graphics/kms++/kms++/0=
001-Add-OMAP-Card-support-for-AM57x-DRM.patch
>>>>
>>>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-O=
MAP-Card-support-for-AM57x-DRM.patch b/meta-arago-extras/recipes-graphics/k=
ms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
>>>> new file mode 100644
>>>> index 00000000..48c9068d
>>>> --- /dev/null
>>>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Car=
d-support-for-AM57x-DRM.patch
>>>> @@ -0,0 +1,26 @@
>>>> +From bc6e89ea8695c7e94eb6892755e47781682e28a7 Mon Sep 17 00:00:00 200=
1
>>>> +From: Sinthu Raja <sinthu.raja@ti.com>
>>>> +Date: Mon, 12 Feb 2024 21:47:52 +0530
>>>> +Subject: [PATCH] Add OMAP Card support for AM57x DRM
>>>> +
>>>> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>>> +---
>>>> + py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmeson=
.build&c=3DE,1,3VCAN204TlXYB924QYhLMMEmS93WM1kI_7WmS3ER9jLN5pLix8cagolTrEve=
jlCBBH-6kJs1N3t2LVtFoPbZ4xidt6HUBa1uunFPxUjOug,,&typo=3D1 | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3=
a%2f%2fmeson.build&c=3DE,1,o8lmqQiC6J9IgNrnPW02TiqhU9slv8AROCpl-FW_llYTMZRI=
t7B9DNgXlwyTsVRybqt9JrdnUp4lFj2mnvG1JorIq2frQLUKKiSQMRkVSQ,,&typo=3D1 b/py/=
pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmeson.build&c=
=3DE,1,7abaHpO_lRHPBP8JIr9MMmwEJgbhJGQvzEk94uebIZ78HMKGvnPd6AJXiQWn3o9mvRW1=
9xJfgDPCCtq6B8meJ2GtWsdRyTyaY91OqtPxm_kCY0fu&typo=3D1
>>>> +index de05d12..ce6c013 100644
>>>> +--- a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
meson.build&c=3DE,1,CTfRZi_8_1fCYZFyzQLhaCWcgOvqcoQSrttD13hjpdCtg7LH0rbApgf=
kSXMafnXyhTGtYbRdKqEDzSyZdI6MR-TAodV5cz3gE0IVAe_48k4,&typo=3D1
>>>> ++++ b/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
meson.build&c=3DE,1,ap4x9zvJd5ZfQQuzZtnoEYjDrKN8fm30VUvYKc4WBVkCj_QiawTvIR9=
55h0RVe68z90BAoT47PzbUKGf-lahu3TSAco_s1ek0G5jY6j5KVUxOF9fxIXAdw,,&typo=3D1
>>>> +@@ -49,7 +49,7 @@ if get_option('libutils')
>>>> +     pykms_deps +=3D [ libkmsxxutil_dep ]
>>>> + endif
>>>> +
>>>> +-pykms_args =3D [ '-fvisibility=3Dhidden' ]
>>>> ++pykms_args =3D [ '-fvisibility=3Dhidden' , '-DHAS_LIBDRM_OMAP' ]
>>>> +
>>>> + destdir =3D get_option('libdir') / 'python' + py3_dep.version() / 's=
ite-packages/pykms'
>>>> +
>>>> +--
>>>> +2.36.1
>>>> +
>>>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++https://lin=
kprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,kFBJhILkClnWLQZ1=
VsDVvzHIYdIol8wO3afczk4Uen3PzHc7X2U3cFd80w0DSM49pPdFlDU1Dh9UqRonCd0KwAF9PRr=
OlUGk2T9QBEpNdkvMcV2HHHoauGuo&typo=3D1 b/meta-arago-extras/recipes-graphics=
/kms++/kms++https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=
=3DE,1,kPor2mDuLLEo3MFONlyaNkM5rbbv6jkGQwmvO4IObk5bECLVJ0_YL9LvEe9tr9h6BuBg=
SYfYwGvRguwCdZ4UYFwMr0tGWXeGYUGzjohMtLQQ7Jbk&typo=3D1
>>>> index 2c0abaa7..010a1f0a 100644
>>>> --- a/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprotec=
t.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,mK1lB4bE0aDJdjlv1Dc855v=
3V2yeoxk-ddZjn4hISG1jQ5RjqUCrJVFni5oTDgDY2hpB_L3vmOnB8HNgySj_Zm9H4RBaPurZv7=
4MrbJVEDVgJrQ9ZRHYQvtR-fE,&typo=3D1
>>>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprotec=
t.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Edi_h690Q45x6mNZKj7Hq8n=
O-rj_27k6LCB1QwLmJcs-f2MrjyyZVMPUAoOftvQrGsG6noSFYTuJ_lKzyZ1rVw1oOfqOPvRP3s=
JAIW5uSzCZCdiX4g,,&typo=3D1
>>>> @@ -28,3 +28,5 @@ inherit python3native meson pkgconfig update-alterna=
tives
>>>>    ALTERNATIVE_PRIORITY =3D "100"
>>>>    ALTERNATIVE:${PN} =3D "kmstest"
>>>>    ALTERNATIVE_LINK_NAME[kmstest] =3D "${bindir}/kmstest"
>>>> +
>>>> +SRC_URI:append:am57xx =3D "file://0001-Add-OMAP-Card-support-for-AM57=
x-DRM.patch"
>>>
>>>
>>>=20
>>>
>>>
>>
>>
>> --
>> With Regards
>> Sinthu Raja


