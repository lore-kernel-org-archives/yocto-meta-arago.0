Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF7BC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 15:34:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.15772.1706024085620825254
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jan 2024 07:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Qz6dsYji;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40NFYi82081524
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 09:34:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706024084;
	bh=+/ogpv8JrD6TvNSmji4dWBIZ1rdOzRZFLW0fy6I992M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Qz6dsYjiPXWTxLtCGEHkDt3kZ4aaG4UzN3tz92sBcDxurZQc37zjxrCvJB0UlLkaf
	 H2DB/HH23Q3dEalJhyqpYtswXNPHHq5ZMkJmESi39OL9IeAJtF2a80YSfYc8Hc13yr
	 4X2I4rjTYlNuHBImdnCsjDni3bcDE9ACiXYRpX+Y=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40NFYiwk072539
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 09:34:44 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jan 2024 09:34:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jan 2024 09:34:44 -0600
Received: from [10.24.69.154] (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40NFYgGh055633;
	Tue, 23 Jan 2024 09:34:42 -0600
Message-ID: <fc9cb1fd-f196-493d-81db-a2a0482c7d23@ti.com>
Date: Tue, 23 Jan 2024 21:04:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH 2/2]
 gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI capture
To: Devarsh Thakkar <devarsht@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <j-luthra@ti.com>, <denys@ti.com>, <b-brnich@ti.com>,
        <p-mantena@ti.com>
References: <20240122162917.822825-1-r-ravikumar@ti.com>
 <20240122162917.822825-3-r-ravikumar@ti.com>
 <000a8c48-7f85-9a32-216a-4cae407c86ee@ti.com>
 <04659a76-06fb-4eef-84c9-ce3efaa08cb8@ti.com>
 <1986d806-eb3f-1336-9aa6-008473f48cf7@ti.com>
Content-Language: en-US
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <1986d806-eb3f-1336-9aa6-008473f48cf7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 40NFYi82081524
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 15:34:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15085

Hi Devarsh,

On 23/01/24 20:38, Devarsh Thakkar wrote:
> Hi Rahul,
>
> Thanks for the quick response.
>
> On 23/01/24 20:33, Rahul T R wrote:
>> Hi Devarsh,
>>
>> Thanks for the review !
>>
>>
>> On 23/01/24 20:05, Devarsh Thakkar wrote:
>>> Hi Rahul,
>>>
>>> Thanks for the patch.
>>>
>>> On 22/01/24 21:59, Rahul T R wrote:
>>>> This is required to avoid the frame drops and increase the tolrence
>>>> for CSI capture using gsteamer
>>>>
>>>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>>>> ---
>>>>  =C2=A0 ...1-gstv4l2object-Increase-min-buffers.patch | 29 +++++++++=
++++++++++
>>>>  =C2=A0 .../gstreamer1.0-plugins-good_1.20.%.bbappend |=C2=A0 3 +-
>>>>  =C2=A0 2 files changed, 31 insertions(+), 1 deletion(-)
>>>>  =C2=A0 create mode 100644
>>>> meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
good/0001-gstv4l2object-Increase-min-buffers.patch
>>>>
>>>> diff --git
>>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0001-gstv4l2object-Increase-min-buffers.patch b/meta-arago-extras/=
recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object=
-Increase-min-buffers.patch
>>>> new file mode 100644
>>>> index 00000000..f9ff4faa
>>>> --- /dev/null
>>>> +++
>>>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0001-gstv4l2object-Increase-min-buffers.patch
>>>> @@ -0,0 +1,29 @@
>>>> +From 9c5e0ee19be372c0477a509889d76ceaf97bdc87 Mon Sep 17 00:00:00 2=
001
>>>> +From: Rahul T R <r-ravikumar@ti.com>
>>>> +Date: Tue, 10 Oct 2023 14:42:13 +0530
>>>> +Subject: [PATCH] gstv4l2object: Increase min buffers for CSI captur=
e
>>>> +
>>>> +This will improve the latency and tolerance
>>>> +of CSI pipeline
>>>> +
>>> I can understand the tolerance but how does it increase latency.
>> Starvation can lead to DMA error and driver will have to trigger drain=
 DMA,
>> which might lead to some latency
>>
> Ok.
>
>>>> +Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>>>> +---
>>>> + sys/v4l2/gstv4l2object.c | 2 ++
>>>> + 1 file changed, 2 insertions(+)
>>>> +
>>>> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
>>>> +index 4ce9fac..9f5a85b 100644
>>>> +--- a/sys/v4l2/gstv4l2object.c
>>>> ++++ b/sys/v4l2/gstv4l2object.c
>>>> +@@ -5172,6 +5172,8 @@ gst_v4l2_object_decide_allocation (GstV4l2Obj=
ect *
>>>> obj, GstQuery * query)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * pool, we'll need what the driver o=
ne, and one more, so we can
>>>> dequeu */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (0 =3D=3D strcmp(obj->vcap.driver, "wav=
e5-dec")) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 own_min =3D obj->m=
in_buffers + 3;
>>>> ++=C2=A0=C2=A0=C2=A0 } else if (0 =3D=3D strcmp(obj->vcap.driver, "j=
721e-csi2rx")) {
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 own_min =3D obj->min_bu=
ffers + 4;
>>> Could you please mention in commit message why our csi driver require=
s extra
>>> buffers ? Is it due to a hardware limitation ? Also mention the use-c=
ase and
>>> pipeline for which this is helping.
>> Sure, will add more details
>>
>>> I believe gstreamer has a fail safe flow where it allocates buffer on=
 the fly
>>> in case there is a starvation, ain't that helping ?
>> Can you point me to this code, I am not sure why this is not helping
>> need to analyze the code
>>
> Will share it offline once I get chance, but it was mainly for export m=
ode,
> for import mode it just waits for the downstream element to give back s=
ome
> buffers.
Sure
>>> I think it is okay to have this here as short term as we have other p=
atches,
>>> but from upstream point of view it looks like a hack so let's documen=
t the
>>> reason why we did it here so that it can act as reference.
>> Agreed, will add more details in the commit
>>
>>> Also I believe this increases the memory footprint in v4l2 export mod=
e ?
>>> For already memory constrained platforms such as am62xSIP this may ha=
ve a
>>> negative impact. I see some vendors putting in extra env variables to=
 let user
>>> modify the buffering part.
>> This does not affect the export mode, min buffers are increased only
>> for import mode
> Does it help if we increase the allocated buffers in downstream element=
 ?
> If that helps, that would be a better solution as it would avoid impact=
ing
> memory constrained platforms using the csi driver. Else we may have to =
mark
> this patch to specific platforms only for now where you are running thi=
s use-case.

No, increasing number of buffers in downstream pool is not helping
I have observed this on multiple platforms, AM62A, AM68A, TDA4VM

Regards
Rahul T R

> Regards
> Devarsh
>>
>> Regards
>> Rahul T R
>>
>>> Regards
>>> Devarsh
>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 own_min =3D obj->m=
in_buffers + 1;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +--
>>>> +2.34.1
>>>> +
>>>> diff --git
>>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/g=
streamer1.0-plugins-good_1.20.%.bbappend
>>>> index 7ad943f6..bb4fdc09 100644
>>>> ---
>>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good_1.20.%.bbappend
>>>> +++
>>>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good_1.20.%.bbappend
>>>> @@ -5,6 +5,7 @@ SRC_URI:append =3D " \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0002-Adding-support-for-bayer=
-formats-with-IR-component.patch \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-v4l2-Changes-for-DMA-Buf=
-import-j721s2.patch \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0002-v4l2-Give-preference-to-=
contiguous-format-if-support.patch \
>>>> +=C2=A0=C2=A0=C2=A0 file://0001-gstv4l2object-Increase-min-buffers.p=
atch \
>>>>  =C2=A0 "
>>>>  =C2=A0 -PR:append =3D ".arago1"
>>>> +PR:append =3D ".arago2"

