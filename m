Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC2AEB362F
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 18:06:23 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.646.1772561173328498560
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 10:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OyDMFu5t;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.71, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3E9G/KlOB2TgnJOH8t7oQXz4OuFysfe1h78O4N8IPw1ArX2W6x+AaJ7mjyIxWBoAkc8XP6WrboPlx26+6pF6OrQvuEaE+6MPuVo/WxLNWRgcJsRaLIglFwBS3al9S5odrFL3cnYnLZRxP8qliEPWoOkbX/Ob+vLGl5WE/icVhn588GgnSpSSGfpCqsfOqVm1QNvyhym+/d6i+er8nvHu3oj2ssbMsOix87FUud1EECHPbjZWS/iEyMWdZmRD9n9ENC8+GPTwz797TsNTUnRwltHt9/guUHUglGqRyAuWJ7NHQrHRxmCHopIQ9d0SNvsGERw+pBy8gKTI8UwHg0HOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVTUI/dIq2kEXp+5y28Nm8K3Wvyzxf9NkN03UjH1LyU=;
 b=FIRKeENlta1NtGL0+qv7LJBXPE0M/6j/yLyJ0fnVeMWexMitOx8p1FdRykN1XCL+m/NBZRsrvJ1XCrlG7zaWpHXmwyhLG2Oc3ZJRCEqlSp2dOXF+q8po2HjGWeYc/Ok/ST4R6m8XeP9yfu7xZ90px4L/LB5lnrQ57wiKjjhCvYq8vzRry05WJ5KnNvUnuyx3n1ATu7LqxljWioIbD2A2sSklEpW52QpajEw3b++QVclpnm2NKI/+zSrKgy34S5VPhYD1qGg1+5GwSC1e31sGcu5arU0I0FpfuOSRhwdrf0zzykOUnc7RLBSA+WUtQB9diepoRN0b97GbdegSLz7t9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVTUI/dIq2kEXp+5y28Nm8K3Wvyzxf9NkN03UjH1LyU=;
 b=OyDMFu5tTs13p992Iymbhnh5l99lRV6zAgI31we3g/wwAI4+blaoxaE34dIy1bD1isf+8iQCekPAdangl4tTeA39C68QzOSUPdbNeZkRFRRdzyvN24EhRDmj/JiwxWZMueeOVAP7k7iNg1o5p2VrmL5rG71FX+PCrDNXv6WC+1c=
Received: from DS7PR03CA0328.namprd03.prod.outlook.com (2603:10b6:8:2b::30) by
 PH7PR10MB7732.namprd10.prod.outlook.com (2603:10b6:510:2fe::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 18:06:09 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::10) by DS7PR03CA0328.outlook.office365.com
 (2603:10b6:8:2b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 18:06:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 18:06:08 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:06:07 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:06:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 12:06:07 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623I67EH2578013;
	Tue, 3 Mar 2026 12:06:07 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vxU8F-00000001fDF-1s2Z;
	Tue, 03 Mar 2026 12:06:07 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v3 2/2] ti-test: Add ffmpeg and mpv to ti-test-multimedia
Date: Tue, 3 Mar 2026 12:06:07 -0600
Message-ID: <20260303180607.396737-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303180607.396737-1-reatmon@ti.com>
References: <20260303180607.396737-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|PH7PR10MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: c92dbd4b-6c72-42a1-464a-08de794f8b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34020700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	JWpQuvm27GeYFGtYbxmo2iR0ffmp0FBSdk0pRv2BLIUuL4Q9yqmgfAGBekG6PZ8o26KFIRV0dABMHKjvjMZIkRlgLyJEASZu5FpXyKWymxODdepyB70IF9okfgLRhRdGlo3hgMk6Nz2s1zg9VE0VXs+Q4xXASzBTQ+KwZHn1wIAs/AloIb/CcUUsNhRYjqsadqKCKrI4zy+Xd9sK2KWB7hYTM2nQRLNrmb5JnS1bl9LbfZOOASR9eGG/vMz57qYwhDoeoeVn10MRpODKXowlxS0bSAaCuDevc3bfXpnl+qRJlDM9glllPLU3CIGvv/1XorqR+HigjPL4zJIoMoIsdge6Oc4GvvRFL7OGguldDTkXTorBTaECh2adl5318iA9gfBZ2Z9HEITSxANP3LXDzsCPF3Ypj5V1OC6vNOkjXy3k7OxCxKSYEQPHsWfYSVLD5mIzfm5MDCb7TUWzRAmQ3w5g+wY00fuhymCEDxB3RPg0GORepP+dj3GIu5S3nrwGiB/XT/nAjqZDMr+C5v/qtcpOw3DileCxvxwirNgfdFqJ4/yolZ7Tzor853K8A2jTiN3rV6Fc56/JCbzEFry7BAjlaxf8ZQbtpWTAFvkiNxt0Guy6OncsbRYzjnfhVjcu5Q95Y107VtwsrmjPDZTB9OQ2zRSLfbj3Y/qfBQmCpcwlfcYrGqsuBb78h8rLfZQ2dc+XVb82ZmU51O3thUia3Xqjs7jnTdf8poY/6KlVklFLAjf1J7dm/wBFjnTAiDlTA35gLDpYq7TMy8rz+htfSqbTzCLrv4RpMWX/0UWxeFHmTBx5XO9Y9HazLm9Zg3PVMMyQevpXkkj5cNRIYT38LQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QqEPYmwXR/3JnZLWTZiO/4ypoT7jZ2G93AhWrYSnMWnXMeaPl0xxNlgfS3oKH6D/R5Z3NtW7xfIvfF+Nz7CIP0sBulx8UH0qXDM1vntdfebJt4UVlTMW5rg21ttu9REwkm5VQtqgfjaiSvjYbvwgUAS0j5R739Z0cBbwfdG3padV6Lx7epdLY2XbkBUQJ7ochhpe6tOOlCTd9glOfitXbP+Xu0uPnf29s5qlEMgM3oA7HG1Uz6kkKs0sQsdBYJ/uOHE8R7C9RDz779R+6AaAzV0EazAyZNgqQH2eRTCUxn2AZLekhZLIJDg8yihmHZC4s3tIsTl1negkK17IzAbs+POc1DApNDdHrQrXXqwRAC3ycZTLCMh8vVPT2gOK288uxC0KrfndS7rHpqD7p8WoD+tiTBQHLE6MFvT4WO/q2YlLbE8HRjVhJBOZ8lTO0L4l
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:06:08.2039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c92dbd4b-6c72-42a1-464a-08de794f8b80
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7732
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 18:06:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17208

FFMPEG and MPV are required during automated testing. Explicitly add
these to ti-test.

Also add the commercial_ffmpeg setting to LICENSE_FLAGS_ACCEPTED for the
layer.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Move mpv behind the guard too.
v2: Move ffmpeg to be tied to building a ti-soc to bypass yocto-check-layer=
s
    error.

 meta-arago-test/conf/layer.conf                       | 5 +++++
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.c=
onf
index ea0a3398..7e8bf1ab 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -26,3 +26,8 @@ LAYERDEPENDS_meta-arago-test =3D " \
 BBFILES_DYNAMIC +=3D " \
     qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
 "
+
+# Codecs in ffmpeg with questionable patent status are not included by
+# default.  As this entire layer is purely optional for testing purposes o=
nly
+# and not meant to be shipped, add support for the ffmpeg commercial licen=
se.
+LICENSE_FLAGS_ACCEPTED:append:ti-soc =3D " commercial_ffmpeg"
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index d3458b9d..8067f4c1 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -91,6 +91,11 @@ TI_TEST_MULTIMEDIA =3D "\
     yavta \
 "
=20
+TI_TEST_MULTIMEDIA:append:ti-soc =3D " \
+    mpv \
+    ffmpeg \
+"
+
 TI_TEST_NETWORKING =3D "\
     bridge-utils \
     ethtool \
--=20
2.43.0


