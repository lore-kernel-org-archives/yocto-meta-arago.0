Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB783F33A80
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:06:34 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46308.1772723184542717263
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 07:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=NNQfuw3F;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.27, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lr7/NbhRKDd3HrGosGGGwTqpmTrcirFE/M0mcE4n2LxOSOyAhobnj3VToLgrEfbd0z+f3PWv39gFpysS9TdBO/DB0cRSHIYc6JhvVk4mSaSPLnO+6Fk3rBe6Bl2BiGlOgJaLRbhHua7lT9MD9or3nskOuYEr9zZ9n4iqd3Zq8D4d13eIRnAjmNIjCcyKfcP958W/FAKR+ztUc4mYUfAik6PQrNIaNgYSLLhwkLWuatyFs+KctEZkhQa77xcTuCFi1RBu5LC+P119vQdEnTLrCjv/T0BiFjtWsN74oT+0GuDkRAOgtEkcL3gOC7W2mRb/TUsbmcixSM96NfN05UnhCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyEILOsngBfp9AzfyeJLGiJzgWr2Th2NxwN0vfQOS6U=;
 b=hRXuKTeDWCa72MX81QsXB8FGNsR5m5jPY3aKToNxfy+Wsv7ml0B05NNjxkcMcvQd/SK6u7uJoMLBW+3KZQ9ogxLy1HmQLeKNPBWZ5ve+7hplpX2+80vQI0Vb1yQmwhkgTxx021JLWc/m9ZDO1r1C3aT6PxnScHWXPqlzzlNE8kdBcDkMHtmpmmPEdmR9hQfGyc91ha5hydNH+Jm47qSyCYuNXcHciLYwd3sjgoLU9kzz9bv8x8V+kloukp2sj5vd7vbbTVlJYWVEcbmf3A2L+v2GYSZ/EX84mD6ZAl2+phn0AE2Cm32XHZ1gU4r9lFU1xDZztwYCsOOHy6tF1Gyggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyEILOsngBfp9AzfyeJLGiJzgWr2Th2NxwN0vfQOS6U=;
 b=NNQfuw3F4jVZPXqRn0XAdd51kEIZ+ZBrS6Gargm0qBSVnLWDfo8t6YViHZtiIjQeRe1ejkrlrWKsu0JJ8uMHXF7V0kc9e5xpn94/AUxRbVVqjVyQ7wy0vEUKq3NlsPwETBXYN+Sk0uMegHXUV5OiB/qNtKgS8GqYlBraAAejixA=
Received: from BN9PR03CA0211.namprd03.prod.outlook.com (2603:10b6:408:f8::6)
 by SJ5PPFA7D84DD83.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 15:06:21 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::2) by BN9PR03CA0211.outlook.office365.com
 (2603:10b6:408:f8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 15:06:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:06:19 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:06:18 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:06:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 09:06:18 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625F6IAx2541349;
	Thu, 5 Mar 2026 09:06:18 -0600
Message-ID: <f2e57ffa-0080-4f62-af5a-1cfcafbb944a@ti.com>
Date: Thu, 5 Mar 2026 09:06:18 -0600
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
 <b919fb23-6b17-405c-8883-64610218e604@ti.com>
 <c6a06889-7318-4c2e-a626-01651273a798@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <c6a06889-7318-4c2e-a626-01651273a798@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SJ5PPFA7D84DD83:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f84852-b732-4272-ea4b-08de7ac8c1a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|34020700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	NBbCGAbuZeuwzSBNqPVKc76ppjMeN4IQ5nsH8I6pX+6hX2ALWB8l+0EYkn3pNILK99/IW90gxXYywmTLMYTGl8FSF9GgTgseoUmdi+qZg2oC8rly1GvVHV+2pkh8Xur+K9psqis0k4dGq1Ce9xIlv8NOdT8/plfZe7UK7TmJ8vRQlayKNA/cdW6Aed4jOPmKNosUzaoqwW+wRIYC5vLe1hBEPAylCdnOnz3v43A9JWHi6XHdnB99bObDTTpTz0kNUFfoIncdFexC6EKIbMnITsugL9WITmleasMq457ytQOD/3ycdos6ltFYYzJG/mldZUTTtJ9xGc4hiPFN4tZSFAyYYrvKqPOjlplS3Bul82L+a6IseYloOUXXdV1riwwvuqJerWNqKxSenyilaAiwGnHlaejC1BzcpQO1cpkoBpNl8+NEz2sEOdJpeQZNSsoQDFk6Xafnnxo1LCuJkRsQsYk6Km4YdLtfd3jWnQkP+hA0jJV4fezbwL/OnkXNhlEIThe4wLU75xgmYAKo6FffOAMzPxvHgjunHlpOzpZ5SPfCE4I72zkVAGubk+fIm8UCMt6zMNnbyoWNtqeZ7qXhY5uKjftKV6l5rbb1qMUx+zAVnH7GyTAcj0DW9b1ZHxsZBMS82Py5Q3Vzr2liADMOsXup+OS4U+Flne5mYTBdDwFEIZUc82ax55z+amuiWLy+LNb/xT50c5yJX40J4Hew+VxTEnje0YqfDsgG0SrmwT8=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(34020700016)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Wx0J5KjvTmtDLZdyxSAutpKTFjZYrXS65jOnnT63oS5diJfs1DtIaa2uklsiYblfp5+LQcCvYGrv0SkiGAShsVRDAWP1g5uumLYCXuC/NYViUDNcSYndfYJJvvRUAlitxniE9O4YfEvbjOCEVv5Pxf+cvNOyaa5RqRAzQUv5n26y3xQsm9W1frxCgF2cUhC9krVU0RiQnr7hBjVeBjQPBLsMKcmFJ9GwLcmn5fZ/sYNhWB3HAVaad5EZcTw8V1kQOBR3vbzPDGeU+UBjvMasIMKKz1saopqxbRt7bq+gLsWra3N3Rm1MM9r7KV+QbAx0gTbqa2e8FfffrkNSD4eSR0k1J027GfeIkLYDjZhxAt/078DBEgdI4ASsUtmYceDA/H+tfdTYH6Mqu6Qub0DpfV03UvlEwbscCiYPIzscqQpi7zC5UyOocRcYodCqRKyN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:06:19.2644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f84852-b732-4272-ea4b-08de7ac8c1a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA7D84DD83
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 15:06:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17234



On 3/5/2026 12:51 AM, Moteen Shah wrote:
>=20
> On 04/03/26 20:08, Ryan Eatmon wrote:
>>
>>
>> On 3/4/2026 12:32 AM, Moteen Shah wrote:
>>>
>>> On 03/03/26 22:49, Andrew Davis wrote:
>>>> On 3/3/26 4:49 AM, Moteen Shah via lists.yoctoproject.org wrote:
>>>>> Add instructions to load initramfs image and update the boot command
>>>>> to use the image to boot the linux kernel.
>>>>>
>>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>>>> ---
>>>>> =C2=A0 .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=C2=A0 | 15=20
>>>>> +++++++++++++++
>>>>> =C2=A0 1 file changed, 15 insertions(+)
>>>>>
>>>>> diff --git=20
>>>>> a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=20
>>>>> b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>>>> index 0af0eef3..5ac61b34 100644
>>>>> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>>>> +++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>>>>> @@ -7,3 +7,18 @@
>>>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default on all newer U-B=
oot images.=C2=A0 This also means that=20
>>>>> some
>>>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variables such as bootde=
lay cannot be changed by this=20
>>>>> file since
>>>>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it is not evaluated unti=
l the bootcmd is run.
>>>>> +
>>>>> +# Initramfs configuration
>>>>> +# Name of the initramfs file in the boot partition
>>>>> +name_initramfs=3Dti-core-initramfs.cpio.xz
>>>>> +
>>>>> +# Command to load initramfs from boot partition (mmc=20
>>>>> device:partition)
>>>>> +# Adjust the device number (0 or 1) based on your setup
>>>>> +# mmcdev is set to 1 by default, partition 1 is the boot partition
>>>>> +get_initramfs_mmc=3Dfatload mmc ${mmcdev}:1 ${rdaddr} ${name_initram=
fs}
>>>>> +
>>>>
>>>> This belongs in u-boot default env, it is basically the same as=20
>>>> `get_fdt_mmc`
>>>> and other helpers already there.
>>>>
>>>>> +# Load initramfs and set up variables
>>>>> +load_initramfs=3Dif run get_initramfs_mmc; then setenv _initramfs=20
>>>>> ${rdaddr}:${filesize}; setenv rd_spec ${_initramfs}; echo Initramfs=20
>>>>> loaded at ${rdaddr}, size ${filesize}; else echo WARNING: Initramfs=20
>>>>> not found, continuing without initramfs; setenv rd_spec -; fi
>>>>> +
>>>>
>>>> This should be part of `mmcloados` in u-boot also.
>>>
>>>
>>> mmcloados is only used by 'mmcboot' which is a differnt boot command=20
>>> other than bootcmd_ti_mmc?
>>> We can consider adding the load_initramfs to 'get_kern_mmc' and we=20
>>> wont need to override the init_mmc with the change.
>>>
>>>>
>>>>> +# Custom boot command that loads initramfs before kernel
>>>>> +init_mmc=3Drun args_all args_mmc load_initramfs
>>>>
>>>> With the above added, you don't need to override `init_mmc` so
>>>> this line goes away too.
>>>>
>>>> That leaves one line left, `name_initramfs`. How about just
>>>> setting a sane default name in u-boot. We got away with something
>>>> like this for K2 plats:
>>>
>>> We don't expect the name of the cpio to be variable, as the name of=20
>>> the cpio stays the same for all K3 platforms which is=20
>>> "ti-core-initramfs.cpio.xz", I can remove the variable altogether=20
>>> maybe and directly use the image name to load. Thoughts?
>>
>> That is a very Yocto centric take.=C2=A0 But we also support armbian and=
=20
>> other distros.=C2=A0 They may not want to name the file the same way we=
=20
>> chose in meta-ti.=C2=A0 The question is, should we paint ourselves into =
a=20
>> corner from the beginning or allow for some flexibility?
>>
>> Plus, even in Yocto, a user could choose to not use ti-core-initramfs=20
>> and instead make their own with their own name. Making this more=20
>> flexible feels more friendly in the long run.
>>
>=20
> I see. So we want to move the structure to something which tries to load=
=20
> any .cpio.xz present?
> Other question, how do we tell other users to include the TPS6594=20
> module(to put it in a better way include the packagegroup for intramfs)=20
> while building their own initramfs(specifically for AM62a), is linux=20
> release doc the right place to do so?

I would say so.


> Regards,
> Moteen
>=20
>> Just my two cents.
>>
>>
>>> Regards,
>>> Moteen
>>>
>>>>
>>>> https://github.com/u-boot/u-boot/blob/master/board/ti/ks2_evm/k2e_evm.=
env#L12
>>>>
>>>> although I'd recommend a more generic filename.
>>>>
>>>> Andrew
>>>>
>>>>> \ No newline at end of file
>>>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

