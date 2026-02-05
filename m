Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137A5ECD9B5
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 22:56:24 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33816.1770332177352683491
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 14:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gj3TDRWK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.10, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAVjNOIUC6txTpq1lqYQzHux2LHnw+66+8z2YsvZveWp0Z2TQ8+rVNCEVot4rcSS09O9zAymSSqC+o1Rv2V99NkXrx3eBD0OQF/a8bnL+gDL+FyQtIT8mLAng4wLYQLtElkJ7mAYZeow+Dubq3yUV02sFD/vFw1xzJFrXjci8YrwBk5ycSR/dwYkFAm5A37odbSj8zMa7POyZhrbZTe7kjBLXms00E/oqRsj+eRrwtgAJ6csBHLIOLFglV8GA/5g8FCgLcZ7F3dF/iF9UNyjJLkAmR2rNDEGomYy00pX4sNoa12E+5OlPK8qxYgoGlMifkPf0RHhDjshN54mg93RQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQWdyVkjKtb1/pF4khkiI6RDUoN+sgPKRuyXnhF4vVY=;
 b=nVfvqn0sUhqbTRnqU8JBKwbLbYndRTsdn8RqJfUsfZ1J+0ERdfEOHR6at83uhehG8rOtj9Wcw5tbw9omqZKMvSmVQofLQQt1vxlWn+sPpwTDK88xQNtigFoGE6SX9XsHSG5ykB44Hx2FkqyxOmhOFrEGCHe89YBWIyAVo/fQQEUInF0EqMGLB/1ubiCEioFzX/s2T1uY6XIzYBFX4naaX+oOzMfkeXDdn/UIGYsm4Jmbc6q+nLjC2na3XlwfI0cdF1iE4FucrgkxNl5cOHTMtxqNfUWTZHBG/BAdOEGWQbmP+vMYp6Uf4pWt9vGm0y8cnQpauGXW2/ugJWEv1Dd9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQWdyVkjKtb1/pF4khkiI6RDUoN+sgPKRuyXnhF4vVY=;
 b=gj3TDRWKayl1pXpTgd+SwtFBHHDZRDP8v9E9uNjpJcqnkOjftcjyAqhBiBc79CvHCd4NPUOdbBIGN1hmF38iDzB3tKhioARAW3J+AWDetU5889yV9fvhoiPHiLa8xNqi0ZAcSeWipYAg/gba32A6PB6wBS8AKmcRfDhFFOmH8dQ=
Received: from MW4PR03CA0281.namprd03.prod.outlook.com (2603:10b6:303:b5::16)
 by BLAPR10MB5028.namprd10.prod.outlook.com (2603:10b6:208:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 22:56:14 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:b5:cafe::f5) by MW4PR03CA0281.outlook.office365.com
 (2603:10b6:303:b5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Thu,
 5 Feb 2026 22:56:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 22:56:12 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:08 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 16:56:07 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615Mu7v6034061;
	Thu, 5 Feb 2026 16:56:07 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <jcormier@criticallink.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH 3/5] oe-layertool-setup: fix config template parsing
Date: Thu, 5 Feb 2026 16:55:27 -0600
Message-ID: <20260205225528.92769-5-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205225528.92769-2-rs@ti.com>
References: <20260205225528.92769-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|BLAPR10MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 61883118-5501-437d-2ba0-08de6509c296
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FIbvylZ7+Q+VoF3STpOrBPsLgQC3G07mhMd7PA1C8GGsduBc3XK0Xdq/RRXJ?=
 =?us-ascii?Q?K42qDTGyUQyzursK3L5yPFRdZcU2OuaabcUVhq0ETpXwltOfRtxEdjlt+++X?=
 =?us-ascii?Q?Fc/BJrcRIFfHacY5pZPWph+eVx22/Iqi2Ojl+2u/s4Bz0H9GGepGlNpzGF1x?=
 =?us-ascii?Q?BFgMKP3IERHICO/0SNxUJPdPxd/H512rCf7x1a8zbZApn0jTOo1c8cftQ9Eu?=
 =?us-ascii?Q?3CHEBYOUaIR7EWiVZ2/WqIbAYHEMP5GVTBsGnxlbS/PobhB1Y1Zew4V0WTRd?=
 =?us-ascii?Q?J/gJKkgpViesoxlvNOMUzLIUn3v35ab74ZPfzoSL8i/TSY2kQVqWeQ3GnAOA?=
 =?us-ascii?Q?2+9VE9knwRYFS7OGOUCSXvoffi941wWyXJZR4SF5Eoba3ds10E0EQeTuUXYi?=
 =?us-ascii?Q?K05Pch5Nj8LgEJEm9NCFd6lVf+QHmbp2LdvhStKFePnFJDBW0E6IlEk7TAca?=
 =?us-ascii?Q?tra8UbySNq6DvHNQ7kJlO9Nfejk92an3o8KhjL+AK7X5hH/8E/X467nPAsqN?=
 =?us-ascii?Q?IMU7fO39urLtQxDCYxNTTfylIrWUoQ0V8Cts1b5FyeIHyxpPuWzVR/ZcERH/?=
 =?us-ascii?Q?mHYB9p+5eJQFvL+1wmemrUMGgLbz8nzRFBF5gl+7I5wnWnM0w7d/e0PV4ci4?=
 =?us-ascii?Q?14SNGCZrTYwuZ7LMXtTDf+fI4bF0re3I6F0ONz5tLWr+GePkM4k6E4inK+Na?=
 =?us-ascii?Q?Ugli1rxqF7Cmulyu2rqIDpIA7JQC7CBvIytiWg/7N/HLPpgD6v1xYAvRMl98?=
 =?us-ascii?Q?k6+WyTEkns+U9343i2td+tLfQKzsM7mzXQEwl4yFtVDp/zU6auKOVcGkyT3S?=
 =?us-ascii?Q?LgqN5kQbtrbVJ4nRPAUXZGeHWpBL8B1BwWJsJhFaZhr0JaXVG42feBX+jgy/?=
 =?us-ascii?Q?1QUYn3Dm5qWe6Vjj5mKsrT1OvQ4IbEDMVHXvM2S65AfL/DPIbV7Uk/sAsLCI?=
 =?us-ascii?Q?SCnKy3q+CqdRkomXxGOo34Oa6mtBtcTxLWrCaQoqQSYfRNuuswO/LsymL8QD?=
 =?us-ascii?Q?ZL9UXUXF6Iqu+XdBq10A9SJdlgHSXQ0Cut5odrRoj/JgkwfusLKpN+ZBbKSc?=
 =?us-ascii?Q?vOyS/sH7r2NHjO+z5STJT8BCGDKQKhBVc5gjpuLS4PO9aW3s2vZS/9Z9qg5o?=
 =?us-ascii?Q?Qa/qwjWTLqyqcHYLqDzS5otDLDe/UGi6kMcjLHvssc0CVxm38sJG/nnc6pa7?=
 =?us-ascii?Q?uP/xtQZz8eWZ3l0SXECDcOUU9fKXYk3wdYtgYg3wf1/RwnmW6M7QMQU64zwW?=
 =?us-ascii?Q?EemOxG/ML6uCjkivyHbvwKbN7kq8Tp/aLvbNzi1D3sQ6SeAZ8WcReR2euJ/C?=
 =?us-ascii?Q?XzynHNrJ5oQSK7UlZonkIKUD9mlYONBeCx8aDP7tthfGUs6VCbOyYBt7tPHt?=
 =?us-ascii?Q?SI3rzWGB4UI14udF0eZdUy0fkin7e4E8DeBcwvs2A/i66oZsZ70EW2d8FsI7?=
 =?us-ascii?Q?VqwM+KoiXiCU/Q6UbL7HOpWqv6VoZztFtl1mMBQppSB+hGDF5xygLzZr2u+s?=
 =?us-ascii?Q?mtaVIPwOLLXsEzodEtC2TGTWML0VuxMlL3T8m8Y3Q6gbBLk9+psqs5Id+nvw?=
 =?us-ascii?Q?7C2LLkF9VP+esCxq8X4YhjNyO0dCpHtArhDkxzhoBeltBtKL1MdCgaDk1FD0?=
 =?us-ascii?Q?A13icT6EP5pF1FxxlPXGvXg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1lrL3Y3IthATl0eToeqERbwvFdvsTvzvHqa5Nr746RBp31mpa8wtztp4nmp0ozp4pSLolTFrY34sgAguSL4/itD8EgN9QBzfqMSXpbhS8WL08TR/8zV/i68EsgNoa2+SSbrxjXCpPAatneUpKCf0pIFUijKWDtevoO4EvUcwYiSUpwWkLESgiJiGxDPzTlBr76WEtUzivSHLA7lbM5JxlPvfF3P2bDtzTrL3H4NTLs8MGVCd7mo1KC+XUcWUn0VL9kIKrGd8l5qxjQrpLRTf9CYeWwIBozQkVPlJWttDA1PVVD7Z4fsaYy3ucv04N2eDGEVbqP0294LvxoxQKTczbyMRLw05U7bfHVTAZUIUIs377CNPiBKZDEd3g2GXHQqDeWAiQxR9CM2JuxyQnhBN3KuV8SR9DiSnj6lniGwQUb72J0NggXBHGQ5taek0L8Jq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:56:12.5613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61883118-5501-437d-2ba0-08de6509c296
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5028
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Feb 2026 22:56:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17090

From: Randolph Sapp <rs@ti.com>

It may be possible that someone submits a config without any templates.
In this case we should not enter an infinite loop, nor should we try to
copy empty strings.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 oe-layertool-setup.sh | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index cd6d04e..979390f 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -658,7 +658,7 @@ get_oecorelayerconf() {
=20
     done=3D"n"
=20
-    while [ "$done" !=3D "y" ]
+    while [ "$done" !=3D "y" ] && [ -n "$confs" ]
     do
=20
 cat << EOM
@@ -713,7 +713,7 @@ get_oecorelocalconf() {
=20
     done=3D"n"
=20
-    while [ "$done" !=3D "y" ]
+    while [ "$done" !=3D "y" ] && [ -n "$confs" ]
     do
=20
 cat << EOM
@@ -765,7 +765,10 @@ NOTE: Any additional entries to this file will be lost=
 if the $0
=20
 EOM
     # First copy the template file
-    cp -f "$OECORELAYERCONFPATH" "$confdir/bblayers.conf"
+    if [ -n "$OECORELAYERCONFPATH" ]
+    then
+        cp -f "$OECORELAYERCONFPATH" "$confdir/bblayers.conf"
+    fi
=20
     # Now add the layers we have configured to the BBLAYERS variable
 cat >> "$confdir/bblayers.conf" << EOM
@@ -806,7 +809,10 @@ EOM
     fi
=20
     # First copy the template file
-    cp -f "$OECORELOCALCONFPATH" "$confdir/local.conf"
+    if [ -n "$OECORELOCALCONFPATH" ]
+    then
+        cp -f "$OECORELOCALCONFPATH" "$confdir/local.conf"
+    fi
=20
     # If command line option was not set use the old dldir
     if [ -z "$dldir" ]
--=20
2.52.0


