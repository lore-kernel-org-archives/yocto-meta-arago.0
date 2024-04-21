Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FB5C4345F
	for <webhook@archiver.kernel.org>; Sun, 21 Apr 2024 09:12:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.28795.1713690751680608750
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 21 Apr 2024 02:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=bJfLeNay;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43L9CRch075549;
	Sun, 21 Apr 2024 04:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713690747;
	bh=SenZQnI1GwHFQflqfeKGe7SHuoVlchktB8dGUjIrIw4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bJfLeNay5BHWwX2LzK+pj+Kk4VWS5DWFLX2JYEx8l7R2pQ3THYEEcw3rJXeXIx7Mx
	 lcYlu0kwMwjAGBVenEt2FxA+QOdZlaIsayZHkb++xYPb39z1uas9DuA4+N6jXjjSCX
	 TpH/NAnE64xV6lNKoMjDYSl6YQDKfIyQJeyej2u0=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43L9CRUR000501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 21 Apr 2024 04:12:27 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 21
 Apr 2024 04:12:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 21 Apr 2024 04:12:26 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43L9COTA054743;
	Sun, 21 Apr 2024 04:12:25 -0500
Message-ID: <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com>
Date: Sun, 21 Apr 2024 14:42:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-distro:
 recipes-core: Add no-fstab-update option to WIC_CREATE_EXTRA_ARG
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Gyan
 Gupta <g-gupta@ti.com>, <dannenberg@ti.com>
References: <20240420125318.397900-1-c-shilwant@ti.com>
 <20240421030736.GZ28791@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240421030736.GZ28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 43L9CRch075549
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 21 Apr 2024 09:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15300

+ Andreas
On 21/04/24 08:37, Denys Dmytriyenko wrote:
> On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:
>> - Ideally running `ls /boot/` in filesystem should list contents from =
/rootfs/boot partition
>> but currently it lists the contents of /boot partition of the WIC Imag=
e.
>>
>> Eg - Incase of AM64x,
>> ```
>>      root@am64xx-evm:~# ls /boot/
>>      EFI  Image  tiboot3-am64x-gp-evm.bin  tiboot3-am64x_sr2-hs-evm.bi=
n  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot3.bin  tispl.bin  u-boot.img  u=
Env.txt
> Will this change affect EFI? As there's EFI directory in that partition.

The EFI partition under /rootfs/boot will still be present.
Following is the output of `ls /boot` with this patch,

```
root@am64xx-evm:~# ls /boot
EFI=C2=A0 Image=C2=A0 Image-6.1.80-ti-g2e423244f8c0 dtb=C2=A0 fitImage=C2=
=A0=20
fitImage-6.1.80-ti-g2e423244f8c0

```


>
>
>> ```
>>
>> - To fix this issue, add --no-fstab-update flag to WIC_CREATE_EXTRA_AR=
G in arago-image.inc
>> to prevent WIC image from adding an additional entry in /etc/fstab.
> This flag is global and will prevent all other partitions from populati=
ng
> /etc/fstab properly. Sure, meta-ti only has /boot and / defined, but ot=
her
> layers could have own wic files with e.g. /home or /data partitions. Mo=
unting
> those will require a custom /etc/fstab instead of wic creating correspo=
nding
> entries automatically.
>


Apparently, this change was being carried in processor sdk layer from
quite a long time (from dunfell) to resolve a customer issue reported by=20
Andreas.
Diving into our internal JIRA system showed that this fix was suggested=20
by Andreas
& was resolved by the SDK team back then by keeping this change in=20
processor sdk layer [1].
Not sure why this was in processor sdk layer though. Maybe Andreas can=20
provide additional details.

Btw, I also see other SOC vendors (meta-freescale) adding=20
--no-fstab-update flag to WIC_CREATE_EXTRA_ARG [2]
So, if we are planning to pull in this change should it go somewhere in=20
meta-ti (maybe k3.inc [3])?

[1]:=20
https://git.ti.com/cgit/processor-sdk/meta-processor-sdk/commit/recipes-c=
ore/images/tisdk-default-image.bbappend?h=3Ddunfell&id=3D58975a30e8f90efb=
ffb97e49d5baac02971644da
[2]:=20
https://git.yoctoproject.org/meta-freescale/tree/conf/machine/include/imx=
-base.inc?h=3Dscarthgap#n614
[3]:=20
https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/conf/machi=
ne/include/k3.inc?h=3Dscarthgap


>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/images/arago-image.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/m=
eta-arago-distro/recipes-core/images/arago-image.inc
>> index 00308b57..2a34a709 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
>> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
>> @@ -31,4 +31,6 @@ BAD_RECOMMENDATIONS +=3D " \
>>   "
>>   BAD_RECOMMENDATIONS +=3D "${@oe.utils.conditional("INIT_MANAGER", "s=
ysvinit", "", "busybox-syslog", d)}"
>>  =20
>> +WIC_CREATE_EXTRA_ARGS +=3D " --no-fstab-update"
>> +
>>   inherit core-image remove-net-rules
>> --=20
>> 2.34.1

