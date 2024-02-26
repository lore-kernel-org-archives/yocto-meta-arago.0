Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2480C54E41
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:51:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.21928.1708959079723430787
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 06:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=fWLUBAWA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41QEpC5q011809;
	Mon, 26 Feb 2024 08:51:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708959072;
	bh=3myGo/RVdN6S9mrFncNsUBVzsC0IqsGB8E/PB95TX7s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fWLUBAWAfTCW7L3lVbRc9aYvzJBDdNZ8yt6PX+OYkkKE0Leo1y6kUnJ33uNrec940
	 VlARGHaqLnpm5jEp0AICHJBzjd6JrU316PQClXudclzA/pE+Oo3mG9uN1bUYl5yv96
	 kNV1IFstP2UuMlX2BHslq0Ah+0GH/onK8SIE8aIc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41QEpCvH017973
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Feb 2024 08:51:12 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Feb 2024 08:51:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Feb 2024 08:51:12 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41QEp92H041776;
	Mon, 26 Feb 2024 08:51:10 -0600
Message-ID: <c3b9f21b-cf7e-2ddd-f58c-f33623367aac@ti.com>
Date: Mon, 26 Feb 2024 20:21:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][kirkstone][PATCH] graphics: kms++: Enable OmapCard
 support in pykms library
Content-Language: en-US
To: Andrew Davis <afd@ti.com>,
        Sinthu Raja M
	<sinthu.raja@mistralsolutions.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Sinthu Raja
	<sinthu.raja@ti.com>
References: <20240212163122.20728-1-sinthu.raja@ti.com>
 <0bf9ab21-a7dd-478f-b406-888115e9c727@ti.com>
 <CAEd-yTR7K3cDcuVQsV-hoebfF-sHumyXf3mnkK+FWHu1tg=pZQ@mail.gmail.com>
 <528407e1-99a9-eae2-e195-927afce038f3@ti.com>
 <d4f5ddee-8e59-48d9-83fb-120f63dbd84f@ideasonboard.com>
 <CAEd-yTTdV5U+xwE=qOSsFtSpPT-f_kYtihx=vzY5nGxZQbqLhQ@mail.gmail.com>
 <8e6d3da2-5547-4a5b-ad30-3a3278ff07f3@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <8e6d3da2-5547-4a5b-ad30-3a3278ff07f3@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 41QEpC5q011809
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Feb 2024 14:51:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15209

Hi Andrew, Sinthu,

On 13/02/24 21:35, Andrew Davis wrote:
> On 2/13/24 3:27 AM, Sinthu Raja M wrote:
>> On Tue, Feb 13, 2024 at 2:17=E2=80=AFPM Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>
>>> On 13/02/2024 10:28, Devarsh Thakkar wrote:
>>>> +Tomi.
>>>>
>>>> Hi Sinthu, Andrew,
>>>>
>>>> On 13/02/24 12:11, Sinthu Raja M wrote:
>>>>> On Mon, Feb 12, 2024 at 10:36=E2=80=AFPM Andrew Davis via
>>>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctopr=
oject.org&c=3DE,1,2DS7l4Ll0Z71XJHz-8l2SWUjg27KV1rvg3XF0AMYsnwQk1_ugC9LSBc=
JkDKPbky1ukBO3cDGKWYMyz4aGetIoLWygeMbGXIVsFLmFXec-9wrwA,,&typo=3D1 <afd=3D=
ti.com@lists.yoctoproject.org> wrote:
>>>>>>
>>>>>> On 2/12/24 10:31 AM, Sinthu Raja M via
>>>>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctop=
roject.org&c=3DE,1,kscN3qPdyfL8tn7Fw-OJJ9CSmKtK9jbcAAMJp2zK3KmVWYUG53IuOF=
VHam_hakwWdc6Wz-dhlHPCRsgWyFh-wNcu5rYmRVFvsvOAzklEyTdmmp7vwy5aHK4QNX0,&ty=
po=3D1 wrote:
>>>>>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>>>>>
>>>>>>> AM57x platform supports OMAP DRM. By default the pykms library
>>>>>>> disabled the OmapCard support. Enable the same by defining the
>>>>>>> HAS_LIBDRM_OMAP as a compiler flags
>>>>>>
>>>>>> What project uses this feature? I didn't think there were any
>>>>>> remaining users of the libdrm OMAP specific framebuffers.
>>>>>>
>>>>> I am not sure about the users of the libdrm, As mentioned AM57x SDK
>>>>> uses OMAP DRM and all the DSS test cases from LTP that use the PYKM=
S
>>>>> library are failing due to the OmapCard property being unavailable.
>>>>> Devarsh/Udit,
>>>>> Please help in understanding the project that uses this feature.
>>>
>>> The only reason to use OmapCard and OmapFramebuffer is to use the TIL=
ER.
>>> If none of the users need TILER, there's no reason to enable the OMAP
>>> support. But no harm either.
>>>
>>> That said, kms++ automatically builds in the omap support if the
>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flibdrm_omap.so&=
c=3DE,1,F-fI2ZgbaQwMkyR6160HbqwP2KIOJTL1ocsF1DbtMr1q-ikrrR7qt-6RBMAiodzw_=
sRQMFEoBWSLDqy1FRCACt9HWnTxKqq0f8ylrjtF-_o-kw,,&typo=3D1 is found, and it=
 also enables the OMAP support for the
>>> python bindings. So it should "just work". However, the kms++ meson
>>> files had a bug and the OMAP support for py bindings was not enabled
>>> correctly. This has been fixed quite a while ago in upstream kms++.
>>>
>>> Looking at the patch, if I read it right, it doesn't look correct as =
it
>>> unconditionally enables HAS_LIBDRM_OMAP. HAS_LIBDRM_OMAP should only =
be
>>> set if the libdrm_omap is available.
>>>
>>> =C2=A0=C2=A0 Tomi
>>
>> Thanks, Tomi.
>>
>> Denys/Andrew,
>> As Tomi mentioned the fix is available in the below commit of=C2=A0 [1=
].
>> 2236a8ccacdfed5ff5f6873ed6618eccf570193d. Please suggest in that case
>> if is it fine to change the SRCREV of this recipe or just backport the
>> patch.
>=20
> If there is a fix upstream then bump the SRCREV to the latest.
>=20
>>
>> [1]:=C2=A0 https://github.com/tomba/kmsxx
>>
>> Sinthu Raja.
>>>
>>>>>> Andrew
>>>>
>>>> I am not sure I got the question but to elaborate libdrm is a basic =
component
>>>> required and enabled for all TI platforms involving display as it pr=
ovides
>>>> test utilities and drm/kms helper libs.
>=20
> I was asking specifically about the OmapCard feature, not libdrm itself.
> Do any of our demos or tests still use that, if so we should fix that,
> OmapCard/OmapFramebuffer should be deprecated out.
>=20

I discussed with Tomi regarding this and he said that omap card feature i=
s
only enabled if libdrm_omap is present which can be used by applications =
to do
rotation and stuff.

If libdrm_omap is not present then pykms (kms++ library) automatically
disables omapcard.

So we don't think it needs to be deprecated explicitly at pykms level whe=
n
driver and middleware are already supporting it and pykms automatically
disables omapcard when libdrm_omap is not present.

Tomi, please add if I missed any of the points we discussed.

Regards
Devarsh

> Thanks,
> Andrew
>=20
>>>> I think there are multiple package-groups referring this package alo=
ng with
>>>> some other packages viz gstreamer.
>>>>
>>>> Coming back to kms++, this too is being used for all TI platforms in=
volving
>>>> display, it is referring to https://github.com/tomba/kmsxx and as Si=
nthu
>>>> mentioned it is being used internally for ltp-ddt based tests and ex=
ternally
>>>> for SDK they provide some test utilities viz. kmstest which are alre=
ady being
>>>> referred in SDK [1]
>>>>
>>>>>>
>>>>>>> The patch looks, ok to me as it only enables/impacts AM57x.
>>>>
>>>>>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>>>
>>>> Reviewed-by" Devarsh Thakkar <devarsht@ti.com>
>>>>
>>>> [1] :
>>>> https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08=
/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Display=
/DSS7.html?highlight=3Dkmstest
>>>>
>>>> Regards
>>>> Devarsh
>>>>>>> ---
>>>>>>> =C2=A0=C2=A0=C2=A0 ...-Add-OMAP-Card-support-for-AM57x-DRM.patch =
| 26 +++++++++++++++++++
>>>>>>> =C2=A0=C2=A0=C2=A0
>>>>>>> .../recipes-graphics/kms++/kms++https://linkprotect.cudasvc.com/u=
rl?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Vzf5PFTG5SYCJ06T3yo-D9goAOsCzXx6j38c=
ESyqUKm6bW2m0vjadcXFO4tYk7Z4AoCEzcxMcfH2yWcmR7AGAI3iS8908081V99Qp3OI&typo=
=3D1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>>>>>> =C2=A0=C2=A0=C2=A0 2 files changed, 28 insertions(+)
>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644
>>>>>>> meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card=
-support-for-AM57x-DRM.patch
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Ca=
rd-support-for-AM57x-DRM.patch b/meta-arago-extras/recipes-graphics/kms++=
/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
>>>>>>> new file mode 100644
>>>>>>> index 00000000..48c9068d
>>>>>>> --- /dev/null
>>>>>>> +++
>>>>>>> b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Ca=
rd-support-for-AM57x-DRM.patch
>>>>>>> @@ -0,0 +1,26 @@
>>>>>>> +From bc6e89ea8695c7e94eb6892755e47781682e28a7 Mon Sep 17 00:00:0=
0 2001
>>>>>>> +From: Sinthu Raja <sinthu.raja@ti.com>
>>>>>>> +Date: Mon, 12 Feb 2024 21:47:52 +0530
>>>>>>> +Subject: [PATCH] Add OMAP Card support for AM57x DRM
>>>>>>> +
>>>>>>> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>>>>>> +---
>>>>>>> +
>>>>>>> py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fme=
son.build&c=3DE,1,3VCAN204TlXYB924QYhLMMEmS93WM1kI_7WmS3ER9jLN5pLix8cagol=
TrEvejlCBBH-6kJs1N3t2LVtFoPbZ4xidt6HUBa1uunFPxUjOug,,&typo=3D1 | 2 +-
>>>>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>> +
>>>>>>> +diff --git
>>>>>>> a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
meson.build&c=3DE,1,o8lmqQiC6J9IgNrnPW02TiqhU9slv8AROCpl-FW_llYTMZRIt7B9D=
NgXlwyTsVRybqt9JrdnUp4lFj2mnvG1JorIq2frQLUKKiSQMRkVSQ,,&typo=3D1 b/py/pyk=
ms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmeson.build&c=3D=
E,1,7abaHpO_lRHPBP8JIr9MMmwEJgbhJGQvzEk94uebIZ78HMKGvnPd6AJXiQWn3o9mvRW19=
xJfgDPCCtq6B8meJ2GtWsdRyTyaY91OqtPxm_kCY0fu&typo=3D1
>>>>>>> +index de05d12..ce6c013 100644
>>>>>>> +---
>>>>>>> a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
meson.build&c=3DE,1,CTfRZi_8_1fCYZFyzQLhaCWcgOvqcoQSrttD13hjpdCtg7LH0rbAp=
gfkSXMafnXyhTGtYbRdKqEDzSyZdI6MR-TAodV5cz3gE0IVAe_48k4,&typo=3D1
>>>>>>> ++++
>>>>>>> b/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
meson.build&c=3DE,1,ap4x9zvJd5ZfQQuzZtnoEYjDrKN8fm30VUvYKc4WBVkCj_QiawTvI=
R955h0RVe68z90BAoT47PzbUKGf-lahu3TSAco_s1ek0G5jY6j5KVUxOF9fxIXAdw,,&typo=3D=
1
>>>>>>> +@@ -49,7 +49,7 @@ if get_option('libutils')
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pykms_deps +=3D [ libkmsxxutil_dep ]
>>>>>>> + endif
>>>>>>> +
>>>>>>> +-pykms_args =3D [ '-fvisibility=3Dhidden' ]
>>>>>>> ++pykms_args =3D [ '-fvisibility=3Dhidden' , '-DHAS_LIBDRM_OMAP' =
]
>>>>>>> +
>>>>>>> + destdir =3D get_option('libdir') / 'python' + py3_dep.version()=
 /
>>>>>>> 'site-packages/pykms'
>>>>>>> +
>>>>>>> +--
>>>>>>> +2.36.1
>>>>>>> +
>>>>>>> diff --git
>>>>>>> a/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprote=
ct.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,kFBJhILkClnWLQZ1VsDV=
vzHIYdIol8wO3afczk4Uen3PzHc7X2U3cFd80w0DSM49pPdFlDU1Dh9UqRonCd0KwAF9PRrOl=
UGk2T9QBEpNdkvMcV2HHHoauGuo&typo=3D1 b/meta-arago-extras/recipes-graphics=
/kms++/kms++https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb=
&c=3DE,1,kPor2mDuLLEo3MFONlyaNkM5rbbv6jkGQwmvO4IObk5bECLVJ0_YL9LvEe9tr9h6=
BuBgSYfYwGvRguwCdZ4UYFwMr0tGWXeGYUGzjohMtLQQ7Jbk&typo=3D1
>>>>>>> index 2c0abaa7..010a1f0a 100644
>>>>>>> ---
>>>>>>> a/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprote=
ct.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,mK1lB4bE0aDJdjlv1Dc8=
55v3V2yeoxk-ddZjn4hISG1jQ5RjqUCrJVFni5oTDgDY2hpB_L3vmOnB8HNgySj_Zm9H4RBaP=
urZv74MrbJVEDVgJrQ9ZRHYQvtR-fE,&typo=3D1
>>>>>>> +++
>>>>>>> b/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprote=
ct.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Edi_h690Q45x6mNZKj7H=
q8nO-rj_27k6LCB1QwLmJcs-f2MrjyyZVMPUAoOftvQrGsG6noSFYTuJ_lKzyZ1rVw1oOfqOP=
vRP3sJAIW5uSzCZCdiX4g,,&typo=3D1
>>>>>>> @@ -28,3 +28,5 @@ inherit python3native meson pkgconfig
>>>>>>> update-alternatives
>>>>>>> =C2=A0=C2=A0=C2=A0 ALTERNATIVE_PRIORITY =3D "100"
>>>>>>> =C2=A0=C2=A0=C2=A0 ALTERNATIVE:${PN} =3D "kmstest"
>>>>>>> =C2=A0=C2=A0=C2=A0 ALTERNATIVE_LINK_NAME[kmstest] =3D "${bindir}/=
kmstest"
>>>>>>> +
>>>>>>> +SRC_URI:append:am57xx =3D
>>>>>>> "file://0001-Add-OMAP-Card-support-for-AM57x-DRM.patch"
>>>>>>
>>>>>>
>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>> Links: You receive all messages sent to this group.
>>>>>> View/Reply Online (#15167):
>>>>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctop=
roject.org%2fg%2fmeta-arago%2fmessage%2f15167&c=3DE,1,JtVExiEgzitnnI9qera=
Gw9E_SzOz72-2Q2QM8GZFdv0pOYZMu3uO-r7hBg82htXSocj3VT8POE6u5-g4AVaWL5GwtLF-=
iHfIODgin99aYA,,&typo=3D1
>>>>>> Mute This Topic:
>>>>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctop=
roject.org%2fmt%2f104314617%2f6034914&c=3DE,1,-WBOvjwcnZv0seovJR_eJVo3cUV=
K4g8QVlqMZb4F0nk2HYj9rqWNk965AyXgwUCTXOp0JTjb1-1S4nNv6Hh9HrRoCt-KW5KQL7-c=
_V7zed4uT9nvwQmgrMs6s-I,&typo=3D1
>>>>>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>>>>>> Unsubscribe:
>>>>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctop=
roject.org%2fg%2fmeta-arago%2funsub&c=3DE,1,feMuc5YJja6GtaJWPLw0gp3grSLOO=
zxqhyzvpUa2rttsNG0zGo1TX2Z3LSqkSj_zI91F2aRQZ0Rbx_MrEnWld-9WP_qHdL6bC8aDsj=
1jUo7txAauSwnZsqCdyg,,&typo=3D1 [sinthu.raja@mistralsolutions.com]
>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>> --=20
>>>>> With Regards
>>>>> Sinthu Raja
>>>
>>
>>

