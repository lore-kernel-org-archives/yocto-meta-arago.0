Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E62F47CBD
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:33:17 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52740.1772739190247556431
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 11:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nJM+svIb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.59, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEyEnCuau53wBha+Y/t723T8/MvfzTaxl78PXskhhWFr+L28Ugadt/HkizPTpcW8lsOoCv9cOgzR5KVW1svasmqLGNO0NpPzq0XhZ2gd0ZqwYrtCXiZUKLe79DCS9lS8f5xhwj/4hN331m6Od5ubTaHkjjiqh+6qkEXLY/cIkBVrV2K3NpMUGF8AaXd5z+9lltkQdWrJ9DQq2WZuffMfUP2Z78Ddf6v/l0kpTbixnYUxPzuab1IxjnoOUEF4VvIH0xcCRIoIMQiWW1vs6lRuegA2aZB1THuPiHPSanq1Jjli6EGv1wK/2xqIqOo25byMhT8malOS0YGElYyHJlwEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnxlfkkAF2/2o/VvsW7DjD1cncxX5gIhuGSREGp6Vvs=;
 b=e9WFYTqDw2jZOAsTQ+syeqthXPRm7pVTFUkGlpKR+BKllqzS/JiwLyDRp+lOhND8r8+aKrUyzntFfxfo42Ur4/35N6DnSB/1SwRO+rTatvGhMefk2O3mcKhZLv2pgXV7y6iiPEu8It3qVPp2PvcnouJdRKYyawTwkkx4jLVqXzLuTsMHOOVRYRlX+6Nte2EMvLriF/UPxrkAbbusW3B6kziUbzU4ZgKqk1FWn8s4AWIaSUpXKX7JZzNQ2Azx7qYolM5ykMa1rE8DRiK8N6anHLVYffuAcPVMCLJV/7vgJLXJm+YEtYkgI9ahrmcB5iXW0VvgjT3CY1/OWDRWrrqRkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnxlfkkAF2/2o/VvsW7DjD1cncxX5gIhuGSREGp6Vvs=;
 b=nJM+svIbYXIn95PmW0gCfZWxsd5vYwDJIYFSQn8IrHm7A+zOTUkmSzjE3tslRnqus/Mnt5HEtJ9kQyxsqh16vwuQM9ntGrjnWy+L782KdxWb/Ah+NvmUh31H5RRqpty7NazaOJchAK4PCltzxnv4jkJ8h7j9RPxD9yAvtlnY6XU=
Received: from PH0PR07CA0070.namprd07.prod.outlook.com (2603:10b6:510:f::15)
 by CO1PR10MB4529.namprd10.prod.outlook.com (2603:10b6:303:96::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:31:43 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:f:cafe::1a) by PH0PR07CA0070.outlook.office365.com
 (2603:10b6:510:f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 19:31:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:31:42 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:31:41 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:31:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:31:41 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JVQ332427052;
	Thu, 5 Mar 2026 13:31:39 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 4/4] nnstreamer: upgrade 2.4.4 -> 2.6.0
Date: Fri, 6 Mar 2026 01:01:25 +0530
Message-ID: <20260305193125.2045659-5-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305193125.2045659-1-p-deshmukh@ti.com>
References: <20260305193125.2045659-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|CO1PR10MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af6fb0e-1e78-4796-e807-08de7aedd462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	/yqhY7FYgtaz2XzsnEIWZAarlN2DdpAswPNibbpqqGQMJ+hdz9stahTFRW3NFyTNHpVHXuMdOlxVQwzo8X3P1QxVuudZsu4cPs0wPUwyHX0aVNPZwCXW18iphfpokRMPac1gExfdwlLg5di6Gg8p2vDVb3aNhbFeXVGnFhpLmd1ZQ/DNOgJeS1hz3WSYrf/5FaHJ5gWkPZ/51ttHhk5bEYr+N+68mUPYDtqNxVpv75jdBUDwdXorag/RTGnCjx0nmXhxzfoBysgcXCU8zDeHMD7/WXB3pLVFMYXy7SmnzLIwq2qyAXES3KmTkropIT7FYcn8uzfIucC/XqGnkrrnIXkciJzO1KpEY9no7/HhSrUPL8cF53UOfwP7oQYFMx9+YuJXZc3obY4Ououo3ezVrtkXGpOBpEKMFsPBagf9TerCQc1peqmUXlm+HH737LiF/Y1TyMdeX3G9sh4s6dxbiH8XilIbE6FERLDWGQoTPFviDcI7iOM2wfUn825wwp5rNnb8eaTtBPxyx2+6/Q9RptpkRur+elF1Oyjs2nj/WSpvGlAdj1mTdFdbBh6Y2jT8g4eznby97xnhQl1sHr52PN3HWMc/SphreuuJphRU8jI0UEiKqssy1fvDZVtwLQMYBnXfIVy3q7jBHlNaG6vva3IxhIuzUboG1WAUHZsw3tX7eNcJ+QvUVHfe+TEEFmsSoNRf2W0pMLmZY/Zo5NAdwdYhTkyps0w6mUx6t0xPIH9+0+o0wiQ/yPkP9GY75CvlY+avlCZ/czi8OrarGbNcoQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LC1txbeQ7TTdmBQYbEYE7TjIeOL90f+K+iwFAKQHJzz0ntntuM4+hmN/GsjJ9rmFtIQ+EaB6aOIJwwIU2cM6NHfJ/x4kOexXc8HbAChWHe0nV3GdeMofBx7wi+ebKGjSmbWi7vMPF6c687U46b2vjb+RbZCnOFdJMxsXHSpVKHJYEen/2vF/7Zh7OSLwm16CUgSN16cHRpSVBihLGe9jQFNXAmvFBY7UMKzDNQ8Es470WLtWdER6pULwGpex1ok+zbfDqm8dTsJBU+kEoJlLXtBBOPBlzMPDhy1j78A44xu2/7ggpnKGUWwBTJkNkx6TvihvL/sCbnjSnZ2PAMzv8uET1roALDNs8HEK1Tt/+n1g9Af2kjbEuueMdPTmwX7D30dP2AbLYTXEBxbSlGqVoPSQ3RTaSexzMbITJDD92D7qvyKBu/oyNB5ADmyN9HVs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:31:42.1451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af6fb0e-1e78-4796-e807-08de7aedd462
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4529
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 19:33:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17261

We are migrating nnstreamer from v2.4.4 to the
stable release v2.6.0.

Key Changes:
 - Updated version from v2.4.4 to v2.6.0

Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:

v2 -> v3:
 - No Changes
 - Link to v2:
   - https://patchwork.yoctoproject.org/project/arago/cover/20260305173419.=
1735480-1-p-deshmukh@ti.com/
=20
v1 -> v2:
 - No Changes
 - https://patchwork.yoctoproject.org/project/arago/cover/20260304123221.14=
50993-1-p-deshmukh@ti.com/

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


