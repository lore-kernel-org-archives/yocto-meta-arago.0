Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA455EB363A
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 20:55:01 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2425.1772484896983931439
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 12:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=RTJi5zIK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.46, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxTV4c3+AlHa3QZQykzfAfBT9vRS4+L1+YFMgsJIh0gdA35WeRsj32iLe2O/UO2+1yFC3p4XXs04TWKB9j2gpsHy2Z4Vgt8RDl5qcO6fihWite4iCOuP+dYWtGzmO7HtChjWg+tE4YNW953Yhm170Os4+bs4yt7f/79kaWhO671Pl5gYvMx4pCmJvAE0bKUizsBnmKTaehSrn6j36gItVxjC8VIuDb/t3ADSsPcIedTO7DUN3KyJJ98dWVkpdEQEekkPDjjr3O7EziNPLnjFdHH/PN7p+xZ/VwvhjTJDFeQUMPmI+vRklB/xc/t9sD9O06p20O2Gabjm/5Es1VuB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mryn7gGJNRCHIfw68eagu2WlT0NywP9lde1C6zCLwyk=;
 b=ZUgocQZ3tjo4SEi/XlGnp4p5CpthBGVER5YXGP8NG9Y5aje8/F7rAi1yDoVExA9slsW/3/tqQ6q1aXglBwUs0J/MDhXC+E4pp1h78h2qAnbbRLhUUAejS/PwqvRmmP2uanw9rHXEpe+v9+cbDvl4DzqCFiM1vMgKXGNJNzh6MiFkZj6u+FJbxDrNr8kQGM/1dSDG57VeVEWMbsePpikPhjjFXKwTwtbPYUftwsVWox2ScKHNgQxQj5o+IBNkoO/Z3EWK2Qia9+3wo+85noajIvDRLzZMwOKcQOet+hxyQnqTVtlhbbFu2w8U5EfH41utQUsOkRWtSLf6MqHoomGkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mryn7gGJNRCHIfw68eagu2WlT0NywP9lde1C6zCLwyk=;
 b=RTJi5zIKIPBw5MWpqXiMq6z/36O/PBA1uEczEgcTX2lbuHFIc7nPVn2WfhwEP+Pf1Ylw/dLG97DED/pW7xXKfrPA0d9YlOfwvKijHlEPEIEfeNMIasyu3at0oM1R0MsCIJbEyrXz6Aw+b6IS+V+6gdLuM7E2yKDA1t99NFVShIs=
Received: from BY3PR05CA0001.namprd05.prod.outlook.com (2603:10b6:a03:254::6)
 by DS4PPFAFF9EAD68.namprd10.prod.outlook.com (2603:10b6:f:fc00::d41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 20:54:52 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::ad) by BY3PR05CA0001.outlook.office365.com
 (2603:10b6:a03:254::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.15 via Frontend Transport; Mon,
 2 Mar 2026 20:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 20:54:52 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:54:49 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:54:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 14:54:49 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622Kskwk921778;
	Mon, 2 Mar 2026 14:54:49 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH 3/4] meta-arago-test: Add curl-cffi and yt-dlp to ti-test-extras
Date: Mon, 2 Mar 2026 14:54:35 -0600
Message-ID: <20260302205436.1117890-3-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302205436.1117890-1-t-lannynd@ti.com>
References: <20260302205436.1117890-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|DS4PPFAFF9EAD68:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe4d321-5dc0-4672-a9e2-08de789df35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|34020700016|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	G30uoZPO+ZiIwDPcXnh6wxLJhDWkmkcsf7zYBFEWge0Vin+a6T503H6+F8dIMm6XJKurVuhPMpyFpW81eptSE5AX2aFnYCPZkKKoRk8tEzXfYey6ATGDwbZ0ynlCmZ/hZjgvjgnc48lGuPWEsa+2aM9x19nGglt1S8HvPy6jqZqSbL+T2+3jsW1ihkefC9mJ6aBk4bgwdukJkKXNFKVPDloWD3YJ4bXEQHfPS1xy3W0ponkUz8D6b5cbnU2AvZ3hwRF1kxknx33qMOQvqH70SX72gSJL7qoRcRRsjDcssU9TsQIwKOR0saUP98ZzUNtKKhZloawp8NKChH0lf788CTTJuaj25YXBBPX59hXoC4u7LCCkCTwyKMqSJ67a4JX6rpIECKC5iEisls8FMLQEV4AYiII9hfxdqQv9nXZ/m2i5tjqnAghH/5PX21W6x6v67dHCFBOzYqSqubTtHU97BA6p9CQwswhLv56t6WxsLVXFN/Zl4Gq6s0jKO8HoA2Kv258A9a9TBFPvaWvO8wFWrAW7S/LrpacroCExY97YaJstrGQhDFHtiyeSiG2OPoNQhofha4fcvIhI02bwqt9bQ/Ap71OXTwQUbH1NYBv0MLqv68ectPPjJUaw0F5LKsP2pW/p5aGWjE88fV3QPrNa9mzPOEAFAVc5xaJ2FTBfkLd8ZoD2BFetlYeMSK/tlIMnroH4CqxtMfjjjhI5k1xCHJIgElLHYA4EfxdjLhySl4so+msl+yoqQuiOUUsJCr8ODZcU6djAM75RsyMXH9BMxXku5U98euItQwLJdAycsvdoV3xmG7cSEcvzD9sJ7c6SrOs5v/WRomD6zxKD8b9w7A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(34020700016)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JwXh2sk8HVgIiGD18BnOWpl1RJO4GQ0nYGs6/fF8/hNHKaydrb4Q2lU1LNmnkB6xpAXgfTaJInNIZmMQNsK9gLsAHz+bLAQDQs1kZRiGFojwK9pMRM6v58k8y4hGrP+Ewbk7dknqPbXZ3qJD8aByvSO+2SCK9SgVkalpLzHFfwJg2OJa6KB1tZDbNtVd3Im4COZgxDyzbQQ+j7CzS38gaCm1zEY67K+oy9Dx3ecvvOL44A2WwHLc8EpqaWOHhQXQRPD8J8AkX38LuwQ1r6WWyM/7fQokG45N63TaZdY+uwbeEmjZunEk5sQ6Cec76koRRUkqtSilk9H4QhZg/QuZzYY3q7cAiPlinzjUtgCdcdgorHkFoj7SYKS9q6pEXY9QBrGaY+8umQAXBUcHIVjRf5alRQv14uGzU6OzLAYJCBFSlx58DrTVRlKcSoYzHZFH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:54:52.0132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe4d321-5dc0-4672-a9e2-08de789df35d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFAFF9EAD68
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 20:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17178

Add curl-cffi and yt-dlp to the TI_TEST_EXTRAS packagegroup for additional
testing capabilities.

- curl-cffi: Python library for curl-impersonate functionality
- yt-dlp: Enhanced youtube-dl fork with additional features

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index f2ae1aef..d1d049c2 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -77,10 +77,12 @@ TI_TEST_EXTRAS_OPENCL =3D " \
 "
=20
 TI_TEST_EXTRAS =3D " \
+    curl-cffi \
     python3-pillow \
     pytesseract \
     python3-numpy \
     wayland-utils \
+    yt-dlp \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_EXTRAS_OP=
ENGL}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OP=
ENCL}', '', d)} \
 "
--=20
2.34.1


