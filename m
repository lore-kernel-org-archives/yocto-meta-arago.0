Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22400CF58E3
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:20:21 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16737.1763583605065240430
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 12:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=psox8DHN;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.53.4, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgqEK43di0U9nyLWhD1YpDaAtbuZjv7REwi41bjzAzYfbxqupFaZC/YYQdgGLbIRmfutiquC10fX31RY/q2/U8xs0Gkae0a0kk0TcKlt4pknNqJMeKRjUXLhewZ6JITovw6lNy45rsDf7ThKxPfS8aNQta9M9ByjnHdSNTnPzFQvE7nXk1MQaZ4Osur/pAz1hGyyPfXcFARueV/a0yOE4UL9ufb3BpB4sT3yqhxtPNLolsVUMrlFn+mYILeuW8KNwuZatwczFbQV0C2a28O4WFTkMxKI1/yL80/bW6QyqcDgcLkr43LVDFMV4xvxOALswTO/DmV+2lko6dwINO7nGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1m2WZIO96RcdVCXtV3QPm957QtRXFcy+4jfvoceunM=;
 b=WYGx8IXUXmN67On97S9JLkfYTHHW0aY2pQcb9ZRsX5b87kZcJ511eCg09uLFmyKKOPp3CcqjjsAHbAncr0/xapeTloT3Vo9tlju44b5VR7QtqGhNo8iGoHDpBNUoE9b+jJvcNC6KOySqKWriK7vr5VOUiNT8csXos8/PJjNt+ue2VSZOdJd+0GDJlU3erJpVuyfnaKlyaAPMV5kLJq3t6+dWGKjnW4FI0kzj4P47ugwdna7ccweWbx1UwV3lODIAUlwSwPTkonN67hHDzDcJBivQuN8G+9wDbyTdHQw5FBY2SMrRL6gh38tUCOn/G7A4GrS1tgjEUOtHs9IdJLnm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1m2WZIO96RcdVCXtV3QPm957QtRXFcy+4jfvoceunM=;
 b=psox8DHNdXYqxLZUGbIp20K6Ii++xqya8JWkmmkd11UJO5HKm6MR/IJ0LNWk8aYFgTkN85PDv8sMx/LSikb6AA68kUKBZQk6WYquKzihqYZ5MYSyhhaR+oy9Qi+9EXHsVW6c6hiqhlxQOWjavgXYCkazSe69zYfRMVmJKG06HV8=
Received: from PH0PR07CA0045.namprd07.prod.outlook.com (2603:10b6:510:e::20)
 by MN2PR10MB4125.namprd10.prod.outlook.com (2603:10b6:208:1df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:20:02 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::2b) by PH0PR07CA0045.outlook.office365.com
 (2603:10b6:510:e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 20:20:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 20:20:00 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:19:59 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:19:59 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 14:19:59 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJKJxgQ2473861;
	Wed, 19 Nov 2025 14:19:59 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] udev-aragoconf: remove legacy usb rules
Date: Wed, 19 Nov 2025 14:08:37 -0600
Message-ID: <20251119200836.362773-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|MN2PR10MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f70a8b0-d62f-4f05-a599-08de27a903dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5yM8PEAIF2YBBDDqVUm3fQM1IfQ3I/iqFU3XBlGstyEmHc8v+TfUChfnAoLo?=
 =?us-ascii?Q?CnBs0nUGVNl0t8LGk5jQhyekLzCKHISrC+cMWMqLTg+yJ5ZLnNlDjgV4g7Im?=
 =?us-ascii?Q?XATndMwertBWZ+N5xtFkVObxj/Vj7yG8PFxh7uhWCcQCs6VIQuLCz2zVRG2P?=
 =?us-ascii?Q?E9BAf00HD3KUQZu92Ux5qsp7h1FWKGbClChcRpmckV0L2Rbhtjg6KZLXbSdQ?=
 =?us-ascii?Q?q8MtXxiM5qTZBupzRdLFF5QHT3N7GCyLuNSd6dgCDUtfsjLxmJqH+cfuODvw?=
 =?us-ascii?Q?9ZHQKXThpZ70eWuJsLcpsBBvb8IYvwRxqj01DxO/tVIceD0BhvX8PMgEP9G1?=
 =?us-ascii?Q?2nnUOK2FQpmMsOAIJM7TjpgCaJcvLnbR5U4s1FX7/ynA0minnViA8bVC/ZOp?=
 =?us-ascii?Q?M3KL1zddBx6kAlktvL32ax1gu5nyPnoEZYcc6RSzY9AXP2cZ49eu4vYLr8X8?=
 =?us-ascii?Q?MgIveB2egtjoYoNcA8+ShSJNrt/18awyj57TAg4YB6CF2VUe81DABAjI0Z4S?=
 =?us-ascii?Q?tyu8sW+makbyFJBY4IOpj3q8M2HeObwxHkJuhnUne6CWeVpP7flX8WoHAF6V?=
 =?us-ascii?Q?ej3+F+vXZTLoEbR+IN5YvVK+XPzXqvoj91AJo7pEQHq/Y3MqgFbrk8ruRgQr?=
 =?us-ascii?Q?A1HaiUeqKzpYt+gTVfpIKsdBj6IhjpIPDDH/1mXF8SUyXaLoomLZR3dQdyLs?=
 =?us-ascii?Q?nLnLbbDTbdB7xwx0rxIFkk/arolAmVBkrNLzc51ofkp20wDTNypyRngzaASx?=
 =?us-ascii?Q?+TiaZp2l68hNHBMEHGya5E6TMBxEc9Z+a60xeDin0sMI7TlLswy/YgldbHez?=
 =?us-ascii?Q?Fg4Eaui56QpZ1APuS6NzJMMJxis2b7+xW5/PdaHHfMfpp8bfOiDw5VdyghJp?=
 =?us-ascii?Q?CgtwoGIZBRKS2W5W+U/FHw9r/S43AytJ4ljAXmALS/MnyygR+O9Wj4NMtnCj?=
 =?us-ascii?Q?jqeSbt658CaRyA1evJi3y0oiDnKWU7Tq5T2QHv4RDu9flcySohHRtl9p4O25?=
 =?us-ascii?Q?n7HYUVrrdZ+kpW5wgsAoorbzKKmzWQwlHXQ/TFAuLRAEaXnwc1rjB5PfTwn0?=
 =?us-ascii?Q?SoyJafp4r2O/jFWzyPZfXbkonckcOrMl9fxqxpcfVykMOxb5/ZwLDF7u1lD8?=
 =?us-ascii?Q?24wcjD/SSLi7HGaAufhyV/M0kIo5+7b8p3XEwtEzjDfWFxh1av44XFCq+6m3?=
 =?us-ascii?Q?GOzLT8DRLxK0HrTLf29fPL54Pe2P7xn7/238UdiMHhP25m0dmg0QkZfqxoGZ?=
 =?us-ascii?Q?Tui1HbjpFiz97vO+Wt9yIucdfrdtaycndFqT1q1N0U8mgU1PlFH8NIgfzTlX?=
 =?us-ascii?Q?9DwqcRRt6nn/MRNu3O1viAAzeesOqNCHXZF5MhuMMwaR5bQSBoS7gtdeq0vZ?=
 =?us-ascii?Q?Jz8ADC3R7QnGr09u689sOnHZCvJ//pQyDEN34S7jMjHiNqBF5e6uMFYr8rZe?=
 =?us-ascii?Q?tsKhGDtnqI2XX98lFBmg2DO+h7lB5jmTAD0XIULESpjEoHu8gJdtQXV3K+a1?=
 =?us-ascii?Q?wgwG5mRyArtz0s+pDw+/XU/nIOCAfv6ljUPv05ahgKkP2L6un7R6guzFwwyg?=
 =?us-ascii?Q?qqO6/Gy5pwQnyjdIlrk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:20:00.0770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f70a8b0-d62f-4f05-a599-08de27a903dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4125
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 20:20:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16802

From: Randolph Sapp <rs@ti.com>

These rules do not match the current structure of the USB DEVPATH and
are not actually fired.

They were initially cited as being help scripts, but I think users
should attempt to gracefully bring down the gadget interface on their
own instead of relying on a script that will attempt to reload it post
mode change.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Master version of: https://lists.yoctoproject.org/g/meta-arago/message/1678=
8

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
index e96e9d3e..e23688b1 100644
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
 S =3D "${UNPACKDIR}"
=20
 do_install() {
-    install -d ${D}${sysconfdir}/udev/scripts
-    install -m 0755 ${UNPACKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scri=
pts/usb1-rules.sh
-    install -m 0755 ${UNPACKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scri=
pts/usb2-rules.sh
-
     install -d ${D}${libdir}/udev/rules.d
     install -m 0644 ${UNPACKDIR}/50-arago.rules ${D}${libdir}/udev/rules.d=
/
     install -m 0644 ${UNPACKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.=
d/
--=20
2.51.1


