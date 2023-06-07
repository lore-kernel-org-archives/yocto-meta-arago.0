Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C13C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 09:11:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4067.1686129076940207969
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 02:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=qWELPcBO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3579BEv3091276;
	Wed, 7 Jun 2023 04:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686129074;
	bh=MfdlEV5iUPmYmOkGs4GZgEPzeQE5FTeYW2XpcckouZw=;
	h=Date:Subject:References:From:To:CC:In-Reply-To;
	b=qWELPcBO6wDPZgCOzEqfjP3DeDIxjqB+YejUiIyqhBk1k7p3ZHv9FtPW6H40UJzVJ
	 4VwkFA/laLL/NtAHaB+neV+0r62Yhn++JzPvUWq7/NvvoZdn1V/+t4Ppakrv83KG7p
	 bm+Yb683fqDjTr608ZSwSNDOE6wX2b+6JA3Sfff0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3579BDwl013398
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 04:11:13 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 04:11:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 04:11:13 -0500
Received: from [172.24.145.229] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3579BAir006118;
	Wed, 7 Jun 2023 04:11:11 -0500
Message-ID: <46a21a1e-1bb5-5710-98a2-cb438877a998@ti.com>
Date: Wed, 7 Jun 2023 14:41:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [meta-arago] [kirkstone][PATCH v2]
 meta-arago-distro: Add recipe for jailhouse image and update kernel and
 u-boot repo for jailhouse build.
Content-Language: en-US
References: <20230606140237.178008-1-p-bhagat@ti.com>
 <20230606223027.GU9226@denix.org>
From: Paresh Bhagat <p-bhagat@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>,
        "Bajjuri, Praneeth"
	<praneeth@ti.com>, <reatmon@ti.com>,
        <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>,
        <g-gupta@ti.com>
In-Reply-To: <20230606223027.GU9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 3579BEv3091276
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jun 2023 09:11:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14519

Hi Denys,

On 07/06/23 04:00, Denys Dmytriyenko wrote:
> On Tue, Jun 06, 2023 at 07:32:37PM +0530, Paresh Bhagat via lists.yocto=
project.org wrote:
>> Add a recipe to build and package jailhouse image for am62xx-evm. new =
image will
>> be named as tisdk-jailhouse-image. jailhouse recipe will also package =
overlay
>> used for jailhouse.
>>
>> Add functionality to change kernel and u-boot source via MACHINE_FEATU=
RES for
>> jailhouse. so if MACHINE_FEATURES:append =3D " jailhouse" is added to =
local.conf
>> different recipe for kernel (linux-ti-extras) and u-boot (u-boot-ti-ex=
tras) will
>> be used.
>>
>> So for jailhouse build for am62xx-evm user will have to add
>> MACHINE_FEATURES:append =3D " jailhouse" to local.conf and then start =
a jailhouse
>> build with MACHINE=3Dam62xx-evm bitbake -k tisdk-jailhouse-image.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   .../conf/distro/include/arago-prefs.inc            |  7 +++++++
>>   .../recipes-core/images/tisdk-jailhouse-image.bb   | 14 ++++++++++++=
++
>>   2 files changed, 21 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailh=
ouse-image.bb
>>
>> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/m=
eta-arago-distro/conf/distro/include/arago-prefs.inc
>> index 34c3c539..40269b56 100644
>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> @@ -19,3 +19,10 @@ PREFERRED_PROVIDER_wpa-supplicant =3D "wpa-supplica=
nt"
>>   #PREFERRED_PROVIDER_wpa-supplicant:ti33x =3D "wpa-supplicant-wl18xx"
>>   #PREFERRED_PROVIDER_wpa-supplicant:ti43x =3D "wpa-supplicant-wl18xx"
>>   #PREFERRED_PROVIDER_wpa-supplicant:omap-a15 =3D "wpa-supplicant-wl18=
xx"
>> +
>> +# change kernel when jailhouse image is build
>> +PREFERRED_PROVIDER_virtual/kernel =3D "${@bb.utils.contains('MACHINE_=
FEATURES','jailhouse','linux-ti-extras','linux-ti-staging',d)}"
>> +
>> +#Change uboot source when jailhouse image is build
>> +PREFERRED_PROVIDER_virtual/bootloader =3D "${@bb.utils.contains('MACH=
INE_FEATURES','jailhouse','u-boot-ti-extras','u-boot-ti-staging',d)}"
>> +PREFERRED_PROVIDER_u-boot =3D "${@bb.utils.contains('MACHINE_FEATURES=
','jailhouse','u-boot-ti-extras','u-boot-ti-staging',d)}"
> This would conflict with all the other places PREFERRED_PROVIDERs are b=
eing
> set. In other words, if "jailhouse" in MACHINE_FEATURES is not set, you=
 are
> forcing everyone into "ti-staging" trees, which is not always the case!
> What about "bb.org" trees, or "next", or "mainline" or any downstream o=
nes?

based on your review, i tried changing PREFERRED_PROVIDERs in=20
tisdk-jailhouse-image.bb using:

if 'jailhouse' in d.getVar('MACHINE_FEATURES',True).split():
 =C2=A0=C2=A0=C2=A0 d.setVar('PREFERRED_PROVIDER_virtual/kernel', 'linux-=
ti-extras')
 =C2=A0=C2=A0=C2=A0 d.setVar('PREFERRED_PROVIDER_virtual/bootloader', 'u-=
boot-ti-extras')
 =C2=A0=C2=A0=C2=A0 d.setVar('PREFERRED_PROVIDER_u-boot', 'u-boot-ti-extr=
as')

i added above code to do_configure:append() . also tried adding above=20
code inside a custom function "do_change_provider()" and used "addtask=20
do_change_provider" inside tisdk-jailhouse-image recipe. but either the=20
build failed or the preferred_providers didn't change. can you help with=20
this or suggest any alternate method we can use? We want to change=20
preferred_providers if MACHINE_FEATURES has jailhouse and not have a=20
conflict with other places as you mentioned.

Thanks

>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-ima=
ge.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
>> new file mode 100644
>> index 00000000..af880d30
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
>> @@ -0,0 +1,14 @@
>> +# Produces wic image for jailhouse
>> +
>> +require recipes-core/images/tisdk-default-image.bb
>> +
>> +COMPATIBLE_MACHINE =3D "am62xx-evm"
>> +
>> +IMAGE_INSTALL:append:am62xx-evm =3D " jailhouse"
>> +
>> +# Package overlay for jailhouse
>> +KERNEL_DEVICETREE:append:am62xx-evm =3D " ti/k3-am625-base-board-jail=
house.dtbo"
>> +
>> +export IMAGE_BASENAME =3D "tisdk-jailhouse-image"
>> +
>> +WIC_CREATE_EXTRA_ARGS:append =3D " --no-fstab-update"
>> --=20
>> 2.34.1

