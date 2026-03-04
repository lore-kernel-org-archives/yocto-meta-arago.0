Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368E2EF9002
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:05:25 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21832.1772640321986834488
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 08:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Kwxx9EZg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.17, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmqbhB25vMXmodPLSEln3Kz+MDWM2ZYQ8h0QAV58ngJ1Y4tE7Y3WRsRfu4M/N6LDgCT8qBqgDm5MyaAXsYdlArHOWEQrmWNphorrs7YdZcPcy/hn30gqPK7QaMHsme3g9isUVzIgMMMzbAr5Y7jA+QRcKOeQI86xdfDoMn8x+ygpc8ARZPI4Zbs0xXcw8/jzKzRmY0TA5jslGtB+4Qewb18WO/q2YclxXPAXOVcN4C0esD5N3KCDFxoO5r4A4V2ANmNuY+N0R8Lf33tu7TWnNVgndAXzpouG+ZMUUUGofto7JiKfNHbbrHZCtcMbqIGw4Dm5oTp0E81tHTs/q4vL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqrEdPHJSg1OauIISRFZx27zxcuwJi74x4Ix3GNVo0c=;
 b=g3O3MCDOfrt+Jn6NDKaxZN1ZE/7vBd4m/YfBto0V6o7Fd1deIHUdcrKgLSiWB7JGu0lfMTZp6SpEh5CTudRYvybDD6a0xPleuQjVWTk91BLt52+DHsz8Sws7JZcVC8ttmREeSKzjGeBheS1/bjELguRF7JvV/+eUw6kXAwDfpSClKg3T4ME4p1gqt9lvmolvM0z3rhyEF8oKhiG/mPQW8TIjVejvIWhKVU2ZsmPXJlSs6t+lff1G1YSgDlM+N6PMvw3Boa925NPtqqf4uuy22j30tEGJEym89bj7+Tt8p9hIVluaoTbWY7z3AGfyU+RyL472Q1VobonFta74AsKJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqrEdPHJSg1OauIISRFZx27zxcuwJi74x4Ix3GNVo0c=;
 b=Kwxx9EZgTPDup1C3QHBasaEnH6xZJhy7g76pcqcRN32CMzz0awqqJ2sRjIkeY/MVT5I6V3qfzsr5ryiGHt0UuSG+XA/Eju2erEB+XoG8Fl9nrmfSWSJSMRG9ZN+oo55xDNWvKu6kNuU/HhNkhaQRiPBMXcP6UL7P/iQ6dwHfVAM=
Received: from SJ0PR13CA0096.namprd13.prod.outlook.com (2603:10b6:a03:2c5::11)
 by BLAPR10MB4914.namprd10.prod.outlook.com (2603:10b6:208:30d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 16:05:19 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::43) by SJ0PR13CA0096.outlook.office365.com
 (2603:10b6:a03:2c5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Wed,
 4 Mar 2026 16:05:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 16:05:18 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 10:05:11 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 10:05:10 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 10:05:10 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624G5AZT153115;
	Wed, 4 Mar 2026 10:05:10 -0600
Message-ID: <bb0be488-4a09-45d8-b4c9-87739c6e7ec4@ti.com>
Date: Wed, 4 Mar 2026 10:05:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [PATCH] tisdk-uenv: Add instructions to load
 initramfs while booting linux
To: Ryan Eatmon <reatmon@ti.com>, Moteen Shah <m-shah@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: <a-limaye@ti.com>, <gehariprasath@ti.com>, <praneeth@ti.com>,
	<denys@konsulko.com>, <vigneshr@ti.com>
References: <20260303104930.889956-1-m-shah@ti.com>
 <d27ccb3c-4f70-486b-baf7-2dfc0943e240@ti.com>
 <565f34b6-b312-4dd1-a822-58cdc1bc7187@ti.com>
 <b919fb23-6b17-405c-8883-64610218e604@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <b919fb23-6b17-405c-8883-64610218e604@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|BLAPR10MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: cd286da9-9475-4ae9-4840-08de7a07d4c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|82310400026|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	+q465IxDG4L0zAyKDpQVfhWq7s4x2vvGxZF+i4TTMYl0Dn+savxRs3KBeBJzyeTn7fumsXSKjND/Id76QtT46yrvzFB4p/ZPZX7bNjGykQw4kKl7iCHzzRvqP2fGQr7n9iX8/KDm9xJP0UPEcU4m/zhEs5se5YW2sgYPUOAuel+bqiqjSH88LijFjDTpIAURghPtmPnjpumFOC9Il/VE4V5KpL7oZOAmHwMvq2m3TItt1gKJly7Rj5Zy+mugGfHVm0w2gRr9wzfLil6QRli6rBI6L/akwrjvN0XnNqECNV0nNN5+jqsQLL5+73+Pc6T4HP6qcNr/cdWod4XmOrJyEcO/RXyZxPdRUmtIWhvPJHRmp4WkQMx1ThT5HTM23+mSPmg6q4wcY274Vc1IWv9DBaxdqIPaXWeky1eoYltgNxlH69PxYfcFAbHIvHIvdwbxDyPzQ51MGOesWcbSjX/gAHaMGrdTCt0bMQnt19Cgo5zbjKQQ4RhdOiidGSJ0efASkJ9bCzm703h4M2yCwVDbEXmxIgxn8axbIBElnsbfFzJgQBHU4PRWthBvANPn+taGV5BDKtTGt01/iA14A8ca6dmFBmf8Wr19pxG++/ix+99e1Jx7aFdU7zypzjA7QctsKpfRPm1Yfdz08ojiewwD1SLS2c1spT/a37qChIrR5QIzhDJzYeCbQDGrULQEDWPM7e6yq2HHMdGk9N6J8dGt8khOe9bKyZ3CDCitnoxWTps=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(82310400026)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UTkbQ7E/XylFieBMok9dBcL2vJkBfzQE7GYElKBeN304G7XVYSn1BrClbnmckfEe1iE820dhsbi915g23krl2oOlISr3EpQ6CzY78ypgBNHhXjHWnZfGdVVK+kwwx6CQwKACvGsC0v4J8HCXGApnSy3O5I+PnAALE2+k2hC1bJifKuYl57joU5nJSgx0VU8ftSWsHW9fo9BMap6d9x5Tqd8CSSyPb39ApQOrAwgZfgs7ZUqd1+zJE1xMDy6x1ZrfEJjqQO8QH3POM36/V03Xpq6/wHBgiIRHOUu1tkUSm4yPxiPRR5LvcQ9qfy5HccdHvYo6rMeNYq6QzGSMvQIhgIvPdywgxaAHHuEzsa3pq051I9PzaiCP+emYk2YII0k+/6IP99bwAJDQQs+XcAGSTKE6hufaQGQQaLjSHX5xuHv9zabF8hg52BKiodRZsBNC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:05:18.5180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd286da9-9475-4ae9-4840-08de7a07d4c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4914
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 16:05:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17220

On 3/4/26 8:38 AM, Ryan Eatmon wrote:
>=20
>=20
> On 3/4/2026 12:32 AM, Moteen Shah wrote:
>>
>> On 03/03/26 22:49, Andrew Davis wrote:
>>> On 3/3/26 4:49 AM, Moteen Shah via lists.yoctoproject.org wrote:
>>>> Add instructions to load initramfs image and update the boot command
>>>> to use the image to boot the linux kernel.
>>>>
>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>>> ---
>>>> =C2=A0 .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=C2=A0 | 15 +++=
++++++++++++
>>>> =C2=A0 1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEn=
v.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>>> index 0af0eef3..5ac61b34 100644
>>>> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>>> +++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>>> @@ -7,3 +7,18 @@
>>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default on all newer U-Bo=
ot images.=C2=A0 This also means that some
>>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variables such as bootdel=
ay cannot be changed by this file since
>>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it is not evaluated until=
 the bootcmd is run.
>>>> +
>>>> +# Initramfs configuration
>>>> +# Name of the initramfs file in the boot partition
>>>> +name_initramfs=3Dti-core-initramfs.cpio.xz
>>>> +
>>>> +# Command to load initramfs from boot partition (mmc device:partition=
)
>>>> +# Adjust the device number (0 or 1) based on your setup
>>>> +# mmcdev is set to 1 by default, partition 1 is the boot partition
>>>> +get_initramfs_mmc=3Dfatload mmc ${mmcdev}:1 ${rdaddr} ${name_initramf=
s}
>>>> +
>>>
>>> This belongs in u-boot default env, it is basically the same as `get_fd=
t_mmc`
>>> and other helpers already there.
>>>
>>>> +# Load initramfs and set up variables
>>>> +load_initramfs=3Dif run get_initramfs_mmc; then setenv _initramfs ${r=
daddr}:${filesize}; setenv rd_spec ${_initramfs}; echo Initramfs loaded at =
${rdaddr}, size ${filesize}; else echo WARNING: Initramfs not found, contin=
uing without initramfs; setenv rd_spec -; fi
>>>> +
>>>
>>> This should be part of `mmcloados` in u-boot also.
>>
>>
>> mmcloados is only used by 'mmcboot' which is a differnt boot command oth=
er than bootcmd_ti_mmc?
>> We can consider adding the load_initramfs to 'get_kern_mmc' and we wont =
need to override the init_mmc with the change.
>>

Adding to `get_kern_mmc` wouldn't make sense, that is for loading the kerne=
l as the
name suggests. If we don't go down the `mmcboot` path anymore then add it t=
o whatever
path we do go down these days.

>>>
>>>> +# Custom boot command that loads initramfs before kernel
>>>> +init_mmc=3Drun args_all args_mmc load_initramfs
>>>
>>> With the above added, you don't need to override `init_mmc` so
>>> this line goes away too.
>>>
>>> That leaves one line left, `name_initramfs`. How about just
>>> setting a sane default name in u-boot. We got away with something
>>> like this for K2 plats:
>>
>> We don't expect the name of the cpio to be variable, as the name of the =
cpio stays the same for all K3 platforms which is "ti-core-initramfs.cpio.x=
z", I can remove the variable altogether maybe and directly use the image n=
ame to load. Thoughts?
>=20
> That is a very Yocto centric take.=C2=A0 But we also support armbian and =
other distros.=C2=A0 They may not want to name the file the same way we cho=
se in meta-ti.=C2=A0 The question is, should we paint ourselves into a corn=
er from the beginning or allow for some flexibility?
>=20
> Plus, even in Yocto, a user could choose to not use ti-core-initramfs and=
 instead make their own with their own name.=C2=A0 Making this more flexibl=
e feels more friendly in the long run.
>=20

And you don't have to look too far, that encrypted boot series posted the o=
ther
day would have made use of a new named ti-encrypted-boot-initramfs.cpio.gz
(although the booting method would have been different)

> Just my two cents.
>=20

Worth every penny :)

Andrew

>=20
>> Regards,
>> Moteen
>>
>>>
>>> https://github.com/u-boot/u-boot/blob/master/board/ti/ks2_evm/k2e_evm.e=
nv#L12
>>>
>>> although I'd recommend a more generic filename.
>>>
>>> Andrew
>>>
>>>> \ No newline at end of file
>>>
>=20


