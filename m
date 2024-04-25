Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE7BC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 05:02:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.9745.1714021373769471169
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 22:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JGIDq9WQ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43P52nTn015681;
	Thu, 25 Apr 2024 00:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714021369;
	bh=T8HqbkxC+muv/FtNZSbK3n/6xAxYM1D56/LADOn1p08=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JGIDq9WQvkaHq0Ztv52CMRU/sa7mdgkhKZVUNgvQ8ikmG+RZ8FAj1mGrG8V7PXcCp
	 NPswvCIdqijOkbeg1JPP86xPXo6MJrJQtifBVuD3obDgeleFLg/NPsf7P9KpE1w8e7
	 5mUwUTqhyswreoJ2QxWZFspqQe6xc9ZU4ZeV6Dkc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43P52n1Z046957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Apr 2024 00:02:49 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Apr 2024 00:02:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Apr 2024 00:02:48 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43P52kqh101834;
	Thu, 25 Apr 2024 00:02:47 -0500
Message-ID: <1ad73612-871f-49bd-a9c6-0c06d51debcb@ti.com>
Date: Thu, 25 Apr 2024 10:32:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-distro:
 recipes-core: Add no-fstab-update option to WIC_CREATE_EXTRA_ARG
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Gyan Gupta <g-gupta@ti.com>,
        <dannenberg@ti.com>
References: <20240420125318.397900-1-c-shilwant@ti.com>
 <20240421030736.GZ28791@denix.org>
 <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com>
 <20240422223206.GB28791@denix.org>
 <f42a8731-8dfc-4459-b440-824ce0285c20@ti.com>
 <20240424201023.GE28791@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240424201023.GE28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 43P52nTn015681
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Apr 2024 05:02:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15310

Hi Denys,
On 25/04/24 01:40, Denys Dmytriyenko wrote:
> On Wed, Apr 24, 2024 at 08:32:52AM -0500, Ryan Eatmon wrote:
>>
>> On 4/22/2024 5:32 PM, Denys Dmytriyenko wrote:
>>> On Sun, Apr 21, 2024 at 02:42:23PM +0530, Chirag Shilwant wrote:
>>>> + Andreas
>>>> On 21/04/24 08:37, Denys Dmytriyenko wrote:
>>>>> On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:
>>>>>> - Ideally running `ls /boot/` in filesystem should list contents f=
rom /rootfs/boot partition
>>>>>> but currently it lists the contents of /boot partition of the WIC =
Image.
>>>>>>
>>>>>> Eg - Incase of AM64x,
>>>>>> ```
>>>>>>      root@am64xx-evm:~# ls /boot/
>>>>>>      EFI  Image  tiboot3-am64x-gp-evm.bin  tiboot3-am64x_sr2-hs-ev=
m.bin  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot3.bin  tispl.bin  u-boot.im=
g  uEnv.txt
>>>>> Will this change affect EFI? As there's EFI directory in that parti=
tion.
>>>> The EFI partition under /rootfs/boot will still be present.
>>>> Following is the output of `ls /boot` with this patch,
>>>>
>>>> ```
>>>> root@am64xx-evm:~# ls /boot
>>>> EFI=C2=A0 Image=C2=A0 Image-6.1.80-ti-g2e423244f8c0 dtb=C2=A0 fitIma=
ge
>>>> fitImage-6.1.80-ti-g2e423244f8c0
>>>>
>>>> ```
>>> Thanks, I'll do some additional testing with EFI a bit later.
>>>
>>>
>>>>>> - To fix this issue, add --no-fstab-update flag to WIC_CREATE_EXTR=
A_ARG in arago-image.inc
>>>>>> to prevent WIC image from adding an additional entry in /etc/fstab.
>>>>> This flag is global and will prevent all other partitions from popu=
lating
>>>>> /etc/fstab properly. Sure, meta-ti only has /boot and / defined, bu=
t other
>>>>> layers could have own wic files with e.g. /home or /data partitions=
. Mounting
>>>>> those will require a custom /etc/fstab instead of wic creating corr=
esponding
>>>>> entries automatically.
>>>>>
>>>>
>>>> Apparently, this change was being carried in processor sdk layer fro=
m
>>>> quite a long time (from dunfell) to resolve a customer issue
>>>> reported by Andreas.
>>>> Diving into our internal JIRA system showed that this fix was
>>>> suggested by Andreas
>>>> & was resolved by the SDK team back then by keeping this change in
>>>> processor sdk layer [1].
>>>> Not sure why this was in processor sdk layer though. Maybe Andreas
>>>> can provide additional details.
>>> I tested and submitted a different fix last night to adjust WIC templ=
ates to
>>> not mount boot partition under /boot directory[1]. I still believe do=
ing it
>>> just for that one partition is better than disabling fstab updates gl=
obally.
>>>
>>> [1] https://patchwork.yoctoproject.org/project/ti/patch/2024042119145=
8.2221303-1-denis@denix.org/
>> So with the above referenced patch in meta-ti, I'm assuming we do
>> not need this patch in meta-arago?
> That's my pitch here.
>
> Chirag,
>
> Will that work for you and others?


Let me kickoff a build with your meta-ti patch [1] & see if that works=20
for us as well.
Will get back in a day or two.

[1]:=20
https://patchwork.yoctoproject.org/project/ti/patch/20240421191458.222130=
3-1-denis@denix.org/=20


>
>
>>> Can you please take a look and maybe test this option for your use ca=
se?
>>> Thanks.

