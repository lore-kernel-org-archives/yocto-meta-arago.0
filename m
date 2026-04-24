Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9850FF8850
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 22:38:33 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1391.1777070312559543324
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 15:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WEJeRfP8;
 spf=pass (domain: ti.com, ip: 40.93.194.33, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsEv4FehuOOuOzQYDnpoSTRZcz1xahNys905W8n1iDonWpRCYjOcb4/PNGf5xHb9KUhptc7kAQCJn6hD/uBgrqTpvQiUBo9oxDk3RTuTfYyASn8zGgOuWm5roVf2Mf1yzuNEQSr3GpsCzXzgMs+wGFGjSiC63r2Qu5SJr/5mwqS+Q8PgEA55S8g8RNFBqjdXu1hH2775Qs0IaOq9pBlRYdNulsAjy56i1XqdR+SfLCsrk99hzI/s8abykCCtMmwex0KZFPz16rwzLhyVQVuTpdQf2mdJMSUCRPqRvEamtO3jQhP3QoRtd0WMq6VpZZfQxG4EcPGwnB9pOp76JuvVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Qr3twPxRYkfgQ5FebkP9LUasAcLEoKj7iG6O5eYnRM=;
 b=Y3Crr2pkxMDSthi/I0Czxj3klB3jDZW4iMwxbPvCgS2Uvfk95GtzD24lMjOA4T1m7r8f7a7IMk/Zl+/mae6xM47hzqH+WVcy0hznhJku9UT3KAeZA9R/vr+dQ7MS1yh4cGJNx+Uh0fSr+mM7Gxg9Ii2abWg2SixxBHgFahuPU8tgmkqQ6fQUbHsq7lrqAIFRr03j0H7FG/W0n3iRkIIucPek0GWeN0x6mTo24RH6OjqkG0g4CvKJiLvhQIW28rBUOb1qHnyrWVQFyIMvYWfVOwZl6pPz9c2yi45+s0tDw+z3lf/0iUzaCOt2SFY24hi+KSq/nuTDjfKgs1gLgZqoHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Qr3twPxRYkfgQ5FebkP9LUasAcLEoKj7iG6O5eYnRM=;
 b=WEJeRfP8Srq4tldlOmpsqif1wUQbjChAVgFcauXNUeIWLDRIH3l9AmT4DsI81bMTIsNT9mXt/SHvKbVhs7OFfIKcAUMonp0XY2AzP/UKndymR8k60xGaFI6lZf3GgWHd5wl3kSSWVrJCG/2JSYKWgy6bcrWL+5jCFni1rJdf9wg=
Received: from SA1P222CA0044.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::9)
 by DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 22:38:29 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:2d0:cafe::3b) by SA1P222CA0044.outlook.office365.com
 (2603:10b6:806:2d0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 22:38:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 22:38:29 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 17:38:29 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 17:38:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Apr 2026 17:38:29 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63OMcSpM2530825;
	Fri, 24 Apr 2026 17:38:28 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <s-sadik@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCHv2] qtbase: remove serial event 0 handling
Date: Fri, 24 Apr 2026 17:37:50 -0500
Message-ID: <20260424223749.2643202-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|DS0PR10MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 433e413c-0921-4449-6466-08dea2523520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ITmdHlRG4Du6bKEl7ft8UbsnT0s1tUeBIwtKTy6KRIDtqwA4WbTVNJPS5tyWo5pU1RQLQOTzqlbVBu4uYD5psHZnK4qmT7G/ddFw7G4cGkM6Zn++REOFGUxZ5RjVJO8jNvgMvqjrUz679yJbuWcRsX1Bccoy3ILzAfXXjA2Qwo6lIGazr3JgBnNbWF6HNW+ARCkgsxGoHw155ihoGBOfTJEGggvSBWP4HM2MJNhGXVRip6It6gRUWkmxE1hkPBJUiPIOe1ckwkIBEOAfovgQN7oqm9wuhFpSfdz3WF5tSnFVAVBBq/D9YvErRIZBnf90VKqQ5PbYALvDEp2ng39PJYbybaVS0QIzEBeV7sp9XmYQT92etjhAEvaQdwfMbzJbZhBZVSmV2wTuqmUy8KkaWyzEKQ84byAj6ZR8PvHIIumAGvpJp/kqZVdaPWsi9OpyukoNFZd7qFg31vJ1+vPAz8ewVDDemR5a3P6CGK9VklSiB2zn1EqQHwl3BEN9t7vR1m6yxySrNvxiLY7XloUqtNtF2oTWRiyLDd3/KdwvO0YfSBznfIbhUNhWV46VyEQTz9e7vRR2lJEyFwc8t79UT/Fy31E2yOr+njZshwac+yf2dag7qfTuHZ3QiXxVgmEa4En++fCYtwwT6aY6jrCj0geBxi9XnWUzg5C8g1jZFXDZE2a3RCDSjMq4wLM8MUOeI03PxxlubdMXY608bh/yBpc+paJwtAeMMcqZ1Or/insPMDDPadRKd8Gy+TJ0H5O0Tv9UBjeY/wiFzCXuAdNiuA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Z+oDwSgo0NVGCr0lHTnO+BQ3QQNsU091nPlTrFM3u5LyeTwqwl7tSzoTdCNwHwRG66qZGWtOiZGRC0YRKXBNtCRoL0xkGeW3JTFiHJTaHF+JrRTG0mSOMOIa793SzgFkD7zxV/ZvySlY+oki3p2pqHuk4jAZHIw1xlhjAGB25KXdtkdajmJq/TCijVHHozECjfJo0Q7Lf1ipoM75jvHSNU+SK4CuhMEy/tJVfefQ4p3CNVP9MsDUvFEB16ia6oY86lKmTLx4lNZ6W6ggEalQWiiya71XShCLPnhpfrMPhHV1LPpR23UzP8cVSCDzyglcKVcu2w09tBzdszQQ1UuAWYheNLXnkiqrK8WAY8NX2H0baLnsSotHdMyecEZI7Km2nUnhc6FNHrR/91K7EBHOnqXQL1G4Tcz33Vu+ll+sNB3SBfcpg6+dqiUq4+m42hUp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 22:38:29.4818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 433e413c-0921-4449-6466-08dea2523520
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7933
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Apr 2026 22:38:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17489

From: Randolph Sapp <rs@ti.com>

Serial number 0 is perfectly valid, though maybe a little uncommon. It
shouldn't be treated differently or used to indicate a special event.

This project has a CLA that we haven't signed yet. Carry an local patch
until the upstream bug is resolved.

Bug: https://qt-project.atlassian.net/browse/QTBUG-146015
Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2: whitespace as usual

 .../qt6-layer/recipes-qt/qt6/qtbase-arago.inc |  6 +++
 ...tdevice.cpp-remove-serial-0-handling.patch | 42 +++++++++++++++++++
 .../recipes-qt/qt6/qtbase_git.bbappend        |  4 ++
 3 files changed, 52 insertions(+)
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
index 00000000..3ac24295
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase-arag=
o.inc
@@ -0,0 +1,6 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/qtbase:"
+
+SRC_URI:append =3D " \
+    file://0001-qwaylandinputdevice.cpp-remove-serial-0-handling.patch \
+"
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


