Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1DCEDEC15
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 06:33:32 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12554.1772606005181631526
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 22:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wzcfVn5s;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.65, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEbPbgkwXIOtaBp/swWZchHTy4dp8T/Q8f8lDwE1uO1yB7bj5pOnQY/mdFnn3UqyNfjGimL/EGfR5R96LrGbMGwAQjGFV3M+8ffozIGP2nWltJquM9P8CzNvdO0109zXJ9lKvlGbmDCEt2BcOQsVDoI0hYSKju8kIdRx5m/AHfxwx9ehjoRciwAeJ0/8SXd5z7z9oF+Mn8r1QdSnIr+lW0pyRVVJfU2WC2LoyAysLJfvpNZxZJXpa3V2ww7ghv/9B3OY/OM/o6lVUoIXG4pYBT2yFLj1PwTw1lc6+9R8LFUDXgjr8NcyOs2vLrXVVBgnC3c2BGxHfE7NqYYqPoOx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeNFwSlm4ohwzAnwdQx/YZcyqljW9Sp/CXHmilN3PqU=;
 b=Zu+we9u0k6nIYwTiH2pBULI7AT17M2I8fHeQfqrIdyo4OvNLxsBL9Le69B8U9yT7xfSiFlm6ie5eD5cjRnmUeDVQdHo4dFKHRZd5OsmKb1siBjiy/kbaCqtaxuRCit3dqt43bB6JuujhQaQ1owvJ7ETtjWAak1mi7+FEIFDoJOsu5tIFyhfSJovv8+4hDm3j8wh8lt7/fbjyTtjp52QwtiMyytwQBrJtKCh1ho55uDjE5P4dDFKo0t++Q5BAUzKK3J/sItR1Nc6ATiXdyKDs8zMxMg9FEq9a6xnlYAqCWEYKbnJuvTon4lH4TStg6dAI776eGfO9t/mnzzORxBIbgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeNFwSlm4ohwzAnwdQx/YZcyqljW9Sp/CXHmilN3PqU=;
 b=wzcfVn5sQk8ZM84ql7EYEyNUdrTRoH4RrXZ5+//EpPiOHE4WMSg2mSmWD7kcXfjAN9nAZtwS+3h0K7+69CJ40brEjBlufT0qQuQKFm/iEvHAMSN+kTqegDH3W9L1OCLeXuRQ7DPuy5bs7WHC6KCk5KSTyNHR2X1rQOSyDlFhKE4=
Received: from SA1PR02CA0021.namprd02.prod.outlook.com (2603:10b6:806:2cf::20)
 by SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 06:33:21 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::ae) by SA1PR02CA0021.outlook.office365.com
 (2603:10b6:806:2cf::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 06:33:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 06:33:18 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 00:32:57 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 00:32:57 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 00:32:57 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6246Wsfw3557799;
	Wed, 4 Mar 2026 00:32:55 -0600
Message-ID: <565f34b6-b312-4dd1-a822-58cdc1bc7187@ti.com>
Date: Wed, 4 Mar 2026 12:02:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [PATCH] tisdk-uenv: Add instructions to load
 initramfs while booting linux
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
	<praneeth@ti.com>, <denys@konsulko.com>, <vigneshr@ti.com>
References: <20260303104930.889956-1-m-shah@ti.com>
 <d27ccb3c-4f70-486b-baf7-2dfc0943e240@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <d27ccb3c-4f70-486b-baf7-2dfc0943e240@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|SJ0PR10MB4688:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb10132-0abd-4fcb-6910-08de79b7ecae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|34020700016|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 
	Pii7au/LdjXNw+yhvUjRIePPHGNHND0hBhvb0T1m0AkB8inNwXaK1Eb8DZ28e5xzV3jcOzb8MfTOmGUqf2P3tcHn6DCmU/bq5gVTZ7E9T0OyBgadXUQuuvOD/Ah6huXKSJqdu3+9FupDResilh54CMunuSirVlLBQPMN7cSRazkwQIDUyGGQrwd0K7nalATwXB1m8i8xOfFKUMAx/67e3jzolWgWPIcn2Ja4FzAjlwANLCxpzG3dEJWgFE0CYn/gAk8/BD8/rVc/W9fcXYbMUm/wEzZSNYjtkSxki2Q8JZjZwppdlBPBNQOjj/lPNTpgvQ3KplWd4OLbq1h5xdthqak4N0R1+tuBZUJ6CQpP4VknYdUHjeUa6W/zBmUQadmcBdM8EX6lAk1by9Tyb7gwJ+MnI+K455lT1O8eJqQ/RuLL3FybN+rpxdVy5x3hWiinx7GdO247kQILqvQ0CALvg91S7eErd02F9CdGt3jomA7FrDTt/iegF75t1uL+JUs410fcke2nELk0c2tx/AHKQV6mwk/jHdvWRTVCJ5CHjj94XW3G+iBfzUH65TvVv4JdD4c4QRbtCp9UeRH/0BLpX/Gp94cPu8x2DzNvHbf8UMebs4N/N6aoNnYJyyPPPcD2tPnAvgDZWmTeDjhTf05cupUEj4PHZRn5KPqOcezYNbSHfbmgXQeLpM5NmQ8Yy0rhOQFEcVn5MC9fNlL1ZgsjobMpZ4tw/KCrptRKsFqr6do=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(34020700016)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RlRKoWPOZ7TVSMG4A5j+ZeLNZk9xTWWx16ijAzqo7A9g2V0mUMBIJRcbZxcMi7ZCRpNwVkMdDnifpOcU65hksLMZJp8xKiIH5G5zuvjCOvL5iKy1nuhM62X9xHe2sZI/bZ3cJltdMONkKI+Ra2wPL0C2TD1z9sDIvrkTMPtBCPc+zfeUROy+1T2hiDlC58owU9ynFIPvyJVxKZ2pryzE8c3lBY3CZxRH82M9KnL9dd9abckLfp30Llt2DDdZ46WDuxPTfwxjSbnMjr8B4Ow0ULzgneqiq7QeVicsdvD0/QPx6Yl65K2MjvIczhjTip4RGB1oeYvYq/nM+8w9xE738vPb8pteR+i8yiRUfVnl5LNq6j88QPO4Ofdx33VEWecNWLh/eS97y1dvWrFjZKO7bpQMBOpMkDg7//7IVKIeU0JLRn2oTvNWTTFchJh6XGSK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:33:18.9325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb10132-0abd-4fcb-6910-08de79b7ecae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4688
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 06:33:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17211


On 03/03/26 22:49, Andrew Davis wrote:
> On 3/3/26 4:49 AM, Moteen Shah via lists.yoctoproject.org wrote:
>> Add instructions to load initramfs image and update the boot command
>> to use the image to boot the linux kernel.
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>> =C2=A0 .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=C2=A0 | 15 +++++=
++++++++++
>> =C2=A0 1 file changed, 15 insertions(+)
>>
>> diff --git=20
>> a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=20
>> b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
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
>
> This belongs in u-boot default env, it is basically the same as=20
> `get_fdt_mmc`
> and other helpers already there.
>
>> +# Load initramfs and set up variables
>> +load_initramfs=3Dif run get_initramfs_mmc; then setenv _initramfs=20
>> ${rdaddr}:${filesize}; setenv rd_spec ${_initramfs}; echo Initramfs=20
>> loaded at ${rdaddr}, size ${filesize}; else echo WARNING: Initramfs=20
>> not found, continuing without initramfs; setenv rd_spec -; fi
>> +
>
> This should be part of `mmcloados` in u-boot also.


mmcloados is only used by 'mmcboot' which is a differnt boot command=20
other than bootcmd_ti_mmc?
We can consider adding the load_initramfs to 'get_kern_mmc' and we wont=20
need to override the init_mmc with the change.

>
>> +# Custom boot command that loads initramfs before kernel
>> +init_mmc=3Drun args_all args_mmc load_initramfs
>
> With the above added, you don't need to override `init_mmc` so
> this line goes away too.
>
> That leaves one line left, `name_initramfs`. How about just
> setting a sane default name in u-boot. We got away with something
> like this for K2 plats:

We don't expect the name of the cpio to be variable, as the name of the=20
cpio stays the same for all K3 platforms which is=20
"ti-core-initramfs.cpio.xz", I can remove the variable altogether maybe=20
and directly use the image name to load. Thoughts?

Regards,
Moteen

>
> https://github.com/u-boot/u-boot/blob/master/board/ti/ks2_evm/k2e_evm.env=
#L12=20
>
>
> although I'd recommend a more generic filename.
>
> Andrew
>
>> \ No newline at end of file
>

