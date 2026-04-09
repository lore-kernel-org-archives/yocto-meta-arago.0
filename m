Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69575F364C1
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 21:39:25 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143413.1775770762427145131
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 14:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=GbORv+te;
 spf=pass (domain: ti.com, ip: 52.101.85.6, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdA6eTODaCjr1h5D0aJ19JRyLmQzuUgzMpM/z6p+Mu43hcGNkLVo6KdrfupAxJQ0tPiCQ+u0HRFG5FsDqqXutC8QZaRT/VsMCLp5ZN4cgbUupqIQ1RiULbeiSKWJYai3hdFmzPHChyE9FQhNsigTb1qCRAs+Nw9ilTHLRuBk8rW5O36tTO165x5rk6UHIu9njcD3d9+MMY1jbG5KiNl2KwiTdANvYj96oLOUpzNyyto16xk+PY9jnth48u+F+p8Gb6zZ+rwDWF5uzTXBR2Ylaac/lrZm4yS1f39igT49dhBaXvoCcvLqVL4LxUcuyzcLiyae5bajKU4zlJ4RxjGxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA8aluwoM7rqdtCI0ESzPlczeW/USUif02qvx0N8OpI=;
 b=ZvYlpg/+laqUu+FM64nVqaFEaKjhQACmKXAJIB1mb++OxpesElVjvLyT40/SXNlVG46gb9QC1hui49fQdvmzHnFesrHe6d5RaLd+vsoilKXWneuIyTmpImQjKNikufoqMN2OVoa4VXkMqIlezUohLbXxwYnF/6t0wiUcRCuKIj1PjTvJLqh9NfsBe7F8YS25Ni7I2kiuz4wtvMsvqiSti34n2Po1H0xHxwb8tobUWDOGn/07G2n3vTO/ZtGTL6qYxoQ9BIqapH8ceYtFUS8rktcdrKP4sr8PxmF3kfpaVnJXH6jIQZsrUiRYZdKkUm+wg2FzKlcCGZ3z3YDiOMkdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TA8aluwoM7rqdtCI0ESzPlczeW/USUif02qvx0N8OpI=;
 b=GbORv+te5xhXUt3DSMCK7pbEf37Ju7y+8bPfOKqt7BU0Rkmx3e3JBSSJAlzXURC+KT227ncnCUXSwYDlbk9iFdHvxGda4yrFhZsoc50bQSH9NlmrjpKC8/39laZl1i4MC/ODT3/tOdjnJi96WhsFxaYgjJzQ6ZwHwUIdt2TLF24=
Received: from CH0P221CA0033.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::16)
 by SJ5PPF87E558B7D.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 21:39:19 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::48) by CH0P221CA0033.outlook.office365.com
 (2603:10b6:610:11d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 21:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 9 Apr 2026 21:39:18 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 16:39:18 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 16:39:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 16:39:18 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639LdIXd264406;
	Thu, 9 Apr 2026 16:39:18 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <b-brnich@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: oe-core v126->128 migrate  bbappends
Date: Thu, 9 Apr 2026 16:39:18 -0500
Message-ID: <20260409213918.1020996-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|SJ5PPF87E558B7D:EE_
X-MS-Office365-Filtering-Correlation-Id: f62b03f5-4c49-42e0-88bc-08de968074ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	QA8p2362jCcNb+mPGOTZ+1/VP724vhPlYoAajM6Ev5qner9gN/rrBPneFRgjbyxxdYGR01utzj9ECD3jAhJHEASwEqCAEyClnsBRJsihG7eZsOlUioMLY07PdRmIkVn+axgmSE8rmRGsSk48jsDTm9//E7nYw2z/0FamkC6PLyw0PhEkSaSmPlH03sPODEZyQ3rNMoIi0LkE1z7Sp0QtvFrdOQgQRTg0XB/u4pXxTlw1TvNpa/z4LbFEHZPDveFo8CLIf7gDw8QcGlP09Xrstl4SJbluBzQf7+FK3cgzjWngkDeYx9/OqXlAFxvwiX5gAMUWhxFdgIo5qQemKkNvbH59PAUri4TtLyJMJuJ6zCvd9ZVKAont4DmQDzjpFfrIUOGQyXteDAr91hp3tLAwvDurCkj5QiSN64RIbi7a6aTTjSh/s/3M0FSRkCdlBCtuJE9cATY25B0+lWvHQ88gh6sNHcBxtCsuSWq7xkZm/xmM0KqMMnTsTa7s8+6nMugXJoLLD2nnLDri1rURw1tUZ6W1UdmiEGFMX1bIYPK4HAs3KkNUi8bvJc5a53e1zUArQH3m2QM9eme78cVcbJzQI7TuSblO99rOuleBV0LgK2MurcpxZhLtVWtg87Ppr3zi4SKIeltGbj5wVjv+IZLbGTEpYOq3GfztfKl0Z+JRQy5S/OMnf4r7NIYKJ9+elkudvRsWX2qtYpHEw+V5Fi1ibatKpucw3kzO8R2PHsQ1+lgbZr8PaENvMN4knwLGAoWkJFQpjOG/r29N2lJ05qqKVQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7QVZFK9E7DnP3ircfyVfhQom6aNGBcavwkcUXNyYo4+MwoSBSdrVVwcZj98p0XAIxW6RtESsN2mWoNgfkNJ3fw0LJiu5PKhvpZy8qowSSyYmsoWCXag8yqVKiQuXG2Be84CO21db57S0QFIvsmyfb2q/XuIAgskxXiKmkTZ0ge6ZM9fcoaNapIc43tp+rsBksgKfCdvcHqcudTepVWRcuQXeSy1m1qP8mPF16iZMsKO2gGbmCVHd0w7GVsfxcdDcYdy35Ba+PjIB4xOXZIBv3/FGUu9SvhATunFVXd7cGl2sHjzrPLKX1SLMH/TCnawRjWPnIL0ph65PGp395Gn39tDSUT4WNnh88JX/tKkowBCMvxVd9HL7CbcriDDAt+4Inpb1rCcjJosNIg5w2k8D+uji3ECzyzFtp+qvkEjs0pMALDnP/y1bFX2oOl1m2K7l
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 21:39:18.9691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f62b03f5-4c49-42e0-88bc-08de968074ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF87E558B7D
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Apr 2026 21:39:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17458

From: Antonios Christidis <a-christidis@ti.com>

Fix bbappend files to apply onto the new recipe from oe-core now
versioned at 128 instead of 126.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend       | 4 ----
 ....26-arago.inc =3D> gstreamer1.0-plugins-good_1.28-arago.inc} | 0
 .../gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend       | 4 ++++
 .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend       | 4 ----
 ....26-arago.inc =3D> gstreamer1.0-plugins-good_1.28-arago.inc} | 0
 .../gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend       | 4 ++++
 6 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-mult=
imedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
 rename meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstre=
amer/{gstreamer1.0-plugins-good_1.26-arago.inc =3D> gstreamer1.0-plugins-go=
od_1.28-arago.inc} (100%)
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-mult=
imedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-good_1.26.%.bbappend
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugin=
s-good_1.26-arago.inc =3D> gstreamer1.0-plugins-good_1.28-arago.inc} (100%)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-good_1.28.%.bbappend

diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/dyn=
amic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.26.%.bbappend
deleted file mode 100644
index 0ceb558c..00000000
--- a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26.%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO =3D ""
-GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago =3D "gstreamer1.0-plugins-good_=
1.26-arago.inc"
-
-require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc b/meta-arago-extras/dyna=
mic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
_1.28-arago.inc
similarity index 100%
rename from meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/g=
streamer/gstreamer1.0-plugins-good_1.26-arago.inc
rename to meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gst=
reamer/gstreamer1.0-plugins-good_1.28-arago.inc
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend b/meta-arago-extras/dyn=
amic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.28.%.bbappend
new file mode 100644
index 00000000..e8392833
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.28.%.bbappend
@@ -0,0 +1,4 @@
+GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO =3D ""
+GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO:arago =3D "gstreamer1.0-plugins-good_=
1.28-arago.inc"
+
+require ${GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO}
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good_1.26.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.26.%.bbappend
deleted file mode 100644
index 0ceb558c..00000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.26.%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO =3D ""
-GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago =3D "gstreamer1.0-plugins-good_=
1.26-arago.inc"
-
-require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good_1.26-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/=
gstreamer1.0-plugins-good_1.28-arago.inc
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plu=
gins-good_1.26-arago.inc
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-good_1.28-arago.inc
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good_1.28.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.28.%.bbappend
new file mode 100644
index 00000000..e8392833
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.28.%.bbappend
@@ -0,0 +1,4 @@
+GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO =3D ""
+GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO:arago =3D "gstreamer1.0-plugins-good_=
1.28-arago.inc"
+
+require ${GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO}
--=20
2.34.1


