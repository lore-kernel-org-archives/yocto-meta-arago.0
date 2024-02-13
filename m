Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8F9C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 08:28:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.7061.1707812896966858528
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 00:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=hZTGO/jE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41D8S6ZL038618;
	Tue, 13 Feb 2024 02:28:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707812886;
	bh=qFPdeCsuAT6OZ/Xkuca+V+7Ya34WJ5qUneqyV19wRcw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hZTGO/jEacHTBlj6fb8gV+oWEXAvsm+WI5kHyM4vuk/07UNBgcIjrbrgEUfWMqzDx
	 x1URS5VfQ/vxYd+wHx4j1WTYoxdA6Kkf4y7O39kTLcSc0a9Mx7VbNSiCjdSj6hwZVk
	 6YVuknehX/08nNg7Zwl0B3qeX4QnE3LqoZPyx1Bs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41D8S60R024606
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Feb 2024 02:28:06 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Feb 2024 02:28:05 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Feb 2024 02:28:05 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41D8S2qO104292;
	Tue, 13 Feb 2024 02:28:03 -0600
Message-ID: <528407e1-99a9-eae2-e195-927afce038f3@ti.com>
Date: Tue, 13 Feb 2024 13:58:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][kirkstone][PATCH] graphics: kms++: Enable OmapCard
 support in pykms library
Content-Language: en-US
To: Sinthu Raja M <sinthu.raja@mistralsolutions.com>, <afd@ti.com>,
        "Kumar,
 Udit" <u-kumar1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Sinthu Raja <sinthu.raja@ti.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>
References: <20240212163122.20728-1-sinthu.raja@ti.com>
 <0bf9ab21-a7dd-478f-b406-888115e9c727@ti.com>
 <CAEd-yTR7K3cDcuVQsV-hoebfF-sHumyXf3mnkK+FWHu1tg=pZQ@mail.gmail.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <CAEd-yTR7K3cDcuVQsV-hoebfF-sHumyXf3mnkK+FWHu1tg=pZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 41D8S6ZL038618
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 08:28:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15174

+Tomi.

Hi Sinthu, Andrew,

On 13/02/24 12:11, Sinthu Raja M wrote:
> On Mon, Feb 12, 2024 at 10:36=E2=80=AFPM Andrew Davis via
> lists.yoctoproject.org <afd=3Dti.com@lists.yoctoproject.org> wrote:
>>
>> On 2/12/24 10:31 AM, Sinthu Raja M via https://linkprotect.cudasvc.com=
/url?a=3Dhttps%3a%2f%2flists.yoctoproject.org&c=3DE,1,kscN3qPdyfL8tn7Fw-O=
JJ9CSmKtK9jbcAAMJp2zK3KmVWYUG53IuOFVHam_hakwWdc6Wz-dhlHPCRsgWyFh-wNcu5rYm=
RVFvsvOAzklEyTdmmp7vwy5aHK4QNX0,&typo=3D1 wrote:
>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>
>>> AM57x platform supports OMAP DRM. By default the pykms library
>>> disabled the OmapCard support. Enable the same by defining the
>>> HAS_LIBDRM_OMAP as a compiler flags
>>
>> What project uses this feature? I didn't think there were any
>> remaining users of the libdrm OMAP specific framebuffers.
>>
> I am not sure about the users of the libdrm, As mentioned AM57x SDK
> uses OMAP DRM and all the DSS test cases from LTP that use the PYKMS
> library are failing due to the OmapCard property being unavailable.
> Devarsh/Udit,
> Please help in understanding the project that uses this feature.
>> Andrew

I am not sure I got the question but to elaborate libdrm is a basic compo=
nent
required and enabled for all TI platforms involving display as it provide=
s
test utilities and drm/kms helper libs.
I think there are multiple package-groups referring this package along wi=
th
some other packages viz gstreamer.

Coming back to kms++, this too is being used for all TI platforms involvi=
ng
display, it is referring to https://github.com/tomba/kmsxx and as Sinthu
mentioned it is being used internally for ltp-ddt based tests and externa=
lly
for SDK they provide some test utilities viz. kmstest which are already b=
eing
referred in SDK [1]

>>
>>>The patch looks, ok to me as it only enables/impacts AM57x.

>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>

Reviewed-by" Devarsh Thakkar <devarsht@ti.com>

[1] :
https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/expo=
rts/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Display/DSS7=
.html?highlight=3Dkmstest

Regards
Devarsh
>>> ---
>>>   ...-Add-OMAP-Card-support-for-AM57x-DRM.patch | 26 ++++++++++++++++=
+++
>>>   .../recipes-graphics/kms++/kms++https://linkprotect.cudasvc.com/url=
?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Vzf5PFTG5SYCJ06T3yo-D9goAOsCzXx6j38cES=
yqUKm6bW2m0vjadcXFO4tYk7Z4AoCEzcxMcfH2yWcmR7AGAI3iS8908081V99Qp3OI&typo=3D=
1       |  2 ++
>>>   2 files changed, 28 insertions(+)
>>>   create mode 100644 meta-arago-extras/recipes-graphics/kms++/kms++/0=
001-Add-OMAP-Card-support-for-AM57x-DRM.patch
>>>
>>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-=
OMAP-Card-support-for-AM57x-DRM.patch b/meta-arago-extras/recipes-graphic=
s/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
>>> new file mode 100644
>>> index 00000000..48c9068d
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Ca=
rd-support-for-AM57x-DRM.patch
>>> @@ -0,0 +1,26 @@
>>> +From bc6e89ea8695c7e94eb6892755e47781682e28a7 Mon Sep 17 00:00:00 20=
01
>>> +From: Sinthu Raja <sinthu.raja@ti.com>
>>> +Date: Mon, 12 Feb 2024 21:47:52 +0530
>>> +Subject: [PATCH] Add OMAP Card support for AM57x DRM
>>> +
>>> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>> +---
>>> + py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmeso=
n.build&c=3DE,1,3VCAN204TlXYB924QYhLMMEmS93WM1kI_7WmS3ER9jLN5pLix8cagolTr=
EvejlCBBH-6kJs1N3t2LVtFoPbZ4xidt6HUBa1uunFPxUjOug,,&typo=3D1 | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%=
3a%2f%2fmeson.build&c=3DE,1,o8lmqQiC6J9IgNrnPW02TiqhU9slv8AROCpl-FW_llYTM=
ZRIt7B9DNgXlwyTsVRybqt9JrdnUp4lFj2mnvG1JorIq2frQLUKKiSQMRkVSQ,,&typo=3D1 =
b/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmeson.bu=
ild&c=3DE,1,7abaHpO_lRHPBP8JIr9MMmwEJgbhJGQvzEk94uebIZ78HMKGvnPd6AJXiQWn3=
o9mvRW19xJfgDPCCtq6B8meJ2GtWsdRyTyaY91OqtPxm_kCY0fu&typo=3D1
>>> +index de05d12..ce6c013 100644
>>> +--- a/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2=
fmeson.build&c=3DE,1,CTfRZi_8_1fCYZFyzQLhaCWcgOvqcoQSrttD13hjpdCtg7LH0rbA=
pgfkSXMafnXyhTGtYbRdKqEDzSyZdI6MR-TAodV5cz3gE0IVAe_48k4,&typo=3D1
>>> ++++ b/py/pykms/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2=
fmeson.build&c=3DE,1,ap4x9zvJd5ZfQQuzZtnoEYjDrKN8fm30VUvYKc4WBVkCj_QiawTv=
IR955h0RVe68z90BAoT47PzbUKGf-lahu3TSAco_s1ek0G5jY6j5KVUxOF9fxIXAdw,,&typo=
=3D1
>>> +@@ -49,7 +49,7 @@ if get_option('libutils')
>>> +     pykms_deps +=3D [ libkmsxxutil_dep ]
>>> + endif
>>> +
>>> +-pykms_args =3D [ '-fvisibility=3Dhidden' ]
>>> ++pykms_args =3D [ '-fvisibility=3Dhidden' , '-DHAS_LIBDRM_OMAP' ]
>>> +
>>> + destdir =3D get_option('libdir') / 'python' + py3_dep.version() / '=
site-packages/pykms'
>>> +
>>> +--
>>> +2.36.1
>>> +
>>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++https://li=
nkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,kFBJhILkClnWL=
QZ1VsDVvzHIYdIol8wO3afczk4Uen3PzHc7X2U3cFd80w0DSM49pPdFlDU1Dh9UqRonCd0KwA=
F9PRrOlUGk2T9QBEpNdkvMcV2HHHoauGuo&typo=3D1 b/meta-arago-extras/recipes-g=
raphics/kms++/kms++https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
_git.bb&c=3DE,1,kPor2mDuLLEo3MFONlyaNkM5rbbv6jkGQwmvO4IObk5bECLVJ0_YL9LvE=
e9tr9h6BuBgSYfYwGvRguwCdZ4UYFwMr0tGWXeGYUGzjohMtLQQ7Jbk&typo=3D1
>>> index 2c0abaa7..010a1f0a 100644
>>> --- a/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprote=
ct.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,mK1lB4bE0aDJdjlv1Dc8=
55v3V2yeoxk-ddZjn4hISG1jQ5RjqUCrJVFni5oTDgDY2hpB_L3vmOnB8HNgySj_Zm9H4RBaP=
urZv74MrbJVEDVgJrQ9ZRHYQvtR-fE,&typo=3D1
>>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++https://linkprote=
ct.cudasvc.com/url?a=3Dhttps%3a%2f%2f_git.bb&c=3DE,1,Edi_h690Q45x6mNZKj7H=
q8nO-rj_27k6LCB1QwLmJcs-f2MrjyyZVMPUAoOftvQrGsG6noSFYTuJ_lKzyZ1rVw1oOfqOP=
vRP3sJAIW5uSzCZCdiX4g,,&typo=3D1
>>> @@ -28,3 +28,5 @@ inherit python3native meson pkgconfig update-altern=
atives
>>>   ALTERNATIVE_PRIORITY =3D "100"
>>>   ALTERNATIVE:${PN} =3D "kmstest"
>>>   ALTERNATIVE_LINK_NAME[kmstest] =3D "${bindir}/kmstest"
>>> +
>>> +SRC_URI:append:am57xx =3D "file://0001-Add-OMAP-Card-support-for-AM5=
7x-DRM.patch"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#15167): https://linkprotect.cudasvc.com/url?a=3Dht=
tps%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2fmessage%2f15167&c=3D=
E,1,JtVExiEgzitnnI9qeraGw9E_SzOz72-2Q2QM8GZFdv0pOYZMu3uO-r7hBg82htXSocj3V=
T8POE6u5-g4AVaWL5GwtLF-iHfIODgin99aYA,,&typo=3D1
>> Mute This Topic: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2=
flists.yoctoproject.org%2fmt%2f104314617%2f6034914&c=3DE,1,-WBOvjwcnZv0se=
ovJR_eJVo3cUVK4g8QVlqMZb4F0nk2HYj9rqWNk965AyXgwUCTXOp0JTjb1-1S4nNv6Hh9HrR=
oCt-KW5KQL7-c_V7zed4uT9nvwQmgrMs6s-I,&typo=3D1
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flis=
ts.yoctoproject.org%2fg%2fmeta-arago%2funsub&c=3DE,1,feMuc5YJja6GtaJWPLw0=
gp3grSLOOzxqhyzvpUa2rttsNG0zGo1TX2Z3LSqkSj_zI91F2aRQZ0Rbx_MrEnWld-9WP_qHd=
L6bC8aDsj1jUo7txAauSwnZsqCdyg,,&typo=3D1 [sinthu.raja@mistralsolutions.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>=20
>=20
> --
> With Regards
> Sinthu Raja

