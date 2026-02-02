Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFD6E7DEFD
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:17:19 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56534.1770049029742835289
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 08:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=oiz/JIrC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.66, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfIzS1oNUbCw5mibILLaCCJU1V4TBRIuldzsh9lYglruxQLPPvKwOdwD6ZBtVyd2YPTCW5ZfOgH60O29MysFbHQsJQtg2Odvd5UxAqEeJc59pfTbNoWZszPwK7OxyXhb/A82VW5LD4ilxp3a3zdoEYnEvcxRo0pO4zeUSsrUvhUe8J8rc3NLqu6E6YYD9yUs5OwkyeeS9sB0AByVRamni26GyLa5Yso7oQpSCW1LPCK4B7ljmjdqr0r3ufC/VcDdTpROh4A/uLPMU2bEJ0xal3Wj0YLEBk9rEXRMEp0cALMC6NbcNuueowb0iWB4NNgUHIfcen0rfCU71W/uFx0Y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1OneHwZ4198+pJSxBBzUPHhXIB94OPZli8GvTWbr7o=;
 b=YJLymuO0/39qyIaEjkrRjA/uNIP2kJ6Ez/QymKZlYNc0Kszp4P7M8L6R1MAnvfEYMuqbLdcLZbRshKNz+ZUo5Zyf8ZmTNNSc/zrfe0HVeQIV0WoxpHv4IxdRG9+r9FM2wN3hbNQtn0SWJ870cQWob921Wu3Pq86LL9l9VwRU0QUHhx5yv8+s9E8ytvM6cgdmW6o+wu58PI3ZL0DV8y0FUot0jVj2zaukAomIH0pId7xzNIQTgcn9v7M9PFcfu3Dkdc/Slm/RhqJJAnbZQsEfVkmvxo+jZYD4iguPWL49PKDhlwyN1GMQiBOxdi/0nIL8ry/CgEf+/uZXENpmO20KPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1OneHwZ4198+pJSxBBzUPHhXIB94OPZli8GvTWbr7o=;
 b=oiz/JIrC/3n9uqG7CXBblnF0BLZtlgraafYrV1gRf2Ven6FSfAFSCNbG/h8A4IoWlmtyaevSeue0Nbx7SCB3q9sNcy2qMnVBw3ruBxH0ozADkOl9PeeTYP6un4M+RYQ2/zOZ91Iil6ftbDW2+3d5TSmJYACszOTeSFeK6WhHJT0=
Received: from CH0P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::9)
 by CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:17:05 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:11c:cafe::29) by CH0P221CA0008.outlook.office365.com
 (2603:10b6:610:11c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 16:17:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Mon, 2 Feb 2026 16:17:05 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 10:17:04 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 10:17:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 10:17:04 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612GH4vI2451593;
	Mon, 2 Feb 2026 10:17:04 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vmwbo-000000014ys-2jyu;
	Mon, 02 Feb 2026 10:17:04 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ltp-ddt: Fix reproducible build issue
Date: Mon, 2 Feb 2026 10:17:04 -0600
Message-ID: <20260202161704.257467-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|CO1PR10MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b0ccc9-0259-4dc0-7b53-08de627681aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mvNfyHfTNNINpOI1ccPoaa3124gzTrxxk8FSsvLMAPvu7Uqorn0w0W/0Xijt?=
 =?us-ascii?Q?e6jXsBVOpBLtn9awgU0u7Az2k5uFKsIPjJ60ln3VjnbEza0IQB2Olb1XY6TT?=
 =?us-ascii?Q?qz2VL/H63C6cejIie3VbHCUuJr1sN+qcyXdErCahAbR5X3KauZyhH9YRr+5x?=
 =?us-ascii?Q?aQL5Jo5ZHGmVs1eJnv8u86JVqlQ/U6O4zaxox9dVEAgcd2rkSaUu6dUu9M3S?=
 =?us-ascii?Q?kQlbciVNoi+RVzGdKf8wTMe+n8hgJRvMLSsXAYDTId5AQ10lXwc3jM+w4gUt?=
 =?us-ascii?Q?BBcxGrKwJtWqd4ocozI5+Sc/SAmER8keS2MGAjJggH10TWRBuAKxY8TT+s5E?=
 =?us-ascii?Q?ppYOAZkfDktmrpQOiOzUpBJUChELTSVSBjgLohNmL02UUbkI4DtxWIJ/L75c?=
 =?us-ascii?Q?Yz7ApT+TYG+LkTqL/aso10+6ZHphtviOfNk0WhozL6JmiDSwz87Ryzj4l5aT?=
 =?us-ascii?Q?gl4rfSIGmiuA4oNtLJTG1jSOlWvAbEWUWQEg9tYE8pHs4d7aTlyUG/RqLMNd?=
 =?us-ascii?Q?PcbZoSU3K1JV2ADuTdU9B75a6DTn4YW983XoAVRYLwRftONQloQE9WDG/zdM?=
 =?us-ascii?Q?1Jlrj+PfIhqQJpalGUMa8WDh/3xiHHe0vO9/f+BDGj1LleukNdDmRJHr6aVa?=
 =?us-ascii?Q?qfo6pgLkMcydiVGOK4eL4DkRkLQKBLZ6sDRfUHesSG0vff98Amgx8WwH+xZK?=
 =?us-ascii?Q?wofaal9LT+X39/6tJj6QDNmGEKvLCCVI+YUZMACbSBX5pYMHydf1SJ+IZw3D?=
 =?us-ascii?Q?IEhG+0NknUNszzSVAgO6DDJyu2ZHGgc1YCUv4k0ycMXW84d0ZelzkBobTcqM?=
 =?us-ascii?Q?gxTzlzfYsSGj+lJaPI6jLg17l3VSJQraglWH+erA84n5QtHhMHmudhvHh3aD?=
 =?us-ascii?Q?lkv4AOZWVvO6hBX7seQYi+jZfFDTHU6RVuGWi4QdjvLLyf022ZzWbX505JVJ?=
 =?us-ascii?Q?fxxy/2dMRjNE4ww0xothWBh5v7ONxKgCC8E03fgUh+AEJRkqWR8lsze7CJXg?=
 =?us-ascii?Q?7sUxyLwv1IPDh8dbw7urjl3HO4hJDpRSFYeLTBNWJX+liQqzt3iagymJGAj5?=
 =?us-ascii?Q?bZD3KDWiwBR3Y9R38QranxwoHpR3XMTdmpy8H/iLkkb6p0BzO0FELy8TxPYQ?=
 =?us-ascii?Q?KR/B2IEgYY6XkXMrWCGK4UxWDnFW0852bn17bBF6PAAzgKhOZhAQ9HhQI96H?=
 =?us-ascii?Q?5sqCE82PXIP8utpzJ6m0+14bUQmJV6eX8unlYqsVJm0E9eYtJ5NPcK7oBAg2?=
 =?us-ascii?Q?WeMXJagG3DmlGC97rxc5gCm1JoCrd/1FfgujVaRuNv96KGN7UTXz+ohzn2I9?=
 =?us-ascii?Q?UAU3wsfqJQSnRrX/1bQdKBA6afo9ZPIHdFv55nvWM2FKb0Dt7pTgN+Jz7dHU?=
 =?us-ascii?Q?q1z0Y8Re3R0/wiLuGTrf7Z+YOulzsgyCndLWGhz00SBtdhmc2qLLc7g5s7Mj?=
 =?us-ascii?Q?LCc+nXCdtxEH5JlpgYpELnHCO7JGVhuD2klizyyVBiSnWzBxMXFs6L42QPW3?=
 =?us-ascii?Q?XhiOIvuIf114qG3dxadZYnF8xF6oR4MnO7Gg4hMd+DZka63HxkphzdkRlXN8?=
 =?us-ascii?Q?XlYSW/1pmQ0LewCdse19X+4wr3U/CBTJjgjr3YPMU2FQ4983ggd8KHMvWVsy?=
 =?us-ascii?Q?zMugszE798S2KXLG6yOYAcixQz9AIONh5mVBEa1N2aYMHFfbwgUtPS4YxrVo?=
 =?us-ascii?Q?G9T+lg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1YwRmhDZuo8r1yGvplI2vGcl2DzhhPtt9w5FdaYZUdSabOkxEW831szG9Zzr25702r14XLGNeumMBG4ysg4G1xiRpZZWrTJJZt/fM8NC7XJM/JM3WRy+pxkFh2Jg1Aoa5nkfKzhoB+2o7iSnt2y2gjKEE5YHGoLnenk71ko5BJC26jFKxjx8onzV2rhMskW3EEo/nfftq/riHbodAWzdB3FvFZiotXa+2GKbKzop3zK/K034IwqfPmJQayUXTmlcUVeIQ3otQOttmcYZ3W1Z00f94JqnLhfoj2kTW4MZOAZA5UEmMMD6E9DhxPZcGC0+WSZsBYRwVMosinvneabyERxV7il5WIdFT2nmbquf0oIwYOyvlniBNfzOgQBVE1klaAiaDXPVGSmQoo8PHWEZRjVRpzRqvNG4+cW6hn/qOY5dKe2JKMCiX7WT5VoEFiR4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 16:17:05.3329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b0ccc9-0259-4dc0-7b53-08de627681aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4561
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Feb 2026 16:17:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17063

One of the tests "wdt_test_suite" has a reproducible build issue.  The
patch has been submitted upstream, but will take sometime to propagate
down to here.  This will be a temporary patch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...t_suite-Fix-reproducible-build-issue.patch | 33 +++++++++++++++++++
 .../ltp-ddt/ltp-ddt_20250930.bb               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-w=
dt_test_suite-Fix-reproducible-build-issue.patch

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test=
_suite-Fix-reproducible-build-issue.patch b/meta-arago-test/recipes-devtool=
s/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Fix-reproducible-build-issue.patch
new file mode 100644
index 00000000..243a0b74
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-=
Fix-reproducible-build-issue.patch
@@ -0,0 +1,33 @@
+From 438c30f5c8a37df7334769d345b6dff574961a22 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Mon, 2 Feb 2026 09:52:27 -0600
+Subject: [PATCH] wdt_test_suite: Fix reproducible build issue
+
+The Makefile sets a value for CFLAGS that is not overridden by a value
+from an external build system (like Yocto) which adds the correct
+prefix_map options.  Change the settings of CFLAGS to +=3D to allow for
+defaults from outside.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ testcases/ddt/wdt_test_suite/Makefile | 2 +-
+ 1 file changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/testcases/ddt/wdt_test_suite/Makefile b/testcases/ddt/wdt_tes=
t_suite/Makefile
+index 3625ba373..11e40e8c3 100644
+--- a/testcases/ddt/wdt_test_suite/Makefile
++++ b/testcases/ddt/wdt_test_suite/Makefile
+@@ -12,7 +12,7 @@ UNWANTED_FILES          :=3D Makefile
+=20
+ INSTALL_MODE            :=3D 00755
+=20
+-CFLAGS		=3D -g -Wall -D__EXPORTED_HEADERS__
++CFLAGS		+=3D -g -Wall -D__EXPORTED_HEADERS__
+ LDFLAGS         +=3D -g
+ INCLUDES        =3D -I $(KERNEL_USR_INC) -I src/interface/common -I ../ut=
ils/user
+=20
+--=20
+2.43.0
+
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
index 613ff399..9b2be3e5 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
@@ -16,6 +16,7 @@ BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
 SRC_URI:prepend =3D "git://git.ti.com/git/test-automation/ltp-ddt.git;prot=
ocol=3Dhttps;branch=3D${BRANCH} "
+SRC_URI +=3D "file://0001-wdt_test_suite-Fix-reproducible-build-issue.patc=
h"
=20
 export prefix =3D "/opt/ltp"
 export exec_prefix =3D "/opt/ltp"
--=20
2.43.0


