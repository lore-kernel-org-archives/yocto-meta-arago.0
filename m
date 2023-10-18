Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2D6CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 16:10:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.285711.1697645414075399323
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 09:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=nW0wkKul;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39IGADjo087804
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 11:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697645413;
	bh=ainbSpLaM03YfIvdCN+ljaXqmjq8jZ4WpYW5x0AgFhA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nW0wkKulDxaSiBmHG8qZzkcvsP4o6G2+GHS+6pQK6zOadtg8qdSoUyxtniGXZUEC8
	 y8fwJcpY16IuiiJNcBUmwaMHHD0RgF1VI75y9Lk5C6bEXF3OnqDvKifT5o3RLmyYrK
	 sU0Nl2CfCx/3EAJfNpU4NCWBGW8mN1JbOW6iu/Vg=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39IGADXh121540
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 11:10:13 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Oct 2023 11:10:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Oct 2023 11:10:12 -0500
Received: from [10.24.69.154] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39IGAArM091867;
	Wed, 18 Oct 2023 11:10:11 -0500
Message-ID: <a0b0bd61-b5ff-4aa1-9539-1743c9f7bf3f@ti.com>
Date: Wed, 18 Oct 2023 21:40:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH v2]
 gstreamer1.0-plugins-good: wave5-codec: Set max buffers same as min buffers
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <p-mantena@ti.com>, <devarsht@ti.com>, <denys@ti.com>
References: <20231018091946.754458-1-r-ravikumar@ti.com>
 <9f8c5f0c-50a8-4f1a-b5da-9d8c1b025361@ti.com>
Content-Language: en-US
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <9f8c5f0c-50a8-4f1a-b5da-9d8c1b025361@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 39IGADjo087804
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 16:10:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14951

On 18/10/23 20:05, Ryan Eatmon wrote:

>
> Unfortunately I had already applied, tested, and marked the v1 patch=20
> for inclusion in CICD.=C2=A0 And the patch has already been promoted on=
to=20
> the master branch.
>
> You sent a message in webex that implied a level of urgency with=20
> getting this patch in for CICD.=C2=A0 In the future, if there is no urg=
ency=20
> and you want feedback on a patch, then do not send urgency messages=20
> off mailing list.=C2=A0 I am watching this list and checking things on =
a=20
> regular basis.
>
Hi Ryan,

Sorry about the confusion, It was indeed urgent
anyway the change was only in the commit message

Regards
Rahul T R

>
>
> On 10/18/2023 4:19 AM, Rahul T R wrote:
>> v4l2src plugin queues same external buffer with different v4l2 buffer
>> with different index. This workaround was implemented as a workaround
>> for this. Workaround needs all buffers to be allocated during the init
>> phase, if new buffers are allocated post stream start it fails. Avoid
>> such issues by enforcing max buffers same as min buffers
>>
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>> Reviewed-by: Prasanth Babu Mantena <p-mantena@ti.com>
>> ---
>>
>> Notes:
>> =C2=A0=C2=A0=C2=A0=C2=A0 v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Updated commit messag=
e as per the comments
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Added the reviewed by=
s
>>
>> =C2=A0 .../0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 7 ++++---
>> =C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch=20
>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch=20
>>
>> index a1471661..bf73e257 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
>> @@ -14,9 +14,9 @@ Signed-off-by: Prasanth Babu Mantena=20
>> <p-mantena@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 sys/v4l2/gstv4l2bufferpool.c | 17 ++++++++++++++---
>> =C2=A0=C2=A0 sys/v4l2/gstv4l2bufferpool.h |=C2=A0 2 ++
>> - sys/v4l2/gstv4l2object.c=C2=A0=C2=A0=C2=A0=C2=A0 | 15 ++++++++++++--=
-
>> + sys/v4l2/gstv4l2object.c=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++++++++++++-=
--
>> =C2=A0=C2=A0 sys/v4l2/gstv4l2videodec.c=C2=A0=C2=A0 | 20 +++++++++++++=
+------
>> - 4 files changed, 42 insertions(+), 12 deletions(-)
>> + 4 files changed, 43 insertions(+), 12 deletions(-)
>> =C2=A0 =C2=A0 diff --git a/sys/v4l2/gstv4l2bufferpool.c=20
>> b/sys/v4l2/gstv4l2bufferpool.c
>> =C2=A0 index d85f036..e6a60dc 100644
>> @@ -86,7 +86,7 @@ index ee60540..eff1cf2 100644
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 own_min =3D MAX (own_min, GST_V4L=
2_MIN_BUFFERS (obj));
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* for the downstream pool=
, we keep what downstream wants,=20
>> though ensure
>> -@@ -5049,8 +5053,13 @@ gst_v4l2_object_decide_allocation=20
>> (GstV4l2Object * obj, GstQuery * query)
>> +@@ -5049,8 +5053,14 @@ gst_v4l2_object_decide_allocation=20
>> (GstV4l2Object * obj, GstQuery * query)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 min =3D MAX (min, GST_V4L2_MIN_BU=
FFERS (obj));
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* To import we need the o=
ther pool to hold at least own_min */
>> @@ -95,6 +95,7 @@ index ee60540..eff1cf2 100644
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (obj_pool =3D=3D pool) {
>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (0 =3D=3D strcmp=
(obj->vcap.driver, "wave5-dec")) {
>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 min =3D own_min;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m=
ax =3D min;
>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 min +=3D own_min;
>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>

