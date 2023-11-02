Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817D8C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 12:05:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.28961.1698926709354069904
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 05:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=lxrNpD+b;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A2C58OI025340;
	Thu, 2 Nov 2023 07:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698926708;
	bh=CgLfqxJPRvvLo949uisBnlDtu47kDRyp50H2H1dJ5t8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lxrNpD+bVznbK1cVOTQU+mS36paQ1F+FTpJ44KfgfnsOXcRoqh+/P5+GGu5j3pVzP
	 LXKhC0CsO6Dq4gM+soP/VACQepVebn7hsc3PalPQlxjxzTfW7QzwjHv+9CzBFbHnw4
	 s733NNDRD83ZEjGc2Rv709WfQgzmEPOdQ+FIpi/U=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A2C58go027138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Nov 2023 07:05:08 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Nov 2023 07:05:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Nov 2023 07:05:08 -0500
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A2C5605025474;
	Thu, 2 Nov 2023 07:05:06 -0500
Message-ID: <cae9fd73-2287-44a2-8b08-a1a45dfc3bc1@ti.com>
Date: Thu, 2 Nov 2023 17:35:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master/kirkstone][PATCH]
 packagegroup-arago-initramfs: Add e2fsprogs-mke2fs and dosfstools
Content-Language: en-US
To: <sabiya.d@mistralsolutions.com>
CC: <meta-arago@lists.yoctoproject.org>, Dasnavis Sabiya <sabiya.d@ti.com>,
        Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20231101092855.101794-1-sabiya.d@ti.com>
 <20231101092855.101794-2-sabiya.d@ti.com>
 <1235f399-9ab4-42b3-ba22-e030867c273c@ti.com>
 <CAAyKsAYjtj8MR1HE=VJ40v36LjHywvSaE0qSR4t16r2BFBaWwA@mail.gmail.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <CAAyKsAYjtj8MR1HE=VJ40v36LjHywvSaE0qSR4t16r2BFBaWwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 3A2C58OI025340
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Nov 2023 12:05:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14989

Sabiya,

On 02/11/23 12:26, Dasnavis Sabiya via lists.yoctoproject.org wrote:
> Hi Ryan,
>
> On Wed, Nov 1, 2023 at 7:08=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wro=
te:
>>
>>
>> On 11/1/2023 4:28 AM, sabiya.d@mistralsolutions.com wrote:
>>> From: Dasnavis Sabiya <sabiya.d@ti.com>
>>>
>>> Add e2fsprogs-mke2fs and dosfstools for mkfs.ext4 and mkfs.vfat
>>
>> Right now the only image that is using this package group is the tiny
>> image.  And part of the goal of the tiny image is to remain as small a=
s
>> possible.
>>
>> The intent of the tiny image is to support the initial wakeup efforts.
>> During this time the various hardware settings are not fully known and
>> so external memory and other things do not work.  The initramfs is mea=
nt
>> to provide the bare minimal OS needed to fit into the on-chip SRAM to
>> figure out those settings.  Once those settings are figured out, we
>> never go back to the tiny image.
>>
>> So what is the need for the mkfs tools in the tiny image?  Why not use=
 a
>> bigger image that has these tools in it?
>>
> There is a customer requirement to provide production programming
> solution to use arago-tiny-image to partition and program
> the boot media like eMMC. We need these utilities to format the eMMC.
> Please refer https://jira.itg.ti.com/browse/LCPD-34783


This is upstream mailing list. Please keep the TI internal jira-ids away=20
from it.

Regards,
Chirag

>>
>>> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
>>> ---
>>>    .../packagegroups/packagegroup-arago-initramfs.bb        | 9 +++++=
++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-initramfs.bb b/meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-initramfs.bb
>>> index 380cc0e3..10412784 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-initramfs.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-initramfs.bb
>>> @@ -1,4 +1,13 @@
>>>
>>>    require recipes-core/packagegroups/packagegroup-core-boot.bb
>>>
>>> +ARAGO_FSTOOLS =3D "\
>>> +    e2fsprogs-mke2fs \
>>> +    dosfstools \
>>> +    "
>>> +
>>>    RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>>> +
>>> +RDEPENDS:${PN}:append =3D "\
>>> +    ${ARAGO_FSTOOLS} \
>>> +    "
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS
> Regards,
> Dasnavis Sabiya
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14987): https://lists.yoctoproject.org/g/meta-arago=
/message/14987
> Mute This Topic: https://lists.yoctoproject.org/mt/102315218/7030289
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [c-shilw=
ant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

