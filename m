Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949CECFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 11:16:20 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5553.1764674176967399902
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 03:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=dTy6dd29;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.51, mailfrom: anshuld@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JddPL8EomRIXHRDv5Nowsw9qxKFAwiABXF7sRJvvQRejF0Gk1javADCpe/0KA1ibTn+Tfsu21JEDEiznUoK7PFPjK7kn+TQ+tcfLa3RTJyh18PC6zRoAcSHSQFs9S0WjHTh5hOJY/plieS3MSwlZJZ5rNTHu5+q1T412Vrr2FU+J6IxoEQ8dAFuazyCMOwPyFm9ALr5vvK24hmJVoO43/6UcdAM6jGDFj6tMe2IMAwzc2jb5FJ9x/kM5ZavYTKwYELs+SHkCNXKaZ6tV17TC3RBn05pYPAU6xd94TVS8F0b0we8PNtYNWq5CGmc8rfsyMjCxsVCtsPJm3QtJLHqCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doKhlZPXTH9FKcYSa88Q/KK2s4rAyh9rDGX2F0p+sME=;
 b=u6omLMgBBEuPfZvkM+nXm1KlIXL3P07B+3X0Kb7TQrEANoYyXZLVXnRfSRrT6CjVF3DlS4lpXgcyqLIitc61T7VQZXOFuLVA/8WflWw/kOyR6cXtNo5c0yQfxgVvHxgtQ01taN0S+w2xufJsn7lF42tADpgxUXD0HqbPusnh1zoLVpsWOQeHbXJwN7+5JhqCTRuDo50Qo0d/8TCyxYZbEmzrT2xVKaoslswr/Dc9cA9CnE4HFeutA1ohUQH+MpQPlWX3EcgcrTq8TRA9FrhvGz6aCaGrXFRlsNCvFJL+7bS2SIetqxd8sbxf0Uxa/ylEClrMgvh26ph27NQE9pK/GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doKhlZPXTH9FKcYSa88Q/KK2s4rAyh9rDGX2F0p+sME=;
 b=dTy6dd29rQ5KdloZB/zvzzlRIgddvMJYPnvMvewEN2P03ztvxcY7kWTh7FObX97SnBosFRtkozSnh2u+1IujNslbUIaioxmm5ZrjNAyzsP/kOzddKnXbIvC0921JnQ93GQ/0PuiGDUq0foDZeC7vfEFLC9OZApTc+X72jRuqsOM=
Received: from BN9PR03CA0285.namprd03.prod.outlook.com (2603:10b6:408:f5::20)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 11:16:14 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::ba) by BN9PR03CA0285.outlook.office365.com
 (2603:10b6:408:f5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 11:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 11:16:13 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 05:16:11 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 05:16:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 05:16:10 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2BG9lF2143130;
	Tue, 2 Dec 2025 05:16:10 -0600
From: Anshul Dalal <anshuld@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>, <denys@konsulko.com>,
	<reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH RFC 1/4] swupdate: add systemd service to rootfs
Date: Tue, 2 Dec 2025 16:45:58 +0530
Message-ID: <20251202111603.1616989-2-anshuld@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202111603.1616989-1-anshuld@ti.com>
References: <20251202111603.1616989-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b648865-aa91-4deb-c86e-08de31943457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lgajpNTzkT4awyM+koInP4/TTS79L79uErCOB3Lw0olZIlVgM2tyaFQ7+ao2?=
 =?us-ascii?Q?POCA/RVYOsHW4reDZII3iAPoZp3kj+lblr485d2Lwt+Tg326CHm49yXeD6C/?=
 =?us-ascii?Q?JDuEGDXKnVoiWU+1BVaUB2GGpUzXT/qKSmH+Y1KYFGXCapVzdOa+xjDlvD4k?=
 =?us-ascii?Q?zvPIH00KOlgIx9dEFxjH+S3zEkBZb4ASPQHQfhb2bUOagAWcw8uYthKHlSrq?=
 =?us-ascii?Q?fRd6m2pC2gvJSmkoBIfqFb/fu4SyKn5vCN+9til+ZlbQMXs5a2YUmlMCYb5T?=
 =?us-ascii?Q?K9EP8rapfL2lJuQnHI0gjP9m0qkYwKlRp+B5vy/tKVvrH5jH4czt62XHz9n0?=
 =?us-ascii?Q?NNgXyZxxsDSVvhMiG81IVMetEfLG3mOVBrXVqDbBnwyZlwBTptcwro0/EdYz?=
 =?us-ascii?Q?myMrmTPyED9J46Tu54LzzAOnJauLuzFCyWnZ/Ldiwhqass0ZSiRXLSZ12ryq?=
 =?us-ascii?Q?xSKbqsRfjp2EVZ7uy/voosn95xY0915t6VEHmtR7SCvYzhVUZ0DBfijqkCKx?=
 =?us-ascii?Q?r0m1ckbwhJtt1df8YQjxDJW3so1xq0vYLeubiG6uRqW1NCxIjKPNcy8RTwNR?=
 =?us-ascii?Q?0xM/KjHj+Y9e0nr7cT0/Sm9RIQAWVrAJ+Mi4TmwuPqSYNPnLP47jEWM4a/7q?=
 =?us-ascii?Q?pWWC3LFxvegejksryjidJmsRS6oTtTps9ux0/Wxa9A6PudsZRknKFrLdwVPJ?=
 =?us-ascii?Q?GzJnqM3+LHHzBvFYRN8eOWB1Dzh/XbbvA4cc57jwNhkRaRW1Iw1pfdlmbIaC?=
 =?us-ascii?Q?Wy7J4uWbJyHcTio0eCUMARDikP3MERDxrMmak8X1lpKV2i2KMzQc1039ehD7?=
 =?us-ascii?Q?7NhSSBHg9kYxuv/synkb908zxxpHUFlXdI5G4MvXUlPofyxIbzDnmHziexxo?=
 =?us-ascii?Q?JPbKeoVK6mt7N30L889dv17t6GHA9TmzbCE20NOjr4xnBpec77eOY083ingJ?=
 =?us-ascii?Q?KRHvwl7eWD3RVzGQVDDxHd3uL4M+1+OwIghXuq8GeSkoeAMlqx51g1/IBO7U?=
 =?us-ascii?Q?XO0GJK0aCmgIhbDbEYUWEQUkptpTBqMPG9ekk1ZjEZwM1QQfiklncnOKDcnt?=
 =?us-ascii?Q?123JCFFkxDoiVCDjzUDSE8HIjMgfz921Wb3Ehr58r20pgihwNDGjZss4roVE?=
 =?us-ascii?Q?mSvDINaHMuHW+6MgtJslwhRwbHiRGryESY/8N17RTjf6do7Phl0urtn7OfKU?=
 =?us-ascii?Q?FTaaMpQY8fnPqXRk13pS6Hhe8dD0YlvJvO54D/aoHlREckg6oe3+xQ4gEbNr?=
 =?us-ascii?Q?Qp8mudPUdu0UnJHcSKHp5f13jsr1RMxs8k/D9XVVTli8y5qTIGAF8PzkfO/Z?=
 =?us-ascii?Q?6LCQFHcB4fNWBpPZLoheEtnlIszOdBvoHpHEh1rlU4cX8kpEcgZkv9MFRs13?=
 =?us-ascii?Q?MVS39kXu4fXk7ZcEdXbX+9TGvt60eWAxrwwHrm828B4pjZJOlu+iLXkfdjNG?=
 =?us-ascii?Q?UIxkcMGy62LUSFnaJXz5oISGWaodVaa1z0J9dGvNg2sLwZPxMs7tZ3/5L/pw?=
 =?us-ascii?Q?MjU6WSFWpMTzdIfivI8y5a4Dw/lcF74TiCW0?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:16:13.5058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b648865-aa91-4deb-c86e-08de31943457
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Dec 2025 11:16:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16847

This patch adds basic support for A/B dual update mechanism where the
rootfs is duplicated to provide redundancy in case of an update failure.

The bbappend adds the modifications required to make SWUpdate suitable
for our use case. The new swupdate systemd service invokes swupdate.sh
on startup which starts an update server on the target platform.

The "ti-swupdate" override is used to selectively enable SWUpdate
support to the final tisdk image.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf      |  1 +
 .../recipes-swupdate/swupdate/files/defconfig |  9 ++++++
 .../swupdate/files/swupdate.cfg               | 13 +++++++++
 .../swupdate/files/swupdate.sh                | 11 ++++++++
 .../swupdate/swupdate_%.bbappend              | 28 +++++++++++++++++++
 .../wic/sdimage-2part-swupdate.wks            |  6 ++++
 6 files changed, 68 insertions(+)
 create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/defco=
nfig
 create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/swupd=
ate.cfg
 create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/swupd=
ate.sh
 create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.=
bbappend
 create mode 100644 meta-arago-distro/wic/sdimage-2part-swupdate.wks

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index abbe4faf..d8630718 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -34,6 +34,7 @@ IMAGE_FSTYPES +=3D "tar.xz.md5sum"
=20
 # Extra boot files for WIC images
 do_image_wic[depends] +=3D "tisdk-uenv:do_deploy"
+WKS_FILE:ti-swupdate =3D "sdimage-2part-swupdate.wks"
 IMAGE_BOOT_FILES +=3D "uEnv.txt"
=20
 # Mask any broken recipes (currently none)
diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig b/=
meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
new file mode 100644
index 00000000..b1362eaa
--- /dev/null
+++ b/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
@@ -0,0 +1,9 @@
+CONFIG_HW_COMPATIBILITY=3Dy
+# CONFIG_LUA is not set
+# CONFIG_BOOTLOADER_NONE is not set
+CONFIG_SYSTEMD=3Dy
+CONFIG_WEBSERVER=3Dy
+CONFIG_CFI=3Dy
+CONFIG_EMMC_HANDLER=3Dy
+CONFIG_RAW=3Dy
+CONFIG_SHELLSCRIPTHANDLER=3Dy
diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.cfg=
 b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.cfg
new file mode 100644
index 00000000..5cb04b0c
--- /dev/null
+++ b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.cfg
@@ -0,0 +1,13 @@
+globals :
+{
+	verbose =3D true;
+	loglevel =3D 5;
+	syslog =3D true;
+};
+
+webserver :
+{
+	document_root =3D "/www";
+	userid		=3D 0;
+	groupid		=3D 0;
+};
diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh =
b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
new file mode 100644
index 00000000..bb3a3593
--- /dev/null
+++ b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+rootfs=3D$(swupdate -g)
+
+if [ $rootfs =3D=3D '/dev/mmcblk0p2' ];then
+	SELECTION=3D"-e stable,copy1"
+else
+	SELECTION=3D"-e stable,copy2"
+fi
+
+swupdate -H @MACHINE@:1.0 ${SELECTION} -p 'reboot' -f /etc/swupdate.cfg -w=
 "-r /www -p 8080"
diff --git a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappen=
d b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
new file mode 100644
index 00000000..0ce763f9
--- /dev/null
+++ b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
@@ -0,0 +1,28 @@
+inherit swupdate-lib
+
+FILESEXTRAPATHS:append :=3D "${THISDIR}/files:"
+
+FILES:${PN} +=3D " \
+  ${SWUPDATE_HW_COMPATIBILITY_FILE} \
+"
+
+SRC_URI +=3D " \
+    file://defconfig \
+    file://swupdate.sh \
+    file://swupdate.cfg \
+    "
+
+do_install:append () {
+  install -d ${D}
+  echo "${MACHINE} 1.0" > ${D}/${@d.getVar("SWUPDATE_HW_COMPATIBILITY_FILE=
")}
+
+  # We don't make use of conf.d in our swupdate.sh
+  rm -rf ${D}${libdir}/swupdate/conf.d
+
+  install -m 0755 ${WORKDIR}/swupdate.sh ${D}${libdir}/swupdate/
+  sed -i "s#@MACHINE@#${MACHINE}#g" ${D}${libdir}/swupdate/swupdate.sh
+
+  install -d ${D}${sysconfdir}
+  install -m 644 ${WORKDIR}/swupdate.cfg ${D}${sysconfdir}
+  sed -i "s#@MACHINE@#${MACHINE}#g" ${D}${sysconfdir}/swupdate.cfg
+}
diff --git a/meta-arago-distro/wic/sdimage-2part-swupdate.wks b/meta-arago-=
distro/wic/sdimage-2part-swupdate.wks
new file mode 100644
index 00000000..cf3b6f03
--- /dev/null
+++ b/meta-arago-distro/wic/sdimage-2part-swupdate.wks
@@ -0,0 +1,6 @@
+# short-description: Create SD card image with A/B partitions for SWUpdate
+# long-description: Creates a partitioned SD card image for TI platforms w=
ith SWUpdate support.
+# Check https://sbabic.github.io/swupdate/scenarios.html#double-copy-with-=
fall-back
+
+part / --source rootfs --fstype=3Dext4 --label rootfs_1 --align 1024 --use=
-uuid
+part / --source rootfs --fstype=3Dext4 --label rootfs_2 --align 1024 --use=
-uuid
--=20
2.52.0


