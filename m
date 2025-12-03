Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4C5D12699
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 10:16:26 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11807.1764756978238719809
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 02:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=TuaktfN1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.22, mailfrom: anshuld@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPKgwjF6wBi6PQoEtXWZBoj4xrqR2TGSusm0gjXM1Aj+d688kM1/R0NqcISavUUJV77kjrJboXdtF1oekry7N81jL5u7W6kS1Eqml3zR0x6n4E2iEBFXBefphQIot4e/u3Te+dGwUzm7aEfXGLAUDgkhdOe8bHY2vTvo1psYUDl2f1WCWPlptjGZsvNaTlMimOu2FuduVf0bXHNWndlFHFUaTr9g8s8EsPxVImbPsAZN3ATQDyUscWwtbtVylZVKvjs/7Mgoay4K+lHNIE1t07bA71Drv6D98WOIJ9nlPC3lRtfEzXSRfcyKpFmZiZfh6DSSqBqw2G8RBTG2TZklmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjWDy5VYvT/biOnjCnFoIEYwpuAqQii1dSCC2OOWtx4=;
 b=hwdVLFIPsEfUWXslFdkJwpDGcC3CHTWNv6iSUlKXbqJC4NdUDdPhE/lrJQiiYD1m0eRdnLZoeLFfh0jy9QBQ35cWBK20TlBrmc6Kn2oKgGizwsK+0oGnuk4dOmgn+TsdK/l5GkVdIGJNVpgjylSJP4v8ZkZB5X9qDOX8qAIZ55b6qfmLfPMgmIOfvL+UTO7B1gHApkczXMMJ7UVLfUsDEjpZyMpgUHUt2ukL6nw6BeXBvsvEbPFmvj9kdFnax9Mff32sgqabEiuHfVR34f9ls5xAblt7qLoARPUVfQoij6gzJ5DcrwTVXEIsMk/np8ua2yGGgSpBA/5ACh0Q2YgZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjWDy5VYvT/biOnjCnFoIEYwpuAqQii1dSCC2OOWtx4=;
 b=TuaktfN1lxJEhgV4xfGZbIyVr9V861msycbIyBH+YDukeYghNR1bSxmWi0zHyvYir7ieuwgY11DrzmXewe9Dk4Q7ulecMhCWi4YYVLQ/DdM0bElSwcuaasLLqC/XlRZIe1+qbZhZXynoEsU0k4n8n+qIw1U1uDA+Tjjz/05eOeM=
Received: from BY3PR10CA0010.namprd10.prod.outlook.com (2603:10b6:a03:255::15)
 by CH0PR10MB5179.namprd10.prod.outlook.com (2603:10b6:610:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 10:16:14 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::1b) by BY3PR10CA0010.outlook.office365.com
 (2603:10b6:a03:255::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 10:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 10:16:12 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 04:16:08 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 04:16:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 04:16:08 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3AG65X3857011;
	Wed, 3 Dec 2025 04:16:07 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 3 Dec 2025 15:46:06 +0530
Message-ID: <DEOI4UB95HE8.HQIWL8ZAPCCP@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH RFC 3/4] swupdate: add bootloader
 support
From: Anshul Dalal <anshuld@ti.com>
To: Andrew Davis <afd@ti.com>, <anshuld@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251202111603.1616989-1-anshuld@ti.com>
 <20251202111603.1616989-4-anshuld@ti.com>
 <4ca3917b-8303-4f5b-bd42-65cfb19551db@ti.com>
In-Reply-To: <4ca3917b-8303-4f5b-bd42-65cfb19551db@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|CH0PR10MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c10e550-f7d2-472f-10a1-08de3254fc4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y3pXMC9OdXBDM1BVYXdaZ2VKWWlFU2tRcFBkejcwalBwQ3p2cEkvSklobDFE?=
 =?utf-8?B?SWJ3TlVkQXlWdUpWQWo0Qm1QTDY3SGZneHVKZWVNR0ZrUmZRNUVkemxkNTVO?=
 =?utf-8?B?S1V0eHJoVUg1OExiaW5QN1FWcTh2U29YdVRXYjh2SGRrOWxpd0Q5dThOTXJU?=
 =?utf-8?B?SXk5a1hleVZVMDZSTlVWeVFZNWhmeVpUc3FoK2tqUDJUcDRNZGxwT2tweTNE?=
 =?utf-8?B?dzYwRUZwdFdYU3IrUTJPNnMxZVZCa0VqVGs4WTFONGFQZjV6WDNkbFV4dXlL?=
 =?utf-8?B?K05DRnJTV0ltWEY4STNPd2IxVHNib0VSWENkeVhwaG5rUFBaZVZxK2ovS1Ru?=
 =?utf-8?B?ODY1b1Bzckp5MFVVM0VicFFIcS9zL1FDUUNXd1QvQlNNMTlLVUFhUGliWWsr?=
 =?utf-8?B?UEVyQjgrTjFqM3Z2UU83ajQwUjY1YUREdkdRTlYxemdQLzF0UmVWdEhrY3Uy?=
 =?utf-8?B?VHRiRCsyV1E3NDlJVC9uc2pqaHhQTFNyUjdPTStzTGJsaWlhcUZaY0VOM2pU?=
 =?utf-8?B?WGNpSWZCcDJ1czVINGdmUGhaOU5NZzZsLzgyY1dNYXJlV1hJdThUVWg1SERW?=
 =?utf-8?B?ZFJ4WkNOQ1lqOTdISzlNYWJWWW1ua0JpekxkWDMraXl4bWZTYUk2NVdTclFa?=
 =?utf-8?B?eXdWWXdhVWs1aU9admdZNUNuR0pxY1dtQS9SSlYvL0NnVDZDQU9XSXNjcXgw?=
 =?utf-8?B?T3VWMVpKME1XYTBQb0lxZGNiTzdyZ1pNNTl2T21UT3FoNHo3VG9rb3V1Qld6?=
 =?utf-8?B?Y3hTNkErbkoydVEzNlluRmk0NHQ5SHNQbUVnTmlOVG5GS0VVZzRIbnZrd1JB?=
 =?utf-8?B?SEZRY3pkQ3JLelB0d3pzTG5lOE03bFVvd1J1dkl6RXZySjNiTWdOaU1GR1hK?=
 =?utf-8?B?M1luQm53eTJuallwQ0FQaHdkdzJqNzdQb2k3aTJvVm0zZkliTU9icUpDZm9E?=
 =?utf-8?B?Y1pkMjE3NHJTWkg0T2huTk5pcXhVYjVTWUZXelFKTlJBT0hhUitzazFCdTdQ?=
 =?utf-8?B?SkVOK2RiUkZPbHQwSEpNMEFvdFlTcmJaNXhhbXNzTE4ySGFZRmJxRS9HSEhr?=
 =?utf-8?B?S0lPWk40Q3BJYVBsY0ZORU92MFdTV3FIVlhpTkRZNEZHbHQ3dXBKYkIrZUxK?=
 =?utf-8?B?YVBnM3d3MU5PZUo2MTY0K0RQbmxNbmpSVS9zNmhUWHRiYlh6M3plLzVVczNw?=
 =?utf-8?B?TDdzYlFaUm9QemdHa0hxdk4yMlRBcjU4d1dXT1pmNk0zekRiaTQxY05pdERG?=
 =?utf-8?B?eWgwenRLWFVFbE0vaDV0SFpVNGx6dk5ZOVd2YUZNMFdUOFErUFc4bllIaVBV?=
 =?utf-8?B?ZXhseW5uREtlS29UenF4Q3VOWGpma2t6UmRtNjQyOVZQWXZIN0M0VXVPdnNT?=
 =?utf-8?B?Sy9oTG1QemIreTNzVHN3eHBtOTVKclVCcHEvSldhSUN3a3RJSlRsRDEzZ2Ri?=
 =?utf-8?B?WFZvQXU5OHlHNE5ITEhDYWluN1pEZHMzTmk4aVVsa0U1ZFhZZFc1VlZhTlR1?=
 =?utf-8?B?NmRZN2xJUDN0TUlEcVppME9Jb3dnUWJRRDZtTDFEZEF2NVNtMmx4WnpUTFhC?=
 =?utf-8?B?MHRiR1k1OTAyTythRVgrbnpma3UyYWhFenAzalM5RW5tZURhYzcyamk0Wkc5?=
 =?utf-8?B?WUtpQ29oRzBqajhKM2NzaDNNVitwL1A3ZHhUd3BBOEhQcmFySmpURGQ2Rm15?=
 =?utf-8?B?VGMrUUFDUG5SNDNzVUNHQzlESWF2dm9udHN0Yjl3U29IZnJlM1FFbGtsMWZ4?=
 =?utf-8?B?aXc3MVhlZGxVOVB2Y2xGUnVrWnZqZ2ZOajM5dTVlTzRQYndBMEIrOFhxc1hV?=
 =?utf-8?B?aGFYeXV0dzd1cWFLdHpEeWF3NVgrYUR1WEUvMHJsMTF0a3BwdTMwUFkxUlFx?=
 =?utf-8?B?OVZ5SDFjbWpkWjFWaWJaNDQvZVBtWTNrcmM1bXJJaEFKcDEzNVBHRGZhdHNR?=
 =?utf-8?B?OEE1ZVJnRU9Qb1lNbVJkSDlzZDY4SEgzUE1xVlVFNmdEQmJsR2tWUmVnRU45?=
 =?utf-8?Q?1+3icpSm084lXEir+HV1FGGZcbHGwU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 10:16:12.3795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c10e550-f7d2-472f-10a1-08de3254fc4e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5179
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 Dec 2025 10:16:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16856

On Wed Dec 3, 2025 at 12:53 AM IST, Andrew Davis wrote:
> On 12/2/25 5:16 AM, Anshul Dalal via lists.yoctoproject.org wrote:
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
>>   .../recipes-swupdate/images/files/sw-description     | 12 ++++++++++++
>>   .../recipes-swupdate/libubootenv/files/fw_env.config |  5 +++++
>>   .../libubootenv/libubootenv_%.bbappend               | 10 ++++++++++
>>   .../recipes-swupdate/swupdate/files/defconfig        |  2 ++
>>   .../recipes-swupdate/swupdate/files/swupdate.sh      |  4 ++++
>>   .../recipes-swupdate/swupdate/swupdate_%.bbappend    |  2 ++
>>   6 files changed, 35 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/file=
s/fw_env.config
>>   create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/libu=
bootenv_%.bbappend
>>=20
>> diff --git a/meta-arago-distro/recipes-swupdate/images/files/sw-descript=
ion b/meta-arago-distro/recipes-swupdate/images/files/sw-description
>> index 8dc4e2b2..241bc95c 100644
>> --- a/meta-arago-distro/recipes-swupdate/images/files/sw-description
>> +++ b/meta-arago-distro/recipes-swupdate/images/files/sw-description
>> @@ -15,6 +15,12 @@ software =3D
>>   						compressed =3D "zlib";
>>   					},
>>   				);
>> +				uboot: (
>> +					{
>> +						name =3D "bootpart";
>> +						value =3D "0:1";
>> +					},
>> +				);
>>   			};
>>  =20
>>   			copy2 : {
>> @@ -26,6 +32,12 @@ software =3D
>>   						compressed =3D "zlib";
>>   					},
>>   				);
>> +				uboot: (
>> +					{
>> +						name =3D "bootpart";
>> +						value =3D "0:2";
>> +					},
>> +				);
>>   			};
>>   		};
>>   	}
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
>>   CONFIG_HW_COMPATIBILITY=3Dy
>>   # CONFIG_LUA is not set
>>   # CONFIG_BOOTLOADER_NONE is not set
>> +CONFIG_UBOOT=3Dy
>>   CONFIG_SYSTEMD=3Dy
>>   CONFIG_WEBSERVER=3Dy
>> +CONFIG_BOOTLOADERHANDLER=3Dy
>>   CONFIG_CFI=3Dy
>>   CONFIG_EMMC_HANDLER=3Dy
>>   CONFIG_RAW=3Dy
>> diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.=
sh b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
>> index bb3a3593..2083062e 100644
>> --- a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
>> +++ b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
>> @@ -8,4 +8,8 @@ else
>>   	SELECTION=3D"-e stable,copy2"
>>   fi
>>  =20
>> +# BACKUP_REG0 MMR on AM62x
>> +UBOOT_BOOTCOUNT_ADDR=3D0x4301c100
>> +
>> +devmem2 $UBOOT_BOOTCOUNT_ADDR w 0
>
> Yuck, magic memory locations and /dev/mem, I'm trying to get
> rid of our dependence on /dev/mem in general so let's not add
> to the problem. How about CONFIG_BOOTCOUNT_FS?
>

As Yogesh suggested, it might be better to go with env since it's more
commonly used.

This would eliminate the need for devmem as well.

> Or maybe store it in an EFI variable, look into efivarfs and
> see if we can do something with that to allow usersapce access
> to this count.
>

The A/B rollback is already well supported with EFI (that's how CIP does
it for example), what we want to provide is redundancy for the entire
software stack including the bootloader. This RFC doesn't implement it
yet but this will be added in a later revision.

Regards,
Anshul

[snip]

