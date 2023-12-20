Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50257C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 13:01:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.20978.1703077272911547549
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Dec 2023 05:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=MkjN4zhr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-ravikumar@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BKD1B7u014144
	for <meta-arago@lists.yoctoproject.org>; Wed, 20 Dec 2023 07:01:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1703077271;
	bh=A1MpjigrDShUbQP+93/smz5X+c9b9G7nDUUXRwIceW8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MkjN4zhr9qgiFBmOY94wLRhMGOa35WPZouI+J1tTbUpziAPl+15EA+TEi4LHmDvJl
	 tL/8Ii/MHvE64Xl/2+2VEQxMZ1qryLAewbBu8uRc4LfjWrd/lNnlEGjBbmlA5MBsib
	 Nksr5RZuRTarkFvSGZDGqU/tJxMYb9SHqhAa/cOA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BKD1BqS012224
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 20 Dec 2023 07:01:11 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Dec 2023 07:01:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Dec 2023 07:01:11 -0600
Received: from [10.24.69.154] (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BKD19b1076232;
	Wed, 20 Dec 2023 07:01:10 -0600
Message-ID: <ecbabeb6-8610-48be-b1be-f030facad5cf@ti.com>
Date: Wed, 20 Dec 2023 18:31:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][oe-layersetup][PATCH] configs:
 processor-sdk-analytics: Add 9.1 release config
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <r-ravikumar@ti.com>
References: <20231219093155.186246-1-r-ravikumar@ti.com>
 <5f043199-7b8e-41f5-ad9a-9980e7df4ade@ti.com>
Content-Language: en-US
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <5f043199-7b8e-41f5-ad9a-9980e7df4ade@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 3BKD1B7u014144
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Dec 2023 13:01:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15066

On 20/12/23 11:11, Chirag Shilwant wrote:

> NAK
>
> Why are we pushing a oe-config with internal bit-bucket links on=20
> public lists?

Sorry about this
I pushed j722s wakeup config by mistake
sent a v2 for this
https://lists.yoctoproject.org/g/meta-arago/message/15065

Regards
Rahul T R

>
> On 19/12/23 15:01, Rahul T R via lists.yoctoproject.org wrote:
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> ---
>> =C2=A0 .../processor-sdk-analytics-09.01.00-config.txt=C2=A0 | 16 ++++=
++++++++++++
>> =C2=A0 1 file changed, 16 insertions(+)
>> =C2=A0 create mode 100644=20
>> configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-confi=
g.txt
>>
>> diff --git=20
>> a/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-con=
fig.txt=20
>> b/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-con=
fig.txt=20
>>
>> new file mode 100644
>> index 0000000..1fe0f1f
>> --- /dev/null
>> +++=20
>> b/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-con=
fig.txt
>> @@ -0,0 +1,16 @@
>> +# This file takes repo entries in the format
>> +# repo name,repo uri,repo branch,repo=20
>> commit[,layers=3Dlayer1:layer2...:layern]
>> +
>> +bitbake,https://git.openembedded.org/bitbake,2.0,42a1c9fe698a03feb34c=
5bba223c6e6e0350925b=20
>>
>> +meta-arago,ssh://git@bitbucket.itg.ti.com/coresdk/meta-arago.git,kirk=
stone-j722s-wakeup,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras:meta=
-arago-demos:meta-arago-test=20
>>
>> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79=
364bed1abc297636f7933d0e35f22be,layers=3D=20
>>
>> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,=
kirkstone,67b0ef4256a484851f3556d281ca4caa88374388,layers=3D=20
>>
>> +meta-openembedded,https://git.openembedded.org/meta-openembedded,kirk=
stone,402affcc073db39f782c1ebfd718edd5f11eed4c,layers=3Dmeta-networking:m=
eta-python:meta-oe:meta-gnome:meta-filesystems=20
>>
>> +meta-ti,ssh://git@bitbucket.itg.ti.com/coresdk/meta-ti.git,kirkstone-=
j722s-wakeup,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp=20
>>
>> +meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca=
0a6b5f8f90b4715958546fc41d73,layers=3Dmeta-arm:meta-arm-toolchain=20
>>
>> +oe-core,https://git.openembedded.org/openembedded-core,kirkstone,b77c=
d331199fa62e3b162f37efca3b927c68d8e5,layers=3Dmeta=20
>>
>> +meta-tisdk,ssh://git@bitbucket.itg.ti.com/ti-sdk-linux/meta-tisdk.git=
,kirkstone-j722s-wakeup,HEAD,layers=3D=20
>>
>> +meta-edgeai,ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/meta-=
edgeai.git,kirkstone-j722s-wakeup,HEAD,layers=3D=20
>>
>> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>> +BITBAKE_INCLUSIVE_VARS=3Dyes

