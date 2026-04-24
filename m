Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C503BFF8850
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 22:33:53 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1258.1777070029953128460
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 15:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=n2/1WkzN;
 spf=pass (domain: ti.com, ip: 40.93.195.20, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nw4pPvNKUNPGdVhOzhie68ihsnZ5C9Vwp9jG3lI8kRi5w1DXKIZfQeuAlCrH9Cp76r/3X98fxfa2dggEWSpzYqIOvKvYYy/QNIbViTVh8ba5T1na4/CaAgaTIUAoCttCX/Ckcx9bWBsJCWoOipdurrBWLGfYcgftorNEf5CGWKyHSSMmf/gUV24zjMRmacrgU19Uo2FU5FLuppr6B5txLMMLjN8dltucp9wJ2JUwmyuYk0OOfqBW2rj7CQa4Yqhb+z139YTyy/lGSbnm/DwRC4nysbqz6n/aVX/lhlSOH53ka8z67mSTAFRAjhhDelY9bP5p8YXR+xtL+pBqH/pykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYa8ITLpasakk2TLIjiqpMkL3Dz/MUiVmKMqNjnQ4FY=;
 b=efVmkwE1grKFUy9lmS68XJPfmDatKUjQwrJEUo/hQPD4mA2/lU1kB5qG6Qog4520gAWSS9jTMYqPi6MOXeDuWsJlb8rWMEAb1wl4XgaYkfYrTBRHQNMRfnz1R36hOTyIfqLaIWUu9BP4th7fh/uTD6zrc8pvpqF6XelBPiLLdzqBYxXghfFgLOQRXECclfh4PBBWcoqpGbCQ2AnFcJtixFmPque9bkhXtAC0Z06qQ5Q6amcADFcEuJkov2MRRlIVLHqf2tYbPrThhqy8kWf6ac92J9G8VhxcC6y4v6vpMtGf9fQh9omu0QQg5s93b29s6BF9pUlG6rV5WvE+C7tHRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYa8ITLpasakk2TLIjiqpMkL3Dz/MUiVmKMqNjnQ4FY=;
 b=n2/1WkzNv6KM7i8eARy/g7+JW49nS1HBgB5XOCMVJKWegMVatFkk73R9Vwf3iCp/sqNCu3qG8TWSysAyS/T441tvBw4L0Usu9c+RzQQtrM2zUnfuwe9OPEPlkyhMRu8n6dhIYtErBRUmAy5K85y90gSI4Aklq4dLOChs80jE1iE=
Received: from PH8PR22CA0009.namprd22.prod.outlook.com (2603:10b6:510:2d1::25)
 by DM6PR10MB4282.namprd10.prod.outlook.com (2603:10b6:5:222::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Fri, 24 Apr
 2026 22:33:46 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::a9) by PH8PR22CA0009.outlook.office365.com
 (2603:10b6:510:2d1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 22:33:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 22:33:44 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 17:33:43 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 17:33:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Apr 2026 17:33:43 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63OMXhtw2525809;
	Fri, 24 Apr 2026 17:33:43 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <s-sadik@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] qtbase: remove serial event 0 handling
Date: Fri, 24 Apr 2026 16:32:20 -0500
Message-ID: <20260424213220.2378279-1-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|DM6PR10MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c35490-9a64-4bd6-e02f-08dea2518b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	jekYOksjltQrRfyNIT8mbESfP2Zd+TNF49QAquFmbaDxGB50eh7xUQESqRFNwl94HQgNPfC2XAc3UzKHhd7We4fsUHKTaOO/SMeMHO6xedkE+eSov7o6vTEJb+OAG/EbJKdmw7HZGFBQ/FF4N6ralSoelVSsyQbLE1lfRf4AlZ1sqlAxOWfzHsnIlavzQd7XO/YA0iDfAg+Tzos3vLl/9ieb8FB+GRQrw+D0Ps5kZBCUun9ZcIYbwVCPjwJykeK3T8t3OU87nmriaa63r7P8uRy0zFnRJ4JyHfsT8/ACDQDm5orhgxwRx24mWMkeLBoADucbsIkQK5WndZRQv8pr/eOZppLvtBA5K7SGMPqXmCfvSZ3K+Gslx+2Tuejhu8x+Efw4T46ikmNXVtavCPDIakJkZBsXzWmHcLw/8fdnk075pKqULqcoVgBYYtyXXQJeeIp4ku19GCCKY4nZoNuTxw3QQdghxu4gesCHxEJJMqmwrAuYGoHkmeyvXPEi4iNrei7mAHJJq6ywUW61milj3ymFxc2gIpTAWMuF90hPbfs/6z0bNYOYRcYk5SPqgxTSRJ7GXk9bQGW1yB/OlmAa73VNxLqbs/rWmb8L++cFuRmg7KZEeU4aysN0GSmAvsRl7ZHBw2mrl96yQXc3UwlkYpQfeY1PYRZysoCzajAzhKsecLV4xXgFz64dru5DbcScjGE+lqZ7RBAQDx85ChtmY0IxqK5YUdWlpDZWsTg0xKID97KF7qix+SIWgXAOk6e8Ihny1L4TmwBQvxTuj3EyUg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	C29Sm0Cu3c7akGT0tQ1Cay2eD2mW798jOv9jezD+mjvGWawDMHpPwDxyCZ9zARya8IFjS//GK4lF8jy2D0aFejI6ETLNsUUM94qSkp9hQLzAGSrctjGXYQ16g01cOl0Hium/cN6VYYv1HOC+keu7rLsVDVs7XlsrHGPy0U6Fv1v/1bguiW3+XxsXScQFDsWtcC0JVn53UDkEfmVhDrm20chnNoEyEXYZKK6rbCMqCpESph5ocfgLytKqbPP3BQvZfns3sEfTy16z/XcniVhSonNr1TvWEsdgWDOJtis9sKiJcg1rYeP6G8jbE60KYd87U5uRnT826hH6g4jfxY16kWmMh47LLpw8x/OWN+l+DNY84KP7AmJll+kxZozIvOMh3nLLC1THYO73tZKpfQwTdSOC0QI64H+52tZRd/znGPkuN5wh995yS4zcsHf7XcQK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 22:33:44.1882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c35490-9a64-4bd6-e02f-08dea2518b14
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4282
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Apr 2026 22:33:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17487

From: Randolph Sapp <rs@ti.com>

Serial number 0 is perfectly valid, though maybe a little uncommon. It
shouldn't be treated differently or used to indicate a special event.

This project has a CLA that we haven't signed yet. Carry an local patch
until the upstream bug is resolved.

Bug: https://qt-project.atlassian.net/browse/QTBUG-146015
Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../qt6-layer/recipes-qt/qt6/qtbase-arago.inc |  4 ++
 ...tdevice.cpp-remove-serial-0-handling.patch | 42 +++++++++++++++++++
 .../recipes-qt/qt6/qtbase_git.bbappend        |  4 ++
 3 files changed, 50 insertions(+)
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/q=
t6/qtbase-arago.inc
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/q=
t6/qtbase/0001-qwaylandinputdevice.cpp-remove-serial-0-handling.patch
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/q=
t6/qtbase_git.bbappend

diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/qt6/qtba=
se-arago.inc b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/qt6/qt=
base-arago.inc
new file mode 100644
index 00000000..9f03a370
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase-arag=
o.inc
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/qtbase:"
+
+SRC_URI:append =3D "file://0001-qwaylandinputdevice.cpp-remove-serial-0-ha=
ndling.patch"
+PR:append =3D ".arago0"
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/qt6/qtba=
se/0001-qwaylandinputdevice.cpp-remove-serial-0-handling.patch b/meta-arago=
-extras/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase/0001-qwaylandinputde=
vice.cpp-remove-serial-0-handling.patch
new file mode 100644
index 00000000..4c1a0d40
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase/0001=
-qwaylandinputdevice.cpp-remove-serial-0-handling.patch
@@ -0,0 +1,42 @@
+From f10c63a7391adcf5c28c3378e9d72ee52b5bba97 Mon Sep 17 00:00:00 2001
+From: Randolph Sapp <rs@ti.com>
+Date: Fri, 24 Apr 2026 15:14:26 -0500
+Subject: [PATCH] qwaylandinputdevice.cpp: remove serial 0 handling
+
+Serial number 0 is perfectly valid, though maybe a little uncommon. It
+shouldn't be treated differently or used to indicate a special event.
+
+Signed-off-by: Randolph Sapp <rs@ti.com>
+Upstream-Status: Denied
+Bug: https://qt-project.atlassian.net/browse/QTBUG-146015
+
+Yet another CLA we won't sign.
+---
+ src/plugins/platforms/wayland/qwaylandinputdevice.cpp | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/plugins/platforms/wayland/qwaylandinputdevice.cpp b/src/p=
lugins/platforms/wayland/qwaylandinputdevice.cpp
+index b9ca27e6f04..84b7457b0a1 100644
+--- a/src/plugins/platforms/wayland/qwaylandinputdevice.cpp
++++ b/src/plugins/platforms/wayland/qwaylandinputdevice.cpp
+@@ -237,9 +237,6 @@ void QWaylandInputDevice::Pointer::updateCursorTheme()
+
+ void QWaylandInputDevice::Pointer::updateCursor()
+ {
+-    if (mEnterSerial =3D=3D 0)
+-        return;
+-
+     auto shape =3D seat()->mCursor.shape;
+
+     if (shape =3D=3D Qt::BlankCursor) {
+@@ -882,7 +879,6 @@ void QWaylandInputDevice::Pointer::invalidateFocus()
+         disconnect(mFocus.data(), &QObject::destroyed, this, &Pointer::ha=
ndleFocusDestroyed);
+         mFocus =3D nullptr;
+     }
+-    mEnterSerial =3D 0;
+ }
+
+ void QWaylandInputDevice::Pointer::releaseButtons()
+--
+2.53.0
+
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/qt6/qtba=
se_git.bbappend b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/qt6=
/qtbase_git.bbappend
new file mode 100644
index 00000000..dcf0954f
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_git.=
bbappend
@@ -0,0 +1,4 @@
+QTBASE_ARAGO =3D ""
+QTBASE_ARAGO:arago =3D "qtbase-arago.inc"
+
+require ${QTBASE_ARAGO}
--=20
2.53.0


