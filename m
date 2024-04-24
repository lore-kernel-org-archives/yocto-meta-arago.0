Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D932CC41513
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 13:32:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.16435.1713965575843313865
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 06:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Fyd3HpOF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43ODWq5U034055;
	Wed, 24 Apr 2024 08:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713965572;
	bh=8NWtz1odRub+oEBPCnEgel54mUSmP3XdfVkiBKLBgtI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Fyd3HpOF58mVPInAVU3sJ4/T5qyKCyRBNNjE33Z+nMCkhK68FIQDpHgVbe9gsTp+N
	 HMcbOM9nvAyxOMq3kFWVWoNjhy9F1WDD/8hOcwuclaewb0uu33zK1ndOgLnBnOgaWV
	 5c+Ya39SIphBOg9TUnfXUobohAPW+g4iHBY+aCwM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43ODWqMq008129
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Apr 2024 08:32:52 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Apr 2024 08:32:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Apr 2024 08:32:52 -0500
Received: from [10.249.35.173] ([10.249.35.173])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43ODWqdA002949;
	Wed, 24 Apr 2024 08:32:52 -0500
Message-ID: <f42a8731-8dfc-4459-b440-824ce0285c20@ti.com>
Date: Wed, 24 Apr 2024 08:32:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-distro:
 recipes-core: Add no-fstab-update option to WIC_CREATE_EXTRA_ARG
To: Denys Dmytriyenko <denis@denix.org>, Chirag Shilwant <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Gyan Gupta <g-gupta@ti.com>,
        <dannenberg@ti.com>
References: <20240420125318.397900-1-c-shilwant@ti.com>
 <20240421030736.GZ28791@denix.org>
 <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com>
 <20240422223206.GB28791@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240422223206.GB28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 43ODWq5U034055
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Apr 2024 13:32:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15305



On 4/22/2024 5:32 PM, Denys Dmytriyenko wrote:
> On Sun, Apr 21, 2024 at 02:42:23PM +0530, Chirag Shilwant wrote:
>> + Andreas
>> On 21/04/24 08:37, Denys Dmytriyenko wrote:
>>> On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:
>>>> - Ideally running `ls /boot/` in filesystem should list contents fro=
m /rootfs/boot partition
>>>> but currently it lists the contents of /boot partition of the WIC Im=
age.
>>>>
>>>> Eg - Incase of AM64x,
>>>> ```
>>>>      root@am64xx-evm:~# ls /boot/
>>>>      EFI  Image  tiboot3-am64x-gp-evm.bin  tiboot3-am64x_sr2-hs-evm.=
bin  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot3.bin  tispl.bin  u-boot.img =
 uEnv.txt
>>> Will this change affect EFI? As there's EFI directory in that partiti=
on.
>>
>> The EFI partition under /rootfs/boot will still be present.
>> Following is the output of `ls /boot` with this patch,
>>
>> ```
>> root@am64xx-evm:~# ls /boot
>> EFI=C2=A0 Image=C2=A0 Image-6.1.80-ti-g2e423244f8c0 dtb=C2=A0 fitImage
>> fitImage-6.1.80-ti-g2e423244f8c0
>>
>> ```
>=20
> Thanks, I'll do some additional testing with EFI a bit later.
>=20
>=20
>>>> - To fix this issue, add --no-fstab-update flag to WIC_CREATE_EXTRA_=
ARG in arago-image.inc
>>>> to prevent WIC image from adding an additional entry in /etc/fstab.
>>> This flag is global and will prevent all other partitions from popula=
ting
>>> /etc/fstab properly. Sure, meta-ti only has /boot and / defined, but =
other
>>> layers could have own wic files with e.g. /home or /data partitions. =
Mounting
>>> those will require a custom /etc/fstab instead of wic creating corres=
ponding
>>> entries automatically.
>>>
>>
>>
>> Apparently, this change was being carried in processor sdk layer from
>> quite a long time (from dunfell) to resolve a customer issue
>> reported by Andreas.
>> Diving into our internal JIRA system showed that this fix was
>> suggested by Andreas
>> & was resolved by the SDK team back then by keeping this change in
>> processor sdk layer [1].
>> Not sure why this was in processor sdk layer though. Maybe Andreas
>> can provide additional details.
>=20
> I tested and submitted a different fix last night to adjust WIC templat=
es to
> not mount boot partition under /boot directory[1]. I still believe doin=
g it
> just for that one partition is better than disabling fstab updates glob=
ally.
>=20
> [1] https://patchwork.yoctoproject.org/project/ti/patch/20240421191458.=
2221303-1-denis@denix.org/

So with the above referenced patch in meta-ti, I'm assuming we do not=20
need this patch in meta-arago?


> Can you please take a look and maybe test this option for your use case=
?
> Thanks.
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

