Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56253D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 18:41:06 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100.1764614456974271552
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 10:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OvcvTY0K;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.46, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnjr9vlTYs0nuKXzbYEuG8jhGhOB4eWdqoEA7uoqbZGEZWMTSB3/OJwlll5M++qVJjw5fQMgx7l8p6UpdFBjxVDRO7njYgViCprHmX581W5gy59fjbhJKT5wxU/zuTgqErR0YkKlSeC6MBouKYCUYRlGdeoMIHoFk0qJYxpMJOyphcXc4YQCmzXC7i5x9dcIMBKbnYv01i1PfpZgLjrfF8aXxfRwll8LBJFxYoFU6cNga3BEAnhY02bf6CVfVgyBApOmyge+hrj8bZmGI5MQlLVC36vdxMP/gpV9kboNsyiJOhxV6K4h/x3AHwa7jkZ1s/z7ruTtq7E6+nynMIP2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhKOZmrZQXOOno+iJ7cWFVAm3pb2ElPHofsD+VSpel0=;
 b=e7cxyiPVYnivdsNb5DXOcz6B0AtUGarbhiW05mrzCMXBka5DQex9Aj4IxQmbDNNOnS7AELDhmG5rLOTIHFaXWM9fJqGmBy46CPfz6R+2dxNMzmX7TZeMrC2sxmEstLT/jM8HsF7Yks57p88Ct9tw91tnqCgE5zvxPGlPRD1Vt6VbCUt+jOQDe2BrPFYcWiH2ymxBDmwBpzvvNZvkhNl/dA08mgYH6cH+VXjk0a5ZVU2MvoNAhf7cbtQmxwmK67cBIL8HpT7C/xhVejicWwYtaWoVKK+zLq55pfOIFY44x2oFY17KjrPuzr+PPZ3dcgQeussY4xr//0inUIAPFsMAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhKOZmrZQXOOno+iJ7cWFVAm3pb2ElPHofsD+VSpel0=;
 b=OvcvTY0KMgcYKZ27G1EXyRNchH0pXxx2Rd8l8w0SWV/u57JEaXcrisuD1O2Dv0t1+3ZVsm/GrwUj+BIt4Co9qmCuRdUmOX7RPgm0fRLEeMsmcVncUNkRSkkxHomVxtt/yEbqnR4ESX0gkBuWNf4Y0QiIGMdvXq37kWwn24OVbB8=
Received: from SN1PR12CA0074.namprd12.prod.outlook.com (2603:10b6:802:20::45)
 by IA0PR10MB7276.namprd10.prod.outlook.com (2603:10b6:208:3dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 18:40:54 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::17) by SN1PR12CA0074.outlook.office365.com
 (2603:10b6:802:20::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 18:40:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 18:40:53 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 12:40:50 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 12:40:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 12:40:50 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1IeoqY917764;
	Mon, 1 Dec 2025 12:40:50 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vQ8pO-00000005kqP-0DvH;
	Mon, 01 Dec 2025 12:40:50 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] bpftool-native: Adapt bbappend to upstream change
Date: Mon, 1 Dec 2025 12:40:49 -0600
Message-ID: <20251201184050.1371702-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|IA0PR10MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: c357acb9-21d3-4c94-84db-08de31092881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vCTGNMJjzmXEIElHTCazXSiOScoMAT4CYjQklJg3NQObo3Bm0zbT8/BMg8lD?=
 =?us-ascii?Q?5mlV1ON7+X6+zP5qI/OPS2pcnCUznXeJvrlLKRHkK6yfuWg2YW0DM0wDVN9d?=
 =?us-ascii?Q?XVKGOZGqA2D84KIg6Rm/y2+iPSkSLbxz447I8vYQBfIulo9gMOTm3pt1yDYc?=
 =?us-ascii?Q?1C4Q17h1IIaDNrOnbZDOyTo1/0RkJyjgibalv6sm+rLRwyUrJx6LpEEN85vI?=
 =?us-ascii?Q?iY4lBzWbcTfgMSqsGWSznHjsIorY3X7Dmsa2CMUaNsxbgJIsYZF2GCgxtsli?=
 =?us-ascii?Q?EocnJC55lctBtCNx0lJWN2n00eWeSNIbNT7YC4UsGi03EuGMseMwZegSonhp?=
 =?us-ascii?Q?ymtGsaa4YVul6Qd0SfqmGsf5DO+VqvU4ZS58gM9Qd0py+oa5rphZK5PeLrIb?=
 =?us-ascii?Q?gJEIPw2Z3swHTJWNPLwaFGzn+VhUMYkeK3R5iW/db6DcHNUVoOwJ5C1dU3kw?=
 =?us-ascii?Q?iF0uzVTz5xtQ7YYv5I3r5bdz3DWk644Zum6/pEFnLB61X/PMLUPu08UTb+oi?=
 =?us-ascii?Q?GZTXPLB95uVfl0bY6L+qHLupje/PxbsLZSnscm6Fnwr8Q/C11zwHykiF/jDa?=
 =?us-ascii?Q?r4JblzvyYdyPsgCBPvpnSty8S4J9/81o1XT7619TK250uPcIOwVnCyCGW25k?=
 =?us-ascii?Q?mj5UO9sW4M5tW0P9/tHTkd81SjR+YplFQhgv/yxDOmxN/WjandBauGXJC9PM?=
 =?us-ascii?Q?oBMCo629RH8vGk7w+0l7rl0g6eyGna4k5fUufkmFC8dS+/tC6OUviF6GXJZH?=
 =?us-ascii?Q?cYKzrCjmFlzifV486d+cFRWmPlH1ES3J92IS7FHhV1JTwt+Vnr9RXIjp6Y1U?=
 =?us-ascii?Q?E96rQ7fJ9Nxs8tkznr5TmFUxCAjL/209xGZv+For1ABjYEnCmej+cbJOwya9?=
 =?us-ascii?Q?jqmYkZVjNTfGour0peSBuLHEeTy7k6+lrhY1l+AUlnLedmmmV7lR9Z2wuQCs?=
 =?us-ascii?Q?SeBEW1TN45JfY34n6IL0AclxiKO+c15iMPQTluHDPQHAF9LeciCovAifM1T1?=
 =?us-ascii?Q?u5puyUuH3O2sAEFCojNJYWSYOEEa1mVy86pbYrZ6qGXup1ODbH81+fvZtaNi?=
 =?us-ascii?Q?PBP2P7UkqOs1ZCIoLKXTMoI7pYH4SXxlfZuHQxBZN2jpY8llX3emrRq15I+q?=
 =?us-ascii?Q?fnI5Nt2VgQUWBbutrcMnvxR0W56fl2HG/P0sXYfAdoKSnxWzIQxEjLlBmcu+?=
 =?us-ascii?Q?jn25+BraqMJDfLV7fTMfEUcVAZ4ikD0Jo2X3njepVv2ZCzNSDEMW9HsoTCAE?=
 =?us-ascii?Q?hrYJknxrh0/hXaGRKdibQ4F5r79YaR0D/hSVNh/61EewBvergZcLPj9+8hcy?=
 =?us-ascii?Q?iZtLEgaTh5VPonJ2zJwIWXngTNs24LvEXhr2R8SUAG21nQJR7k0Vo9O83wJ1?=
 =?us-ascii?Q?ohQQSkw5BhLyN/zFBTxOqxGkh/nX+j70ZVZyctEJtDL1SKOs1qwcMbGTWNU7?=
 =?us-ascii?Q?z7Kn+D3qZIgIqHitOmtLhiElhKfHWGmj/MfgyyvzldZshZsAACvf/B/yTkrs?=
 =?us-ascii?Q?l+0eUen9d/45/zG4LAnvvxGcskZKM1X4aqKJq8yXqv9HxVeo9ATfRPcTpYlx?=
 =?us-ascii?Q?69fOClydWMXyUOM5D9w=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 18:40:53.6718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c357acb9-21d3-4c94-84db-08de31092881
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7276
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Dec 2025 18:41:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16841

meta-openembedded broke the bpftool-native package out into a new recipe
[1].  Our bpftool patch was changing something in bpftool-native, so we
need to rename our bbappend to match.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3D6d3a6503720=
b10b0edd6e70ee3595032e0aa975b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-devtools/bpftool/bpftool-native-ti.inc            | 1 +
 .../recipes-devtools/bpftool/bpftool-native_%.bbappend        | 4 ++++
 meta-arago-test/recipes-devtools/bpftool/bpftool-ti.inc       | 1 -
 meta-arago-test/recipes-devtools/bpftool/bpftool.bbappend     | 4 ----
 4 files changed, 5 insertions(+), 5 deletions(-)
 create mode 100644 meta-arago-test/recipes-devtools/bpftool/bpftool-native=
-ti.inc
 create mode 100644 meta-arago-test/recipes-devtools/bpftool/bpftool-native=
_%.bbappend
 delete mode 100644 meta-arago-test/recipes-devtools/bpftool/bpftool-ti.inc
 delete mode 100644 meta-arago-test/recipes-devtools/bpftool/bpftool.bbappe=
nd

diff --git a/meta-arago-test/recipes-devtools/bpftool/bpftool-native-ti.inc=
 b/meta-arago-test/recipes-devtools/bpftool/bpftool-native-ti.inc
new file mode 100644
index 00000000..213a0f4e
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/bpftool/bpftool-native-ti.inc
@@ -0,0 +1 @@
+DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
diff --git a/meta-arago-test/recipes-devtools/bpftool/bpftool-native_%.bbap=
pend b/meta-arago-test/recipes-devtools/bpftool/bpftool-native_%.bbappend
new file mode 100644
index 00000000..3d084dcc
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/bpftool/bpftool-native_%.bbappend
@@ -0,0 +1,4 @@
+BPFTOOL_NATIVE_TI =3D ""
+BPFTOOL_NATIVE_TI:ti-soc =3D "bpftool-native-ti.inc"
+
+require ${BPFTOOL_NATIVE_TI}
diff --git a/meta-arago-test/recipes-devtools/bpftool/bpftool-ti.inc b/meta=
-arago-test/recipes-devtools/bpftool/bpftool-ti.inc
deleted file mode 100644
index 0310ebaa..00000000
--- a/meta-arago-test/recipes-devtools/bpftool/bpftool-ti.inc
+++ /dev/null
@@ -1 +0,0 @@
-DEBUG_PREFIX_MAP:remove:class-native =3D "-fcanon-prefix-map"
diff --git a/meta-arago-test/recipes-devtools/bpftool/bpftool.bbappend b/me=
ta-arago-test/recipes-devtools/bpftool/bpftool.bbappend
deleted file mode 100644
index b2dfa9d5..00000000
--- a/meta-arago-test/recipes-devtools/bpftool/bpftool.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-BPFTOOL_TI =3D ""
-BPFTOOL_TI:ti-soc =3D "bpftool-ti.inc"
-
-require ${BPFTOOL_TI}
--=20
2.43.0


