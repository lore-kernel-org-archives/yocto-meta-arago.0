Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDD0F33A9D
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:34:54 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49946.1772732090283996961
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VbfhsYec;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.42, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjzQ5o5idP6RtJ49EegsyHRxh7heg6icGXDWXTyM9LWhf9IKBxTbJhS+Np999KljndX//WehfYRM8JxmBNCuKZAcQzHycU84HJi00oSD8dROsDfjMajVeiSNw9KZPqqK2l6y9FRLN7pltFFCmST4UWL7AW9ZekG/a5/ARr5icGEQ10DijpGBl38t4TFdyJt7by3tBt62oVX9UjgC+FkSSg24O62v6OGkn+p/i2x8wEvDeLxyf6yHawFJpnzCOWZus5Hhi6OFjS6JVlkNG8i4KY5uHH3Cs9A+Dbj17lpPWgofY5PUb3MAEpWuma50r2u4jpYeT78LfK/bST7S0R53DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8R1EO3GzGztg9wEGipTkCAYSdPP8ambbcbJ8vqDCz5w=;
 b=gowUgy0hnGfz0qA5TfwfkW1Ee8HRHI9g6RPgm+VIu1WsiHZaOQaeUw7bIsWPWyfMgoXGNG+AA6lAuRhQosOlw0yAQYtrnsc4FYqKqszdnv4XoTjJgqy+YlB887u3sA+Fj8jgMYuYCMiOa2LP//TeDO5IJSqsMYVCgp7touoYHKhe8zgGJA4oHM3wo9tQAO3chPtjo2503RYXpxHTYkFHRc0Q8HQNzztrNDVSu+FBNNbRW+lmg+5ZMoDBJVm/3HLvflrt6SDJtlDErZsuxMyNBT2Bjx+VWeE5V+T+MyMzmg453VjfgGpC4F7VHXoOEybbd6uSmPlrQ9Jd+j2xsOhx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8R1EO3GzGztg9wEGipTkCAYSdPP8ambbcbJ8vqDCz5w=;
 b=VbfhsYecKUcAN+iW8S7RBar8ymkoaCPaERRYTC/Ff66jIIX5fDuYLynQlLLXu53Ldve3IcVqPz9wW2oGWSLsIqnosXC0Yw38vFbfkqfnx3jixBK7HGcm4U3GucFtk4sHM52lkjulJjjtNRcdP+sJrWI42p2b4m2oPloiCpnZsD8=
Received: from BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::6)
 by SJ5PPFDEBD75B51.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Thu, 5 Mar
 2026 17:34:47 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::c2) by BY1P220CA0002.outlook.office365.com
 (2603:10b6:a03:59d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 17:34:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 17:34:45 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:34:30 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:34:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:34:30 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625HYLRk2269842;
	Thu, 5 Mar 2026 11:34:28 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v2 2/4] armnn: upgrade v24.11 to v26.01
Date: Thu, 5 Mar 2026 23:04:17 +0530
Message-ID: <20260305173419.1735480-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305173419.1735480-1-p-deshmukh@ti.com>
References: <20260305173419.1735480-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|SJ5PPFDEBD75B51:EE_
X-MS-Office365-Filtering-Correlation-Id: b18781e0-b963-432a-b9a4-08de7add7df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|34020700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	h71dZ0Z/r8kp2tJZNWvFLo9pbFDJulS5aaAwQWC0YrM6JxXGChqIakUMZS4oRPbfm2uiSPl69vLZ4sGZboRzdDshdq8j0J5iqgtoXUpSXdBVJsW6CSEkGdjWWESHWJdT4iaeWSroMUcvbyLo+MN6sXa9i5L3oVATqQfuALB9TFO/K15li5n54BOmjwSqwb/c6wF1R2ixAH6W+JKOYbabHufKK7b7IwbW4khV3/O0kI4gtRoVguFa7b4nBExcVDn/bukhUy2A0qUH4sTRoDIhjEj/2khWtk5J/Dhc5Hzyb79bvVUL6Zo4s4Wk61p9gMw7szZli7nEp3aWyn5fG8iw50QE4Yg4uuew5BrkFJtfIS8DBd+3588mi6FB6Ib/tVKZ96tuzb+xxXdjjyK6LX4FMMfydm1B1fLO8w+PuBw4QpnyRzRPCCNgrQVC43LWTzQ+8JcjHCrddD2dkZXuCVpSSYB//Z3lW0XbhY7WxMIy+h4VX46hDjps7GhDYGKOgZ/Y6+fzTfFNOg9tEBPONbNi5q3A25ge36zeENBC0+Ly0U1K5DKTxubEcLWfeyuu0GJHcGOK/MKi570Nb2FBFAKLz/uHysL8tteG5xlMrxxaoAH5JwWFniu/tKn3rhhCE07zWlpyd7KFmLlchxLJe1cFLBdpk6jBYkEAWJ5bOVu/cT2mmULlx4ihrDVIiEDOB0fUhg8M/xwKPE9Zgcae3vOSvfE6MUjmbi/fEYE7K5rwGHCGa4fiblnXCPM+qXoCAez0O6iJNF7BDiiGPramU5CcMw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(34020700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4DbZ0GVOjfCOf4khddNf0Qs543Qj660RWI9p2bjpKOe2JtVloNf55eZ4LUpkJKBHwTDjAV0DJJUN3KbPxYEAyUkew6nPLgXOsMkiGiKP8R/w1DsA4G3s8S4zaHwYEgD0ypMjWJVRg+5PzhtLjQN0XVzXF81MKf/NpnnMmlDYLSRTMyUh5Nh8stX7BYLAhDMjPGDPkswR3B3l8pcDW5fxM/YOaaQSmZLhHUuAWhvQ/NCBFBbUUVMOd/5uQQhiqv91w3lxoPjN7QR7LCBfTCViCIYgqFDFRYvv4ZWQgBpMUZUKU6OKvvIPKvkrrUhssfq+7pZFPZTXpTwRDYn26k5u9rhMWrx/r634Z8uj2H6HZjwUpvsqQ9LP9UvXswMzlCfbY63Vyh+EHOjaDRdHsUbHhb0ZCk1lxYl7iVTk1f2s4FvneR3Io25oQrH7JDEF4CPh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:34:45.1652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b18781e0-b963-432a-b9a4-08de7add7df7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDEBD75B51
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:34:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17246

We are migrating ARM NN from v24.11 to the
latest version v26.01

Key Changes:
 - Update SRCREV to the stable v26.01

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:=20

v1 -> v2:
 - No Changes

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


