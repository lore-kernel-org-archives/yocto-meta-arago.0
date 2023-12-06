Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FE0C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 16:03:09 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.35263.1701878585151373198
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 08:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=BryjWW9c;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6G33OB023587;
	Wed, 6 Dec 2023 10:03:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701878584;
	bh=rx7Cjdwh2+cvTsgjRbd7vRSKbyHTtSF0nZFQmJoosfs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BryjWW9cIObFw1836dxLmaonJGrC/TDDJ8oC2kPgxA8A/UYEILn+pd9Qy52rsGio8
	 Dg7rJj9HbNlEGfV++kk1mgJ9sZUU6jy3DS74kZ9+OSIfEmBcX4lCXdThUls3h4m5Yh
	 1jO41CsAgIiDfSIyRq4vN1Kyziu4Iyefz2gV038M=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6G33ks023007
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Dec 2023 10:03:03 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 10:03:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 10:03:03 -0600
Received: from [10.24.69.154] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6G2wJY071012;
	Wed, 6 Dec 2023 10:02:59 -0600
Message-ID: <7c8a1267-ec96-4238-9026-4cdb333fab2f@ti.com>
Date: Wed, 6 Dec 2023 21:32:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [kirkstone] [PATCH] receipes-multimedia: gstreamer:
 Add patches for AM62P
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, Andrew Davis <afd@ti.com>,
        <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <rs@ti.com>, <k-bhargav@ti.com>,
        <a-limaye@ti.com>, <shyam.jagannathan@ti.com>, <vijayp@ti.com>,
        <detheridge@ti.com>
References: <20231206144822.3194663-1-devarsht@ti.com>
 <3d7635f6-6ac7-4ec8-ae02-ab5d5e9b22d4@ti.com>
 <d729dcef-1a8e-b007-ece3-f6038c9100e0@ti.com>
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <d729dcef-1a8e-b007-ece3-f6038c9100e0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 3B6G33OB023587
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 16:03:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15043

On 06/12/23 21:26, Devarsh Thakkar wrote:

> Hi Andrew,
>
> Thanks for the review.
>
> On 06/12/23 20:41, Andrew Davis wrote:
>> On 12/6/23 8:48 AM, Devarsh Thakkar wrote:
>>> Add patches to prefer contiguous video format and supporting
>>> dmabuf-import mode for video decoder.
>>>
>>> This is to support use-cases involving video codec with other compone=
nts
>>> viz. GPU, Camera e.t.c.
>>>
>> Why does this "support use-cases"? What is wrong with the default form=
ats?
> For 0002-v4l2-Give-preference-to-contiguous-format-if-support.patch :
> I think we have certain blocks such as ISP, Camera seem to only support
> contigous formats which doesn't go well with gstreamer v4l2 which prefe=
rs
> non-contigous by default and we fail at negotiation.
>
> For 0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch :
> I think this is a local patch which complements a patch already made av=
ailable
> in driver, this to support dmabuf import for the decoder.
>
>> Are these posted upstream to upstream gstreamer, if not why? Or should=
 we
>> instead fix the consuming software to handle the default non-contiguou=
s
>> formats better..
>>
> For 0002-v4l2-Give-preference-to-contiguous-format-if-support.patch :
>
> The crux of the issue is that unlike v4l2 gstreamer has only single GST=
 video
> format for both NV12 and NV12M (non-contigous) and it prefers to advert=
ise
> latter during caps negotiation. I think there was a proposal long back =
to have
> separate GST video formats for NV12 and NV12M but that didn't converge,
> perhaps they wanted to support this with a VideoMeta based scheme as pe=
r logs [0].
>
> Also I see other vendors also carrying similar patch like this locally.
>
> For 0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch :
> There again is discussion around this to support this in upstream but t=
he
> upstream patch is not yet merged [1].
>
> Anyways, I don't see any harm in applying these patches if they are hel=
ping
> achieve use-cases and I see they are already getting applied for other =
platforms.
>
> [0] https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues/=
414
> [1] :
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/455=
0/diffs?commit_id=3Db12eaf65f489bab50917e22242758e000d69df58
>
> Regards
> Devarsh
Reviewed-by: Rahul T R <r-ravikumar@ti.com>

Regards
Rahul T R
>> Andrew
>>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> ---
>>>  =C2=A0 .../gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++
>>>  =C2=A0 1 file changed, 4 insertions(+)
>>>
>>> diff --git
>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gs=
treamer1.0-plugins-good_1.20.%.bbappend
>>> index a36c9760..e14a3c93 100644
>>> ---
>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.20.%.bbappend
>>> +++
>>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.20.%.bbappend
>>> @@ -20,4 +20,8 @@ SRC_URI:append:am62axx =3D " \
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0002-v4l2-Give-preference-to-c=
ontiguous-format-if-support.patch \
>>>  =C2=A0 "
>>>  =C2=A0 +SRC_URI:append:am62pxx =3D " \
>>> +=C2=A0=C2=A0=C2=A0 file://0001-v4l2-Changes-for-DMA-Buf-import-j721s=
2.patch \
>>> +=C2=A0=C2=A0=C2=A0 file://0002-v4l2-Give-preference-to-contiguous-fo=
rmat-if-support.patch \
>>> +"
>>>  =C2=A0 PR:append =3D ".arago0"

