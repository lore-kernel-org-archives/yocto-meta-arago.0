Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860DAC44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 06:49:27 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31778.1769064560845489730
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 22:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=I7cx1reM;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.8, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5M68lYZqhHHuND9vukEazCll8dT/WPZtF0wd2uUcVahLe7iKR2unp92IlBgZG0tyqfA2l085CARlB+VypPEilQYUm6K326pBkt4VGVZghx9L2NkJIFOMjXDiCxQs+AnTFJvyea5DNX3H+zXArnR4HjZ8N3AO91C9/zGSmf4ObPSEdfDAdpOgjFzQo5zJsdtBHFsGlykVY6YWgjrv+Z5pAuow7GJJivZrCbjP8oegiX0KYLYw/n+TmgnFGtmCXfWIuQhAmBBkUnGjdm6a8rWshZkNNivLGSa2uBaHcSp9IJfKwZh/plA/G73iCpiko15Da4li9gR6frJUHf8zu8yIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rCI1hz6Q6ElSnmyjGAVB7x4r0mAn62i+x6VHg1oGtA=;
 b=VEZYrljtwzh0AvuPi3xPLaqLbFj1iOVRJVfe/SX4SWLx9nk0B54qJ4QE+U4gGqwSGDMmIFHy2qROMkGbR9m150B9PDivk3eu5RUGxVrSk2uEvURzeexGwc0p9acdvjvxe1lXv8fQ35T2Le96sI1sU/sKoE9iHjTn8x9RlFg05mQ9yqqVjU0ZihmTu9W2ujPzwLtKAIVfnNuhjtgOlSedsgtdG484/LkaQiieFaO+4BRxUzDcVPtzZ3Ysr49Ib7sxV0MtQ9Wy9JeNRg6F3KfOGjpmKk/8g+3GaHZ5aneJXOl66BcEKC9DpJMWHd6wxaP6+VSXAWettwpLonjmrL7Teg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rCI1hz6Q6ElSnmyjGAVB7x4r0mAn62i+x6VHg1oGtA=;
 b=I7cx1reM6jn+dvbk964SZo4EQYCxKdbQdMjqGh3xiVYMyyGnhJkvVJx9ioKzFn9bHI65Apvyn07ytoCvadmFCAUCHFM9KbFf/zLhWgFS6e2CTqa34cs/PWu4y2ozPmsYWIcA3VJSXBMiFLlOZSaDsTW7gzRZdv7GeJrnjK6Dcqk=
Received: from MN2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:208:a8::32)
 by MW4PR10MB6369.namprd10.prod.outlook.com (2603:10b6:303:1ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 06:49:15 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:a8:cafe::38) by MN2PR12CA0019.outlook.office365.com
 (2603:10b6:208:a8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 06:49:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 22 Jan 2026 06:49:13 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 00:49:13 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 00:49:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 00:49:12 -0600
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.72.146])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60M6nB5u002927;
	Thu, 22 Jan 2026 00:49:12 -0600
Date: Thu, 22 Jan 2026 12:19:11 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <v-singh1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [meta-arago] [master][RFC PATCH]
 packagegroup-arago-tisdk-connectivity: Enable zeroconf ip support
Message-ID: <20260122064911.njy4xh57r356ag2g@yogi-work-pc>
References: <20260119110339.3585220-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260119110339.3585220-1-v-singh1@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|MW4PR10MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ab3934-dabc-4246-b2de-08de59825acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xbTqiqINGPOIqQmRBtUtbAFgtXqPR/CZUGRCIB3pstwsr9xqgHBH6Y+VR6AR?=
 =?us-ascii?Q?AoRmQkKanehJ6A2WG4+UTxBTW5tIvUipRuKNKjDkFm8OrWcPzg7Eon7ftjcf?=
 =?us-ascii?Q?pSa9QIInjL3ohErl6Oxx5Hj7CPbqWDn+1BTZXPK3FWxRuUuJp1U+/GGLz/Fw?=
 =?us-ascii?Q?a7qVAS1fZgZvg01jQpUUM6rIJmxigSB+//ZvHrUDJje4nf23XezsgkZY8jut?=
 =?us-ascii?Q?IGJDdrkTEqCWL2NTU2sbFQiJ9MNCC+HglYtE5/S7ePvHmMIHiKiJk5xxb6Nd?=
 =?us-ascii?Q?Zg3dAWiV7xMD0TXv7TMOSmwPW5xgxTWxDXu5kVqJcswQ0c9SrqDdkFJeWlyQ?=
 =?us-ascii?Q?b5C77rT/yi6Vl5PIUUuAHm5FpypyaVE/RguvHiAGypLF/CEWnYdV3WF3kuka?=
 =?us-ascii?Q?dP4Cjdua5m/PhpvIss1M5JSTr52ijWuC99/Yvxt+I1T+asIh/YfMyM5AVDSx?=
 =?us-ascii?Q?/mIkCVDGzmYpdNNCsnd53jz30L/M9vay75A60K5559F3FK2qpn7E/6zCHst9?=
 =?us-ascii?Q?fDALQxEBA0b5gIFgN020pHvgweQihMcEuiCWLvcKtbtgg0HJ6fwSbMKS9Ymv?=
 =?us-ascii?Q?zs/lalMAVQJzf3+MY3OBd2emlzDrnYerZZGTZ3tD/ApmF+iGYjsr0NQ453r9?=
 =?us-ascii?Q?kksiiSnHsfxJVik5dEitEHcQR1/V5M1kcb8Prw97yUKmSHPf2/XmwZ2kaukO?=
 =?us-ascii?Q?fpu828t3fPJ78HUcZFeYFqbisNyVpQhNBy0nIPlj3ZAmhEk0b4b/clpjNaiG?=
 =?us-ascii?Q?a7Ka+pt/n6cIPSv8xULupWJe1ifaMZounLwKjBnnvG5wT4F5ZElEil+m713g?=
 =?us-ascii?Q?gEBaLZtExShGX/znljLzY8p6cp6gkH+6unBD5gCM1EFiisVSrRiLSZbTEO+s?=
 =?us-ascii?Q?DoA9h16YHtF4mZ98VlhoOinIu3CSFnsbvyH8XlHFtxVqbp64WZxu1r8sFvzQ?=
 =?us-ascii?Q?pVEszP46dUOX1wFBy+z19JmuPLo8vdmzpwK8ymJ4jMqbePHwZdUrrmsf6t88?=
 =?us-ascii?Q?a8fDvte04u9E/So867m7pkOGVewhICqOyvOCdOFJ9DGfdb3JosPos+LqBVqo?=
 =?us-ascii?Q?N07bHCq7DeqACjSWeucYW8upgWTxRi7595mKIdEA5sHaSDowPoYZgBRwmk5X?=
 =?us-ascii?Q?jMtiLnVnutvqsAM/L9OzngAhmPLqVTYAMjVHfYc1hZOJfJtSFivcAQWgu8UY?=
 =?us-ascii?Q?f+gXQQIXBkHQeAiEV5B8EQm3xqKgcGFBH5vN7ucjSPuC2rHNmhB1MaxVi9Wk?=
 =?us-ascii?Q?Nr1eRcP32CHyfcsOTu/+ikq/20WAIhJKRbeXEoyTLp1rjLyPfsl/pBUSr2im?=
 =?us-ascii?Q?+7izRhCNk6gfFTKW04hRoiX1L4TZEiw0RbVzi4J9L5xkNeViYO51tiCTcwfz?=
 =?us-ascii?Q?a9+PvJAhO57DzOjv62VBmSNnFSNeqrVnWdF/nK70k4w136uUQ9fMadHMW/p2?=
 =?us-ascii?Q?pIK5F7FGkl8dmrNsE4kRwr3ji4aHT4BoOmniYc6l1vzRo+rjWV564nwT9rTG?=
 =?us-ascii?Q?tjLEtDI/O40wOtPAA446MujEyubDgL42zzz5QjvbJJv83/95yqTVGZzm+RYb?=
 =?us-ascii?Q?Klxl9LTpk67hi5tHZ0upJU3fm1XWe+pZdItPflHU9vrK0C7rzkckSKTuXpIC?=
 =?us-ascii?Q?aX+vLWH/41UpjLNwNGEWTWvSrY6RAwT68umGl3y7z8LwT4fcj5A/Rcv2Tgix?=
 =?us-ascii?Q?lM1S/A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 06:49:13.5952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ab3934-dabc-4246-b2de-08de59825acb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6369
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jan 2026 06:49:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17004

On 16:33-20260119, vishnu singh via lists.yoctoproject.org wrote:
> From: Vishnu Singh <v-singh1@ti.com>
> 
> Dante DEP useage zeroconf for Dante network IP addresses.
> Zeroconf provide the IP network without manual configuation,
> and avahi-autoipd is for auto ip assignment.
> To get the zeroconf ip at bootup, zeroconf-autoip service is used.
There are few typos in description. useage -> usage and configuation ->
configuration. 
> 
> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> ---
>  .../zeroconf-autoip/zeroconf-autoip.bb        | 30 +++++++++++++++++++
>  .../zeroconf-autoip/zeroconf-autoip/README    |  1 +
>  .../zeroconf-autoip/zeroconf-autoip@.service  | 12 ++++++++
>  .../packagegroup-arago-tisdk-connectivity.bb  |  7 +++++
>  4 files changed, 50 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip.bb
>  create mode 100644 meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip/README
>  create mode 100644 meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip/zeroconf-autoip@.service
> 
> diff --git a/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip.bb b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip.bb
> new file mode 100644
> index 00000000..4b59a7e6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Zerconf autoip"
Typo Zerconf -> Zeroconf.
> +DESCRIPTION = "Zeroconf IP assignment using avahi autoipd"
> +LICENSE = "MIT"
README file contains TI-TFL, It is a bit confusing due to 2 different
licenses mentioned. Can you clarify the correct license and include
the correct license text in the README. 
> +LIC_FILES_CHKSUM = "file://README;md5=102e8ceedf1b96837ba2eefc0d47f4e6"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +COMPATIBLE_MACHINE = "am62dxx"
> +
> +SRC_URI = "file://zeroconf-autoip@.service \
> +	file://README \
> +"
> +
> +S = "${UNPACKDIR}"
> +
> +inherit systemd
> +
> +SYSTEMD_SERVICE:${PN} = "zeroconf-autoip@eth0.service zeroconf-autoip@eth1.service"
> +SYSTEMD_AUTO_ENABLE = "enable"
> +
> +do_install() {
> +	install -d ${D}${systemd_system_unitdir}
> +	install -m 0644 ${WORKDIR}/zeroconf-autoip@.service ${D}${systemd_system_unitdir}/
> +}
> +
> +FILES:${PN}= " \
> +	${systemd_system_unitdir} \
> +	${systemd_system_unitdir}/zeroconf-autoip@.service \
> +"
systemd bbclass automatically handles service files, I think it is safe
to drop the FILES variable completely. 
> +PR = "r0"
> diff --git a/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip/README b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip/README
> new file mode 100644
> index 00000000..1ad1d419
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip/README
> @@ -0,0 +1 @@
> +TI-TFL
> diff --git a/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip/zeroconf-autoip@.service b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip/zeroconf-autoip@.service
> new file mode 100644
> index 00000000..952a8c60
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip/zeroconf-autoip@.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=zerocnf-autoipd for %i interface
> +After=network.target
> +
> +[Service]
> +ExecStart=/usr/sbin/avahi-autoipd --force-bind %i
> +ExecStop=/usr/sbin/avahi-autoipd -k %i
> +Restart=on-failure
> +RestartSec=30
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 0a8d4493..66aa4872 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -53,6 +53,11 @@ BT_TI = "\
>      bt-enable \
>      bt-fw \
>  "
> +ZEROCONF_TI = "\
> +	zeroconf \
> +	avahi-autoipd \
Since services in zeroconf-autoip uses avahi-autoipd, best to include
avahi-autoipd as RDEPENDS in zeroconf-autoip recipe.
> +	zeroconf-autoip \
> +"
>  
>  CONNECTIVITY_RDEPENDS = " \
>      htop \
> @@ -68,6 +73,8 @@ CONNECTIVITY_RDEPENDS = " \
>  CONNECTIVITY_RDEPENDS:append:ti33x = " ${BT_TI}"
>  CONNECTIVITY_RDEPENDS:append:ti43x = " ${BT_TI}"
>  CONNECTIVITY_RDEPENDS:append:am57xx = " ${BT_TI}"
> +CONNECTIVITY_RDEPENDS:append:am62dxx = " ${ZEROCONF_TI}"
> +
>  
>  RDEPENDS:${PN} = "\
>      ${CONNECTIVITY_RDEPENDS} \
> -- 
> 2.50.1
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16997): https://lists.yoctoproject.org/g/meta-arago/message/16997
> Mute This Topic: https://lists.yoctoproject.org/mt/117382985/9980049
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [y-hegde@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-

Thanks 
Yogesh 

