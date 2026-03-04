Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E1CEB7ED9
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 12:32:45 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17035.1772627558623754442
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 04:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=EZ4qQ+dq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.35, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBM9ndr8TdXLh5jvwg/TZE8xe2jaGN5fYGNaGHr7lT5wMTDEyobszXYEg0/w0ZXYm/nJC73t4vBEap5NaXGmkTvphZs8q8eJaWBr95Ot8SnXmlnt/APTrTS3CaL73GjbT9DK2LKNrQ5DbsEAVUnEJqAwjR9ymixxPpw2OGjKmSvJM5U+ZL786RQSYoSoiNhynahx93fIF9Nba+n2Hs5A7pHruTHclUiEYrXdE/kLsoISaKMFH2+izpRmkxem6dmsUUSw+2EaE6qdtjZwEh9JyIT/GKM6xnp/rB83GvcbjzD0b5CxLZQjM0tJaPH5weIuCyKmngDOde4PdwGkQNrNjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnFVsW0GEBcz6hbtWgMPsg+/HvYartLFKlOUmdcOWB8=;
 b=OMD6TuLPKVs4aAUOuA+DRXPN68CtVUTcb+jMNKJUbp+bYHw1zpc5d5TXSEc2Q9mfyQisSEv1HwQA40ejSFeguiH7GxgKgS1Rp4iR2C34bRp5ZH+u7OUtE+p3A+CRvhfh3mhZz44jgSUCFzurjeOlcnz2YSWOULTKaZfe5eJGxaIH/7D+gip4ybG4rZ1HvPADD2aXmXv2DaPcMlVa0tMf7j/zttnagrNzYTqvRkRHJI2ilED2hhz6S1ivPdqU3mUe8PVABM9kyEQgheeaq8FAkaEeXZibbk9oPvnr3l9OOQcUI7wj1B2Ss5sduBsfftqDl3qHIVVHexjmwxPyFgiIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnFVsW0GEBcz6hbtWgMPsg+/HvYartLFKlOUmdcOWB8=;
 b=EZ4qQ+dqCQjT1Dulfb3hQx2idtHSVPOGpSM1RUcS6+z+biywe25xCHQT2Bwm04da2Gtcn3Lw8SOF8Itk7b7mp2SjR3gPkpN1YF3BLdegtjL0j4xzimucW9oT/55XE/WtJ76gDmWmJX/wbjwqZyYSr3nijEZnue2Yu+yGh5WzdGo=
Received: from BN0PR02CA0048.namprd02.prod.outlook.com (2603:10b6:408:e5::23)
 by SJ0PR10MB4637.namprd10.prod.outlook.com (2603:10b6:a03:2d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 12:32:36 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:e5:cafe::db) by BN0PR02CA0048.outlook.office365.com
 (2603:10b6:408:e5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 12:32:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 12:32:35 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 06:32:32 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 06:32:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 06:32:32 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624CWMFq4050563;
	Wed, 4 Mar 2026 06:32:30 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH 2/4] armnn: upgrade v24.11 to v26.01
Date: Wed, 4 Mar 2026 18:02:19 +0530
Message-ID: <20260304123221.1450993-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304123221.1450993-1-p-deshmukh@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|SJ0PR10MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: b188bca8-6c23-49bc-3966-08de79ea1d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|1800799024|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	A6BbLtsphafnZokgrtRsFRYrQxA+hh4slxwK03bMYUl0yiSHb0gYTfzrvLcTIIgRsbUZ53TZftVNrmxWV9XayKXo17/Wzsx/BmhxWnOVQK754PnqLcURPOFpy1cKIs+QnLMtMqyl9k9jhHQRhr833yab7LQVFdOTtrpStRzQy6bGFTTEUoOuQrJUlKZdcAtBjU/p4Sd5G7NKOgdNGcFz1kOTKMWHyAQRoGp+jd6tnRPfNpthlNyskHw6nC6rFV0rE71zLindEz6I4qL+7vfblMCv5WuiAKlySA9jCcjgQ+yHQCsX+qg1YfcId+q2Tw/M+xHbGdrGaMsBkXx5p39IecxuP7EwJ2CzXiOhqye8jz2w2Rpy0Mjc3dP52HVrbWTjIfzNiAL4Xfv89wbm/DY1HcS0SUdL6EuuQSy+EMwF3IYILrATtBbDe/qvT/xmbJPiKbNw+N+eDx3EUc1phVoUB7e0vTsqh+OoqIKJtEG0MAseAp/Hw/O5s6Z40bkDf70RalwYEL1NXxe0DZuZRqi/drkybEhgYy3ngozTWlIx+DSELzXlXCZspwxLRhd/1PdlhQojO6TGoAX6uMjHSXYL1EObsI+pYS/Yzy4WwTxJoA+Ujz+lCh/++MD59KyMT5Ly7fNYAgMko07q4+yajLyEre+yLANtOPgB7nnadrL3cOddC3bbBhR15Y2HxP01JQ0j9Upjjrbga3FSDdlbdElysQ1kYuLs8Hhy8ovg02btS2CW88JSR4UXZCKXZnhDRms9wrkOOqHo550xgEE6qoHwvg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(1800799024)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Z4nUnCgIQDGtoCEEyTlXREt/UcOTgvO6/30scWoheaMAOZblXHKkmwZWWiO1V2xolQ9lOT1d9F0b4Xp/ZJ10XFuf3mKaNEeu5Xjs28bDqpQja/ZTdp+UOmyRvdOEZ6iktY/ZCXhAyJI+LB0LnP9MPJThwtbeMKFPr9lsEEsgkeZihHkcuKJvjJ0mU/lJQpNOr1ziqzK/moZ1Glhk2jxIZ8WQeEuGtKnlSCkhWdvfTS9ItV1dZJ+lcOeKOdNZisJRtAW+tquClmnzzSQ/jEskinZnEofWfWzH0x/Y//I61dTcQxi4TAQTgy4AQfIq98eXgvg9hw6b/neStVKpve+0b+USoanNVDwgmSOOLlni92sfg4ltloskjkMZERT+erjkxx4Stam7WRK/l5MJiLAd5vO2WI/k04zgxl5JTVuoGv7zIlS8++KZi6H1YB5+ANiT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 12:32:35.2548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b188bca8-6c23-49bc-3966-08de79ea1d47
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4637
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 12:32:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17213

We are migrating ARM NN from v24.11 to the
latest version v26.01

Key Changes:
 - Update SRCREV to the stable v26.01

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 .../armnn/{armnn_24.11.bb =3D> armnn_26.01.bb}           | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-arago-extras/recipes-devtools/armnn/{armnn_24.11.bb =3D> armnn=
_26.01.bb} (88%)

diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb b/meta=
-arago-extras/recipes-devtools/armnn/armnn_26.01.bb
similarity index 88%
rename from meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
rename to meta-arago-extras/recipes-devtools/armnn/armnn_26.01.bb
index af55fa4d..b1172ea0 100644
--- a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
+++ b/meta-arago-extras/recipes-devtools/armnn/armnn_26.01.bb
@@ -3,12 +3,11 @@ DESCRIPTION =3D "Linux software and tools to enable machi=
ne learning workloads on
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3e14a924c16f7d828b8335a59da6407=
4"
=20
-BRANCH =3D "branches/armnn_24_11"
+BRANCH =3D "branches/armnn_26_01"
 SRC_URI =3D "git://github.com/ARM-software/armnn.git;branch=3D${BRANCH};pr=
otocol=3Dhttps"
-SRC_URI +=3D "file://0001-Fix-type-casting-for-32bit-builds.patch"
=20
-# v24.11
-SRCREV =3D "3ed70c005559d409feff2c578a1a39cf8fec8804"
+# v26.01
+SRCREV =3D "600c0004a2a7a2d600a3bce22ef83193de1dde57"
=20
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE =3D "(^$)"
@@ -37,6 +36,9 @@ PACKAGECONFIG[ref] =3D "-DARMNNREF=3D1, -DARMNNREF=3D0"
=20
 EXTRA_OECMAKE +=3D " \
     -DHALF_INCLUDE=3D${STAGING_DIR_TARGET} \
+    -DARMCOMPUTE_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libarm_compute.so \
+    -DARMCOMPUTE_LIBRARY_DEBUG=3D${STAGING_LIBDIR}/libarm_compute.so \
+    -DARMCOMPUTE_INCLUDE=3D${STAGING_INCDIR} \
 "
=20
 do_install:append() {
--=20
2.34.1


