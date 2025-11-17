Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8023DCE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 21:49:33 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1916.1763416161410884347
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 13:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fU5qKAyQ;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.193.4, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olzFYAjDx3XFggI2PbarHw6pfg4ZLn4NyaUnbEZPEjLrBeJvi1NGZLcDXXYKISTyABZN/KciI5P0EEyqaPCb8e99CMdP+cLh5vpDGVkt+A3EToDIGh0F3adSbc4gGZnehLX2AM+NRg1x9LxI1isT2B30+uX1rjIdkr1ks4LvTndiuZEl8nzW4+d/GsDlJQxcbS308nxdd/hLIflcHSSUc7kFqVKuiG0h/xJk97cBMvvkJ1FG80x8eBYVTZVASqy6Spfq487eeECZJnf41ddyvpCMF2Zs1/xO15VT6EtTcE2y5L+Rs6fVeB3IkeRWeLMZYqy3MIWXS18LztlVZ8yEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i31EO7UWrQRZ0w9I3hcrjv2BVry09IdikA2SnZjPueY=;
 b=B0GZmKurldAlGzXTpwyrk1Ahyr+xkkzleXSr7GwR2rjgGNQn7c8k5EalM75i6eRxbG6GNZKToGQCwhjMW6gNCBMj0pXzYyQaJ0pso847VJmf08hqRBLItxdfP+j8mfrWXZM1EEQgvZA55XNdrNo/xXNPwR48dhC2MpyqdJLF+I/ZBwIG7J+6JtUsqaie2blYVlZtnlrYU4nZAD5nMyQ/7lz1Hof1KpKdD79IWnU4bMzYge/GBCpHIH/uCu9VxIS5+1eLCjDG9tqKsaHn65NHuzO34Wqk2dEaiKW3pfuixGyZ3+M+WD1UqY+Gdv3FcXnVWFCZDvLEbMBzsyBqgminzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i31EO7UWrQRZ0w9I3hcrjv2BVry09IdikA2SnZjPueY=;
 b=fU5qKAyQWQR4OPA4VHWhvjnYZdn/0RDKMhGqdHsGEMM46IDZtvgu5KeM3cYDAJXPqH+HwHeP3yjLDhYt11hlCrrRjlsr4vy5PcIBxJgQnT7GfkhTCc7Dv/JOvgWueOC2j6KESljxQKNoqD6hEDT7dSw81s8zmJNxvujz0PvKE4Q=
Received: from BY5PR20CA0030.namprd20.prod.outlook.com (2603:10b6:a03:1f4::43)
 by DS4PPFEE36F3C1F.namprd10.prod.outlook.com (2603:10b6:f:fc00::d56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 21:49:15 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::b7) by BY5PR20CA0030.outlook.office365.com
 (2603:10b6:a03:1f4::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 21:49:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 21:49:15 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 15:49:09 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 15:49:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 15:49:09 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHLn9SR3198357;
	Mon, 17 Nov 2025 15:49:09 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCHv2] udev-aragoconf: aggregate generic udev rules
Date: Mon, 17 Nov 2025 15:48:29 -0600
Message-ID: <20251117214828.2518952-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|DS4PPFEE36F3C1F:EE_
X-MS-Office365-Filtering-Correlation-Id: 6665757c-7312-41c8-6394-08de262326f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DMQE0+PfDTZsU6NuqD0djf1FTzsMvBW8ipbHSAagmoGhUSy6ek9xkeHnA9TN?=
 =?us-ascii?Q?Kry0KzYYdyRhBqaYpEjLYb41Mtl1xAf82l9Iy8ghhBWud9tVZK6pjB8c8e7n?=
 =?us-ascii?Q?ToTbjUICmRerXm8udDFJrawdNzqRJytVXu237jipEczQMJwKg5ToCJPmq5Ni?=
 =?us-ascii?Q?HjspQP7H5OFn5BuhudkYCva8z1tTZJ1lJuFpvZrjAdxJxDOuHSMuRpwd+lWI?=
 =?us-ascii?Q?H9ieMtJftmNP4KtsrEgHnZ8j64+X0svZZM62ALDb8Z0EbiXLXgPkS548CjKe?=
 =?us-ascii?Q?Qx60hFK8R8glTh98XXZXO+jSc8urlgOFfEx3BCB92EVoLCQFil0lEvTchARo?=
 =?us-ascii?Q?kdM5krBwW6d42Por9h2CnHeSqEaGcZb0nMiiXKJbfzpklFudNG0B8CGGXS7j?=
 =?us-ascii?Q?68cXe5YJJ1OpZrm/MvnNx9HajL2FpjNusnwWDfQ6r9ij3BfXOUbsqcOLcYH9?=
 =?us-ascii?Q?0DcDLppZw3HX0/UaJC+1CHYiWaaICnYJL+EaYr16r8P6z2piAlCVJJRLnGs+?=
 =?us-ascii?Q?1A/3JvoFpAyjxCTtgcQNCmLGBcdcztG5og8KWKk5HbSOgUMLxpccodw5XjCu?=
 =?us-ascii?Q?KkleW8dBwY7CQbjX/Bfug9reW0b4jXiVeI82/5IeEqsec5HETYrjMtAUE61x?=
 =?us-ascii?Q?QzYOUVeln7s5JmvocaARb8cHtHA6NyDNivvIkONjfKRqgIQg2v++lGwAfQnD?=
 =?us-ascii?Q?9QyuOQmC8ekec6VvbMOHaTEebU7Jr6HXwDaIezQTgGcOsAv0qQhXJm1HN+Cy?=
 =?us-ascii?Q?igUxuZJnezBh8kFJC8RPAKIRNIf10en23Wt/epXEaqrHEB6uq43ce7BaUJeL?=
 =?us-ascii?Q?onSYAoOPkwq2d6dytyxhwb8Ocu+9s4c7RMACxqDsqxM7cheoCb0qx5ofQUwb?=
 =?us-ascii?Q?k3MyZ6nsM23ePwT4YeBkwoCOzj+uQr3ktDtXKn3WC+Yns4hJmXxrNtJFKMI5?=
 =?us-ascii?Q?OkeK3KZYgnRVKHRodKrg2UPq6QWyJXT1ZsdMHvtYWlKBIrH2ZFDxizK2fkhC?=
 =?us-ascii?Q?6iatg4eeaD7enos26cGKPDMTUvmys8EyQxims12Xt2akJc20GCNPNFHWzAxa?=
 =?us-ascii?Q?mpyU3c2jjCOAOcZ//cNublfqIlpZeBiYZiBc1t7ldIsXQ0hRDkXHUsjsdc5L?=
 =?us-ascii?Q?tF/9i33D3LPDzYN9phdIu/FQ1KDRPJ16FUQZjNR2/MpT899JiMZb3QAmYN5o?=
 =?us-ascii?Q?BWbXnl9hLecxpNs6kPpFX4lQ+gJUjY7IOYixcvoYBHF4orjGCmY73bXhbACJ?=
 =?us-ascii?Q?BvxtNJTScv2YQUcRaeS30gYaPTPzsp38qicdhbSmqRwgsjr80eT6gEkRC5/+?=
 =?us-ascii?Q?hS10H0i2p/n6uCOM/WYo0f46ph0TrOgPS+GPkpT9B9sKqVkh/jksran4Vqpl?=
 =?us-ascii?Q?bBCoMb5qd6v/4yR47MUYs56kBjTHuG7t71apr1s+VXnPzT4JVY2ygOYBdeLK?=
 =?us-ascii?Q?Gd4YZIVjwX78z5V7MPEE/N4tmf0EBY6a++GH1oyCC3A0jdqsS++Ypd0V/Ji2?=
 =?us-ascii?Q?wxywmEzzwiJA/2ZfpA6MFWLjN9eqtOkzA94f7GaD8Bh7iQdHmeUlYLeadxtT?=
 =?us-ascii?Q?279dlKsbcg30fIxH4KI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 21:49:15.1465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6665757c-7312-41c8-6394-08de262326f6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEE36F3C1F
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Nov 2025 21:49:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16780

From: Randolph Sapp <rs@ti.com>

These udev rules are specific to TI platforms and should not be
appending to the main systemd or eudev package. Split them into a
separate udev-aragoconf package to reduce duplication and cut down on
appended content.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2:
	Use UNPACKDIR instead of deprecated WORKDIR.

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
index 00000000..e96e9d3e
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
+S =3D "${UNPACKDIR}"
+
+do_install() {
+    install -d ${D}${sysconfdir}/udev/scripts
+    install -m 0755 ${UNPACKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scri=
pts/usb1-rules.sh
+    install -m 0755 ${UNPACKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scri=
pts/usb2-rules.sh
+
+    install -d ${D}${libdir}/udev/rules.d
+    install -m 0644 ${UNPACKDIR}/50-arago.rules ${D}${libdir}/udev/rules.d=
/
+    install -m 0644 ${UNPACKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.=
d/
+    install -m 0644 ${UNPACKDIR}/37-can-am62.rules ${D}${libdir}/udev/rule=
s.d/
+    install -m 0644 ${UNPACKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rule=
s.d/
+    install -m 0644 ${UNPACKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rul=
es.d/
+}
+
+RDEPENDS:${PN} =3D "udev udev-extraconf"
--=20
2.51.1


