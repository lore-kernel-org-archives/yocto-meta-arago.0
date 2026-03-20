Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC38C1099B43
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:12 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1062.1774044850206486598
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 15:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pW5aqU9N;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.5, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1K/3ss+IBhHy95HJ1N8OU7t2MgPtoBGtm980+jpjcokhiQNrbk/+wx4f5qPnuQkXAyZAsIcddnsUbFXMUHN6FR8QPtJabj+hO+xPmjbv7oDMbywMSpN2UCUSP0UhugCjn1CQyI8C9QFa5O4IbeVPOTHGVuJ2ANlgE9Skxbi6CvIIBg6DNBG7CJsf6vKJ/UkKKv/XAj37nPQ8ShwFZo5VLnsd1IBz7oeWCT64OwdL4fAZOXkseHuV6SAPavsdUTuamM7eOMLYl33OfuMqCPAeHuAzY9bg93qonjnAX5uswolY45Sg8x992YIksJM+Gcg0RZWzRKscs96//f0ETsF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw2lnGwmNZhMZTUFJES1cYacpcS69Pd3+HCbWOpZkyA=;
 b=sUO2u9Q47n2CkuqV3rBpHvJRMmgH2dRbQg3NWEsTowhowfeReBlRKPNpgFcEyNUP+s1TmFZIl7Qu3X2T96oBYU0tWdQY6cT18jy+qKAr/3gF1fz0it7eKrhFJ0wlMzCLJIymvaWVvHRvvJnNtxppQgSjyaQ/d0eHf1pr7TDmKqJximEU/NBfh4ZPVCjvW3Abw8AeRQf+1RLaUEY06eiJPDgE4jKseq4YKmwxiHrxSMMKvEx6hqLwvTwfxVRo+OyBxgx/y7sKCYz/KU/YiQiIalmEV2nZGPw3QaTo0oB8yn4eAkg4Cf8TSGJtYLB56Z/nZPUEAjcSpEl7tZVZQEU+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw2lnGwmNZhMZTUFJES1cYacpcS69Pd3+HCbWOpZkyA=;
 b=pW5aqU9NnQM2C/sRvaKGWNroXJPZUlo01gwRCfPPnrliECzmuPbj8meXcsFORy0MnCpE2gdsPJ7m8ET+mAX6/sWNJdNPA91RoSGUMXGj3VfURc7IpQOxjLl6UVWVYF35i3eY9A84FAPqn7+dlO/qzS5e5xCVXnBg4HxQM+W9dZk=
Received: from SJ0PR13CA0187.namprd13.prod.outlook.com (2603:10b6:a03:2c3::12)
 by SJ0PR10MB5566.namprd10.prod.outlook.com (2603:10b6:a03:3d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 20 Mar
 2026 22:14:07 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::5e) by SJ0PR13CA0187.outlook.office365.com
 (2603:10b6:a03:2c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 22:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 22:14:05 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:14:05 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:14:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 17:14:04 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KME4I1302263;
	Fri, 20 Mar 2026 17:14:04 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3i6W-0000000GkR9-36pm;
	Fri, 20 Mar 2026 17:14:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/4] packagegroup-arago-graphics: Clean up check layer error
Date: Fri, 20 Mar 2026 17:14:02 -0500
Message-ID: <20260320221404.3991734-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320221404.3991734-1-reatmon@ti.com>
References: <20260320221404.3991734-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|SJ0PR10MB5566:EE_
X-MS-Office365-Filtering-Correlation-Id: eb56388d-4588-43c2-b20f-08de86ce002c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	pjPFKbN01OwxjaSMn+Qd6HECz0Zat1w4p1AMb/cZBC46t6lDRhMaXvrp0cpsG+7n3DYaOIGQp0VSdQjNJs52VD5tV9REM0C+t+XlsHpVDbB058zCxQrP04n1roDLMDSLKLegIaZ3qWN8NuMLlOPi4FiF2fmGJ3rnDawrHbQ9eAdNnhe0Y6AfZKrdalU71btPJxjD5n/ZifmwrgsMn8tAY9VdHuEJ5PznTsiqrEq21HU2IhUGvLjMpQ1/ColFN6GVQ0eORbGBy4qmgS6c6DkyKUyBsYWBud1HmGPp7UQ6UPd11/yqGGzri2SqaMDvIRDycH6Uj4O7BYJjJhPK597kD7hm60oaQ6BPJCMSbuLOtCwENwQNPVqsZA08FYy0o7MMuzWM0pl95e7Z27vloXPtme5LA6QYZGpv/DqFp1u4N1eCQyVq3xG0T1T6CgDXcqcoGfdzTFuKHxPfZ6FWDeY1VW9wWzDOolLScCiR+FML8Vs6Dlx/JM5px/AT0eBxQKoabRuRUQOUn6bga/wFPOzluvKImoHwEW3k/4EXJhHWFsVtmkpyy5COeki8HsH7W1KKZzcW9/jm6EewSYOyS1CwaoBYAfAJ6VtONQZTn7gGmgpgHWbZ306DJ0/Zn5KF00TQu6PvTmaWS41pRWI+as6WB4WfG7U6/swmeagOQMe6QXoCxrUVJ8FT9dGuzZbjZ6dxVbfGorFuzxNN+egLEm1EHXc919hVMewTR9svRo0cPHpN/ZJsAzj/AW+9ZN+7p4aADfDiDRBbD4y25NRu89LRtg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VbjhadOcn7zene7CAzcFo9fRlgaUBBrOLSe7KmkZekMEhPcD2mq80i4bzZNbY/0a6ZC2qL0U2SOomQGq5R7hdMyej6PVUJehVsNzO9WF4GvDXXfh/VH9Ozm+J+IhRw0PEL4nyiBb0/ywoqBjwEcP06tdmWEDBUFHFDhE7yNUhjTFtyJmYMn4nYAOg3ZVhJYQh5ycBaoXt50TZkpN8zLjuTepulBt8h/Jakk7Yex+vkZqUyPd/2kcoZtVvM/1r6m0vbrABZkvWSSlRFx3NE5o+DaVkNtsdyrXazoypiwpaUaqH0obkUM+orggTlk6Z2paQUq9okx+i99fz804GmCeli2Gn8AkjJlnhsjt3IfTB+W7j6Ojbla5hzGZG6xMQH+ZrV/rLnaiT3kkXe3z/ih1YomLIetNW+6FtXWeRKG5jn0RDew7DK/IC3+RmLnTMKhL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 22:14:05.6209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb56388d-4588-43c2-b20f-08de86ce002c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5566
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Mar 2026 22:14:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17410

The weston package has a DISTRO_FEATURE requirement for "pam".  The
recent change to the nodistro settings do not include pam.  Gate the
inclusion of these packages into the packagegroup only if pam is also
turned on.

This fixes some check layer errors.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-arago-graphics-sdk-target.bb   | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-graphics.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/pac=
kagegroup-arago-graphics-sdk-target.bb
index 8f760119..79e36c99 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graph=
ics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graph=
ics-sdk-target.bb
@@ -15,7 +15,7 @@ OPENGL_DEV =3D "\
=20
 WAYLAND_DEV =3D "\
     wayland-dev \
-    weston-dev \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', "weston-dev", '', d)} \
 "
=20
 RDEPENDS:${PN} =3D "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-graphics.bb
index 9860037f..026281cb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graph=
ics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graph=
ics.bb
@@ -7,8 +7,8 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 inherit packagegroup
=20
 GFX_WAYLAND =3D "\
-    weston-init \
-    weston-examples \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', "weston-init", '', d)} =
\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', "weston-examples", '', =
d)} \
 "
=20
 OPENGL_PKGS =3D "\
--=20
2.43.0


