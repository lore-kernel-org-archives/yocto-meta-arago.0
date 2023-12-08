Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D14DC10DC1
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 14:55:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.37312.1702047313410030509
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 08 Dec 2023 06:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=W0AsdlDj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B8EtB06077672;
	Fri, 8 Dec 2023 08:55:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702047311;
	bh=9S+WF1d6N13HK+jFrM8y38NWJKLZGQzoS5d4VoyYpH4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=W0AsdlDjix/VkXwqmlKzKND52fuOBZ56AXH0ARv0WTeWYuNZ0C5l4w083pgzDp6q/
	 +FsLQ2MbWrI4OyQa9W1uMTeQ1wt0bB6SfmMubs8H2mFXb7haUYbr+Bf+dCXCifcwWY
	 lBbDBCCY8KAy3xlMxJVFsAfI6vHS7PfJ1vP7+5DU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B8EtBcm016816
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Dec 2023 08:55:11 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Dec 2023 08:55:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Dec 2023 08:55:11 -0600
Received: from [10.249.38.142] ([10.249.38.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B8EtBqC102303;
	Fri, 8 Dec 2023 08:55:11 -0600
Message-ID: <00f90f45-2f2c-4540-b973-e57099bce742@ti.com>
Date: Fri, 8 Dec 2023 08:55:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [kirkstone] [PATCH] receipes-multimedia: gstreamer:
 Add patches for AM62P
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <rs@ti.com>, <k-bhargav@ti.com>,
        <a-limaye@ti.com>, <shyam.jagannathan@ti.com>, <r-ravikumar@ti.com>,
        <vijayp@ti.com>, <detheridge@ti.com>
References: <20231206144822.3194663-1-devarsht@ti.com>
 <3d7635f6-6ac7-4ec8-ae02-ab5d5e9b22d4@ti.com>
 <d729dcef-1a8e-b007-ece3-f6038c9100e0@ti.com>
 <17a8d9a4-499c-4010-a5c9-e77969a377e8@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17a8d9a4-499c-4010-a5c9-e77969a377e8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 3B8EtB06077672
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 08 Dec 2023 14:55:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15051



On 12/6/2023 11:03 AM, Andrew Davis wrote:
> On 12/6/23 9:56 AM, Devarsh Thakkar wrote:
>> Hi Andrew,
>>
>> Thanks for the review.
>>
>> On 06/12/23 20:41, Andrew Davis wrote:
>>> On 12/6/23 8:48 AM, Devarsh Thakkar wrote:
>>>> Add patches to prefer contiguous video format and supporting
>>>> dmabuf-import mode for video decoder.
>>>>
>>>> This is to support use-cases involving video codec with other=20
>>>> components
>>>> viz. GPU, Camera e.t.c.
>>>>
>>>
>>> Why does this "support use-cases"? What is wrong with the default=20
>>> formats?
>>
>> For 0002-v4l2-Give-preference-to-contiguous-format-if-support.patch :
>> I think we have certain blocks such as ISP, Camera seem to only suppor=
t
>> contigous formats which doesn't go well with gstreamer v4l2 which pref=
ers
>> non-contigous by default and we fail at negotiation.
>>
>> For 0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch :
>> I think this is a local patch which complements a patch already made=20
>> available
>> in driver, this to support dmabuf import for the decoder.
>>
>>> Are these posted upstream to upstream gstreamer, if not why? Or=20
>>> should we
>>> instead fix the consuming software to handle the default non-contiguo=
us
>>> formats better..
>>>
>> For 0002-v4l2-Give-preference-to-contiguous-format-if-support.patch :
>>
>> The crux of the issue is that unlike v4l2 gstreamer has only single=20
>> GST video
>> format for both NV12 and NV12M (non-contigous) and it prefers to=20
>> advertise
>> latter during caps negotiation. I think there was a proposal long back=
=20
>> to have
>> separate GST video formats for NV12 and NV12M but that didn't converge=
,
>> perhaps they wanted to support this with a VideoMeta based scheme as=20
>> per logs [0].
>>
>> Also I see other vendors also carrying similar patch like this locally.
>>
>> For 0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch :
>> There again is discussion around this to support this in upstream but =
the
>> upstream patch is not yet merged [1].
>>
>> Anyways, I don't see any harm in applying these patches if they are=20
>> helping
>> achieve use-cases and I see they are already getting applied for other=
=20
>> platforms.
>>
>=20
> This is a lot of good information, it should be in the commit message.

Devarsh, can you put together a v2 with the above information in the=20
commit message?  History like this is very helpful to keep track of so=20
that we do not lose it to the passage of time.


> I do not see any harm either, this was not a NAK. But we do need to=20
> remember to
> work on fixing our drivers/applications to better handle NV12M (seems l=
ike
> it will remain the default in gstreamer). Otherwise you will have to=20
> support this
> hack forever, and for every distro (we have Debian now, I don't see you=
=20
> updating
> gstreamer.deb for the same..).
>=20
> Andrew
>=20
>> [0]=20
>> https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues/414
>> [1] :
>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/45=
50/diffs?commit_id=3Db12eaf65f489bab50917e22242758e000d69df58
>>
>> Regards
>> Devarsh
>>
>>> Andrew
>>>
>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>> ---
>>>> =C2=A0=C2=A0 .../gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4=20
>>>> ++++
>>>> =C2=A0=C2=A0 1 file changed, 4 insertions(+)
>>>>
>>>> diff --git
>>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/g=
streamer1.0-plugins-good_1.20.%.bbappend
>>>> index a36c9760..e14a3c93 100644
>>>> ---
>>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good_1.20.%.bbappend
>>>> +++
>>>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good_1.20.%.bbappend
>>>> @@ -20,4 +20,8 @@ SRC_URI:append:am62axx =3D " \
>>>>       =20
>>>> file://0002-v4l2-Give-preference-to-contiguous-format-if-support.pat=
ch \
>>>> =C2=A0=C2=A0 "
>>>> =C2=A0=C2=A0 +SRC_URI:append:am62pxx =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 file://0001-v4l2-Changes-for-DMA-Buf-import-j721=
s2.patch \
>>>> +   =20
>>>> file://0002-v4l2-Give-preference-to-contiguous-format-if-support.pat=
ch \
>>>> +"
>>>> =C2=A0=C2=A0 PR:append =3D ".arago0"

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

