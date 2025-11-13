Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10E9CDB463
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:50:34 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5636.1763074226264653733
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WgR6K3/6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.4, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDj4MZgcJ5s1s91uJf7DRu6YFFEjPgLqSDlFHlsdYNTIwXJ4jAEgmM5JNLQ6nRkofW1TG9QPMiP70AoHq0bYxfPwhJYE4Gp89fb92OezrI6gk6bGYyUr+q11Qz/G2OKN14EsB1W9CjLLkJr7aCfEJkgg+G0DJxZXpSIq8Dqtb+7bEolsRKo1e1wR8K4QHr9G783xW00n0lbBRqNCAEgPlAwBlXaba3wH3EjUOGBBy/a8uWR40Lua+9whqDvSn2/qUf6Jdbz0bRGvsbzXax5Os5xoY1vCzCM9d8UYd20sChSu3/sFxEfRuAVFhq1dy4NwDHLCdbT1KsqxBxk+2hxPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/2YQwdJT0kT6DI3l4O/FyBieE4/Z+5xTIK9fbta4LA=;
 b=c49ony8ArdZQY3MDS3aiPcy1mwhABcNjVNAC3V9P9rZS9ysQ5kZR4YUs1uDXrmpMWQX0CF37VlLeUvJ4tVk4aFbanSZI9LampQ/w2IqSacOpT+vb3L8TzNwfz24SKKUqL4nyrQA6P6eaa4hWz9C/rbpjxm+sEIoTdOgKqD8/G18e+GyO0sE2Yj2XJPgPsyw4WK+IL4TKmeW9pROefefqMl7CqdSY316yHyknmc1AgY1HPUippFuc7+2MuMNlrQa8Oc0+mlG2qpEkCz4Pzo3nL6OQeXrjDkZhQ7Fjg18LVdjY245WmHcjFVFKi9R1F9sPrvEeUPmgxAyYdDy7QqEVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/2YQwdJT0kT6DI3l4O/FyBieE4/Z+5xTIK9fbta4LA=;
 b=WgR6K3/6/wumJZ6bby0CZjOAnsjtUrvsNWznqTeehXU5QQi+JcnvHdxG96BRZv5IvrupeXNMe2K4BUzPh7/7uI2RbipQ13wrF8yf4tuNwlJ3AMGRcSBIKa0avy4D9eJeSzyNOF6TS8duEOPO2+jcB02U6hapeVDspIEXs+rYZes=
Received: from SJ0PR03CA0223.namprd03.prod.outlook.com (2603:10b6:a03:39f::18)
 by PH7PR10MB6650.namprd10.prod.outlook.com (2603:10b6:510:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 22:50:23 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::14) by SJ0PR03CA0223.outlook.office365.com
 (2603:10b6:a03:39f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 22:50:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:50:21 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:50:18 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMoH581018047;
	Thu, 13 Nov 2025 16:50:18 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJg8v-0005zw-S6; Thu, 13 Nov 2025 16:50:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 04/10] emptty-conf: Remove rogue -conf entries
Date: Thu, 13 Nov 2025 16:50:11 -0600
Message-ID: <20251113225017.22994-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251113225017.22994-1-reatmon@ti.com>
References: <20251113225017.22994-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|PH7PR10MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 1325c00c-dce1-4625-465d-08de230706ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zhG4aaI3QFVZk6rzpXj3gJJ+Vqao0kbYsSue+XzCd/+171Aqr14IeZwh+D4+?=
 =?us-ascii?Q?Z4nX2EyGyOwWMB6wZBCJyKbucWPmSEcRO9xQG5C887WkRxpdu8xPFvvNriJa?=
 =?us-ascii?Q?hPujOoXdyffzMaH+atSgB2JWzL3s5RgmBgaToLivx/rmycQwxoBl1n6EaIT3?=
 =?us-ascii?Q?iTswiC/4/JX8z/q07SpLqiqZcqTbq/8hlFeeXS6+//7SUCl/dN0qEKhtdS7a?=
 =?us-ascii?Q?pkE96XFnK9q2qYRRvV+pWzEXJMuHrHi/qjQZL0CvPXN/EkxVh75WaigHEh6u?=
 =?us-ascii?Q?5VhHPPuNnK31PgOw7zE2Ie313gRrmgG2bJiTo2xfghMUf1mMs0zl2TnsLFF+?=
 =?us-ascii?Q?sqsUfCAPauWXxyBHAepVB4Nq8/iwxy42XG4A7pliEAZjT0Th0hwQ7als4pvV?=
 =?us-ascii?Q?ZUi+J9WIjodI+vGxo+A8y85W5IctDvTkhSFBkbXpqWH1xPKjFBzOZK1ecu2j?=
 =?us-ascii?Q?1PoGELdpCXxXI4KFSYxUNw0Sp4NgzwckvGCu6JuyXqRiMQHRlIiS3mPralkO?=
 =?us-ascii?Q?PnBIVNwnBhKrdRT4BxTqCMw6riEhV9DDf3BviuPAtJ4K1GkzZU8IyTFHIMfk?=
 =?us-ascii?Q?fvcN94REmfQiPpnyT3Bcm0oyNzvyUyGaCC+1UISHGQ8Yfns7ZvMK0DedKUGN?=
 =?us-ascii?Q?NYBPsxHDaURyTivHtoV9VMXCnMULsdDrnsYEcVYAU+kgxSTyYJzwkPvKoMi7?=
 =?us-ascii?Q?uV6qh6nS0WXWj3WtqNcF2Fv0qNB+zOpEAOZFxEXeyq8vCr37lria/VDwREm0?=
 =?us-ascii?Q?pz6C/2cSRU7hC9i9yDUKQHqRR4VSjRyHqLrfP/va6qC18ZI0tbW9bz/wU5ZI?=
 =?us-ascii?Q?NO9VV1MkUmqfENKDdHl4W1XjZCTIEyuhA90L7xM2ldl6EUBUKN7qFWhHCrJS?=
 =?us-ascii?Q?TvXRBREcz5r83Gm/uNh7hmJAGufA0UJn9sBy9cMjlHqTt8ch3cyrzjQnIIo6?=
 =?us-ascii?Q?NZ84wq/PFYlM9tKxOcLwCnTm9soO9nRbXxn5Ox8eFWgIcEDgT8uBzKa+XWzu?=
 =?us-ascii?Q?QX8B/2tTQTxMvb4zG8YpoLfX56a6L8UXPwsF1SS+Nqmdc/jcC6U5xiFih36l?=
 =?us-ascii?Q?pxc4Q3pdhUKdbaKTA2nAGNG4JxZ06K4qWkOEtkieBKD4kqz3Xp4VgDQQ9YSX?=
 =?us-ascii?Q?ISw2pzJBKVW7li7/gAVEjvJ4UNDf6Tk69BJQfvlHjzkLWFlGXbey6VeIAbC7?=
 =?us-ascii?Q?d32ZTBzsIQETpk3w72eohwGq3ygnWqvbZtnXl3byzu5YmXFMVGVn2hfEDZpn?=
 =?us-ascii?Q?GPKNdmph/qKYuNRQpNTEJqOiRt4kNngNbo9JMGTrTu6xQ5k0SRhKMN1xGdEb?=
 =?us-ascii?Q?NS20CXorttTdNtm2AHAsLg006VzVPz+0NASa3ZfTbOZaC4iwvzk5z433A9aK?=
 =?us-ascii?Q?z4uk5kYenP0BzN9MmBm3ofllo0s2b0JVAnOHSggGRAO+b6KHm4/WxcEACfP2?=
 =?us-ascii?Q?BBL7/i51D4/VTaPQ22VF6ilbxj/0vlyF2oUggZlUXpeOWVVCLerGX5SLjXpv?=
 =?us-ascii?Q?JjmOQTAoS9bOCJofD2RT8h3mJpeKi1oLc9HMKZWuRqZKJ69jKdxe/jtxDwtT?=
 =?us-ascii?Q?i6fvs0GjB+VfM44Jdgg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:50:21.6159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1325c00c-dce1-4625-465d-08de230706ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6650
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16757

Since the PN for this recipe is already emptty-conf having the extra
-conf creates bad entries for this recipe.  This was caught using
yocto-check-layer.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
index 0aacb086..0b98e2e1 100644
--- a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
@@ -9,6 +9,6 @@ do_install () {
     oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-config
 }
 
-FILES:${PN}-conf = "${sysconfdir}/emptty/conf"
-CONFFILES:${PN}-conf = "${sysconfdir}/emptty/conf"
-RPROVIDES:${PN}-conf += "virtual-emptty-conf"
+FILES:${PN} = "${sysconfdir}/emptty/conf"
+CONFFILES:${PN} = "${sysconfdir}/emptty/conf"
+RPROVIDES:${PN} += "virtual-emptty-conf"
-- 
2.17.1


