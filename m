Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA859C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 16:05:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.15228.1707840314821521803
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 08:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ZVOQl7PH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41DG59nZ020270;
	Tue, 13 Feb 2024 10:05:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707840309;
	bh=9uxqqDB/JgUNWmzKFy98pZYxVJlJDS2NwYfvDs3Yy1w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZVOQl7PH2Dm+Wnd64wv3OVjS63OZd7pFuOh4TK/2AGz08WbGbO21txTVQWUITjbmr
	 T9Y6UiwwlbTjBLROD5TbX+0wLZm+/tl5gYdk4AQrFqTo6dR2NNvGia8I4fUp3WJa3o
	 i3g8mbUg3qqSiYvsWEALJWFz5+2ZEyS0gXDdNRD4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41DG59FR083743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Feb 2024 10:05:09 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Feb 2024 10:05:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Feb 2024 10:05:09 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41DG59hK077052;
	Tue, 13 Feb 2024 10:05:09 -0600
Message-ID: <8e6d3da2-5547-4a5b-ad30-3a3278ff07f3@ti.com>
Date: Tue, 13 Feb 2024 10:05:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone][PATCH] graphics: kms++: Enable OmapCard
 support in pykms library
Content-Language: en-US
To: Sinthu Raja M <sinthu.raja@mistralsolutions.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>
CC: Devarsh Thakkar <devarsht@ti.com>, "Kumar, Udit" <u-kumar1@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Sinthu Raja <sinthu.raja@ti.com>
References: <20240212163122.20728-1-sinthu.raja@ti.com>
 <0bf9ab21-a7dd-478f-b406-888115e9c727@ti.com>
 <CAEd-yTR7K3cDcuVQsV-hoebfF-sHumyXf3mnkK+FWHu1tg=pZQ@mail.gmail.com>
 <528407e1-99a9-eae2-e195-927afce038f3@ti.com>
 <d4f5ddee-8e59-48d9-83fb-120f63dbd84f@ideasonboard.com>
 <CAEd-yTTdV5U+xwE=qOSsFtSpPT-f_kYtihx=vzY5nGxZQbqLhQ@mail.gmail.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CAEd-yTTdV5U+xwE=qOSsFtSpPT-f_kYtihx=vzY5nGxZQbqLhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 41DG59nZ020270
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 16:05:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15177

On 2/13/24 3:27 AM, Sinthu Raja M wrote:
> On Tue, Feb 13, 2024 at 2:17=E2=80=AFPM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> On 13/02/2024 10:28, Devarsh Thakkar wrote:
>>> +Tomi.
>>>
>>> Hi Sinthu, Andrew,
>>>
>>> On 13/02/24 12:11, Sinthu Raja M wrote:
>>>> On Mon, Feb 12, 2024 at 10:36=E2=80=AFPM Andrew Davis via
>>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctopro=
ject.org&c=3DE,1,2DS7l4Ll0Z71XJHz-8l2SWUjg27KV1rvg3XF0AMYsnwQk1_ugC9LSBcJ=
kDKPbky1ukBO3cDGKWYMyz4aGetIoLWygeMbGXIVsFLmFXec-9wrwA,,&typo=3D1 <afd=3D=
ti.com@lists.yoctoproject.org> wrote:
>>>>>
>>>>> On 2/12/24 10:31 AM, Sinthu Raja M via https://linkprotect.cudasvc.=
com/url?a=3Dhttps%3a%2f%2flists.yoctoproject.org&c=3DE,1,kscN3qPdyfL8tn7F=
w-OJJ9CSmKtK9jbcAAMJp2zK3KmVWYUG53IuOFVHam_hakwWdc6Wz-dhlHPCRsgWyFh-wNcu5=
rYmRVFvsvOAzklEyTdmmp7vwy5aHK4QNX0,&typo=3D1 wrote:
>>>>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>>>>
>>>>>> AM57x platform supports OMAP DRM. By default the pykms library
>>>>>> disabled the OmapCard support. Enable the same by defining the
>>>>>> HAS_LIBDRM_OMAP as a compiler flags
>>>>>
>>>>> What project uses this feature? I didn't think there were any
>>>>> remaining users of the libdrm OMAP specific framebuffers.
>>>>>
>>>> I am not sure about the users of the libdrm, As mentioned AM57x SDK
>>>> uses OMAP DRM and all the DSS test cases from LTP that use the PYKMS
>>>> library are failing due to the OmapCard property being unavailable.
>>>> Devarsh/Udit,
>>>> Please help in understanding the project that uses this feature.
>>
>> The only reason to use OmapCard and OmapFramebuffer is to use the TILE=
R.
>> If none of the users need TILER, there's no reason to enable the OMAP
>> support. But no harm either.
>>
>> That said, kms++ automatically builds in the omap support if the
>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flibdrm_omap.so&c=
=3DE,1,F-fI2ZgbaQwMkyR6160HbqwP2KIOJTL1ocsF1DbtMr1q-ikrrR7qt-6RBMAiodzw_s=
RQMFEoBWSLDqy1FRCACt9HWnTxKqq0f8ylrjtF-_o-kw,,&typo=3D1 is found, and it =
also enables the OMAP support for the
>> python bindings. So it should "just work". However, the kms++ meson
>> files had a bug and the OMAP support for py bindings was not enabled
>> correctly. This has been fixed quite a while ago in upstream kms++.
>>
>> Looking at the patch, if I read it right, it doesn't look correct as i=
t
>> unconditionally enables HAS_LIBDRM_OMAP. HAS_LIBDRM_OMAP should only b=
e
>> set if the libdrm_omap is available.
>>
>>    Tomi
>=20
> Thanks, Tomi.
>=20
> Denys/Andrew,
> As Tomi mentioned the fix is available in the below commit of  [1].
> 2236a8ccacdfed5ff5f6873ed6618eccf570193d. Please suggest in that case
> if is it fine to change the SRCREV of this recipe or just backport the
> patch.

If there is a fix upstream then bump the SRCREV to the latest.

>=20
> [1]:  https://github.com/tomba/kmsxx
>=20
> Sinthu Raja.
>>
>>>>> Andrew
>>>
>>> I am not sure I got the question but to elaborate libdrm is a basic c=
omponent
>>> required and enabled for all TI platforms involving display as it pro=
vides
>>> test utilities and drm/kms helper libs.

I was asking specifically about the OmapCard feature, not libdrm itself.
Do any of our demos or tests still use that, if so we should fix that,
OmapCard/OmapFramebuffer should be deprecated out.

Thanks,
Andrew

>>> I think there are multiple package-groups referring this package alon=
g with
>>> some other packages viz gstreamer.
>>>
>>> Coming back to kms++, this too is being used for all TI platforms inv=
olving
>>> display, it is referring to https://github.com/tomba/kmsxx and as Sin=
thu
>>> mentioned it is being used internally for ltp-ddt based tests and ext=
ernally
>>> for SDK they provide some test utilities viz. kmstest which are alrea=
dy being
>>> referred in SDK [1]
>>>
>>>>>
>>>>>> The patch looks, ok to me as it only enables/impacts AM57x.
>>>
>>>>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>>
>>> Reviewed-by" Devarsh Thakkar <devarsht@ti.com>
>>>
>>> [1] :
>>> https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/=
exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Display/=
DSS7.html?highlight=3Dkmstest
>>>
>>> Regards
>>> Devarsh
>>>>>> ---
>>>>>>     ...-Add-OMAP-Card-support-for-AM57x-DRM.patch | 26 +++++++++++=
++++++++
>>>>>>     .../recipes-graphics/kms++/kms++https://linkprotect.cudasvc.co=
m/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Vzf5PFTG5SYCJ06T3yo-D9goAOsCzXx6j=
38cESyqUKm6bW2m0vjadcXFO4tYk7Z4AoCEzcxMcfH2yWcmR7AGAI3iS8908081V99Qp3OI&t=
ypo=3D1       |  2 ++
>>>>>>     2 files changed, 28 insertions(+)
>>>>>>     create mode 100644 meta-arago-extras/recipes-graphics/kms++/km=
s++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
>>>>>>
>>>>>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++/0001-A=
dd-OMAP-Card-support-for-AM57x-DRM.patch b/meta-arago-extras/recipes-grap=
hics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
>>>>>> new file mode 100644
>>>>>> index 00000000..48c9068d
>>>>>> --- /dev/null
>>>>>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP=
-Card-support-for-AM57x-DRM.patch
>>>>>> @@ -0,0 +1,26 @@
>>>>>> +From bc6e89ea8695c7e94eb6892755e47781682e28a7 Mon Sep 17 00:00:00=
 2001
>>>>>> +From: Sinthu Raja <sinthu.raja@ti.com>
>>>>>> +Date: Mon, 12 Feb 2024 21:47:52 +0530
>>>>>> +Subject: [PATCH] Add OMAP Card support for AM57x DRM
>>>>>> +
>>>>>> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>>>>> +---
>>>>>> + py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fm=
eson.build&c=3DE,1,3VCAN204TlXYB924QYhLMMEmS93WM1kI_7WmS3ER9jLN5pLix8cago=
lTrEvejlCBBH-6kJs1N3t2LVtFoPbZ4xidt6HUBa1uunFPxUjOug,,&typo=3D1 | 2 +-
>>>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>> +
>>>>>> +diff --git a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhtt=
ps%3a%2f%2fmeson.build&c=3DE,1,o8lmqQiC6J9IgNrnPW02TiqhU9slv8AROCpl-FW_ll=
YTMZRIt7B9DNgXlwyTsVRybqt9JrdnUp4lFj2mnvG1JorIq2frQLUKKiSQMRkVSQ,,&typo=3D=
1 b/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmeson.=
build&c=3DE,1,7abaHpO_lRHPBP8JIr9MMmwEJgbhJGQvzEk94uebIZ78HMKGvnPd6AJXiQW=
n3o9mvRW19xJfgDPCCtq6B8meJ2GtWsdRyTyaY91OqtPxm_kCY0fu&typo=3D1
>>>>>> +index de05d12..ce6c013 100644
>>>>>> +--- a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2=
f%2fmeson.build&c=3DE,1,CTfRZi_8_1fCYZFyzQLhaCWcgOvqcoQSrttD13hjpdCtg7LH0=
rbApgfkSXMafnXyhTGtYbRdKqEDzSyZdI6MR-TAodV5cz3gE0IVAe_48k4,&typo=3D1
>>>>>> ++++ b/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2=
f%2fmeson.build&c=3DE,1,ap4x9zvJd5ZfQQuzZtnoEYjDrKN8fm30VUvYKc4WBVkCj_Qia=
wTvIR955h0RVe68z90BAoT47PzbUKGf-lahu3TSAco_s1ek0G5jY6j5KVUxOF9fxIXAdw,,&t=
ypo=3D1
>>>>>> +@@ -49,7 +49,7 @@ if get_option('libutils')
>>>>>> +     pykms_deps +=3D [ libkmsxxutil_dep ]
>>>>>> + endif
>>>>>> +
>>>>>> +-pykms_args =3D [ '-fvisibility=3Dhidden' ]
>>>>>> ++pykms_args =3D [ '-fvisibility=3Dhidden' , '-DHAS_LIBDRM_OMAP' ]
>>>>>> +
>>>>>> + destdir =3D get_option('libdir') / 'python' + py3_dep.version() =
/ 'site-packages/pykms'
>>>>>> +
>>>>>> +--
>>>>>> +2.36.1
>>>>>> +
>>>>>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++https:/=
/linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,kFBJhILkCl=
nWLQZ1VsDVvzHIYdIol8wO3afczk4Uen3PzHc7X2U3cFd80w0DSM49pPdFlDU1Dh9UqRonCd0=
KwAF9PRrOlUGk2T9QBEpNdkvMcV2HHHoauGuo&typo=3D1 b/meta-arago-extras/recipe=
s-graphics/kms++/kms++https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f=
%2f_git.bb&c=3DE,1,kPor2mDuLLEo3MFONlyaNkM5rbbv6jkGQwmvO4IObk5bECLVJ0_YL9=
LvEe9tr9h6BuBgSYfYwGvRguwCdZ4UYFwMr0tGWXeGYUGzjohMtLQQ7Jbk&typo=3D1
>>>>>> index 2c0abaa7..010a1f0a 100644
>>>>>> --- a/meta-arago-extras/recipes-graphics/kms++/kms++https://linkpr=
otect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,mK1lB4bE0aDJdjlv1=
Dc855v3V2yeoxk-ddZjn4hISG1jQ5RjqUCrJVFni5oTDgDY2hpB_L3vmOnB8HNgySj_Zm9H4R=
BaPurZv74MrbJVEDVgJrQ9ZRHYQvtR-fE,&typo=3D1
>>>>>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++https://linkpr=
otect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Edi_h690Q45x6mNZK=
j7Hq8nO-rj_27k6LCB1QwLmJcs-f2MrjyyZVMPUAoOftvQrGsG6noSFYTuJ_lKzyZ1rVw1oOf=
qOPvRP3sJAIW5uSzCZCdiX4g,,&typo=3D1
>>>>>> @@ -28,3 +28,5 @@ inherit python3native meson pkgconfig update-alt=
ernatives
>>>>>>     ALTERNATIVE_PRIORITY =3D "100"
>>>>>>     ALTERNATIVE:${PN} =3D "kmstest"
>>>>>>     ALTERNATIVE_LINK_NAME[kmstest] =3D "${bindir}/kmstest"
>>>>>> +
>>>>>> +SRC_URI:append:am57xx =3D "file://0001-Add-OMAP-Card-support-for-=
AM57x-DRM.patch"
>>>>>
>>>>>
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#15167): https://linkprotect.cudasvc.com/url?a=3D=
https%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2fmessage%2f15167&c=
=3DE,1,JtVExiEgzitnnI9qeraGw9E_SzOz72-2Q2QM8GZFdv0pOYZMu3uO-r7hBg82htXSoc=
j3VT8POE6u5-g4AVaWL5GwtLF-iHfIODgin99aYA,,&typo=3D1
>>>>> Mute This Topic: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2=
f%2flists.yoctoproject.org%2fmt%2f104314617%2f6034914&c=3DE,1,-WBOvjwcnZv=
0seovJR_eJVo3cUVK4g8QVlqMZb4F0nk2HYj9rqWNk965AyXgwUCTXOp0JTjb1-1S4nNv6Hh9=
HrRoCt-KW5KQL7-c_V7zed4uT9nvwQmgrMs6s-I,&typo=3D1
>>>>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>>>>> Unsubscribe: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
lists.yoctoproject.org%2fg%2fmeta-arago%2funsub&c=3DE,1,feMuc5YJja6GtaJWP=
Lw0gp3grSLOOzxqhyzvpUa2rttsNG0zGo1TX2Z3LSqkSj_zI91F2aRQZ0Rbx_MrEnWld-9WP_=
qHdL6bC8aDsj1jUo7txAauSwnZsqCdyg,,&typo=3D1 [sinthu.raja@mistralsolutions=
.com]
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>
>>>>>
>>>>
>>>>
>>>> --
>>>> With Regards
>>>> Sinthu Raja
>>
>=20
>=20

