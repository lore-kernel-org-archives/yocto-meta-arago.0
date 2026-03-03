Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B042EDA6A0
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 16:54:50 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23414.1772556880606212136
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 08:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fFow2GXa;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.21, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzgjjFbOAZCNYyqrIC4vdJ1AqxAlRZIFKIN7FfYmGSd7eMDe1CT+id0YrEb2TqoSIc9smmgddsyGqfhr9JswFsu3VHWTVcX2JEKDpt/cGqZKSUaRDL7NftlpQYb1bvkmO/VzIoK132llUx6w5zLLUDjeyaFbAuHNOd4dA49nhsMW7d6/pkP5sI+Azq0JFPUD26OIGuqs8GNx3tB0OplQI7doKC91JtU0fXCZM6gDxsPJpuysrWG3qWHNRSmACVHcJwbN5fhfJiBaVTD4xaDTvAZ4qcL+9faSGQxBBZ5c0RQF/hi52uw8lMcr1QiqqkdGcLnrPURNS1f13ofJ1p1TlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsJLveh3nr+D55uHpNsPQXoeEbXU+p0p5/MfQrRiVHQ=;
 b=hG9zhPM2pAhr9bmnTUctGdFKgLCEAwtN3Jz0Ktlr8h38Qqm+/hy4ejwxnCKij7ULlu8/FItbFkhTROItwWdtD9nZaP4uPHHdhju5PdTqqKhOsxss2UeQxeri61Mfb4v8ZJjsfUkazK2kCFTS9jL/MRUS/UdYNO0B4U1ViMQxgpxjsTe4jNK6Ow6hEHrGuZ6XK5c/M78aUR5UQFXIQC7dxzxp9A10gD0veYm46sMxtnUxNLsEz/HTFEgDiYy/LvqWS3WsfD6G/WF7G1pFt1j6gWOyhyOl1IlMUF8EQkBoMEh+QtaVYgI1RJikOu6ipdF/qtQLWgfHl0lzCBDdnyGvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsJLveh3nr+D55uHpNsPQXoeEbXU+p0p5/MfQrRiVHQ=;
 b=fFow2GXauL0qrcxDxFI0Iw0PzA58aIR+7+P1gUq4XXh9YYtNU98Qykw5voAk+FY5l5WRmun6jXfEQhsxqN1ua+ag4uqAfGSlTo3GguOPhBHgt2aTxG/vtTfgrdphcQh+EIzYM4A2bt/UwIYRmAr3RrwDlsBferpYcMKg5MHyspY=
Received: from DM6PR02CA0139.namprd02.prod.outlook.com (2603:10b6:5:332::6) by
 CO1PR10MB4563.namprd10.prod.outlook.com (2603:10b6:303:92::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.23; Tue, 3 Mar 2026 16:54:38 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::ba) by DM6PR02CA0139.outlook.office365.com
 (2603:10b6:5:332::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend
 Transport; Tue, 3 Mar 2026 16:54:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:54:38 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 10:54:29 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 10:54:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 10:54:29 -0600
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623GsTJt2970797;
	Tue, 3 Mar 2026 10:54:29 -0600
Message-ID: <0c257ead-92b8-426e-98bb-13bb08511236@ti.com>
Date: Tue, 3 Mar 2026 10:54:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [PATCH] tisdk-uenv: Add instructions to load
 initramfs while booting linux
To: Moteen Shah <m-shah@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <a-limaye@ti.com>, <gehariprasath@ti.com>, <praneeth@ti.com>,
	<denys@konsulko.com>, <vigneshr@ti.com>
References: <20260303104930.889956-1-m-shah@ti.com>
 <18995CD714D202F6.918325@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18995CD714D202F6.918325@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|CO1PR10MB4563:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b00e05e-e600-40c1-1353-08de79458e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	EYq2/r5bVUId4WZRRI/iFq/WyjwuB6Ekp6fzEvsCjYKHOBmkl87PciB4pN2qNICDWv4hXvrb4bIUu1Ndp+t3YcEYZYAjmMIQ5/j+hMSelNCJ7vun1Ct11GOQ//K2LcnKKr/4Wl6apgDWj46soRRk1gHoIZd+9/n2mZkF0MwP74phPzDGoNoJAFzJjaJ/ebm0u2hUSOQldsSQcmfsunvtg2rCrns2Dr+baLoqJUAQW5uWbdLzQpkkChelNH/YvFu2sYQa/jqZOu2KFfD+i0c6YmE5xrywuHFtdTu8cEKZt+WnsqHLfRmMZpABzWH5/yZzAZZHZC+G4WUT6RFnO78mdYUl4koOWiwWItC3PmizUgJuPdrLZhASyoC4wFiBVImI5TPExvqsJa/ip6s+EhY9FKxMboPq8MKOTcQ+oRpR0/MOkTceg9fMhdXs0cYZlekIcxQ+y2dH03WyiATj1Fay0B2NQwQA3dwFz5s3XPNCekp1vO4YtSIXyE9ZoKE82UmndD/GJbxoAAVtfJstwUGOYcFgGl7+uNVux1S6UzMhAsvaC9MgU/OUZVdRXKYd1nvXGni280eBumYkivVs2k1mYNQVVheDU+BOT0BClcinG4OMzZfqHdaQqDecan4a9i+y80/s2+VO+Qhsf2wVnf8euI9kNb9FhP6g4M4aLwh9vIw4ZYgEyB5aDek1zF7XU+TVKjfvf2YjZeJcxz7HX+n9F4lWWLFpRTYtod3MmsVM4F63XoCZcjMzmzOy0Mloww3YBDF0PrftWeOyj381FVaXSZ+Xd0aJfCdPS7YlcjFx2SEGjfEfGIxPnWvdAk+CK4ejHWryzZS9YUMbcow9sZbKhA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jDg5WqubCnQuddoZVV28+UTCrn5RzF/8kgNqC9CMWB0fXEwF4ejigItt5ZbQm+sGuTMK8LAmB1UxdUn0V3Z8cyMjh0mBEwlWog7joik5cyVQC2P/TH2gd2Rau1Mk3lcNuieWtJY7YzP/l5KfflH9pgPdUId94KO6yCZyRNryGAlJLegmpzjvcWIWz4lpbcSyzD9lRseCyh4Rt5QzYdI/5eElA/XWd2a1efBk6TGfhDe8Ohwy22xeFvreCPbBKdU8ng+KvY2iqzj5gXLyCVKtyggVIkUWreZ0KVscM8hgF99CGLsyuEMoS7jtWQ6m9q5W8AraDI30BceQJ/u/2GFseI9etJPx1VdlMoQrhTcWwsHTt0GkqYWzEHOJ6t41yK/X7exWsI2zXDrT0TpoHa9olh2LrPbCZ8nP+cXkvq/yugZxqQAvwGU6zZ1YLBDjCBRh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:54:38.4716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b00e05e-e600-40c1-1353-08de79458e9f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4563
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 16:54:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17202



On 3/3/2026 8:59 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 3/3/2026 4:49 AM, Moteen Shah wrote:
>> Add instructions to load initramfs image and update the boot command
>> to use the image to boot the linux kernel.
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>> =C2=A0 .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=C2=A0 | 15 +++++=
++++++++++
>> =C2=A0 1 file changed, 15 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/=20
>> uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.tx=
t
>> index 0af0eef3..5ac61b34 100644
>> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>> +++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
>> @@ -7,3 +7,18 @@
>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default on all newer U-Boot=
 images.=C2=A0 This also means that some
>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variables such as bootdelay=
 cannot be changed by this file=20
>> since
>> =C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it is not evaluated until t=
he bootcmd is run.
>> +
>> +# Initramfs configuration
>> +# Name of the initramfs file in the boot partition
>> +name_initramfs=3Dti-core-initramfs.cpio.xz
>> +
>> +# Command to load initramfs from boot partition (mmc device:partition)
>> +# Adjust the device number (0 or 1) based on your setup
>> +# mmcdev is set to 1 by default, partition 1 is the boot partition
>> +get_initramfs_mmc=3Dfatload mmc ${mmcdev}:1 ${rdaddr} ${name_initramfs}
>> +
>> +# Load initramfs and set up variables
>> +load_initramfs=3Dif run get_initramfs_mmc; then setenv _initramfs=20
>> ${rdaddr}:${filesize}; setenv rd_spec ${_initramfs}; echo Initramfs=20
>> loaded at ${rdaddr}, size ${filesize}; else echo WARNING: Initramfs=20
>> not found, continuing without initramfs; setenv rd_spec -; fi
>> +
>> +# Custom boot command that loads initramfs before kernel
>> +init_mmc=3Drun args_all args_mmc load_initramfs
>> \ No newline at end of file
>=20
> Does this work if there is no ti-core-initramsfs.cpio.xz in the boot=20
> partition?=C2=A0 Or is this assuming that there will always be an initram=
fs?=20
> Because that is a problem if it is required all the time in all cases=20
> for all platforms.

Additionally, this is being done in meta-arago, but the=20
ti-core-initramfs is staged in meta-ti so that it is available for all=20
distros.

Is this something that should move to meta-ti?  Are these settings=20
really a distro thing?  Or a BSP thing?


--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


