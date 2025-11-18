Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4740DCF2561
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 21:58:41 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.633.1763503108556764649
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 13:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uCBO7loG;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.52.27, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTWjCAQVvp8ZUcB5ROVU/9ZpcroRwSGIfznpUVXVZe/osdGN39h1/jbi5+acSnvqgg7DYQW/v9lHCOeF78gGbrd2vOSjd7M8TDm5+dxZ7E94k2sscK0seRMZc97O+s8pj17lbxFl9UQyyVrWMYmNN0F5rGmpG7qhuUnYgtpoaWLMZ28QJh7A7n0hyicJ/NfyOmY7OnS2lh0i/OkZaYCAaYOnqVizNt19+34HsAYW/KSaCEnmJQ+9L/PzMt6yrg4bcpF5wzYDUE5vAV3QvhIfNi/VvlHfLrvRLlGpSzBhJ95fcP/QP6CXq8550ZrpYuEjD0gIPvqr0MEouS+k1jsSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmNBLjA5erYq4z22ihmJrG+8EVaOm0ulUNivW3D1PvI=;
 b=P80/5aXZGA63sDz1X1pMs1mcieQuGXAVymMs/O6bqE0UIhtvjPMTd9KJaf1ZZ1Tc1S1KXICuJr8CXt8JQMm2KjIJKDUXLtrKWyro4T9EKP8jJ2PnS6NH0D88tDnUY8GIrwipOjltuONZKxEtWAef/ZCI4oaNKoAwumRbl2xBqYTpx+nx1cRE9dmef31pqid9wVI9s2/61pscHkxeoFogBT4kcxn92fWDhNl3VE5T8S+XhdacBln46EYk823yXmVmVyILwTf4rbEzvhBKJZGDiYeJfQLi2Tu2xfPd2o7Kh08quO8HIAcjg+KClq7whkn+HqM7knr66G7+38sH0Cp7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmNBLjA5erYq4z22ihmJrG+8EVaOm0ulUNivW3D1PvI=;
 b=uCBO7loGLWLEkZNLQyO0nsCYQTU9LF15rzAtplHsSF7SACqFJZdzBUEWuBYTIKt6YP+yxe/eu96g6rm9ZcSzFlWGP7286PhfLXyXHJ5HyHFGTa5BX23nxKOd3LbN0FhCxofhfFjq2iYfkt4IgURqqNV3O6kOuE6zDqDsKpUrpZ4=
Received: from CH5PR05CA0021.namprd05.prod.outlook.com (2603:10b6:610:1f0::18)
 by IA3PR10MB8444.namprd10.prod.outlook.com (2603:10b6:208:577::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 21:58:24 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::e3) by CH5PR05CA0021.outlook.office365.com
 (2603:10b6:610:1f0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 21:58:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 21:58:24 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 15:58:20 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 15:58:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 15:58:19 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AILwJaO751248;
	Tue, 18 Nov 2025 15:58:19 -0600
From: <rs@ti.com>
To: <d-gole@ti.com>, <reatmon@ti.com>, <denis@denix.org>, <s-vadapalli@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] udev-aragoconf: remove legacy usb rules
Date: Tue, 18 Nov 2025 15:56:41 -0600
Message-ID: <20251118215640.249268-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|IA3PR10MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 68097356-833c-4ccb-7f83-08de26ed98a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n27Ni3dKXJHJ8wH+Lo0yQtXrKkYCP5g4FJIz7tBkgx7OCIvY1SPG8gygeHU9?=
 =?us-ascii?Q?It3p7J5TYB3lGYZXCzFljJWvgnkVDx0/lAgLbTKUa/dHWKR2+W3koZGG1MxZ?=
 =?us-ascii?Q?v27oS73G23UqxreUpyi8CCQPVQ1oHgquirA7di4onVFW1me83UaBxzWHeMsy?=
 =?us-ascii?Q?OvLtPHGdOO8rPQz0M5GMFx1dC9xGk1VDs1i6Odg6bURm3AiY+JbfgKKxqgkD?=
 =?us-ascii?Q?45e5ksAg0wPILFzTiGSDpUvyY6PBFTz93yPrvDWjXhNSXG0a5DxpTnu4j8Lv?=
 =?us-ascii?Q?rJDZbQozZ2VLneZUDzGhY/FfN5Ifeutb6K8UBPpTWYqTGwpYm8kFfLxUEf4p?=
 =?us-ascii?Q?75m9hIatpm/a9loxV174ugkC9KxmX+1H+Y3KKAj8+bZSwZN1DyILWOitcTPY?=
 =?us-ascii?Q?iMukDv1dfvxtHedSNUzJXCFfTVHZj279uF605fttG4NeMYEUD9VTCm7RXP1M?=
 =?us-ascii?Q?sCYqUhUfV90cY+qw7w20MtBp9AkL+Fp2lN+MY7vPi3GuvAuE3GCr+Bx8hq+3?=
 =?us-ascii?Q?0my847PRCygcS4+jWFw6ecOT/jsiHSyYqyfh2oCDjWKpHoRHX8i1BKMhNgql?=
 =?us-ascii?Q?J6NvfZ1RPMFEn+Lu/CUDy+7j36ge6ON4yxBGQNijl9J+1MxNcv7ppdvY4vtp?=
 =?us-ascii?Q?T79Y1HumQYpu53QRKw4zU+n3uuEg4+x0RAot50lAEdn1noO5x8JEbG3lMe9d?=
 =?us-ascii?Q?7VtqQZWWRheP+cq+Gkm4cwlBH9pRh0CWyTP03oKGjGgwWhH6E0vHS5s4VoPd?=
 =?us-ascii?Q?4mEYrnp+kHKOjlZFDnIb7m7NcZAW0x8SWSdXjtaD/b3eNM2s6CgButzRDpQV?=
 =?us-ascii?Q?dtVEg9FP1rpWiUWfe1Mcck/jJSII1kT90bMdTH6VW23DeCOsYPn3AvJW9/yp?=
 =?us-ascii?Q?/puXKmgaGfah6BN7X9Ny5wC19UzHfliIzmfiNerpYUJpMTF0F3HCcdqBqgue?=
 =?us-ascii?Q?IRzZHAr0SgknqYb56OPdUEizqsWQxq9rKH+KpBFhBUyBw21VRhK5dB5nSb3i?=
 =?us-ascii?Q?2rhsp0rGPZ8qCdG0SFJw6Suf/h/H3VXsc/4jeSLub9slKya0aSxTzYe0+DAD?=
 =?us-ascii?Q?AdNjVGIOh1Ajflm+2Tt0yyXj1gfxP+u/ggVBWP/ABg4BdqUwGHp8HuFkthZR?=
 =?us-ascii?Q?AJZDXwpBHcFAw5SGkuqi2S+EcExKLJAilidWzR/OkKgdukBjLEFe5cymNy8u?=
 =?us-ascii?Q?uCjjp9ovXaQeusg801TpgRfK62tWh1o0hQ3FDHtpHEMrRrvRI6jhrBbb2Rw4?=
 =?us-ascii?Q?5enXy33NToOY+9JQDJ8ic9GVPa7R/pcQmvGZxz1ix+L0SVK79GaUCyG3MmNz?=
 =?us-ascii?Q?BppcCAJYUgD2WOGhQD4R7WrQeKfkpppQuUDFNuMPMPgcaNGkNcWQFBjXP9Ar?=
 =?us-ascii?Q?qQN7S6gsyWp7LuJs24puV6lzw/MhxHJERYPN9QYUcJBPOm4NZyEYouPHCkAf?=
 =?us-ascii?Q?qtmUV+e7rNVNso/HRiAMTmv7JADMVZaOabD0vk7WGo10Vmn7+ApAMHMiEVHN?=
 =?us-ascii?Q?K9qXoeo79mRQXv34NjGEYdAEZ/6uw225VjEyssBU7wWZ3XMvkcgL3GWnp+Db?=
 =?us-ascii?Q?Khs6DAmzgVfYO0tcCok=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 21:58:24.2309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68097356-833c-4ccb-7f83-08de26ed98a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8444
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Nov 2025 21:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16788

From: Randolph Sapp <rs@ti.com>

These rules do not match the current structure of the USB DEVPATH and
are not actually fired.

They were initially cited as being help scripts, but I think users
should attempt to gracefully bring down the gadget interface on their
own instead of relying on a script that will attempt to reload it post
mode change.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/udev/udev-aragoconf/50-arago.rules         | 2 --
 .../recipes-core/udev/udev-aragoconf/usb1-rules.sh          | 3 ---
 .../recipes-core/udev/udev-aragoconf/usb2-rules.sh          | 3 ---
 meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb     | 6 ------
 4 files changed, 14 deletions(-)
 delete mode 100755 meta-arago-distro/recipes-core/udev/udev-aragoconf/usb1=
-rules.sh
 delete mode 100755 meta-arago-distro/recipes-core/udev/udev-aragoconf/usb2=
-rules.sh

diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.ru=
les b/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
index 4829ca14..3ff14eb0 100644
--- a/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
+++ b/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
@@ -22,5 +22,3 @@ SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ENV{ID=
_INPUT_TOUCHSCREEN}=3D=3D"1", SYMLI
 # Auto-mount any SD cards
 ACTION=3D=3D"add", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"block"=
, RUN+=3D"/etc/udev/scripts/mount.sh"
 ACTION=3D=3D"remove", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"blo=
ck", RUN+=3D"/etc/udev/scripts/mount.sh"
-ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/44000000\.ocp/48880000\.omap_dwc=
3_1/48890000\.usb/udc*", RUN+=3D"/etc/udev/scripts/usb1-rules.sh"
-ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/44000000\.ocp/488c0000\.omap_dwc=
3_2/488d0000\.usb/udc*", RUN+=3D"/etc/udev/scripts/usb2-rules.sh"
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/usb1-rules.=
sh b/meta-arago-distro/recipes-core/udev/udev-aragoconf/usb1-rules.sh
deleted file mode 100755
index 51dfd71a..00000000
--- a/meta-arago-distro/recipes-core/udev/udev-aragoconf/usb1-rules.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!bin/sh
-/sbin/modprobe g_ncm -r
-/sbin/modprobe g_ncm
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/usb2-rules.=
sh b/meta-arago-distro/recipes-core/udev/udev-aragoconf/usb2-rules.sh
deleted file mode 100755
index f00565e4..00000000
--- a/meta-arago-distro/recipes-core/udev/udev-aragoconf/usb2-rules.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!bin/sh
-/sbin/modprobe g_zero -r
-/sbin/modprobe g_zero
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb b/meta=
-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
index c1ffa663..49d00b54 100644
--- a/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
+++ b/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;m=
d5=3D3da9cfbcb788c80a0384
 inherit bin_package
=20
 SRC_URI =3D " \
-    file://usb1-rules.sh \
-    file://usb2-rules.sh \
     file://50-arago.rules \
     file://37-can-j7.rules \
     file://37-can-am62.rules \
@@ -17,10 +15,6 @@ SRC_URI =3D " \
 S =3D "${WORKDIR}"
=20
 do_install() {
-    install -d ${D}${sysconfdir}/udev/scripts
-    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/script=
s/usb1-rules.sh
-    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/script=
s/usb2-rules.sh
-
     install -d ${D}${libdir}/udev/rules.d
     install -m 0644 ${WORKDIR}/50-arago.rules ${D}${libdir}/udev/rules.d/
     install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
--=20
2.51.1


