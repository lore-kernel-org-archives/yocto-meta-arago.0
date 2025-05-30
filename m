Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE86C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 06:40:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1019.1748587249869210885
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 May 2025 23:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=U7+VRUFx;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: p-bhagat@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54U6ek2p2614553;
	Fri, 30 May 2025 01:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748587246;
	bh=Jlc/59tWoWwQQYmdYtL3RjgOh+iKJoWtiLj8eYiASGQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U7+VRUFxa/AxuzT1lc0b7KpxQ52/2hVe6HaovJlw7ONBDuFWmDV9KQnCJZzhNv/ZB
	 gpTNc5ECTvFc5NC7yMeNHvYxY093F4rW9mn/8+A0uTUcjCzBXkHdIqx/u7hfA5dPM0
	 u4CFZ7kZWddSiH4L6eZqEuWXL4r1pzlpoiosLgEs=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54U6ekhe2695533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 30 May 2025 01:40:46 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 May 2025 01:40:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 May 2025 01:40:46 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54U6eh1H2732192;
	Fri, 30 May 2025 01:40:44 -0500
Message-ID: <f3cd9f36-9c58-4d1f-92cf-cab0c7394b67@ti.com>
Date: Fri, 30 May 2025 12:10:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [scarthgap][PATCH] meta-arago-distro: packagegroups:
 Add additional libraries for audio
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan
 Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <khasim@ti.com>
References: <20250528102948.327229-1-p-bhagat@ti.com>
 <6fed1700-8ad2-454c-b3d8-48e5e0d76bed@ti.com>
 <20250529145742.GS18383@denix.org>
 <97bcdc74-0474-4420-a15c-14b5bfec1298@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <97bcdc74-0474-4420-a15c-14b5bfec1298@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 54U6ek2p2614553
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 May 2025 06:40:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16244

Hi,

Thanks for the review. Just to add this patch also depends on meta-ti=20
patch here:
https://lists.yoctoproject.org/g/meta-ti/topic/scarthgap_patch_2_2_add/11=
3341387

So please don't merge. I will send a new version with additional changes=20
next week.


Paresh
On 29/05/25 20:57, Andrew Davis wrote:
> On 5/29/25 9:57 AM, Denys Dmytriyenko wrote:
>> On Thu, May 29, 2025 at 09:27:19AM -0500, Andrew Davis via=20
>> lists.yoctoproject.org wrote:
>>> On 5/28/25 5:29 AM, Paresh Bhagat via lists.yoctoproject.org wrote:
>>>> Add fftw and libsndfile1 libraries in multimedia package group,=20
>>>> which are
>>>> used for signal processing and audio manipulation. Update=20
>>>> corresponding
>>>> sdk target file to package header files and libraries for developmen=
t.
>>>>
>>>> Also add rpmsg DMA library for all k3 platforms and DSP offload=20
>>>> example
>>>> for am62dxx-evm.
>>>>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>>> ---
>>>> .../packagegroups/packagegroup-arago-tisdk-addons.bb | 2 ++
>>>> .../packagegroup-arago-tisdk-multimedia-sdk-target.bb | 6 ++++++
>>>> .../packagegroups/packagegroup-arago-tisdk-multimedia.bb | 6 ++++++
>>>> =C2=A0 3 files changed, 14 insertions(+)
>>>>
>>>> diff --git=20
>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-addons.bb=20
>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-addons.bb=20
>>>>
>>>> index 0d39907a..84ae1303 100644
>>>> ---=20
>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-addons.bb
>>>> +++=20
>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-addons.bb
>>>> @@ -53,6 +53,7 @@ UTILS:append:omap-a15 =3D " mmc-utils \
>>>> =C2=A0 UTILS:append:k3 =3D " mmc-utils \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch-config \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqbalance \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-librpmsg-dma \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-rpmsg-char \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-rpmsg-char-e=
xamples \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 statcol \
>>>> @@ -61,6 +62,7 @@ UTILS:append:k3 =3D " mmc-utils \
>>>> =C2=A0 UTILS:append:k3 =3D " ti-rtos-echo-test-fw"
>>>> =C2=A0 UTILS:append:am64xx =3D " pru-icss"
>>>> =C2=A0 UTILS:append:am62xx =3D " pru-icss"
>>>> +UTILS:append:am62dxx =3D " ti-librpmsg-dma-example"
>>>> =C2=A0 ARAGO_JAILHOUSE_ENABLE ?=3D "0"
>>>> =C2=A0 UTILS:append:am62xx =3D "=20
>>>> ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "jailhouse",=20
>>>> "", d)}"
>>>> diff --git=20
>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia-sdk-target.bb=20
>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia-sdk-target.bb=20
>>>>
>>>> index 95939c09..73dc48e6 100644
>>>> ---=20
>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia-sdk-target.bb
>>>> +++=20
>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia-sdk-target.bb
>>>> @@ -13,7 +13,13 @@ MULTIMEDIA:append:dra7xx =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hevc-arm-decoder-staticdev \
>>>> =C2=A0 "
>>>> +AUDIO =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 fftw-dev \
>>>> +=C2=A0=C2=A0=C2=A0 libsndfile1-dev \
>>>
>>> The -dev packages are not needed unless one wants to compile
>>> programs on the target, which we usually do not do by default.
>>>
>>> The libraries themselves will be pulled in by programs that
>>> use them, so in this case adding `ti-librpmsg-dma-example`
>>> should do that.
>>
>> No, the change is correct, as it is for the -sdk-target packagegroup.
>>
>> This is specifically targeting the linux-devkit (host side SDK) in=20
>> order to
>> install the headers and other development pieces for cross-compiling=20
>> on the
>> host. This is also mentioned in the commit message above.
>>
>
> I thought we called those packagegroups "-sdk-host"? I'm probably just=20
> confused
> here then.
>
> Side question then, how do we determine what packages should have=20
> their -dev packages
> installed in the host SDK? Could we instead make this automatic so it=20
> simply includes
> all the target libraries' -dev packages in the host SDK?
>
>> The corresponding rootfs side of the change is down below w/o -dev=20
>> packages.
>>
>
> My comment about letting the dependent libraries be pulled in by the
> application that uses them still applies to the below then.
>
> Andrew
>
>>
>>> Andrew
>>>
>>>> +"
>>>> +
>>>> =C2=A0 RDEPENDS:${PN} =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${AUDIO} \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${MULTIMEDIA} \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-gst-sdk-target \
>>>> =C2=A0 "
>>>> diff --git=20
>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia.bb=20
>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia.bb=20
>>>>
>>>> index 3aa1a051..6b0397b3 100644
>>>> ---=20
>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia.bb
>>>> +++=20
>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-multimedia.bb
>>>> @@ -11,6 +11,11 @@ MULTIMEDIA =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libcamera-gst \
>>>> =C2=A0 "
>>>> +AUDIO =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 fftw \
>>>> +=C2=A0=C2=A0=C2=A0 libsndfile1 \
>>>> +"
>>>> +
>>>> =C2=A0 MULTIMEDIA:append:arago =3D " ffmpeg mpv"
>>>> =C2=A0 MULTIMEDIA:omapl138 =3D ""
>>>> @@ -31,6 +36,7 @@ ACCEL_MM:append:omap-a15 =3D " \
>>>> =C2=A0 "
>>>> =C2=A0 RDEPENDS:${PN} =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${AUDIO} \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-gst \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${MULTIMEDIA} \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('MACHINE_FEATURE=
S', 'mmip',=20
>>>> '${ACCEL_MM}', '', d)} \

