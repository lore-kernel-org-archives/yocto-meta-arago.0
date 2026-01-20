Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AC1D2ED1E
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:26:07 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8888.1768922763384014336
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=V7QpH6Dg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.7, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yj271dHXQq5SlFQjhw8aJHdhuYEaAufRMwrbZqtJlkPxSsEfRqZ/fx5V6GUp4zw3ECdABBQ/DsJ13b4CFYE1YU3SkhH7a4ZjzrGo5nuv/iRL6zNowRVXhfuVsW/ChdpqrQf4ljKKMVAzqF9BDlro2M6JB2FYWGlwEyXO46iRv/36eLoNPFHq/exwox3eU5bedNU46iCz4ub5PMIkGeoAoJfgetlimQUif3DsmIPv4U2nQOVl3T/YYEguHEMxa+StcEUEzq+vxgZDoHyUJngD1jfMBQwClAeAx5KGqim6wOzVsbNtJn8s9jmr9VOxM9Zkd2/fxznmarwIZC5Sbh74Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yp1KwMjyoTHulUAvXz0TN3JjUvtpyO+f+//4iceUBZc=;
 b=F0c/vhHVjrkepkx3fXJz/w/pk6Ed70wDDcEMz+ByBlgvQoO2the2WS31dz3YNWCs8T9WmXfr4W6dVbBJJF/a3sfN/mS5UgYQ/GicslXaP1rMeuWlLx1f18OeonxhKEY6sADBdSYC3cIt5YeqNZ+amnPVYFQthYRAf0fT+fpHkzQqxvSn+o7+xwGM7+HsljLBON+7QUcaa3tAuRUvHLWmlD3EvfjhTtzlvW649aiMgBo/BvV5XSZw4pWDGuhJdZZmG/kcs1oh4Q7n/AXlQNGYiKQe4sLtMnt6bdsK3079vED5f5NXj8O846b+iRMFFbCleEEqA+U1Y+7QCy2a1DxELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yp1KwMjyoTHulUAvXz0TN3JjUvtpyO+f+//4iceUBZc=;
 b=V7QpH6Dg6Eh4sy9eSOw3qMlt2TGLCps6TbqCdIEsL/loLIoH716FfRxjhR9ybB9H/UqA+VID9oIXYDTqmNBQF5CvSFSOBA7DypAvWWhJTGR/xLEOcsqvx39XURsN7m996gI0ZERS9F9wrHSyoji/yDGO6Tm2O6uQqPnvxZ+6FzA=
Received: from MW4PR04CA0340.namprd04.prod.outlook.com (2603:10b6:303:8a::15)
 by IA1PR10MB6265.namprd10.prod.outlook.com (2603:10b6:208:3a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 20 Jan
 2026 15:26:01 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::70) by MW4PR04CA0340.outlook.office365.com
 (2603:10b6:303:8a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 15:25:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 15:25:58 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 09:25:19 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 09:25:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 09:25:19 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KFPJ2K1419269;
	Tue, 20 Jan 2026 09:25:19 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] open62541: Add patch for implicit declaration error
Date: Tue, 20 Jan 2026 09:25:19 -0600
Message-ID: <20260120152519.12538-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120152519.12538-1-a-christidis@ti.com>
References: <20260120152519.12538-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|IA1PR10MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 4641b005-459e-4695-87de-08de583836a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3LsTAdlNFx3f7wB8Bo9FpcrCsZXU3nD8RoIJzLJTvXPU9JwqpS+LkeA35dmf?=
 =?us-ascii?Q?mcEBsVT3MonIcdf9+76oY1p5L++TgmSOwikApD0ctOJFN3BdEQeZfqaYq4Z7?=
 =?us-ascii?Q?smdvUoh/cJsqQwf7+GsJZ9jXYlMRogcvpzLIezFKGzbYRU9T6v8SR/GXLQzl?=
 =?us-ascii?Q?oQY/Hr+0RWIG831NR4vievERxR4sbjc2WCVURxwMZAvc4ZdBxtgFyHhOaBxO?=
 =?us-ascii?Q?C2w3G7s/KFIdev7GOZcWp7hGwfL7gaCoeAioNrjN5Sv0KluUplVPx7WjAIPI?=
 =?us-ascii?Q?tmE0jg8lw41xdKpxSLm+JLgAAz9vTf+ukdMWuSopI4aYQsT41s++0A0mpCry?=
 =?us-ascii?Q?Hud6HC6soS+hNjo1exy80QGe+TZ0mzFai7mxF0JYxVcyiSWEB1iffLrGxXsl?=
 =?us-ascii?Q?q9B+GTv9zBJVLEZQm6sEUBUUky6BXjquD7RzK46H3LES/5anpApVeq05lFkg?=
 =?us-ascii?Q?m2PLOntii5StSH7M8CbYaB0qVOw0YraVb8I6NxjQNTOVD7oy/YyPnLKmEj46?=
 =?us-ascii?Q?z+0JssutGZUFsdz0Mfr9i7ls433+nbph0QqSKV5+oVym4XSAPbkc1+2/9ijk?=
 =?us-ascii?Q?YCrkl6+qut5v1vkEOmuXkQXtFwawYLCo5TMYQbFD/k3DW36RvZ1YO7gXIFm6?=
 =?us-ascii?Q?/ivbN9hJAG4ziC/uLrhsNGQMoMI04+eKVv6b8s2rfwt2AYx/UzN1XA1mWARa?=
 =?us-ascii?Q?4wlMk3et7SXcL13mVwvtLtTftp6L3kx78DLqzWkzlB85hTYcMIspt+JkWRav?=
 =?us-ascii?Q?oVuklA1n3BqdXgtafIDijpT+uhR1MhOee3y8y4002IZQWVC9BtEC5emD9maY?=
 =?us-ascii?Q?JwP/rk+5xbGTF7EHDqZEaFVYqk9twvMMY7aKJALgrxSLlZuu2c5LUkvHejIj?=
 =?us-ascii?Q?c0rZf1IUR3VZ+Xyi2DGAITBTUFfexnnPgHUewz1fb8J7jvGUliA3xym44ShS?=
 =?us-ascii?Q?FRgSVaR+oIEpNwADP3Hmlf5RHtYGSpM18/X3Pu2Foo+WY22G344bvNivEKQs?=
 =?us-ascii?Q?2k5qWQsrgC2XbFOAaI2WeFmDMCH7//TV4P1B7itMIS1z+6fxQLvv8MJv6S/v?=
 =?us-ascii?Q?ohSjExB5MQEk5aIdK3aTknRrpgB6KTSVAMWSUCNLQ4l7gWP+wWWHSV2xlOEZ?=
 =?us-ascii?Q?zKgDfkPWh7OmO6Uqk/Ux/MKTLDqtAixuR1Qw4Rc6+QKMXnEYfhNE9SColy9d?=
 =?us-ascii?Q?CPXO3GniHntDH3bSeEJkUgbrqugQqXIRusAEFx9DhrROx/JQGoEgI0sHAdzt?=
 =?us-ascii?Q?Tw9ANyIy6NTqYDEthXgv+DlxdjwQ8LN8RurPyVsLqj/n9Aj17a3RgPcfWBEu?=
 =?us-ascii?Q?e2JC6mOgBHSCkZMAJM7PqO4mCRv5/5o8WId9zZOmXa/nveJT88oz8QMXQokV?=
 =?us-ascii?Q?RhSzeX2hdhSCMNBKj80eaZXhCu8itz2b4ecxgWHbhNlYW6BBsv64WefWmcYu?=
 =?us-ascii?Q?/jYvRtr7gl8HSMLPFkNkjBiYYSusvA7Qu7MSXWZizQXW2e+dGOOAysoJM3MY?=
 =?us-ascii?Q?gaQ+JD1t2CCCQ3bXnyRw/Ql5tXeqtAPZRpD5v/wB6wyehrutm3KAY31SdQX+?=
 =?us-ascii?Q?KQ3mU4+XpIMvMrjWLssdGO5aRZ6ctLZ/X4ro/Z+3VUrVglljF3EWW0o7CgVb?=
 =?us-ascii?Q?7IqKladR1QpGfrl7hiuG5Qa2UP8fiPut+Kca7iG7On2j8BQ9il7PVQeryr3Q?=
 =?us-ascii?Q?AILr0A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:25:58.9814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4641b005-459e-4695-87de-08de583836a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6265
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:26:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16987

From: Antonios Christidis <a-christidis@ti.com>

Add patch for implicit declaration error for pthread_create().

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../open62541/open62541-arago.inc             |  1 +
 ...plicit-declaration-of-pthread_create.patch | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62=
541/0001-fix-pubsub-Implicit-declaration-of-pthread_create.patch

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541-ara=
go.inc b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.i=
nc
index cd8ceb00..7bbd34b8 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
@@ -2,6 +2,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/open62541:"
=20
 SRC_URI:append =3D " \
     file://0001-examples-client-allow-configurable-server.patch \
+    file://0001-fix-pubsub-Implicit-declaration-of-pthread_create.patch \
 "
=20
 EXTRA_OECMAKE =3D "-DUA_BUILD_EXAMPLES=3D1"
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
1-fix-pubsub-Implicit-declaration-of-pthread_create.patch b/meta-arago-extr=
as/recipes-connectivity/open62541/open62541/0001-fix-pubsub-Implicit-declar=
ation-of-pthread_create.patch
new file mode 100644
index 00000000..0b1db3e4
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-fix-p=
ubsub-Implicit-declaration-of-pthread_create.patch
@@ -0,0 +1,30 @@
+From 42ede121eeb884bebc79b8083b93e8ce15b61be6 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Tue, 20 Jan 2026 07:37:55 -0600
+Subject: [PATCH] fix(pubsub): Implicit declaration of pthread_create
+
+Include header file, to fix error of implicit declaration of
+pthread_create.
+
+Upstream-Status: Submitted [https://github.com/open62541/open62541/pull/76=
55]
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ examples/pubsub_realtime/server_pubsub_publisher_rt_level.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c b=
/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c
+index 0ec133d1f..da4289a81 100644
+--- a/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c
++++ b/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c
+@@ -7,6 +7,7 @@
+ #include <open62541/server_pubsub.h>
+ #include <open62541/types.h>
+
++#include <pthread.h>
+ #include <signal.h>
+
+ #define PUBSUB_CONFIG_PUBLISH_CYCLE_MS 100
+--
+2.34.1
+
--=20
2.34.1


