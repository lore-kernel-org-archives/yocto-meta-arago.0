Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D07AEF8FF0
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 14:38:44 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19611.1772635114518016600
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 06:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DeKtQJYX;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.48, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhnklcdD4ekQYnWX47VoPfVDbNPRs5uOrDqf0NkLW4TG4DO0XxN7RuLO4pAizIWcDXxuAgExf/Rl+/s0CChUHToKP+frhc62S2NlvYFHcXksQJ4A4V5PnJ4JPAivR0qy13HbwIJzBXAlv0NjympqKtUAppaV1XUQLPHreYIPIN60N6fnK9+/sYGm60LnaWmS0PyA3IU/ZvCnWUW1N+8j3iQ65zHWqHyXic8gt4nGfaaP8kRA00Z6gXfIbd1JMI0bHAAd9RF6GlEXWEBdRNn2dEaeU7n6OMkVzJs+HYsClJX4RBLbkTxU0724oyLU9vG/n3mwiQuIi+Um3xmkENRr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5B7fitzsTw+JfCbsUW3Pa9hkBMSl5WX1hHZVIXJX9A=;
 b=XK0N5XdhRBJlH2y1qAmx3j0Ppm80DiWJV2Kni/jRpOfMfGgkHuT0GcEPtBEJyNSLXbtfZwaA4SvgNuJkKUp45OI8T6aXdIWPO7ro6UMPnmWJbwnQhUfZneJAZyknObXa/MNAJ3EvzyLfwuwcDMGilcgNhCjEXZ6hoDRTYP4jdZ96aiOpTo/bKxZLCETy3IapJ+jaydeWofHSHkQK++PmcrAHsq7fYWuHPUjUYBmi5/8pvCKBTWV+1YbNVScRX+mhLyR8Wt/m8+y4ftIUy3mDgtzzL+kg5tNXun4edByd9T0cUYbuCQDeDAljREXPHj8Tzj1/vuucjPpZPEsVXABWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5B7fitzsTw+JfCbsUW3Pa9hkBMSl5WX1hHZVIXJX9A=;
 b=DeKtQJYXro/27hjlga9rW0ePyYTJt7H5RaETqYZERsk8sd4wmsAuiXsFkOMTNwXq7SwUF8QHJp1lt3zLEDeStx7TLTT9C7B8Lt32jUmb02fcMr8gvyPkbpsSDCaAkiMr0heHXWdAJzWTufAbEC5oy1rsmy1Yu8m2sErToX2xsEo=
Received: from PH7PR17CA0005.namprd17.prod.outlook.com (2603:10b6:510:324::14)
 by SJ5PPF7E749FEBA.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ac) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 14:38:32 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:510:324:cafe::6e) by PH7PR17CA0005.outlook.office365.com
 (2603:10b6:510:324::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 14:38:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Wed, 4 Mar 2026 14:38:32 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 08:38:16 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 08:38:03 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 08:38:03 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624Ec3dH027691;
	Wed, 4 Mar 2026 08:38:03 -0600
Message-ID: <b919fb23-6b17-405c-8883-64610218e604@ti.com>
Date: Wed, 4 Mar 2026 08:38:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [PATCH] tisdk-uenv: Add instructions to load
 initramfs while booting linux
To: Moteen Shah <m-shah@ti.com>, Andrew Davis <afd@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: <a-limaye@ti.com>, <gehariprasath@ti.com>, <praneeth@ti.com>,
	<denys@konsulko.com>, <vigneshr@ti.com>
References: <20260303104930.889956-1-m-shah@ti.com>
 <d27ccb3c-4f70-486b-baf7-2dfc0943e240@ti.com>
 <565f34b6-b312-4dd1-a822-58cdc1bc7187@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <565f34b6-b312-4dd1-a822-58cdc1bc7187@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|SJ5PPF7E749FEBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e271d3a-ab80-47e7-2a81-08de79fbb5da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	+l9jx39uXIFxWk5YJIDgOi5NFFBv0LcFCLOEPbgM/WZ5InikYSKG8j5gJSF5UXzsx+B5pwlL1KXlpGi1OOZiA+4MjhrDfohYoFfbojIXFornr43JRR3SJC6Sa//h09kcFnNjFEYpusjjjSrjePIEaSnMk4U9j07dT292vJIpskfz6cJEa2Sha1hXAOp6qxzDVW4i5mkZ1qd0qw7ESXhW7VxuwpXpxcjuC1Uv3Yr63+4glpeOmio9w+LsIi2tP36j/Suhz1KzVvUz6lnQmi2VlHdfABX8B/4Cz64duIDe0fIu2oqtxw8ECM9qT53TR62b9eEUTInsOYvexwWcJKrX323LRGvGlIIgvzSwJFdRTyx76aeygfyxv/Vp4brTuCAGKa8N4k7udszfPUP6XNlmn+pKJXYvV13seahDXU0ix8d3C6sdfReg27VBRUH69U5cr0/bOyvTdhhd0EoqzdUR9Yr/NLCQ3/A9ARzcByTywS6zAXtEpvUmjXUaowjbk5esXWKF8Ajd10m0IWGbRWcPVFSfy+sArzG0pfjMwY48HQB0yL9E9B0aB0Y23nlCFuWyvwRoE3FycTmo4Jk12OitN+CpwphVdI2lNgzOnTkNk1kjUQD9OtB+qUsqpKYynwGgABExLjBmgqQs2n/MFsmOralGCtCkX3ocyngqN7L6JacCdh4vet8IUmTisSC3D5YErsyqp5qnnqHU2HK0vnciIjaeQfggXqw0iIhDdKYOUZs=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(34020700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RWaRmULqTLy3R3Sct6myPSQqkHhyGJzsKhXiO1sNoQ/WvesryxiC6StKIdeBmaPkDOEw5nbZkokRP14l49Bb9YsFTUxYrX39huennlVgYYy6QPb1vMr2JotkxeXPMEfI13DyRpWAEttDJoAqi75YqxstzjeBG/UxpVtzBbeHHFUpQPKYhMMVViT8kHuBotqZsv76wCSLQeWOVCU2O5vCcP7tbnYcg5/YZf9h1eUDeZF46DZqrFuY/qsyeImTPyqu1SlI9NV8dxJZCkGvvg7q2VAl2vvBBchl2tLxIPGgMQq+PnuG3w9kWLw5CbNne/kcCV7+Mk6crxN0YyiJrBh6gHY/Ua4h6q3EmlKXVBdoI78l7nu7ixuVY4tnyRz+D7iVwZPldEgLCQZyHHlUYqitWOJj1sILTV5mp/byMjX28ygDbxhC8TAO+hyiiTgxRdiA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 14:38:32.6632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e271d3a-ab80-47e7-2a81-08de79fbb5da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7E749FEBA
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 14:38:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17218



On 3/4/2026 12:32 AM, Moteen Shah wrote:
>=20
> On 03/03/26 22:49, Andrew Davis wrote:
>> On 3/3/26 4:49 AM, Moteen Shah via lists.yoctoproject.org wrote:
>>> Add instructions to load initramfs image and update the boot command
>>> to use the image to boot the linux kernel.
>>>
>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>> ---
>>> =C2=A0 .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=C2=A0 | 15 ++++=
+++++++++++
>>> =C2=A0 1 file changed, 15 insertions(+)
>>>
>>> diff --git=20
>>> a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=20
>>> b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>> index 0af0eef3..5ac61b34 100644
>>> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>> +++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>> @@ -7,3 +7,18 @@
>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default on all newer U-Boo=
t images.=C2=A0 This also means that some
>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variables such as bootdela=
y cannot be changed by this file=20
>>> since
>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it is not evaluated until =
the bootcmd is run.
>>> +
>>> +# Initramfs configuration
>>> +# Name of the initramfs file in the boot partition
>>> +name_initramfs=3Dti-core-initramfs.cpio.xz
>>> +
>>> +# Command to load initramfs from boot partition (mmc device:partition)
>>> +# Adjust the device number (0 or 1) based on your setup
>>> +# mmcdev is set to 1 by default, partition 1 is the boot partition
>>> +get_initramfs_mmc=3Dfatload mmc ${mmcdev}:1 ${rdaddr} ${name_initramfs=
}
>>> +
>>
>> This belongs in u-boot default env, it is basically the same as=20
>> `get_fdt_mmc`
>> and other helpers already there.
>>
>>> +# Load initramfs and set up variables
>>> +load_initramfs=3Dif run get_initramfs_mmc; then setenv _initramfs=20
>>> ${rdaddr}:${filesize}; setenv rd_spec ${_initramfs}; echo Initramfs=20
>>> loaded at ${rdaddr}, size ${filesize}; else echo WARNING: Initramfs=20
>>> not found, continuing without initramfs; setenv rd_spec -; fi
>>> +
>>
>> This should be part of `mmcloados` in u-boot also.
>=20
>=20
> mmcloados is only used by 'mmcboot' which is a differnt boot command=20
> other than bootcmd_ti_mmc?
> We can consider adding the load_initramfs to 'get_kern_mmc' and we wont=20
> need to override the init_mmc with the change.
>=20
>>
>>> +# Custom boot command that loads initramfs before kernel
>>> +init_mmc=3Drun args_all args_mmc load_initramfs
>>
>> With the above added, you don't need to override `init_mmc` so
>> this line goes away too.
>>
>> That leaves one line left, `name_initramfs`. How about just
>> setting a sane default name in u-boot. We got away with something
>> like this for K2 plats:
>=20
> We don't expect the name of the cpio to be variable, as the name of the=20
> cpio stays the same for all K3 platforms which is=20
> "ti-core-initramfs.cpio.xz", I can remove the variable altogether maybe=20
> and directly use the image name to load. Thoughts?

That is a very Yocto centric take.  But we also support armbian and=20
other distros.  They may not want to name the file the same way we chose=20
in meta-ti.  The question is, should we paint ourselves into a corner=20
from the beginning or allow for some flexibility?

Plus, even in Yocto, a user could choose to not use ti-core-initramfs=20
and instead make their own with their own name.  Making this more=20
flexible feels more friendly in the long run.

Just my two cents.


> Regards,
> Moteen
>=20
>>
>> https://github.com/u-boot/u-boot/blob/master/board/ti/ks2_evm/k2e_evm.en=
v#L12
>>
>> although I'd recommend a more generic filename.
>>
>> Andrew
>>
>>> \ No newline at end of file
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

