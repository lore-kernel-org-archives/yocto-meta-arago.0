Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B389CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 11:16:40 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5399.1764674195680188578
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 03:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=l6aoj3R0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.28, mailfrom: anshuld@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYHpCBsOjmEaJqi2hKai48gaQuJGV3rYfGC9C3JO+1Rm0wfV9PZm5JuY2OkCHL+E4PKtAzIXAsZJjVuHIOJpsUXk04Yj9zTqqp45fFMYsYfBdUDJMROyV8743ly0/ac4+GPhJyl+i6BZWxoEECnHSnMGCkeEPKHB+t11eywPM1UrlYWntYiNlhF9EpGzRBt4ots+wlqG4rmvAj+ZUn0xp0ZOJNtj2hdiC0WRPrGkaSrILNg6zWacEfLpz0MK/8sRgHAn8NepDhH+2X+jkJH2AuJSW5zajgi7CC9RKdjtdn7Gx725fvFxFj9FjINjnbgvn6VUd/VJxP5sosfuvvM7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WEb0hjAHw1S29+fPzJPTJBgHnf+lC4vM+KW3XQj8lU=;
 b=eQ7hbHvm99z5XND4J4SuIo1MYqo0MrLelPu7ekw4gD9aDdzkjKD6V5zZA21i7OOHHP0PLSupLRg5BrwagZvRgE4ZA7LRIPFaiXd61U/uGQcQXhj5eKRvQogWxIrlLLME3W0o9yZPn8/XPL8W/isFwrbY4osSo3Otitth3Nn1Z6o/HVHlnSYuNGsp5KkJPIwYz1TEyIlWPVbsTXtDxC1AjqDWgig9WY9wTWv4UavrQ2/ZBtd/Qf5nB2BBxIBXNifG7BZC1dz+p7idwaf1XYnSolPyLzLk1jrOsrCKJ2JBkfQgBU71xn4hnrXSrjWHyDHZkgQU8Q8kS6BF+r+I1dKAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WEb0hjAHw1S29+fPzJPTJBgHnf+lC4vM+KW3XQj8lU=;
 b=l6aoj3R0omx7pFdQeCNoNOAmUf/Y7e4gbEtHxJ7CnojgfXgTf+e73NzfJm7yhWZRSYWwnTpN/vdyp6z54hPvx8B396c3dCOa5652BT6LYb7iUiIwim1Z77VNHYXhoKED3pi6X4o/aZBCSNxx9dz3L/H1xX8MP096IqkKYp2Sf1E=
Received: from SJ0PR13CA0184.namprd13.prod.outlook.com (2603:10b6:a03:2c3::9)
 by SN4PR10MB5543.namprd10.prod.outlook.com (2603:10b6:806:1ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:16:33 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::40) by SJ0PR13CA0184.outlook.office365.com
 (2603:10b6:a03:2c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 11:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 11:16:31 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 05:16:16 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 05:16:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 05:16:16 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2BGF8X2143193;
	Tue, 2 Dec 2025 05:16:15 -0600
From: Anshul Dalal <anshuld@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>, <denys@konsulko.com>,
	<reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH RFC 4/4] swupdate: enable authentication for update image
Date: Tue, 2 Dec 2025 16:46:01 +0530
Message-ID: <20251202111603.1616989-5-anshuld@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202111603.1616989-1-anshuld@ti.com>
References: <20251202111603.1616989-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|SN4PR10MB5543:EE_
X-MS-Office365-Filtering-Correlation-Id: fad0e943-c4a9-49be-b426-08de31943f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pwlMhDZSN++EXIQG4WgEvtA6sRJIM0AR8iDR5+3UM4SiOSXZrMkicvX7U5Yl?=
 =?us-ascii?Q?gV1obNLxfOzyMLjzNRdcGM/yNn/YS3686eovtYtjF5owcWuAMkXXiJjhgqU0?=
 =?us-ascii?Q?BgSFfSgT7sExd03g9/8zj/fP3/MHpZ8OR4KH3BgkNugli4OOmiEqyRMr49qL?=
 =?us-ascii?Q?LKn/Aly9Gs11uLlRlegLYgdLzsp3eCjyw3K+HlcyTtjW2WhilX+EuKPLmdo4?=
 =?us-ascii?Q?F6/zfSKk4xRI8Y41G6E1aoORTyiOL11L4bINspTpbLT0NtzLe24DBPDTQZ1C?=
 =?us-ascii?Q?bQCMZw7wMdokr3t3QOVed70wXxp7b9/PSttrqftgOINrgwkz5BcjkZbFWZb/?=
 =?us-ascii?Q?ZiTLCa8VR6xpIOFrJEA1s8VjBZNb+QDjlrZ5n4GKSZtrVOH700M5RmlaXAMY?=
 =?us-ascii?Q?bpNV/1T/5JQD115jzw4B44JlR8xH01vkpNf4gpu4PkegraQ9QXBtMpodhQwh?=
 =?us-ascii?Q?PEGnLYQu+NqcbGyelvgDCAw2gBoFNxTMi055IgXY6kmBrHJaoQYm/tyMIdj8?=
 =?us-ascii?Q?XmcpykLCC4DmBSxK9YLgUO7Nv0wH7IU4+FTeB+80TGu0OQGbfWEyc1XveAgQ?=
 =?us-ascii?Q?AZ3Q6iD3i2fqHWrJfBA3xo3MMcP1mBsrpljhn1bvnA3Qj/ly2otXlwQjNbop?=
 =?us-ascii?Q?B+QT3+gfDhVkk2oK5c4x/iLsrTwENDRYonFwmXILijpphQOB0EsK6NlkF8qc?=
 =?us-ascii?Q?H9IYYfMz+1dlq+ufOx+lvCL2pydNJK/1DD9M7VL4QXR2D9sbPxoWcKI2mRJA?=
 =?us-ascii?Q?qOt84pM/dLKYKEfhONEsGA16bs7ux2PV8tG3caV3OK48P2du7poxj0Pqg3hV?=
 =?us-ascii?Q?8xNoNS3VZLViZVHSjjfsemRflyjWTXSGFpLiYUJX2EVxEFLrc6lKquKrpJJu?=
 =?us-ascii?Q?Evo4TdRhafv7s5l0Or55z58SHjO0MNY8HTWamOsdru6kke6BEy7XvZtyaUEx?=
 =?us-ascii?Q?AveLLfKjpghtHlAXHFRYf7lSmxzkkhMfu45hqcUJoAz0SmYFy33tdV+g8YHZ?=
 =?us-ascii?Q?LBUtb81dmpnxsFqcJDH/jh5Sxam4uE/KCIIOVD9eyEHbs+AUD4m4EQfsC85A?=
 =?us-ascii?Q?JHzZqUu++YIGjVNJYEwQDvXSuT8eg+SHo2IRNBWmk8XAwHhvEADAaKaQTWpa?=
 =?us-ascii?Q?H6pSAzOuPCwf5dEEf2tEnYa9f3jJ1UN7bIAWvixFrITPGZ630yb8G6eiDh6V?=
 =?us-ascii?Q?+X+B0m23S4xXIS43pwmB8Xsxjo8mbXujF8JDssFvA2zT/6AE1gZZMzAIftbb?=
 =?us-ascii?Q?vZcbMiQilVp2dPC7Y5/fESBdSrDH1ztWoN7/tySnn9RHBNZQKvlBwN7KebTW?=
 =?us-ascii?Q?JUm3pEa9h+m8sIqJTBEkrVXPr07vwMK2mQzkb4zSmyB5NuJqHjWKX+jGTkKy?=
 =?us-ascii?Q?xgT1phEJYa9txEbY4etayiQXHLOtp9yeY5Ip2nNTZkmjRzewm1K1Df8YOfD/?=
 =?us-ascii?Q?nTE+dr7Glws0a5jUxY4YfOZ6mtEjKcrqVwN0ralDrLJzTcHDupkX5YvY5eCT?=
 =?us-ascii?Q?0by8oDmnTDCSu/+vTIQfccDjH2hD430pQmI7PdVul/Bsy9du1YvlSP4ps7DC?=
 =?us-ascii?Q?UJc4RXenwZHWJiXkU7s=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:16:31.8823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fad0e943-c4a9-49be-b426-08de31943f4b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5543
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Dec 2025 11:16:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16851

To ensure the platform can only be updated from an authorised source,
this patch adds signing to the .swu update image using the pre-existing
custMpk keys from ti-secdev.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 .../recipes-swupdate/images/files/sw-description             | 2 ++
 meta-arago-distro/recipes-swupdate/images/update-image.bb    | 4 ++++
 meta-arago-distro/recipes-swupdate/swupdate/files/defconfig  | 1 +
 .../recipes-swupdate/swupdate/files/swupdate.sh              | 2 +-
 .../recipes-swupdate/swupdate/swupdate_%.bbappend            | 5 +++++
 5 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-swupdate/images/files/sw-description=
 b/meta-arago-distro/recipes-swupdate/images/files/sw-description
index 241bc95c..8a7e5f4d 100644
--- a/meta-arago-distro/recipes-swupdate/images/files/sw-description
+++ b/meta-arago-distro/recipes-swupdate/images/files/sw-description
@@ -13,6 +13,7 @@ software =3D
 						device =3D "/dev/mmcblk0p1";
 						type =3D "raw";
 						compressed =3D "zlib";
+						sha256 =3D "$swupdate_get_sha256(@@IMAGE_BASENAME@@-@@MACHINE@@.root=
fs.ext4.gz)";
 					},
 				);
 				uboot: (
@@ -30,6 +31,7 @@ software =3D
 						device =3D "/dev/mmcblk0p2";
 						type =3D "raw";
 						compressed =3D "zlib";
+						sha256 =3D "$swupdate_get_sha256(@@IMAGE_BASENAME@@-@@MACHINE@@.root=
fs.ext4.gz)";
 					},
 				);
 				uboot: (
diff --git a/meta-arago-distro/recipes-swupdate/images/update-image.bb b/me=
ta-arago-distro/recipes-swupdate/images/update-image.bb
index 33b0b74c..6176e5a6 100644
--- a/meta-arago-distro/recipes-swupdate/images/update-image.bb
+++ b/meta-arago-distro/recipes-swupdate/images/update-image.bb
@@ -1,4 +1,5 @@
 inherit swupdate
+inherit ti-secdev
=20
 IMAGE_BASENAME ?=3D "tisdk-default-image"
=20
@@ -21,3 +22,6 @@ SWUPDATE_IMAGES_FSTYPES[tisdk-bootstrap-image] =3D ".root=
fs.ext4.gz"
 SWUPDATE_IMAGES_FSTYPES[tisdk-jailhouse-image] =3D ".rootfs.ext4.gz"
 SWUPDATE_IMAGES_FSTYPES[tisdk-thinlinux-image] =3D ".rootfs.ext4.gz"
 SWUPDATE_IMAGES_FSTYPES[tisdk-bootstrap-base-image] =3D ".rootfs.ext4.gz"
+
+SWUPDATE_SIGNING =3D "RSA"
+SWUPDATE_PRIVATE_KEY =3D "${TI_SECURE_DEV_PKG}/keys/custMpk.key"
diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig b/=
meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
index 4a2d78c0..0bf605f7 100644
--- a/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
+++ b/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
@@ -4,6 +4,7 @@ CONFIG_HW_COMPATIBILITY=3Dy
 CONFIG_UBOOT=3Dy
 CONFIG_SYSTEMD=3Dy
 CONFIG_WEBSERVER=3Dy
+CONFIG_SIGNED_IMAGES=3Dy
 CONFIG_BOOTLOADERHANDLER=3Dy
 CONFIG_CFI=3Dy
 CONFIG_EMMC_HANDLER=3Dy
diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh =
b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
index 2083062e..fc32e4cf 100644
--- a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
+++ b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
@@ -12,4 +12,4 @@ fi
 UBOOT_BOOTCOUNT_ADDR=3D0x4301c100
=20
 devmem2 $UBOOT_BOOTCOUNT_ADDR w 0
-swupdate -H @MACHINE@:1.0 ${SELECTION} -p 'reboot' -f /etc/swupdate.cfg -w=
 "-r /www -p 8080"
+swupdate -H @MACHINE@:1.0 ${SELECTION} -p 'reboot' -f /etc/swupdate.cfg -w=
 "-r /www -p 8080" -k /etc/custMpk.pub
diff --git a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappen=
d b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
index 20f87435..bff44926 100644
--- a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
+++ b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
@@ -1,4 +1,5 @@
 inherit swupdate-lib
+inherit ti-secdev
=20
 FILESEXTRAPATHS:append :=3D "${THISDIR}/files:"
=20
@@ -8,6 +9,8 @@ FILES:${PN} +=3D " \
   ${SWUPDATE_HW_COMPATIBILITY_FILE} \
 "
=20
+DEPENDS +=3D "openssl-native"
+
 SRC_URI +=3D " \
     file://defconfig \
     file://swupdate.sh \
@@ -27,4 +30,6 @@ do_install:append () {
   install -d ${D}${sysconfdir}
   install -m 644 ${WORKDIR}/swupdate.cfg ${D}${sysconfdir}
   sed -i "s#@MACHINE@#${MACHINE}#g" ${D}${sysconfdir}/swupdate.cfg
+
+  openssl rsa -in ${TI_SECURE_DEV_PKG}/keys/custMpk.key -pubout -out ${D}/=
etc/custMpk.pub
 }
--=20
2.52.0


