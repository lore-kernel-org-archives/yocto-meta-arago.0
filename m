Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87041099B47
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:12 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1061.1774044848903761095
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 15:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=aFjIXh8j;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.27, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFFcO84NQ+JtJSM2xCSrsVOt89kkQQLnznJb6zmDS4oo2Se3l9Y4DK6Wh5FfD9nsAQMggUv8gJ2IYIBgGzX3REB7CLETSyDYzcKq6OQVFg4HIDO6JNYdG2ijQmnLOzpwHfL0WjvDW5NZxXncAupgVa1PQYMrWvIF/r1OZnIP+p20jWn7J3p60v82jjdovEb9Bp01OjJ1YOqE4uaKPmXAlgIK9Oe6XipeeCPPWXXk7QorCIQ3JZ3HDGJ/BPToiQXdq9KmIiPkaDdip0HQls8ghh/y4P2ShbnKscCkOBeryh0MXj5+399HqKSEPQTduH6ZKaJ/sMxTFt4H/xDlftQovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMzPADhOAzj79SchhsKV06cuguYl+jo+d9qTk04NskU=;
 b=AY05gtuAHi/q3W/9ru33WEJ1nAv5b8HMD+OkJWvjAkX3qAKjMcVD9qcHUAAc0KgHRJcER03OTbUeNsqa7qujQ0YpFrzyPXsCq6dwuWoiGggT9ItVmb9neVKpifc2spy5KwpYfYiBjmmsBZG+eD+lgtAtkWA7M5twgvG+c7gnccnQnmNYkjDUMRG2sl6lWM7D0HxE4Qp+6uEDJ+H2kuMKv4JgbAMoo+sI3qjLHzzissLqPc23qR8QdzRjCjCB3VrRI4L19AhB2vo8N2TL+xg3cRHjHYLk9WtldsXkDURAuDq8kuiqdoTSZ3nkPd2r/WUMZGdfMoMxFB6749UC5ah+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMzPADhOAzj79SchhsKV06cuguYl+jo+d9qTk04NskU=;
 b=aFjIXh8jqeYrDYe2DFM6gzEHCenrmi9gcijHGtNtKqjLdXBYfeccQzr8w1mOZMyHg8v/F1Hq80K52NBAFSfpGpVTKYc/xDeemi2xh+hLZ7Xb060oD70AolLw+K8KTvYxPKVCRn83yhaQhj9qQgw5UDVNnMKqjsmOhSNp2CdoPbs=
Received: from BL0PR01CA0022.prod.exchangelabs.com (2603:10b6:208:71::35) by
 LV8PR10MB7872.namprd10.prod.outlook.com (2603:10b6:408:1e7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.23; Fri, 20 Mar 2026 22:14:06 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::45) by BL0PR01CA0022.outlook.office365.com
 (2603:10b6:208:71::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 22:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 22:14:05 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:14:05 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:14:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 17:14:04 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KME48f302273;
	Fri, 20 Mar 2026 17:14:04 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3i6W-0000000GkRH-3CTk;
	Fri, 20 Mar 2026 17:14:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 4/4] packagegroup-arago-graphics: Add mesa-demos
Date: Fri, 20 Mar 2026 17:14:04 -0500
Message-ID: <20260320221404.3991734-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320221404.3991734-1-reatmon@ti.com>
References: <20260320221404.3991734-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|LV8PR10MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d141be1-257a-47bc-d063-08de86ce001a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	VnsEaM/RRfXH9AagV89SskkNv7K9vWJL0VI1ttYbl6JavphsbnhC4oyjMesmd139xiepDh5USYdkepKtn2vxH8PSUKA4CmcwFmGHlhx2jhK6x0ZzmX7Fbq+fSUie2rYHcnSvw4DixCA2V+7xoGxL2SGyZLI3z1lSiQjnMHtfQyVMQ+lJ1PM7gLaeJ3DYvj4+875utSPpICaAruD4DKb5gW6RP2vgZY207+3D8+A4xAVbz/190Mvt+FXoBLUqILeeJphPCP78d0ks4vDfQiMDGJiw9BmMPiAhwBB8PpFsn1P0lA9HU3oqx2ZqqDUuaqEZjK8u6RykFkQ5foqfB+09pK14sEdc68Ryw7p/udZTpdqAD69ihbW6mRmcmmGBw9/nL8ycJjl6zilOhGTBr/aC5r5gPtvXPYEZ/w1S/3RucA00wb+4mc74ysN1JRCh1usY+QA5SApMw7miG5olvF9dcX49+ddQUw1j+I3m7IYDjedvQS82x7kId02bEwgUcKxLYE7W+WHLwZuN2hyu3tUJ0aB112Ypnvg9TV28ZRnYnBQmIsb2Qd1FvgAckmt3/fVssvTdsHXWta3yYV67xniLk46nPdoRsqYCUtKVc/phfNqeqQ4rIitNyJXz+3n5KIsejV9zx4HsuNO5FFROh5hADp4DZFmmxV7NaafwOz0f6t6b4kpCHLe2sHpoNLuaDGZ/ubBS4Fm86UppBTO8JM+vmBopnsk6KLz9il8hzNbWXn9SexBUOzQujk3fybqwsToA7LOtiLLTcWBV9Y8g6iLiAA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cOC8qAmGsmSjhsTtWC4zsc+h5X9RsquXhSgkY3/cbSU+N0EuY1njlcnsoE8KdoKAI+LkfgR9awxNsZWPX1P72V86gA8ozyDTrYPutmgLZQVD3PweDBOuwFU9WQ30nOy5PCMFVZKCvKArKy2PBvg4zypVA2RgTmjaQBHHZWZS3mCmye6mebRdGjVffb5I9MEPoPuKHtpOHD2PX+dM0xJnpFgyVDDM2WQfQiCpATHxxjQjlhw2oQCJ0h5Zvbb7FEknJlVN4hzHF8eHt1etVvo0LBqwzPfvnv5UB32joBCsrE9tuOcVHT1FAWP40bt61JtdXVP0SZrZRO37u4pW3d10rw0VOegR79DfGytSahsk3A1pxH6EoE1n/ywszaoAWUf41tK4l5ROzLsyt+jx0J4dEh1yJoH4YCcLJS9vvin2D+YQMmJxIkxIVzVGrOfapf2R
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 22:14:05.5102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d141be1-257a-47bc-d063-08de86ce001a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7872
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Mar 2026 22:14:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17408

Add mesa-demos recipe to the packagegroup.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-graphics.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-graphics.bb
index 026281cb..e3c6aff6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graph=
ics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graph=
ics.bb
@@ -9,6 +9,7 @@ inherit packagegroup
 GFX_WAYLAND =3D "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', "weston-init", '', d)} =
\
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', "weston-examples", '', =
d)} \
+    mesa-demos \
 "
=20
 OPENGL_PKGS =3D "\
--=20
2.43.0


