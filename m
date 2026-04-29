Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8227CCD13DA
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:30 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13570.1777475365394772287
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=w2LDassy;
 spf=pass (domain: ti.com, ip: 40.107.209.30, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDE7+yKg8hhAT+ZTcUr4BRX/DBiEtyKEkoXYnKotmLypDpVaMGX3dO6QGb4bzioGSzHwGpBjXR55Q3Vhdv6J2kRbZ9mk3gnh3J9yhy98UAJSaycinQ125uXno4VNVbzBfX1V7j/ltbPU731qWUSTtpnJySWTgUwP5CPzBOB7ucAkoW8wysDw1r5US3VBOvmyaBY7IpIIW3au/O8EhwnBjWSMkJ/Ntc1vzfSTysbMP9IwM715I0XpRpuGIcYtW7EsIW384xwBgH6d4HhgAAGnkIJSSMU5mXjAU3aPJ9/D5xO/lF10Jokq0R1NNrVtfuaxMklJMj91QrzesjmAsQD7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tROHAGggHaA7DmMLe/oNWEISQz31qJZGEOpfwIf0boI=;
 b=lJX0qYDFjTMSjnOcTiJlFZG4gucUXxnDiIQlJtVODhUU1tYT/7TLD/Izs3aJ1kQv5BG1UNKLsQzCoAn6Cn0A+jlLt/Ld8BmklWZOTwNc07hgwdGpXjjyOpryJ88MIeLzt4XqCFC350hczTAy2U5a+0ZhF8vfIjuumZA3N1fcp1RG0/czkSmNExdr19kg2CpGwkdJ9exzh2DyvcnHlMbE1GPovwMVdTtzM7hXLSDM2lfgu3g4OiKqWSY70FMIvykeQj5FmJ/4/Grl/xRiMS2dloq76KHG3Y9ob024B2PfldMUlHYk+uH/mcmgwk2VqBcm5nBXBWr9qICTlWkAK/rtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tROHAGggHaA7DmMLe/oNWEISQz31qJZGEOpfwIf0boI=;
 b=w2LDassyAfqmYkrprQigA8RIaFwmlidag38vlcvUBHs9UNj6UGWX3Ybt5/qQsJ0ID2VZzS0hsB+WL98ABXqjaYLI3sYtb32rn1Yk1Vv9Ef0JCKOHU1NZXYBXdOmZ/mWh0QoT3snJS+I7GGmyhyycXyxJohXE/gLejBNVEbdyGAA=
Received: from BY5PR04CA0004.namprd04.prod.outlook.com (2603:10b6:a03:1d0::14)
 by CO6PR10MB5618.namprd10.prod.outlook.com (2603:10b6:303:149::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 15:09:20 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::e5) by BY5PR04CA0004.outlook.office365.com
 (2603:10b6:a03:1d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:09:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:09:19 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:19 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:18 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9Ij13333866;
	Wed, 29 Apr 2026 10:09:18 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XO-000000046U2-3QeD;
	Wed, 29 Apr 2026 10:09:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] meta-arago-distro: Change from meta-arago-test to meta-ti-test
Date: Wed, 29 Apr 2026 10:09:17 -0500
Message-ID: <20260429150918.978225-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|CO6PR10MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4eda05-c20d-475d-5570-08dea60149db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	v1G53Gli+WFioqEkjvXYkslOVH3ucOdJWl6XlJSDo6vK8GnDmu8at0g6+icA7TI7IDVW2DIUYTFl1NqTfD75A+ITga0IP7TQtTPotgqHa1kABTQPQsLXakhX3pIOKsoWfOyU/I6F1aThyjz6jWWQG4/4/7f0fTSUSD4CePLxR+xV1OLlU3EaKSTF3z8LWx8suC23d4alHQsT57Pz1a3416r0yQkfL3hLTtRMq/Akpw+lyz2QBw7kOBRZzlM9OdY//AOl6Qhwm++24A9GFQaEFTItsyL4PuKzU0fKZWrKFKpDip2a3H8V3xCHQ2enkRAf+CCHG4E1BsD3JblxQR5VFRXTaJiGTPq03lVFq0fo5DPdUr+c3F16JTSKcswV+PuxEK/B0+ZcLVNemofjGJ3XSIg0GLhv3agYCMup39BAC6lNw7eXHLcXYCaOg+U3lWpYHihLqh9qd/qtpn4iP0nY69Z436dXgL/EAjtzrlDu/+JIVvdWzIPIVWJzW7kcbyJPcfFXDyZNCAsQQJX63YHXoA32vaxyOWhGyobsNQuIKI63RwQLTmupkEqcFEc0xun1fkrWr8E5bOKbkrsE+c3ITeXdfyaKwkZyAQf9OlfFQf8XpdjZ57eHMe3EGdBgi2nF4PlERg+T8FZtk4fK1xdnEyYDQDQh4apGgZC6UotNvgRad0SgrW9Fe92gU93sVs5JOch3yv1tJ9kIVklgGW/zx7riAOrr/0byqn4/dCs4JovWvVlWhQumPenaN6t4IYdNCe1Ksp49DMy3Y3EJXySe3g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VAqWm3IEUebtZk+Spr+c8eYV/klUkb4GvlVX2EIO5Fgn5xPUcv22l0SDO3kzPFL1Xj6ttY5aWuMR51VtzoFIwjnpw7T4ZlSRkHs8v9WUd5wg2c+zl3Z1aKjk3JZElMGBq1pWBlEOz5daJC0e8OkcXM80+aBRhvKejz6A2bOlM2/QwHCxLi7XfUBJOLWC4BlwYD6F0R5rfFLRdk9HX4XN4b5xsFbfIOuR/B0sRi6UNr927Zmj/Ej0fnbLfeA4s1eOXHIa/w656eLx8stRDG7K7J/HTrYsa8fyUKsXLorQCifI+qY/YUP+ZJmqzUT3zghtGg0wyPJU7So4fcrgWnl2FWFuVSIpWKLqw36TwLX6K+8HTfs4t6Ivycbyqk6DJaYzDA5z53PCYHMzjtjfOci+eLbwvVIpuKkFM7w7xsnYy65cDs4qK+YPB8Qe/Abc1oZl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:19.6151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4eda05-c20d-475d-5570-08dea60149db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5618
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17508

We are moving meta-arago-test to meta-ti-test in the meta-ti repo.  We
need to change the layer dependency to match this change.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/lay=
er.conf
index af3be2b9..f1593d83 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -14,13 +14,13 @@ LAYERDEPENDS_meta-arago-distro =3D " \
     core \
     meta-ti-bsp \
     meta-ti-extras \
+    meta-ti-test \
     openembedded-layer \
     networking-layer \
     multimedia-layer \
     meta-python \
     virtualization-layer \
     meta-arago-extras \
-    meta-arago-test \
 "
=20
 LAYERRECOMMENDS_meta-arago-distro =3D " \
--=20
2.43.0


