Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A998EFF6E8B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:36:12 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1671.1773786965042180235
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=teeR0N/C;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.53, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgMlrgH7LssoRYlcpqfIzDCvwiUePeu1Bf5hTAMqVZRPRG/THTb78yLtxxV/6z8SZSeQX/tF4CFrXf4zmWTzc6DefkteN9PqrZo89INX1zi2efCbPH6kDA2Xl5IgEjy745DtG40lwhxpiSH/6kRk5BBuzYfLRVW+J2L3B1Y31lew/jiXW324iw0PlyMySgB0SocCJZzJHTPirDMVxMjnC3eLQtQtO5jk18VHgu63jkoi04aD3PfbiAmyM0I2IM50L60TV2n3WbH8oHUKO+8ES5b2CD55clMx4553gxG+PIfOxo7K9PnDA+YfJf3ilZ7AqxMtwE+tAN/CoZjjrwXwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cI5wBgxjgIKjLHOh+iWelzPOUCb3sfsSiQVf6j+yKww=;
 b=aPnwBpAqKvnnJgPzLaRcbGsLczjhW4yID7KWSJh91aueK0KmbnAWUfYBOGtZa7jEliPTCkdkzuoGtKfCP9xCeziFssZbTyFjyoW0hqQI9z771P21ysTKMQWBZGhdU9Rutbd/ozfQMEBvXAATEzOQLblaeaOQk+kWZesJzBZWlmiX9UIv8Op98jUKhd72lq2uAVfQ25dx6sr+DQ7CDOgchNHrdx588V5vkkEiF2W44pnxBM2SfZsWH/TqEX+F2oPvDiIZyvJ5CoJhF0X2eb4yNyUDuCNF+GolFnpSCjmznEReZJa5Yc4g/nHAmEcsmJ4aSqDN0/7JiFLtqZDWsCNLCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cI5wBgxjgIKjLHOh+iWelzPOUCb3sfsSiQVf6j+yKww=;
 b=teeR0N/CD0KyU/dqDui8siHm7cIE5cmlfX2adHaCswiWUc3l//zWWEIhpr4u+Oo3uHkNnuKdIiowa8bvB6rvWp9YAGeFiToWIH3xJ22j8Kjmi3wLZkhvECzArpMVByHnDC0uxGABnEqqrUgeJXxmtUfg6TSbgiXFD5XMrrXZqyA=
Received: from BL1PR13CA0061.namprd13.prod.outlook.com (2603:10b6:208:2b8::6)
 by CY8PR10MB7314.namprd10.prod.outlook.com (2603:10b6:930:7b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:36:00 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::ab) by BL1PR13CA0061.outlook.office365.com
 (2603:10b6:208:2b8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 22:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 22:35:59 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:35:57 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:35:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 17:35:57 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HMZvnk3950024;
	Tue, 17 Mar 2026 17:35:57 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w2d13-00000008HVe-0Tsh;
	Tue, 17 Mar 2026 17:35:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] layer.conf: Update the layers to support wrynose
Date: Tue, 17 Mar 2026 17:35:57 -0500
Message-ID: <20260317223557.1973923-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|CY8PR10MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 345d4b41-c96d-4e54-fb82-08de84759011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	K5qFv1yMd4/mpz2g1jOpwQqLWOGtIUm3tpJ1j0SH3X2XoVMAydaUZdmzaeQom/lj7D1iiSK+or+D1prEd3+lWa1Zqo0HXBAT7u6QJk5+Jk5AJy9EEkhnt4Flea7iXrNaP81fb7BILAwmFZ7sQ7ZwSm8NaU2Jpy/dKTlmdTjKMVHy+6AiDY+kNUpdaQt6fphllLsj5vIXB26W7tSA2McAc97AMqOnzznWq7OKsPWatYDaveleRr1sLB8JWq3I3Rd5X1x4ic0D/xqV1ryVt/2ESZljU8plADiW+J+wLsrfKUtoRHHYlCxw6uSksWTyh2rR8wWVt6/yF9lnMjqvNcfURqdvcaRhHMJrN40uUV68fmzRPL3bwl2aMlKabrfM2qVP6MwL64F7YM4qbrmFJytLKJodITgbuk4l4bCKZdXPJFk1cEewmwR3fQukm+K89r9ak82DFw1FzxP+v/XSXB21j1t1nDo0UUo6HtS1bJUZhR0ZHZwLDrNLEjkh3sz2S9JMl8q1750Ik/Mwg6Dn8brwykLJnW1jHs5AGyLYwhAqI3Lg6pNsGg/HM7ZJYK+Rm4WeUq1tzpMxh6iR1zPj3qYdkH5CgMEois8kJyT/tedohVJmhmDcVilgosi7YgWOMSIdB/oVMT4clsNnz/0WU2QOYUy8q/+5rLUNvCSjku3ZTVVfXwC1Ltd42wFHBybHhyfXtpCusKht5OVsjumniTRVY0aEH81hhj9FDZ1/7LsN7mnVlNVE3hseT1VmAqEnR3aBxSYJJGlieHMm6nJA2Z4+GA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xhEmi0mx0CbjUfOWqn5j0R+vYUbMHTPrnwKBVDiTzu0B1gbPgn2xGnTjQWqOtwl5g9/Q/Xv/jCEIPohc5TuUc+k+SbknxRESWNrO4qzXGYYqnpQEVWwyC40cFeXKsAzGJqNWNSmQJynX5sDNxhHQeHEpR9rojjYQe5F5/nP58smifiZW3Int603VjBf9uWfwiXANOPJsxG/l5DWDWQe2LvjpTJ4rwZ2tXYcrLrDn08Fy0s06m5tWs504OF6xxSlFjpDPXSZl7/H9qJDxo0VCkvearo8nbXm4834WZx2xM3OlB6cYvZ648TJGQ5PmmIGZEtId7d6BqGZycAz2fcOZ9mNIvU5QXjmkT+ZM27J/GpFfgrx/zdPVqmbfzea8T5NxTF6hsinfYMTJnPDswUOu53TZMGe6L8d7RsELdFXcDDjnKqfEqbT8GTYGB6E9Jmlx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:35:59.5182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 345d4b41-c96d-4e54-fb82-08de84759011
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7314
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:36:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17391

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 meta-arago-test/conf/layer.conf   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/lay=
er.conf
index e16eedd6..2ad036f5 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-distro =3D "walnascar whinlatter"
+LAYERSERIES_COMPAT_meta-arago-distro =3D "whinlatter wrynose"
=20
 LAYERDEPENDS_meta-arago-distro =3D " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/lay=
er.conf
index 1a4a5bdd..29107f12 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-extras =3D "walnascar whinlatter"
+LAYERSERIES_COMPAT_meta-arago-extras =3D "whinlatter wrynose"
=20
 # Set a variable to get to the top of the metadata location
 ARAGOBASE :=3D '${@os.path.normpath("${LAYERDIR}/../")}'
diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.c=
onf
index 3a5ed925..3084974b 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-test"
 BBFILE_PATTERN_meta-arago-test :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-test =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-test =3D "walnascar whinlatter"
+LAYERSERIES_COMPAT_meta-arago-test =3D "whinlatter wrynose"
=20
 # Set a variable to get to the top of the metadata location
 TITESTBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
--=20
2.43.0


