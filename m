Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8527CCCF9F8
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 01:18:24 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75.1762564701849515884
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 17:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wT0I6bBp;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.63, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWI1AmzBvN7momaIWX6AEJFHqquUMTmXd4tOCwLEwZJBqXxNC4Evg4y2Qwz6zMhwdo+3xSQa8dlFgHxP2QGTVAosZ12epEOGpNNHBWoW13Li37OG4CHO1Zc4avhOLuj0Ux92vbCa8Hy0ozwH1R/Q+3dh4hZi1FZxZ8vWbyquhFbmzle60UeHJMwnI3cQvTKKKf3qkoyBSUBScY/AwjLGOXqcc4PajkP9E60aaXfAkuYRGuS9FyAicl8MRhM1POcCNuOTPfCg+KWlh9PBUpBGXqPBZ6yiM1TTuymgKjkayx9etpXR1ibpgkviNkWtFyhZRpiogeiNnCl+mRRs9crbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FmiH52w4/DuMgAyOIuLdHgB3W7hisjVCXqNxUZcycU=;
 b=k0oju/Ugjmrw4U8dXdA3dLQnZGCQPD7qYvS4KOxd/+q6LMClxasc0HIYT1j56PaeTTmrvtPWCJZr8luJnUdw0OSrU5eYmnp+PH3VGwfZikZ9sP/fd0bswURmoResATzeiDNhZZCuEUKKc7ha7H9hYiWwPSR03KGl1ZihVLd3zVGFBfGfop2N/hvDK3qqbBnr5qBqfkpzlQ1eA0ugSirrncbfXY0pKmR9a05ltvLpaE53stC6PWdKMgR4/YLYkuzW5yKUDkzSUCcWaBDIuOjiAj/3g7JLJ2OCDnK221yhu1BFSQlMuIV4EJSuHXDjU3CeYUXmi53rpksixdLC2n6DWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FmiH52w4/DuMgAyOIuLdHgB3W7hisjVCXqNxUZcycU=;
 b=wT0I6bBpl6tsIKdXjr72ngSvA2j8GDxM3OFqMr9yDwbUlA/i4aR13eqvjWjWQhWaxqOmT2T53wIeqsO+55sRL9ol3P39WwdN+/drNmgUHDxQVLjUTDCMn0P4f0T4xq5amzMOwcoCpeAmQGT+IxRqy5Ju+vJXNj4gpsiw7KfKEcA=
Received: from BL1PR13CA0231.namprd13.prod.outlook.com (2603:10b6:208:2bf::26)
 by PH7PR10MB6355.namprd10.prod.outlook.com (2603:10b6:510:1b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Sat, 8 Nov
 2025 01:18:18 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:2bf:cafe::e1) by BL1PR13CA0231.outlook.office365.com
 (2603:10b6:208:2bf::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.8 via Frontend Transport; Sat, 8
 Nov 2025 01:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Sat, 8 Nov 2025 01:18:18 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 19:18:12 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 19:18:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 19:18:11 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A81IBXR3910053;
	Fri, 7 Nov 2025 19:18:11 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] udev-aragoconf: aggregate generic udev rules
Date: Fri, 7 Nov 2025 19:17:52 -0600
Message-ID: <20251108011752.3782760-1-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|PH7PR10MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 69637a99-5e93-4baf-0125-08de1e64b2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?om2lPbPI66D1Igtq2UO9hzRFlCHrTwjtsFIKLhOGUbNA5LUgEAZJZLet2jgR?=
 =?us-ascii?Q?4TV1AVTBanulO247T3JLnlIA0AxNg7GDJYpqah8qkq1tcp+auj7/uYRsjkMj?=
 =?us-ascii?Q?xBj3CqH0/7KRfePYhv96f1PWLOJL1xn1IHsaFPcRse0a4oualOESSN9dzW3P?=
 =?us-ascii?Q?Ii/JRXd1frtirOzDNcrt4oHY2vM/gZfzClNGCGfLR2aDnrNHrEq9X0HYcz7D?=
 =?us-ascii?Q?I347MU674ETCUru17rNkFTJWOP7np7JFQRY2A5exr7aInTvZLmA2omtI3Wis?=
 =?us-ascii?Q?YROsP8ztJi1j/mmh0C8hBr/UmzzEdLQ0M/BY9rEszPHaTvHJiEBC8+3cejzT?=
 =?us-ascii?Q?FZQXQTCuKZpLqcAMhQ8nf4qHqKSgURaoG7/UHzJ+cT3ZFsDACLJ23NxB+D1s?=
 =?us-ascii?Q?vGt8xiC8h50g7Do/n0QydLYPhpXR4sLbCQiYp12ay9WJpnXfz+JI8q/g9Jui?=
 =?us-ascii?Q?fZKMoMnKw8Qriz8UJd7vYk1HMfwBJK7BRjzHAfnDu576Y6u6gkhKvZWjNucc?=
 =?us-ascii?Q?x+6L9SeTufM+9TFRt66qyhqwEuu//0AQZIFYTvXTir7UtWNoRnEg272sNdu7?=
 =?us-ascii?Q?fXkAQf2lxnZfhv2WOHVNPc+/NOT1o76GFZ+zNp+27/KTWBna3J5O6GKY4nmr?=
 =?us-ascii?Q?ijabxLjkZ0u/Koq+h6maq0STzhstNt+CSkLfqVmtdWvinANJ/SIUXTjGttRF?=
 =?us-ascii?Q?gTD7DLw4T8pwsShytCi3s75v3/V8J59Qu0n5i+k+Gy3SW8tskrjVoVMo/axg?=
 =?us-ascii?Q?AnVLC+VjTlyncx2GivsPGwjLP9F1yHNa2e0L7WLcbmG3s9YuFHgWjZwR4DnP?=
 =?us-ascii?Q?/UKJs4cond1wxdiC9zRl6iagANv/6GEGZEPqkNciHS1FfroisdKjp7iTgIqm?=
 =?us-ascii?Q?Z+f441vRbawBajG3Rw8a6XQGKKqLCZFx/9XwDicgy/nu7BbUtivttImvQiz+?=
 =?us-ascii?Q?4cSYXS85K+ZpU5GlxrBm5sGQBpATNv2o0tVDxR+WoCNQv5NhKdP9YTHiwa8W?=
 =?us-ascii?Q?lyQRa9qx9txj8gSrXdPQ44kB+NZEbo9PKkKSdUFXnR8giljMaZov7yirLrnM?=
 =?us-ascii?Q?+py7jcHohlWr1no3iQjOpOP2W2c3o7hC42VsVYgAc//RfAF5XpGrB3OrSeHM?=
 =?us-ascii?Q?oYwR4duBkQkZuSjOaDPd+bf9bHQUlAAie1L0uwdVwM+f9O00q04aH0bd8o4T?=
 =?us-ascii?Q?oZZzMa/Hm5AfbwFBd8twCShZWyZOjDyZ04mk4zhNsqsPrpAY2v3y7loXalcU?=
 =?us-ascii?Q?2bB57Gb8LX7870P11bKjiuoTXLbx9TNGH5lQS84HT6hslmQllC8+vNmYuiv9?=
 =?us-ascii?Q?cQc4pZnykAgIuBXELdYXUIFmxdE59UNr7rff98HbGepnl3IGToqcf3mj1mO6?=
 =?us-ascii?Q?FCB6uK+Ke5x4sBXhkrRJ/eric4zGT2K12bFJLgIgLEbO09cf0UmDvTisnL3h?=
 =?us-ascii?Q?ZD3M8g0u6JbxkJt29RLeGnF+ki6urqU/tMWDPbre5TR1xOM2Bmm54IwoX8Y8?=
 =?us-ascii?Q?pcHtrDi6mk0tBZKs8+QdGXdkpHSGfWzMsHiIC0+Ds1q5gW4Q0b/ZckTnrjXR?=
 =?us-ascii?Q?05DeV0uHgA/T4NyxfIY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 01:18:18.0583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69637a99-5e93-4baf-0125-08de1e64b2fe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6355
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 08 Nov 2025 01:18:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16739

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
index 44889345..0aac3c7b 100644
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
-    install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
-
-    install -d ${D}${sysconfdir}/udev/scripts/
-    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/script=
s/
-    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/script=
s/
-
     install -d ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/10-eth.network ${D}${sysconfdir}/systemd/ne=
twork/
     install -m 0644 ${WORKDIR}/15-eth.network ${D}${sysconfdir}/systemd/ne=
twork/
@@ -41,17 +27,4 @@ do_install:append() {
=20
     install -d ${D}${sysconfdir}/systemd/
     install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
-
-    install -d ${D}${libdir}/udev/rules.d
-    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
-    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.=
d/
-    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.=
d/
-    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules=
.d/
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
index b0c44b17..00000000
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
-    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
-    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
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


