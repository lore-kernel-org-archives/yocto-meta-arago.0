Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBCFEB7ED9
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 12:32:55 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16989.1772627568234944572
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 04:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=A4c0tsEz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.65, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rL1UHDa1VXtzKgRp8HKaG0EYlkr3nndn0OO+aR1jUv6i7k2oeWLRiZk1mLyrI3EJBRJcD7X5mLeLgfFG28gcgpy6BCkvoWKKnlSbdnxmzGAh059+S9ATs2+4Wi1oN/nUqaq8CORxhwJe+PLpD+lmf58OnF3JNZEm3fuULZwit4xo5MCnKdVbfBA7rkUZknUIZTE0desAbfkUZVKGyACEhbD/C/2fG6xogcVh2so/zwAlzBpfmGwbBbUn7b4KLZEWJ1+XUu80vUZw+dlS7Odksbl7AcLd8sxNdiUkDfDR//Gnh2Bkj0QdEe1Z6SYqzwdF4j/Ip0rffXZqE+bjPmSVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEmp1kG4tAniuZn69Nay/y57F3hj5kFQdu9vGgISwUc=;
 b=p2551nsUVgqCxfNy48EGTz4nwRZRbQ6C4+/qlWaMddec4Ti2WAmukLg00aXa4Ek4LchQFowk9D6x23UL+P0Wp2BwZrGj0yN2v/LFTa6PL5k9L3jntGNf83h+7YjTz38SX62+e87N/QGiP3b1Ks5BtKb5U6Wv5XtK8I5U5kCgNr0keK97yaEGcytBkJxRtT/bMp9IDlTleEdHWLXJRYGgzCCGCynUxSyCrElZ2Od8FSSXGskA48bIwOc/1Q80mnq8fDKxJHNeio7LQbykxmlpAr7tvdRwKlfZdNQ/XYb1vGxRfyPDg/Zc1lMWee0VI51loJ0SXx40uKiJUrTOMPe3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEmp1kG4tAniuZn69Nay/y57F3hj5kFQdu9vGgISwUc=;
 b=A4c0tsEzV+k4l0dvLhFI4vRAq6Rr3hBKFrBDfk1QcCTU2WzGn/SiUVs81ZzSMpRzV/aEh2CV4FaHsbEFp0LuFEl6nWcfs9eHlT1SQFRZQYl4tbIPj28EW5eVutzz47i+GOj8tGhKVg/tpnujNwI3w70VBfUUO184DQW8U+CZp5w=
Received: from SJ0PR05CA0196.namprd05.prod.outlook.com (2603:10b6:a03:330::21)
 by BY5PR10MB4115.namprd10.prod.outlook.com (2603:10b6:a03:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 12:32:45 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::2e) by SJ0PR05CA0196.outlook.office365.com
 (2603:10b6:a03:330::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Wed,
 4 Mar 2026 12:32:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 12:32:44 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 06:32:38 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 06:32:38 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 06:32:38 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624CWMFs4050563;
	Wed, 4 Mar 2026 06:32:36 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH 4/4] nnstreamer: upgrade 2.4.4 -> 2.6.0
Date: Wed, 4 Mar 2026 18:02:21 +0530
Message-ID: <20260304123221.1450993-5-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304123221.1450993-1-p-deshmukh@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|BY5PR10MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: 606b404f-e325-484c-0fbf-08de79ea22ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34020700016|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	HGmH9eOWwhFK+0ehshmqI9EWdt/+oQPx7117JHS3TAP7qmPwUyAOKBRtXsYC0RXS9xus8SRbKC92KivQhaihQzlBO/MPYbiHH7n66hx2QuvvPZ4siwSRLbyA+4Qpu+y1HOaJCyt1XgMESZ7PjvTOKUPnY3GenZ5SeBw6cFNdzsGluEQPOGwMqaGOsHYMwE4b9XRfut8+3R6xhQ4VawAp59p9+7HEbehXBzRu1je5FuRSjuiz/n9jzZI2FvTyaNlCC2hwRru+ioa/0yxQaOUZ7RTV1P+R+TpxF4W6bx6mUh5Hf5Qa/4AEG4i8JSxqT5RPaXXk9hojs8Vsq9JaE2gBt4DS/3rPIeJ0RqUEd5EJvT9P7CZAldwud0jyvYgAKt6yCzvScxv2w+uA7hAOFJoFGnnd3c+4ozn/i2Gv70JuGLsYzN36+nXWCF7CpUTq3Cqv+GyAmjsJj+0w+Qvm9mdRe8E8/rTuh3m2UMNtU403taDzclYJnpqe1Gy05EMDBvngkEIY+uyYfyM6hE/2oCsZeLKbr2M8pVI/SrBvGe35sdF3Hk8qcFBuVXhfHacN8ckwrWczsy3+CUmOnO11wNQz1hh60nt412vPW59HANQ+b8TlAR3EDeKMzWrvgW7OIT5iXOJmpb3FM1AhAbzfrprQ1ptkRWqy1Y112HqNGsbvOFIaIOidqy6qGCdOBhE83ODVystJcSGapCJpxDJcly5xoidowLrEPeIXQ8pP0Hnh6uiGJtCSLLWUTymc4DqzL5JAejogq1L3sNyqPX3MhXJnTQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jUu1+EGacSE0bSY9vACBbMU2Yli78ejt36I3uLoTWVYwVXhL8pBjaeaCqzmkCsmbJkJVhttLildPk620x2AgUgmsHyMKMb1T46mxJwSFvlK4waeiwQ/BQwuM3FlCK1iF3NDW7AKiCb0vct/xCySgItVaZuhMtkj+QyxgfUxyrO0UqHmlfFCFDNMoYgOtXgTJMMzmOcXNktjcd/wYt89EeBgGNMz51d0FfmpJ2e34gbmBdpSYil7TwaQnBlEfv9LuHauFGIl652oV7XqCYr3ttkLf9PrY+wAIoT+pmiF0oOIExWNkM3qrHdlcM57im3SYxjD0zARfrQWa0/S/KpQWv1add8s1a8vVVDOScm1cWSmiuQUXAId7zMLa1qu3h9CAtXPuaW+DbWJWVGawfu3dfrGNTreyBDKzMECVbqI4T5xxqte/10sFh+JIE6E2O3DP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 12:32:44.8408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 606b404f-e325-484c-0fbf-08de79ea22ff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4115
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 12:32:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17216

We are migrating nnstreamer from v2.4.4 to the
stable release v2.6.0.

Key Changes:
 - Updated version from v2.4.4 to v2.6.0

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 .../nnstreamer/{nnstreamer_2.4.4.bb =3D> nnstreamer_2.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.4.b=
b =3D> nnstreamer_2.6.0.bb} (97%)

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4=
.4.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
similarity index 97%
rename from meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.=
4.bb
rename to meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.=
bb
index 3419e5a3..c62589ac 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
@@ -4,7 +4,7 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25e5c1949624d71896127788f1ba59=
0"
=20
 SRC_URI =3D "git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;prot=
ocol=3Dhttps"
-SRCREV =3D "3b32573bc104b4708af44837466b8b6c73f94869"
+SRCREV =3D "b970e9eff6bfb4e915463842422fe14bb2e53f84"
=20
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE =3D "(^$)"
--=20
2.34.1


