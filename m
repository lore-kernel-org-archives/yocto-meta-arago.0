Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD82EDB7D0
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 20:48:34 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91886.1775594911293745071
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 13:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OPbbEIhh;
 spf=pass (domain: ti.com, ip: 52.101.61.3, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNgBr2+5Vj6uleOToPxLhd8zbTRGZvwK+kvGAjigBfjfJadaLdFMA3wcrFZKFKrTfq26hAdkzRuFQaQyusd+bSsXEy2s4hqmG5fLLiqr1h2tGWSBf8q5HVCt2RdPWXPsmggx5eyHaU4thL4vNtDxguMigmHGpzo6kkQcL9BA7Hpc9+8e2vUp2s4Mqg0/O3qD+885MRC1P3Cz4U0hGNhUtvOxCMFi9RmoxlOL2n6qLoQHwu28ydutl7e6VKlDSDMmZoKQw0mUoLj8v0mHh98QPWDKNubGt5Wlmlg50rVM6MycqyJXkM0swzLrRMJUPt9KyuM5fW59HJ3pX05VpNHsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zs1rbuErcoP5qQlkU+h4SBuf1J0DPLY7iMwUG+G7Tv4=;
 b=wMa4Q99iUw/tpeNL0nGcJpkRUHrDJc1jySx3CodsyMOzLHqikzPMOsmjnjnIgsLJ2fTNG5mdJYZ9niQfVQWQgsFcsuwIdEiATBZFpBkVC0QfmsxG8/sTWH+ALN0Yxq4lpAJnI0ejz4NHOolTGKfEhVr0+eE45pV7To48+CQTyOhV6pG3GDrxzK2mKa3/ulspCSsbCtREwCxKvBniuvGn6LFxB+b2BPi0mONABdvkI2gq2WzN2rgTMqL69avjB4MtvuoK5eD6e7DQ/fvbGWVjF8ZpVkRA43TVAebhnIfQiLhv6YC58xbWjmJh3EkGbVtxAaUhvOYS2TkFZL9S3kyWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zs1rbuErcoP5qQlkU+h4SBuf1J0DPLY7iMwUG+G7Tv4=;
 b=OPbbEIhhS61JclCxZ0c9wzN4CFz0is12PytPmr1yp7kbup3bbgytN7sRiwwKV3bWPKh54hq477Vr/lMcwBQUDmf8+tf0/2PdWUs53dQqKkk0kEekBRsauSXxFzM5Bqp0fyPdKL/UOpRyVyy4pGKH8dvXnsMh4jMscVCpTSCarQ0=
Received: from BY5PR17CA0043.namprd17.prod.outlook.com (2603:10b6:a03:167::20)
 by CH0PR10MB5081.namprd10.prod.outlook.com (2603:10b6:610:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 20:48:27 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::39) by BY5PR17CA0043.outlook.office365.com
 (2603:10b6:a03:167::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 20:48:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 20:48:26 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 15:48:24 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 15:48:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Apr 2026 15:48:24 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 637KmOhQ688005;
	Tue, 7 Apr 2026 15:48:24 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wADLU-00000004Cz2-0Csx;
	Tue, 07 Apr 2026 15:48:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arago.conf: Change to DISTRO_FEATURES_OPTED_OUT
Date: Tue, 7 Apr 2026 15:48:23 -0500
Message-ID: <20260407204824.1003213-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|CH0PR10MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df26cb5-3971-4739-0956-08de94e70432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hFp1bVNwSZ2ujz0pioVpqD6swySXSV/k68CIH38tyXlIGK3foE9BpsK8iW9s4uZlqxfzvL456OVOLIfIQGio7j3nQR2oCqP74QMF4m7Uj0MUwXPv4YVpDZ61zpsCSaRNbwzFNtX4K3doOCfWBbQ03Sc8H1YX6aTZKgJGiDrbKlEkK3nHnWRm5iyfGPse8BSsCK2tXIFpKClpLBwicbpMJ+Zdkq0qPd6xcJMlQ0J4aOq4C3/wWZm4/Xzx9XVcryFedjeE2jwLOCybdbeb9HEvk7UfNXox1TCp/ZJQ5FUjAanyF6FAFup+2z3p/Oy6KmVX6YKZ4rKVuI4pvc90CDLJrKjMyKCPjPSKnA39wPR9MXdY4B7+o8AvPJmoYIcpkjXt1QuYgF1CXAYWrSY7u9oPNdj9xxZozc1ntYYHiFfgPyNo/b7GNeca+kIlo79DxLNOyUwkYXmJxkoQ5D8p3wi9+zIzIY5oWOq++yOFGhhEK5uUFf5goUobsmIN1NpE8UWYKeLcF3xT7ts5Xu3s8bBoy2JoyDJA+KFiZSlDJqBU+LTRk2JZTmviupZ40pHlrKPLSa1pLz9GAW4liVFjoKAmu7UEDH1VMmbeQLKgDE5TDicYY7AaXNPGOJFj596/1tWnT75ubnZGhyTP2WrY1dOjZc6zjm00hGZBSTH7aOmcNPHkOKOAmE548utQMLl7KW3Z0/G8n9CWovrhr3AvUU9VA9BGrjVhW47sq0l0qMMF3wWvI6I/1444lyNx/x9qAoG4bedprq5D+mefEx+vC9+zIA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fqMuxmlIpqS/0AkhIeFhErFPOC4rJLJBOlSxKBB23YmtkArtNdlehnbOJX7ZYkKTTIrxqVqDp/vA0T2uSdBbi9bGpxLCdVyJouh6QEF2WkBhPlDBYciBCu1S2yKpnd0A7u7nGB/YyYIiXd2wnCxrbp3dX37NVNrZ3LZmza344PQJ1IGuZ1vy8k3V6K+zMaQ6RRJE9U1ouK4zhszlaQ08R37Eb3uyh8beH6rjUPZoGAlAeUO6bqAeY2Bvc7J50EgZ/FUpCtOHEGydOk545xbmFviwxa8RBqw4lGWdXBI33efDAn4BfZxbTLcwy8ABqvAz9yItMdWQBohTdNkKeEprH0xnCKBDXndFREllnJqT4fKcv7PhUgU3GIwlB93OnxZ/iMw7T1m78C/8qVRX8MQuYwc03BjONa2Sz8rTOD3a2L+Cx6sD2WkfzF+SfgHyamkh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 20:48:26.0678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df26cb5-3971-4739-0956-08de94e70432
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5081
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 07 Apr 2026 20:48:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17454

Make the required change from DISTRO_FEATURES_BACKFILL_CONSIDERED
to DISTRO_FEATURES_OPTED_OUT according to [1] in oe-core.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D159148f4de2=
595556fef6e8678578df83383857b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 9787abfe..42019272 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -52,7 +52,7 @@ DISTRO_FEATURES_FILTER_NATIVE:append =3D " opencl"
 DISTRO_FEATURES_FILTER_NATIVESDK:append =3D " opencl"
=20
 # Do not include these default DISTRO_FEATURES from oe-core
-DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "ptest"
+DISTRO_FEATURES_OPTED_OUT =3D "ptest"
=20
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ??=3D "0"
--=20
2.43.0


