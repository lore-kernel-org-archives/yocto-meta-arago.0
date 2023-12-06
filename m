Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7F2C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 17:03:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.38393.1701882193032617420
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 09:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=W3kl1ZxK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6H3BdX108351;
	Wed, 6 Dec 2023 11:03:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701882191;
	bh=9b46yncyaMc3OKAo5HFH2y7CKsF/6+xcQJ2fVvEtDwc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=W3kl1ZxKJBqOzRFRhiVdLx6ERFM1Gu5UdrXD7lQBy1w6OOhRo1O52x75cZDXX/a/V
	 IXFGNlmUazTnAYl8td39jWBBPs/wk+gIoNHM1ZfyVI2FsZkMP1dE9fO0sjyJNV5koP
	 Qo08Yt3kOh/S0RmUurI9ilDoIFZv+F/UVlEeDF7g=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6H3B6l069152
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Dec 2023 11:03:11 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 11:03:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 11:03:11 -0600
Received: from [10.249.36.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6H3AUC019453;
	Wed, 6 Dec 2023 11:03:10 -0600
Message-ID: <17a8d9a4-499c-4010-a5c9-e77969a377e8@ti.com>
Date: Wed, 6 Dec 2023 11:03:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [kirkstone] [PATCH] receipes-multimedia: gstreamer:
 Add patches for AM62P
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <rs@ti.com>, <k-bhargav@ti.com>,
        <a-limaye@ti.com>, <shyam.jagannathan@ti.com>, <r-ravikumar@ti.com>,
        <vijayp@ti.com>, <detheridge@ti.com>
References: <20231206144822.3194663-1-devarsht@ti.com>
 <3d7635f6-6ac7-4ec8-ae02-ab5d5e9b22d4@ti.com>
 <d729dcef-1a8e-b007-ece3-f6038c9100e0@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <d729dcef-1a8e-b007-ece3-f6038c9100e0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 3B6H3BdX108351
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 17:03:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15045

On 12/6/23 9:56 AM, Devarsh Thakkar wrote:
> Hi Andrew,
>=20
> Thanks for the review.
>=20
> On 06/12/23 20:41, Andrew Davis wrote:
>> On 12/6/23 8:48 AM, Devarsh Thakkar wrote:
>>> Add patches to prefer contiguous video format and supporting
>>> dmabuf-import mode for video decoder.
>>>
>>> This is to support use-cases involving video codec with other compone=
nts
>>> viz. GPU, Camera e.t.c.
>>>
>>
>> Why does this "support use-cases"? What is wrong with the default form=
ats?
>=20
> For 0002-v4l2-Give-preference-to-contiguous-format-if-support.patch :
> I think we have certain blocks such as ISP, Camera seem to only support
> contigous formats which doesn't go well with gstreamer v4l2 which prefe=
rs
> non-contigous by default and we fail at negotiation.
>=20
> For 0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch :
> I think this is a local patch which complements a patch already made av=
ailable
> in driver, this to support dmabuf import for the decoder.
>=20
>> Are these posted upstream to upstream gstreamer, if not why? Or should=
 we
>> instead fix the consuming software to handle the default non-contiguou=
s
>> formats better..
>>
> For 0002-v4l2-Give-preference-to-contiguous-format-if-support.patch :
>=20
> The crux of the issue is that unlike v4l2 gstreamer has only single GST=
 video
> format for both NV12 and NV12M (non-contigous) and it prefers to advert=
ise
> latter during caps negotiation. I think there was a proposal long back =
to have
> separate GST video formats for NV12 and NV12M but that didn't converge,
> perhaps they wanted to support this with a VideoMeta based scheme as pe=
r logs [0].
>=20
> Also I see other vendors also carrying similar patch like this locally.
>=20
> For 0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch :
> There again is discussion around this to support this in upstream but t=
he
> upstream patch is not yet merged [1].
>=20
> Anyways, I don't see any harm in applying these patches if they are hel=
ping
> achieve use-cases and I see they are already getting applied for other =
platforms.
>=20

This is a lot of good information, it should be in the commit message.

I do not see any harm either, this was not a NAK. But we do need to remem=
ber to
work on fixing our drivers/applications to better handle NV12M (seems lik=
e
it will remain the default in gstreamer). Otherwise you will have to supp=
ort this
hack forever, and for every distro (we have Debian now, I don't see you u=
pdating
gstreamer.deb for the same..).

Andrew

> [0] https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues/=
414
> [1] :
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/455=
0/diffs?commit_id=3Db12eaf65f489bab50917e22242758e000d69df58
>=20
> Regards
> Devarsh
>=20
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

