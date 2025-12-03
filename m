Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A46D1269B
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 10:23:46 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11948.1764757424195436841
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 02:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PnhFObiT;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.2, mailfrom: anshuld@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7fCnGHs32ZAgvTbfVf/qgbsraA9sEkm/xLFg4FiTdG9K6JJAHz09dAFEYDYl1hCcj46Ea0v5gjjN5810pBtKG1a0TvWR2cOCK4GyJideggGWH6SZVzrPFWUIy5SU1w277RpXGU9kv6r1vsKbodjzmU6GRg7AJgAvO8VcC12w/c2r1G3h861kIQF4URh1+LMi+pePvir7+bv68u9WgmJixyKUsuj3KnBl7LX6xiLuGwcqyXZbXO6EPZooXX5dNqX5uDS/o6wPNxeL338AzPo0y12JVxqZu4vomZMxro8lxyFDGkA2loZvx1QaWXCX3htAJ+VYiHIXkfrZshM+xokXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noaP0R0X7NH3S7hiqeuQnlK3l/GI+BrbvXRPYzB642g=;
 b=H5FZ7vm7AO+skCLYSDIo3dkY4c8m6y4DS9EesnRcFY0qfAKZP3aGfSMv3AUJdcv/k3s5lETHS01Jo0sul2/JJjMXRFVJEvwwCHDz6MToDr9L5SbsZgnX+mvEHmh8KVR/A/9GGs0VOAKbShohSVyNUcquyI8snM0BwCH9o9mKMbCsT8F9QIR9KPubWnw9SIvdoL3ySQYcUIh4aunJ2QEEE3ikEqxM3AfiRmex8MpY6z+bfgdyzEeqLHfjIpgY8gWKFW3Sh7tx4ayoGOUlYeWuhrys3gpmMZBJUQtq9dOdkhn8nRkTVRhg8v2390auT+1H8WYPkeUGCVNvgHvTTNMxZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noaP0R0X7NH3S7hiqeuQnlK3l/GI+BrbvXRPYzB642g=;
 b=PnhFObiTwsbTDV9Iy401JuFw3l5iBezsxU2kXHZfI+2io0kuLIKHqtcRKYPqiN589/UmKvv1+NuZh0T8nAlsEK016SnyKyuMmmw6tdA1QrlH69UZbO5Mu5MP+Ziv0az5ySkv5Z4N4ljUo8s8qk3s9CwumQ53KODsTPbDH37pNss=
Received: from SA0PR12CA0015.namprd12.prod.outlook.com (2603:10b6:806:6f::20)
 by DS0PR10MB7979.namprd10.prod.outlook.com (2603:10b6:8:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 10:23:40 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:6f:cafe::b1) by SA0PR12CA0015.outlook.office365.com
 (2603:10b6:806:6f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 10:23:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 10:23:40 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 04:23:38 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 04:23:38 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 04:23:38 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3ANbbI3866084;
	Wed, 3 Dec 2025 04:23:37 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 3 Dec 2025 15:53:36 +0530
Message-ID: <DEOIAL6O198D.2VGOE1FQNQTL3@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vigneshr@ti.com>,
	<denys@konsulko.com>, <reatmon@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH RFC 3/4] swupdate: add bootloader
 support
From: Anshul Dalal <anshuld@ti.com>
To: Yogesh Hegde <y-hegde@ti.com>, <anshuld@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251202111603.1616989-1-anshuld@ti.com>
 <20251202111603.1616989-4-anshuld@ti.com>
 <20251203055830.73womzso5xslwr6l@yogi-work-pc>
In-Reply-To: <20251203055830.73womzso5xslwr6l@yogi-work-pc>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|DS0PR10MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: ac62354a-f444-4cee-1af6-08de3256077c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Tkh0azloR0pUTWYyeG9UVlhacXA4Vm0yU2VFMTV4a2JRMEdMQWhMOHp4c0dq?=
 =?utf-8?B?TUQvV2d1cWJUaXBEcDZJVFJ5Q2RzaUdFRWg1UDJQODRWWjNlQzF3cWhJVmI3?=
 =?utf-8?B?S28xbUgyc1RIb3JkNzlnK0c2L0VBUEZBWHN0UXdvTmx5WGJtUGtnU0FCbklZ?=
 =?utf-8?B?THAvdmh2aGNuZlRjRUU1NTRDMGM4eVFJWUgzQ1JYVDRYd1M5d1pyTW5kU1Bt?=
 =?utf-8?B?c3J2RzlhNTRybkdqaktiZjdhYkx1Q0NGVldYckovanNPZmZEYVJPU2kwUG1X?=
 =?utf-8?B?bjNvZmpqaXdnbXVlRzRaemk2aWowbzc4OGJLRnNDNWc3djAwbThiclhOMzBx?=
 =?utf-8?B?eE5CSU9KbGhzRjNzL2tkQndpeDl6MUErQnJPNnFicVphL1NQdEFrcFRvSVVp?=
 =?utf-8?B?L1lqYTBkdzlaeVVhRS9NVytXTTdQa2VBdkNCK09heGNMWTBLcElFTlhjRm1W?=
 =?utf-8?B?SEt0K3NYZk1nRmgxM1RpS3QxRjRtaGd1blRYaWVrYWVBcEkwSkRFS3VQMXpm?=
 =?utf-8?B?aUM2ZDhNbTNsQkMzU2planJQdmVmeU9oQjFtZVN5ek1RWEIydXd3MTBreWNw?=
 =?utf-8?B?NVB2cHpJN1VPSnYxd1IxcEFjd3ZkR2lCeElQdVhrTk1KT2ZGbklLRHEvL3NO?=
 =?utf-8?B?ZkRvUytBWkMzekZQWVhNb0ZPRUFXZWkwdVptUU1HY2JiVWlqQW5CUm9QMVI1?=
 =?utf-8?B?eTB4Q09NZEowbEFSekpqK2hUcUd1a0VHSVlVR25JSk5zTVhvdjk4dGpObE9B?=
 =?utf-8?B?L0FlK2IrMTJaS2VTWXp2ZFlTZU16ZzF2TDgyOHlrVTR4TUFRZ3dnYmZxQVYy?=
 =?utf-8?B?czhmS1VUSitSUEV5UnlsK0hia3BoU0RFbW1PRnZ3WERvUUtJNVRjK2ZxcVd5?=
 =?utf-8?B?ZkVFRXYyc2hpNU8xeGNVQzVVZGhGTG9hdTJiUmF3ZkNNeVFXNVZyelRVajJX?=
 =?utf-8?B?WnVxdC9uc2xQVXM1WnJGdFcvR09XNkFoZTdiRnNUaW00ZDJBU09tOGlkd1cz?=
 =?utf-8?B?OG83T3ptQUk1ZVhad1Jlbmg5Rm9oOC9EdGFHYmtLY0pWZHRaZ3ZOY1NmWmp3?=
 =?utf-8?B?K1dRbURkSzFoWmZ6K05hUTZVUE9TRTJGSW5ka21NT1NlVTdwREllcVp1SGU3?=
 =?utf-8?B?SU5DY0oxTHNYcmJHN0xnUlArdGV4L2FGSHZZZkdyVUx4RkpMdUVPYXQvMGdS?=
 =?utf-8?B?STQrcVFkK2dUd2tCbHZuQzAvWmU0bEFpQXVkYi9kWnhzQXlCbHRkZjcwNGVr?=
 =?utf-8?B?a1ZXbVNhaytqSFlUR0kycDNwdjJVRzAwc1lRQkkyRFE1TkVIeitrREtiQ3FL?=
 =?utf-8?B?R2VjTmRQbkFEd2tqYTlEeUFiT0JBTnpRdjlrZVk4dU1RaGRLRUtYVy9KTEJ4?=
 =?utf-8?B?ZjIwSlBaZjRvWkN6NWNhZGdMdXg1b2lyeGpjK2FVaGp2M1lhNUYrdXlKajZk?=
 =?utf-8?B?Si91aFRNdUNMbzgyZkpEOTJKd2JqMW1qSmpZVG4yRGhEcnlpMjhTbzc5Zk9T?=
 =?utf-8?B?V1hxLzE2UGszMTBwNnZVcmN1U1ZjRG00MXpHM3NLYWVSTE51MTZFNmUwT2NB?=
 =?utf-8?B?cW0xMUdkUDlSU1loOW5oa1Fva3o2NE9wdWRVazdYZGExM0xtTGFGbUdSMzZZ?=
 =?utf-8?B?QzRXNmN6QXFuUUN1RG5WTVJxbUF5YVZHZkRHN2MvUWdUSVNrZTNBN0pLeFZK?=
 =?utf-8?B?V0ZFNWpKZXlicUtqeW40b2t6WitIemw4WVBnei9pWEZEVkh2TWhpYXhTbjVH?=
 =?utf-8?B?Q2NVbE4xc09NOWJuTlp4L2Y4Qmh2WERRY09OSlFpcW5GRmdLc0xOazJ6R2h5?=
 =?utf-8?B?QWN1cWxHSmFYbExHYXRCZkpOUzFUS29GcTlPL2xCRGVOQjhWMHZaSXhDY3Y5?=
 =?utf-8?B?U04zNXVMNFNZMTVua0xyZk11b2FUcWZ5eXlhT2xIbG1ZOG1EZmduVGhsY0pB?=
 =?utf-8?B?QWl6cjVCaUZCc1FuTFpRVVlJSVc1ZXEzaTlJUGhBeUZweTc2c3ZVdWZZOWU0?=
 =?utf-8?Q?0yBtIyv5vQO0wPDetu2ENVYG9abst8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 10:23:40.6969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac62354a-f444-4cee-1af6-08de3256077c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7979
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 Dec 2025 10:23:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16857

On Wed Dec 3, 2025 at 11:28 AM IST, Yogesh Hegde wrote:
> On 16:46-20251202, Anshul Dalal via lists.yoctoproject.org wrote:
>> U-Boot uses the 'bootpart' env variable to configure the rootfs for the
>> kernel at boot. The BACKUP_REG0 MMR is also used to store bootcount as
>> per U-Boot requirements[1].
>>=20
>> After each reset, U-Boot increments the bootcount and it's reset to 0 by
>> the swupdate service indicating a successful boot. If the kernel panics
>> however (eg. if the update failed), the bootcount is never reset and
>> keeps on getting incremented by U-Boot until it reaches certain
>> threshold after which U-Boot switches to the other non-updated partition
>> to ensure a successful boot.
>>=20
>> This patch adds support for the same to the final .swu image generated
>> by the update-image recipe.
>>=20
>> [1]: https://docs.u-boot.org/en/latest/api/bootcount.html
>>=20
>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> ---
>>  .../recipes-swupdate/images/files/sw-description     | 12 ++++++++++++
>>  .../recipes-swupdate/libubootenv/files/fw_env.config |  5 +++++
>>  .../libubootenv/libubootenv_%.bbappend               | 10 ++++++++++
>>  .../recipes-swupdate/swupdate/files/defconfig        |  2 ++
>>  .../recipes-swupdate/swupdate/files/swupdate.sh      |  4 ++++
>>  .../recipes-swupdate/swupdate/swupdate_%.bbappend    |  2 ++
>>  6 files changed, 35 insertions(+)
>>  create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/files=
/fw_env.config
>>  create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/libub=
ootenv_%.bbappend
>>=20
>> diff --git a/meta-arago-distro/recipes-swupdate/images/files/sw-descript=
ion b/meta-arago-distro/recipes-swupdate/images/files/sw-description
>> index 8dc4e2b2..241bc95c 100644
>> --- a/meta-arago-distro/recipes-swupdate/images/files/sw-description
>> +++ b/meta-arago-distro/recipes-swupdate/images/files/sw-description
>> @@ -15,6 +15,12 @@ software =3D
>>  						compressed =3D "zlib";
>>  					},
>>  				);
>> +				uboot: (
>> +					{
>> +						name =3D "bootpart";
>> +						value =3D "0:1";
>> +					},
>> +				);
>>  			};
>> =20
>>  			copy2 : {
>> @@ -26,6 +32,12 @@ software =3D
>>  						compressed =3D "zlib";
>>  					},
>>  				);
>> +				uboot: (
>> +					{
>> +						name =3D "bootpart";
>> +						value =3D "0:2";
>> +					},
>> +				);
>>  			};
>>  		};
>>  	}
>> diff --git a/meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env=
.config b/meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.confi=
g
>> new file mode 100644
>> index 00000000..57eec5fc
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.config
>> @@ -0,0 +1,5 @@
>> +# Describes the env location for U-Boot in the hw partition
>> +# Second entry indicates redundant env
>> +# Boot dev			Offset		Size
>> +/dev/mmcblk0boot0	0x680000	0x20000
>> +/dev/mmcblk0boot0	0x6a0000	0x20000
>
> Does this fw_env.config work for all machines? =20
>

No, AM64x and J7200 make use of different offsets. Though it might make
sense to move the libubootenv configuration to meta-ti altogether with
the config under libubootenv/files/<SOC_OVERRIDE>/fw_env.config.

Since this config is not only useful for SWUpdate with arago but anybody
trying to make use fw_* tools on our platforms.

>> diff --git a/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_=
%.bbappend b/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.b=
bappend
>> new file mode 100644
>> index 00000000..e3d142f2
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbapp=
end
>> @@ -0,0 +1,10 @@
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
>> +
>> +SRC_URI:append =3D " file://fw_env.config"
>
> If this config is not tested on all boards, it would be best to only appe=
nd it
> to the machines that are tested.
>

That's fair, perhaps we should error out on builds with untested
platforms with 'ti-swupdate' active.

>> +
>> +do_install:append() {
>> +	install -d ${D}${sysconfdir}
>> +	install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}
>> +}
>> +
>> +FILES:${PN}:append =3D " ${sysconfdir}"
>> diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig=
 b/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
>> index b1362eaa..4a2d78c0 100644
>> --- a/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
>> +++ b/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
>> @@ -1,8 +1,10 @@
>>  CONFIG_HW_COMPATIBILITY=3Dy
>>  # CONFIG_LUA is not set
>>  # CONFIG_BOOTLOADER_NONE is not set
>> +CONFIG_UBOOT=3Dy
>>  CONFIG_SYSTEMD=3Dy
>>  CONFIG_WEBSERVER=3Dy
>> +CONFIG_BOOTLOADERHANDLER=3Dy
>>  CONFIG_CFI=3Dy
>>  CONFIG_EMMC_HANDLER=3Dy
>>  CONFIG_RAW=3Dy
>> diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.=
sh b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
>> index bb3a3593..2083062e 100644
>> --- a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
>> +++ b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
>> @@ -8,4 +8,8 @@ else
>>  	SELECTION=3D"-e stable,copy2"
>>  fi
>> =20
>> +# BACKUP_REG0 MMR on AM62x
>> +UBOOT_BOOTCOUNT_ADDR=3D0x4301c100
>> +
>> +devmem2 $UBOOT_BOOTCOUNT_ADDR w 0
>
> Using devmem2 might be a bad idea. Consider using fw_setenv [1] to set
> the bootcount to 0.=20
>

Yeah, this should be trivial to support with libubootenv-bin added to
IMAGE_INSTALL.

Regards,
Anshul

>
>>  swupdate -H @MACHINE@:1.0 ${SELECTION} -p 'reboot' -f /etc/swupdate.cfg=
 -w "-r /www -p 8080"
>> diff --git a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbap=
pend b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
>> index 0ce763f9..20f87435 100644
>> --- a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
>> +++ b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
>> @@ -2,6 +2,8 @@ inherit swupdate-lib
>> =20
>>  FILESEXTRAPATHS:append :=3D "${THISDIR}/files:"
>> =20
>> +RDEPENDS:${PN} +=3D "devmem2"
>> +
>>  FILES:${PN} +=3D " \
>>    ${SWUPDATE_HW_COMPATIBILITY_FILE} \
>>  "
>> --=20
>> 2.52.0
>>=20
>>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16850): https://lists.yoctoproject.org/g/meta-arago/=
message/16850
>> Mute This Topic: https://lists.yoctoproject.org/mt/116574476/9980049
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [y-hegde@=
ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>>=20


