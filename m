Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDFACCFA02
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 08:21:46 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.54])
 by mx.groups.io with SMTP id smtpd.web11.10321.1761898899886024711
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 01:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=T5hcBy9H;
 spf=pass (domain: list.ti.com, ip: 52.101.61.54, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5FrLwc1zBhUhjVzuY4pveXqDewQYSvacV7kay760PPp+EiU2XCQy78tPuh/cI4SXM+fnh+2QBpVivN1dLbozEv96yRsYvyjDXXwEb9nkUV4xFS4r333tNbLFvUB4EDz1vcgiw5Elu7FeJMTj1Mtp3qofQPLodjQ371RRUmxRLgCWm6vNPsTcgP/7K3/w9ea5iLitMRH6Y3WKbYIZ6/xLwa+yKhvGSXyfSBpHlXfYN2gNFyIyhw+Zbk6Y6rrVBPQaFrGfrO+Qnzh/aq6bSwHRM4gGAL+/wSAf+RaSVg9SW2S9+oeDx10Pb4RpB0+nQWuUK/RNhy4+urQ38HEFKisLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nzqmwb4YiyXNx+6yawC8pvdhq8k3aZvR9YZT+tSUqNs=;
 b=aGB8G5yyUgwPH/U++og/fxAumEvd+eAdzTV8y2YVmzaBhi27fi2u5KuDuSxeujfzc+qkm78ndRUZyOeOqE397qKjwBGkEuQDG6eV3hCffsqsnOn33/EEhzhuc2NWYTZkXZEI5tjsHzqVWeveWokD7XZGSsmmyGpoK94GdB8X7rKctMKVixgYw0czbQAuQkNlqWJn0VPQh3yTGAcAVGmRzQREYaxuLrhkc6WZAMEoZfUf68UVTIqxFPCL+trbqthZJz5OiBhhx/cVrJvQP48SJ6GNY8X0EMEDSbGiQXBSnV23cSt+KGakTPDhLIEYGIPWokgvDbCVpY0MCdrT1pWwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nzqmwb4YiyXNx+6yawC8pvdhq8k3aZvR9YZT+tSUqNs=;
 b=T5hcBy9HnBjorH7p3e9f+eE3sac8NcXRcEUO4c1EkNDu86AvZ2gZ1n1meheNlY/eoTL8ykaT4nyKJvqLKiwpRndIUsvl6jaTZWNEZD796Ay2X0tLh6+PJR/mhzeOskrEloafR/bqrFtPY/jfWMxLo8BWU3BFCGTZbuDdhxY9jv6Q1Rvzm66U44gWPTwj49vYs1plz/EZgxK+7Bya5xEIDPE5vbgeJyDWnI6e9Z/qMLoYQIrzsgh9mpjemcdUj+TTGhVTVu+rZIixeT+u2368SHS3pWxeOCKQ1ZS8zG82D1plSXdA3VYnS+813O+F0gwlmWGVI56/wMuB7L6IjYrX3g==
Received: from DM6PR05CA0047.namprd05.prod.outlook.com (2603:10b6:5:335::16)
 by IA1PR10MB6736.namprd10.prod.outlook.com (2603:10b6:208:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 08:21:36 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:5:335:cafe::d3) by DM6PR05CA0047.outlook.office365.com
 (2603:10b6:5:335::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.5 via Frontend Transport; Fri,
 31 Oct 2025 08:21:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 08:21:35 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 03:21:30 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 03:21:30 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 03:21:30 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59V8LUAV3324928;
	Fri, 31 Oct 2025 03:21:30 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 41CD72A6D; Fri, 31 Oct 2025 03:21:30 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510310100
Date: Fri, 31 Oct 2025 03:21:30 -0500
Message-ID: <20251031082130.3317942-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|IA1PR10MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: b2df5a0d-cfaf-4b65-3df8-08de185681dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|34020700016|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?haYbUas0X/kZa/jI3NrKEghCNyEMuBds0VYU7EFoCpKFyANkaFwOj0SjxySk?=
 =?us-ascii?Q?4pXk/r8z54botafuFMd+SeCfu/HPAp+DOZ9cgR6zHhULXZiPzSXQ2+Rjlh+J?=
 =?us-ascii?Q?bIKfzqs+YDPN/qnGXNZIfsVQaocRfxBG0PKBqZO/7xcLD+S/76ylNwcx+Ocd?=
 =?us-ascii?Q?Ars1bdDBzR4CLTcSxdarcv3Q00KM8WyY55VkTAxpyyhgQT7PzrC1vcntut+W?=
 =?us-ascii?Q?EkKfB7isaTzDVZidXylpXKVG6jmJH2Wj66xalJdn0+QOl1P8dUA12Vvu0NHJ?=
 =?us-ascii?Q?eTqUOsmX/Y3C8Q6KPLYW72Umt70zxEP3Ax8G36POmGTDyviiwHQmt+oYdoKN?=
 =?us-ascii?Q?Bfl4nOWt3ADexLTHbzFNR93ty7MGZQvyYwrqJOGaW5T4oYqkaSl8t8t8iQ3Z?=
 =?us-ascii?Q?59yjQMQWWtmL7gw4wBxEyDJ9NGedEkhnDbODEgX9cKP/7lLiZYKojAFYeywS?=
 =?us-ascii?Q?K7uiVq7d3hcncPgknYyM13Q0R5JLqkgmrElcD31IHa+ETZ3AwzLVnbFIVV2X?=
 =?us-ascii?Q?J/87TL9ZeVFc6zOLME9IiQwjjJBZikTY5i9213NfGjne8yoCJ9/X8XL3OYUG?=
 =?us-ascii?Q?idDz5euhpMDw1LVfiFQ149oNVEFxPzykutaYZaWMyjlHw2dPvES9FUG4MPwG?=
 =?us-ascii?Q?0VEey1J4nga7DcIXFR/WB7Yemz0+JStsoffZkaaNEEUGAAk2JRVZNtE91HMZ?=
 =?us-ascii?Q?oWCm7b4RA9wWNLL1Kq2XESL7HdS9zerchhLyn6DpSPCiXiJv+CQ7hjhUSriR?=
 =?us-ascii?Q?bQFUI1Vd50OFFUhYslVc4FvbxzP2g1+W038dY3tqMe+ox4o0q7w35v/332ed?=
 =?us-ascii?Q?6Hdr0Y5//xktRRte37BYTqnLUiTPqZ3xDrY6DEL6yBHsEhEUGsLbeDT3rn03?=
 =?us-ascii?Q?2yI5g5NjksnEN98d/cLdEtq0yNEhcYw9w9FocRZlpyN8zrJHFoV6B/7/cpCF?=
 =?us-ascii?Q?NqzbcXG30zJLTegFQAMLXbTjr7O0EqV9wcnDhLDZEL9wGjTzRxK55Pc+9ujn?=
 =?us-ascii?Q?f5un7XQeP+c7k02Ft91hF9UqXw5qMgrTk/M/HuninkJHd/SIxFv9SCckj3jP?=
 =?us-ascii?Q?/3ynpX5S6+CafRsK7OY9ozxjXL5b36hP1gaVGzjjONPeeSAEnBE6Cy/RWVzt?=
 =?us-ascii?Q?cnFgyJnVCUChlCE64L/CHHuVY/1PF6HICtQfhQLT3e+SVTJcjM38SsMPJ717?=
 =?us-ascii?Q?9AiE3yV+flQTwPdAdtDGBthTzMkHZijU9Lm1pAmr6S2uJ3NV5tYESMZboDyU?=
 =?us-ascii?Q?12gO+nvRG8Xt3QGC9C8jT9mJCuuqYWLFO1cy+mKiSiLXyEMoKHhIZnW/MCkC?=
 =?us-ascii?Q?1QI18K5SIgaIYxLtJiK+ROoj2tC0xkqKXiqd3nokGmJk5Md60JgNvSkABobH?=
 =?us-ascii?Q?jQVCmAYR/9VnAatHv6Aqv/JmO/JENDQyreaI6pfsDUX555AmgF+B2d3hlf1l?=
 =?us-ascii?Q?+1qQJKUcsE/UdZEq0KHDDkgsvqhPFOpRxgx8t2UhAyJXKz69dRzdzaQ5g38c?=
 =?us-ascii?Q?nn41TmwEs98Dq5tnUkeqs77nHpa3c+fkTcCZ6eA3aDoBXKubsCsT0Pbmojp+?=
 =?us-ascii?Q?bgf+o/Jx78LywDKcBsI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(34020700016)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 08:21:35.7893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2df5a0d-cfaf-4b65-3df8-08de185681dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6736
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 Oct 2025 08:21:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16716

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D84666597750b5c68d903eb23cdd9b412c28e889b..d025cd6ccd407e7022bfeaa46eba7=
c3c9d29d933

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index d70e5c09..523d8ff4 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -9,7 +9,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "84666597750b5c68d903eb23cdd9b412c28e889b"
+SRCREV =3D "d025cd6ccd407e7022bfeaa46eba7c3c9d29d933"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


