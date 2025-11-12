Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FBFCD4F25
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 23:12:43 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11527.1762989156170239806
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 15:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fL8dAd0m;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.43, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjPzlJnDfbIcDO4II6tCV7EKIGyWgeSZ4zPUAokvt1Gqb1Fg36Cj3N8O6V/29g7cIzcvY7oEr1JC7bSco76tMa8aQxjYt8we5SwkZL+UhmFMaOWdfGMJn3E1iYA5CmIse1usmqpItaqpz+iGFV6pAcoF3NpjRxi67HEDS351p7ASyCoXCot/k5TnUZZTZauG8dghvx/+ftLipIEbbhfywIn+tln7/qhVJBm0DNaZhMA9LaMfVxFte5HUKsnCNM2fTWZLfByFBaZ4035AwofVd/cshjBVX360uSFoa0sL3k5ObBf64cjq0MoD+l0hu7t/sidJDGsQ2ZNDBn1nKjxrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRrI3LJE7/jNMERrYmcCKEV3sGQkDmo0KZdVtB7cjt4=;
 b=SDCWtnwMA5o9e9Qp+nzJz8oMUvEKAMR0+Z6HArxdJatX3xI0KBfh8kT/EA4XWd2elWsd0RTmt2uYOU9dZoghE/AGpZtGxfEdoALgQ9xFci/5mX5Nmp4DJP7POAAq7BVqOtvzf0xZaubLhrklJRn4bD2bo6WI3BNijE3VpQ0N/o/TLhKfXznyHIWEr0ysPe9VS1eh/eOddCskpmpLr7L0enuLb6Pp5jAvXeiQxiDX5qGnTO81PDv8DDswt/U/HAeILYC9f8eLEae8p6tExLq5NlCcUc/dg789WYHdysMOkgj3tS40NSwxwfxf/ZXQJSRfkA+baKx/i/o6t/dZ6LBxZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRrI3LJE7/jNMERrYmcCKEV3sGQkDmo0KZdVtB7cjt4=;
 b=fL8dAd0mXb4fYldVKddiz+Kna32fc2bGnDZObapxyrEmX32GV3wncQgAleT778WcSYT4tgDBxp6AdfA9FA4LsUV0aPiWn8BS09CUWBd0XH6+/sqTxh/RIHJM5kFLLWSoWxeEcG3v0tXVtruVP9eigO4YDBohRgR7XGZE3rJSp8g=
Received: from SA1P222CA0082.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::29)
 by BN0PR10MB5093.namprd10.prod.outlook.com (2603:10b6:408:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 23:12:32 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::7e) by SA1P222CA0082.outlook.office365.com
 (2603:10b6:806:35e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 23:12:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 23:12:31 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:12:28 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:12:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 17:12:28 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACNCSZP3452363;
	Wed, 12 Nov 2025 17:12:28 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] udev-aragoconf: aggregate generic udev rules
Date: Wed, 12 Nov 2025 17:12:24 -0600
Message-ID: <20251112231224.191420-1-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|BN0PR10MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b1053e-c5ed-49f6-0598-08de2240f528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XxIIMLjbrdQRYoFe6XtsKCkXqWRmzAzpdu2FYyu7oYuVLFeD6hUWjIyOBtEc?=
 =?us-ascii?Q?PnbboA6UnuNxifSS6W2A9l0ltqG+AiJPiBvwlfvuWoJUSIXrYzr49pHK2rwf?=
 =?us-ascii?Q?JoCbAc6oLR62G1gz7kafieF8YuXXxOx4j510XoO3HH51zpzjWquNC6bMbzya?=
 =?us-ascii?Q?73A46ckp2jnq5l4bzUGiJsmRtZSt5hIKrBq2fscUS3hGLtFZcvOl5iB07RJY?=
 =?us-ascii?Q?LbqLEoFRq8T1e4RESuF34WcwGfreGUlqwgBZMQhFn8ckdgv8lZtFx06GH7A6?=
 =?us-ascii?Q?mI+rbZrEsyh5DJAX9UbsZWQ+xZUCUN7zoxEXgLGZL/fiNrT2TGYomel4Y4W3?=
 =?us-ascii?Q?uS9tbt3eCpuZVitBPGtpAOr7l8vZ4Ena983GH+1WovHuRr+P/EgoE2CwYMjk?=
 =?us-ascii?Q?30M0MLkOsZ8/PKWqC7pWIjLPnAYcOx0VzpxJ84mpQ8d7MJlEjwJDzJ5+cBj0?=
 =?us-ascii?Q?0xtHLPWpr2jIMX55v/Ov3DPDHp+OstUHKdmzM/KNGStiZJN6bQeDiwR2MXDQ?=
 =?us-ascii?Q?YNM9Im6gc8AXdBfCJ+yyLY1M398+0xbjSUQgNXoKLPnEPMQH9+bR4OMBdwMp?=
 =?us-ascii?Q?MtP0/2XMvRHiZoYKSGJyKyhCztQYa4s2GMtfdDj8rSBVL8jKC03kLr6rhrZ3?=
 =?us-ascii?Q?DACx/3ht8OGfsfatBVNW+Y+4IYHMzhNFrwHh0teJ+YeDC8BZuIgOgu6x6Ked?=
 =?us-ascii?Q?l3axxkXl8634aGj2JyicbcFyYBJY0NrYpCqfnrwp85kIE+yXQ7CCN9xLuF7e?=
 =?us-ascii?Q?WpAt1eV3RJw6nhubBlfNPz7rf7P9Zxj/092EmiuslXNeGaDtaGEFEJbZYn+H?=
 =?us-ascii?Q?t9KR2imw1m92RvJoIXBjK0r6/W05q51Wl/KCqOg7l+iO5nAnRQQR2ISpF3/l?=
 =?us-ascii?Q?MzMNKIYk+mXlkH3eM2gDWD0C8u7IuMIqJ0aB7KTQv87SoRTmL9SF6aLzsEgt?=
 =?us-ascii?Q?sVVV4TK2zX6TYBC2sP2LPkmrlRxPA/ZkduhLGtGgtOUWC+RvHPl1mxw0l0mO?=
 =?us-ascii?Q?Cd3Q3hIrk7CwiAp0Qj0kDJ9dwEfzy9G2OG9/RcZeMgNoD6vRn0bqr1hkaBEf?=
 =?us-ascii?Q?ctvRNeSqa3jYl5zX7JoZLXrweFLxSMqNs237k7kl+B/NB3rNzvfzgpf311NU?=
 =?us-ascii?Q?OXV7GTNLWbQuB4Vr59J6e2FTP3otGr8WcaCnCNGy3MOIpf4hNf884uqzuILo?=
 =?us-ascii?Q?UDOatlSYR49CpSG1aQIncs1ptG814sgRSW+iIRP8ICs+6G7/zUuthxc+AVh2?=
 =?us-ascii?Q?W4LPdWNTYC61DiaCh2mjz2iAVol7dStl+JD38VT/2Qu5oZW1OQhQVqCpk1o8?=
 =?us-ascii?Q?Lf5pEveF8Ei2lR4VZST6QSO2DXRXPOci48BkjI1m06s+KHJg2mhdpe0BW1Yb?=
 =?us-ascii?Q?mT3coHWy8dxyFPfna/gYQkgUOsJD9+QgUM95JZNsIIom8t2nOIVFa9UrOz9I?=
 =?us-ascii?Q?yAEiG++dwxWVHvkQSVXzdKe5X/eCT8+ukDjRHE+IbCipHV7MlMpgYMxacf9M?=
 =?us-ascii?Q?780TtRpLJB7IV9zXZAu4IfyRG7ie40O5naFqN7/dJHrdlHQNnykJhNAsL/lJ?=
 =?us-ascii?Q?9Ux5IZdw08Y+z9iFCfQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 23:12:31.9196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b1053e-c5ed-49f6-0598-08de2240f528
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5093
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Nov 2025 23:12:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16752

From: Randolph Sapp <rs@ti.com>

These udev rules are specific to TI platforms and should not be
appending to the main systemd or eudev package. Split them into a
separate udev-aragoconf package to reduce duplication and cut down on
appended content.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../packagegroups/packagegroup-arago-base.bb  |  1 +
 .../recipes-core/systemd/systemd-arago.inc    | 27 ----------------
 .../systemd/systemd/usb1-rules.sh             |  3 --
 .../systemd/systemd/usb2-rules.sh             |  3 --
 .../recipes-core/udev/eudev-arago.inc         | 22 -------------
 .../udev/eudev/dra7xx/udev-cache.default      |  5 ---
 .../udev/eudev/keystone/udev-cache.default    |  5 ---
 .../recipes-core/udev/eudev/local.rules       | 26 ---------------
 .../recipes-core/udev/eudev_%.bbappend        |  4 ---
 .../udev-aragoconf}/37-can-am62.rules         |  0
 .../udev-aragoconf}/37-can-dra7.rules         |  0
 .../udev-aragoconf}/37-can-j7.rules           |  0
 .../udev-aragoconf}/37-can-ti33x.rules        |  0
 .../udev-aragoconf/50-arago.rules}            |  0
 .../{eudev =3D> udev-aragoconf}/usb1-rules.sh   |  0
 .../{eudev =3D> udev-aragoconf}/usb2-rules.sh   |  0
 .../recipes-core/udev/udev-aragoconf_1.bb     | 32 +++++++++++++++++++
 17 files changed, 33 insertions(+), 95 deletions(-)
 delete mode 100755 meta-arago-distro/recipes-core/systemd/systemd/usb1-rul=
es.sh
 delete mode 100755 meta-arago-distro/recipes-core/systemd/systemd/usb2-rul=
es.sh
 delete mode 100644 meta-arago-distro/recipes-core/udev/eudev-arago.inc
 delete mode 100644 meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-c=
ache.default
 delete mode 100644 meta-arago-distro/recipes-core/udev/eudev/keystone/udev=
-cache.default
 delete mode 100644 meta-arago-distro/recipes-core/udev/eudev/local.rules
 delete mode 100644 meta-arago-distro/recipes-core/udev/eudev_%.bbappend
 rename meta-arago-distro/recipes-core/{systemd/systemd =3D> udev/udev-arag=
oconf}/37-can-am62.rules (100%)
 rename meta-arago-distro/recipes-core/{systemd/systemd =3D> udev/udev-arag=
oconf}/37-can-dra7.rules (100%)
 rename meta-arago-distro/recipes-core/{systemd/systemd =3D> udev/udev-arag=
oconf}/37-can-j7.rules (100%)
 rename meta-arago-distro/recipes-core/{systemd/systemd =3D> udev/udev-arag=
oconf}/37-can-ti33x.rules (100%)
 rename meta-arago-distro/recipes-core/{systemd/systemd/local.rules =3D> ud=
ev/udev-aragoconf/50-arago.rules} (100%)
 rename meta-arago-distro/recipes-core/udev/{eudev =3D> udev-aragoconf}/usb=
1-rules.sh (100%)
 rename meta-arago-distro/recipes-core/udev/{eudev =3D> udev-aragoconf}/usb=
2-rules.sh (100%)
 create mode 100644 meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-base.bb
index 5cb4e30c..e27a9ca2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
@@ -22,6 +22,7 @@ ARAGO_BASE =3D "\
     bash \
     opkg-bash-completion \
     udev-extraconf \
+    udev-aragoconf \
     libgpiod \
     libgpiod-tools \
 "
diff --git a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc b/met=
a-arago-distro/recipes-core/systemd/systemd-arago.inc
index afcf6928..6e5baef7 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
+++ b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
@@ -3,28 +3,14 @@ PR:append =3D ".arago7"
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
=20
 SRC_URI:append =3D " \
-    file://local.rules \
-    file://usb1-rules.sh \
-    file://usb2-rules.sh \
     file://10-eth.network \
     file://15-eth.network \
     file://30-wlan.network \
     file://60-usb.network \
     file://timesyncd.conf \
-    file://37-can-j7.rules \
-    file://37-can-am62.rules \
-    file://37-can-dra7.rules \
-    file://37-can-ti33x.rules \
 "
=20
 do_install:append() {
-    install -d ${D}${sysconfdir}/udev/rules.d/
-    install -m 0644 ${UNPACKDIR}/local.rules ${D}${sysconfdir}/udev/rules.=
d/
-
-    install -d ${D}${sysconfdir}/udev/scripts/
-    install -m 0755 ${UNPACKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scri=
pts/
-    install -m 0755 ${UNPACKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scri=
pts/
-
     install -d ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${UNPACKDIR}/10-eth.network ${D}${sysconfdir}/systemd/=
network/
     install -m 0644 ${UNPACKDIR}/15-eth.network ${D}${sysconfdir}/systemd/=
network/
@@ -41,17 +27,4 @@ do_install:append() {
=20
     install -d ${D}${sysconfdir}/systemd/
     install -m 0644 ${UNPACKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
-
-    install -d ${D}${libdir}/udev/rules.d
-    install -m 0644 ${UNPACKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.=
d/
-    install -m 0644 ${UNPACKDIR}/37-can-am62.rules ${D}${libdir}/udev/rule=
s.d/
-    install -m 0644 ${UNPACKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rule=
s.d/
-    install -m 0644 ${UNPACKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rul=
es.d/
 }
-
-FILES:udev +=3D " \
-    ${libdir}/udev/rules.d/37-can-j7.rules \
-    ${libdir}/udev/rules.d/37-can-am62.rules \
-    ${libdir}/udev/rules.d/37-can-dra7.rules \
-    ${libdir}/udev/rules.d/37-can-ti33x.rules \
-"
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh b=
/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
deleted file mode 100755
index 68e83511..00000000
--- a/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-/sbin/modprobe g_ncm -r
-/sbin/modprobe g_ncm
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh b=
/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
deleted file mode 100755
index 97071264..00000000
--- a/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-/sbin/modprobe g_zero -r
-/sbin/modprobe g_zero
diff --git a/meta-arago-distro/recipes-core/udev/eudev-arago.inc b/meta-ara=
go-distro/recipes-core/udev/eudev-arago.inc
deleted file mode 100644
index 791a7926..00000000
--- a/meta-arago-distro/recipes-core/udev/eudev-arago.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-# This fixes an issue with touchscreens not being detected with the defaul=
t
-# local.rules.  This can be removed when this change is picked up and
-# meta-arago switches to Dora
-
-# look for files in this layer first
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/eudev:"
-
-PR:append =3D ".arago5"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-SRC_URI:append =3D " \
-                  file://usb1-rules.sh \
-                  file://usb2-rules.sh"
-
-do_install:append() {
-    install -d ${D}/${bindir}
-
-    install -m 0755 ${UNPACKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
-    install -m 0755 ${UNPACKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
-    ln -sf libudev.so.1 ${D}${base_libdir}/libudev.so.0
-}
diff --git a/meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.de=
fault b/meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.default
deleted file mode 100644
index b1aa63f8..00000000
--- a/meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.default
+++ /dev/null
@@ -1,5 +0,0 @@
-# Default for /etc/init.d/udev
-
-# Comment this out to disable device cache
-#DEVCACHE=3D"/etc/dev.tar"
-PROBE_PLATFORM_BUS=3D"yes"
diff --git a/meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.=
default b/meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.def=
ault
deleted file mode 100644
index b1aa63f8..00000000
--- a/meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.default
+++ /dev/null
@@ -1,5 +0,0 @@
-# Default for /etc/init.d/udev
-
-# Comment this out to disable device cache
-#DEVCACHE=3D"/etc/dev.tar"
-PROBE_PLATFORM_BUS=3D"yes"
diff --git a/meta-arago-distro/recipes-core/udev/eudev/local.rules b/meta-a=
rago-distro/recipes-core/udev/eudev/local.rules
deleted file mode 100644
index f14352d5..00000000
--- a/meta-arago-distro/recipes-core/udev/eudev/local.rules
+++ /dev/null
@@ -1,26 +0,0 @@
-# There are a number of modifiers that are allowed to be used in some
-# of the different fields. They provide the following subsitutions:
-#
-# %n the "kernel number" of the device.
-#    For example, 'sda3' has a "kernel number" of '3'
-# %e the smallest number for that name which does not matches an existing =
node
-# %k the kernel name for the device
-# %M the kernel major number for the device
-# %m the kernel minor number for the device
-# %b the bus id for the device
-# %c the string returned by the PROGRAM
-# %s{filename} the content of a sysfs attribute
-# %% the '%' char itself
-#
-
-# Try and modprobe for drivers for new hardware
-ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*", RUN=
{builtin}+=3D"kmod load $env{MODALIAS}"
-
-# Create a symlink to any touchscreen input device
-SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ENV{ID_INPUT_TOUCHSCREE=
N}=3D=3D"1", SYMLINK+=3D"input/touchscreen0"
-
-# Auto-mount any SD cards
-ACTION=3D=3D"add", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"block"=
, RUN+=3D"/etc/udev/scripts/mount.sh"
-ACTION=3D=3D"remove", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"blo=
ck", RUN+=3D"/etc/udev/scripts/mount.sh"
-ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/44000000\.ocp/48880000\.omap_dwc=
3_1/48890000\.usb/udc*", RUN+=3D"/usr/bin/usb1-rules.sh"
-ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/44000000\.ocp/488c0000\.omap_dwc=
3_2/488d0000\.usb/udc*", RUN+=3D"/usr/bin/usb2-rules.sh"
diff --git a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend b/meta-ar=
ago-distro/recipes-core/udev/eudev_%.bbappend
deleted file mode 100644
index 51afb053..00000000
--- a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-EUDEV_ARAGO =3D ""
-EUDEV_ARAGO:arago =3D "eudev-arago.inc"
-
-require ${EUDEV_ARAGO}
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rul=
es b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.rules
similarity index 100%
rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rule=
s
rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.ru=
les
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rul=
es b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
similarity index 100%
rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rule=
s
rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.ru=
les
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules=
 b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rules
similarity index 100%
rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rule=
s
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.ru=
les b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
similarity index 100%
rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rul=
es
rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.r=
ules
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/local.rules b/m=
eta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
similarity index 100%
rename from meta-arago-distro/recipes-core/systemd/systemd/local.rules
rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
diff --git a/meta-arago-distro/recipes-core/udev/eudev/usb1-rules.sh b/meta=
-arago-distro/recipes-core/udev/udev-aragoconf/usb1-rules.sh
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/eudev/usb1-rules.sh
rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/usb1-rules.sh
diff --git a/meta-arago-distro/recipes-core/udev/eudev/usb2-rules.sh b/meta=
-arago-distro/recipes-core/udev/udev-aragoconf/usb2-rules.sh
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/eudev/usb2-rules.sh
rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/usb2-rules.sh
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb b/meta=
-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
new file mode 100644
index 00000000..c1ffa663
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
@@ -0,0 +1,32 @@
+SUMMARY =3D "Udev rules for assorted TI SoCs"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+inherit bin_package
+
+SRC_URI =3D " \
+    file://usb1-rules.sh \
+    file://usb2-rules.sh \
+    file://50-arago.rules \
+    file://37-can-j7.rules \
+    file://37-can-am62.rules \
+    file://37-can-dra7.rules \
+    file://37-can-ti33x.rules \
+"
+
+S =3D "${WORKDIR}"
+
+do_install() {
+    install -d ${D}${sysconfdir}/udev/scripts
+    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/script=
s/usb1-rules.sh
+    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/script=
s/usb2-rules.sh
+
+    install -d ${D}${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/50-arago.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.=
d/
+    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.=
d/
+    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules=
.d/
+}
+
+RDEPENDS:${PN} =3D "udev udev-extraconf"
--=20
2.51.1


