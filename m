Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC45CD37AC
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 03:47:57 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17978.1778989672124877366
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 16 May 2026 20:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FypcyZSe;
 spf=pass (domain: ti.com, ip: 40.93.195.60, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AveUnCs2Qo1RyMwvJ2NX5xgZ2eholZQC/ZZT9HXWDUQR5/JZdQeHxia5S6W6drzUE4CF6LxmLfE7uf9/BjcK5lRCo0bulFT3czD9+wI0FiDe2xAHyMvmv5TEFRNfFCbJoyPGfRuWLzG6KjKTvFK1egFn9rsTR22ZzznJzrAnnDX0t7fCnJDWF4CeJOMZvKJYJ2fLlEtRL/kP5z8b6TuxQoq2Rf+324D+gY25SM60tdt9XC9ILRcXaojKA5X1Q7AbCOq4Yc/sfx1wLBNs7f6wmTQapFiQk36LXrrs3ZJBv5ntseCmvQN2p2MiDnwdG4iaJJOntBd/7TNIRH0T7JQfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6P7d6xME7+YWCq6I4vBHH//B2F2aXv0QpoQsNxOqvQ=;
 b=EZ2sNDLjO1TUoc8587+BLPhMxQhTcOR/xMykQRABGa7tDEK84SzSIbpNUwHZOF3rJo0U2cX9s/TGh3t8GGierRs0TOL2ReeiQmLn1JVltVGYntyJA3Kwm9WcloivWEzFLdXK593wMP8xOs8opd3Y0QapNnBphg78BFtz6QJ1W/FQwG3glY+FoyOVFyWedtuN5NtJ1fhwPQRiwDsXnGgBn3qpPhgfCZ2ycUDPdU9nfK2xJAapnFu4Zs2Ewkuo8JjvZvYkP6i2dKqkmj6zCO47KKMdlZ75QxsTReZFAf+vIJxxWrKlpNEz4WeGd6LsxYscVhjuA3zlxZXTD44EHfSUYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6P7d6xME7+YWCq6I4vBHH//B2F2aXv0QpoQsNxOqvQ=;
 b=FypcyZSeoVHl98v1PRPcvdZcGRwSjGxsV7ZcfTRW/60C4/zc0vTdkJ96nUxERlHYJq3FG1vDFNtvPrGbKPUoTnb9EAUm82RutT31u/eKVHHbEWuEj7ByXzHt5ToOVL7+u2xSxajq5dK6iYGAchzUuflN1xv4XbRXzpSUeWGrC/E=
Received: from BL1PR13CA0078.namprd13.prod.outlook.com (2603:10b6:208:2b8::23)
 by DS4PPF7BD9BEA92.namprd10.prod.outlook.com (2603:10b6:f:fc00::d2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 17 May
 2026 03:47:49 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::52) by BL1PR13CA0078.outlook.office365.com
 (2603:10b6:208:2b8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Sun, 17
 May 2026 03:47:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Sun, 17 May 2026 03:47:48 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sat, 16 May
 2026 22:47:48 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sat, 16 May
 2026 22:47:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sat, 16 May 2026 22:47:47 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64H3llHb2831480;
	Sat, 16 May 2026 22:47:47 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH] open62541: Update upstream-status of pthread patch
Date: Sat, 16 May 2026 22:47:02 -0500
Message-ID: <20260517034702.1309037-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DS4PPF7BD9BEA92:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c02a75d-ec0c-4d64-27ae-08deb3c71064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ZNb8hJKVWsXK0/1LL6Uq4IVrf2vKAR2MgSqYPXtuSnrusuqnLfu85yX95/xDXMyZZDy+al0A+iV+NzIzXSzWndmmEWu3/3p+3hifI75MBi41egPyTofQ1qZ2h9IvsUOG8tiEa41r7F1vLIHVKHivaf8OUgRMAWTJ84I/XPsuXw+dik9/E7/B1SvmKPqbH+P3nysYYLwi8Pq5a+W8d7Ulk5k41SQqOZfl106rDyJWT7A8y4felqTB8x6MSS217km2wSIl+IncHb/KudOv4Uy+OS0gZJtysakfLv/bLs3nV4Ya3O4uOkqTGEEPE2E86g7Nsd4OcG6gjfu/yWQCNwCbhxoJwLN3G/oKjig2mBqVYleSfR0K7ynA2Dp7WcB7xF0mHBBkKf6POFsPWJ0yVGUIzLemob8ee2BCpCDf44dAjIJxUZwj/m4gbHDv6dTiDrQNomnK24MzUC2BwHFnb6fFy8gsdpg58wDCSy6VOnCUN/beL5cDiEGJGUOJd52bXmkK05FSaIK62wztrq/Zaf9ADLeIvRNsJPqdtb838iGmOs+dDeZAPasMkuaUAvuLdtZpuKna/L025DNoYMx8/4QAyp4rP+q/zEscHlEIz1KojCCCmDbh+r8PhyunAZOITnKxqx2GGQQVDKxGvOaBpg3SxdW+bFBf+00JH0LAX8oUtvqBhCv4N5H2TAUUzARjMCC/rDSMlTdACwoC9tQ3+sst/HJQau/oSmvGru3fE4XXmn4=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SG+x3hNj/CQsDf01aHZb8LrYm150Bx1bn/9KqFvU8Elk6cQGE7Ha+5MUftC+xLAciIeU/LMEUrikJo0Cb+BlhxCdEHJ3TryVguhJ2lznzxrHtN3a0UfLxk4qxjCVtx5h7OUf2zeJfh+6kyecKFrpzI9710SwptWo/TKc2MIpGHPPO+SdKfoaMU2B/m2FjJUWDs6ysuTVZKDzOROr9/vZXXkh9z/sl+n4KbVeJ+59KGvwpKB7pGaXCF+61gY9fIxDU+X6E93gXHxL6b1VY8vA0c1sV7cBD3RKniewS9D+zAlq+UdDnXSmpXBPp7c4ODmOsDY4sRCD505giKEJY1c+u5VyqdJPvrxukCTRXObCkySE5QHqId+xJ5vdQNZWHKDuXr1eFxPFntmqa4/Yf/MBzSoiO3pGCgm2aIvLxKBpQtHQ99CEGV2dyTIGB8T1G/Ps
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 03:47:48.6763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c02a75d-ec0c-4d64-27ae-08deb3c71064
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7BD9BEA92
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 17 May 2026 03:47:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17523

Update Upstream-Status from Submitted to Backport because it
got merged upstream.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 ...2-examples-pubsub-fix-missing-pthread.h-include-in-RT-.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
2-examples-pubsub-fix-missing-pthread.h-include-in-RT-.patch b/meta-arago-e=
xtras/recipes-connectivity/open62541/open62541/0002-examples-pubsub-fix-mis=
sing-pthread.h-include-in-RT-.patch
index 57e6ee8d..66610546 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0002-examp=
les-pubsub-fix-missing-pthread.h-include-in-RT-.patch
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0002-examp=
les-pubsub-fix-missing-pthread.h-include-in-RT-.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] examples: pubsub: fix missing pthread.h in=
clude in RT
 Include header file, to fix error of implicit declaration of
 pthread_create.
=20
-Upstream-Status: Submitted [https://github.com/open62541/open62541/pull/80=
44]
+Upstream-Status: Backport [12f122e16a6a76dbff0022f64a615a5ba459e71e]
=20
 Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
 ---
--=20
2.34.1


