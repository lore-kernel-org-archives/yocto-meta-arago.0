Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54A7CDB466
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 19:44:49 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5502.1782157481936400657
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 12:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Hd/Jd1Ho;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=scLyeuQg;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65MJaG103678998;
	Mon, 22 Jun 2026 14:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=3Ve6BcH16WPhg
	RwmP8Jq6hW2x9Gxypiapsx4FYOle+c=; b=Hd/Jd1HoYDbgTVjbN1IM4PrH/wx3K
	8KneeHxb0eOWjGQ+GZ32Z40bVWczR2mhBWkr4/rcI3YIWhpC5GZPxbfnTPgORt89
	yRwXBsw/4/ULgCVts1a9bhznpABXt0C8ejM2ukMrUAzNKClqfbYwL/g7Vl7Sjsgp
	uOyn34XcSViCHC/NCEB+BtlhvX+F+hvxs90MqQjn0Ujp0UsZgE4Y0cNn0IKu4NF8
	kv00vyBHEkWrtDvHa8AamTDs8XfTwCYAUfgWgfut6BeCwjCrhq/rCKlA3pGv/ZzI
	smLj7miGp1zImy413lD5/QpceREJNKcF8IBcM8h8nzlI3i8XWtNkLh39w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ey04ec3c7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 14:44:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN5J26C/52MzTRqYdwyfHAy11MKaYG0P0vHC4IOTufi2scU9Z5JXD7zrvmhqIx3v93ycCZ/ITJ671xwg9yEwAoYttSM2VEYd1VcM7utLthe0wrJMYOoGWzhKsmzV9yLMrChTm8ScWOaxg9fHusL5AhRBh21EWr29QxU98cATyD7ysbwNagjduCg2ny7HV+RRg9terJkRpKNTGJoZIY1gcrJARXO8fyUVYzcKoPQYncXKowUhjJkfJwkjJWdi2UmH5YgUiOytO3oD3vgUWLK8A+MWrsqWIg2PDE2oGAi3nkQYfFRU4IL5EVSvn32L1GJVopRXDgpU8qGE2gsEO2G5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ve6BcH16WPhgRwmP8Jq6hW2x9Gxypiapsx4FYOle+c=;
 b=W68a/j8BDl6M6ZkJNQsZZis2/+HhvPIwi7HsIRURrL1WQBG0bNRYX/2dfPIxZFCEMh3IGMwyiVVXJAkiMkamDcm2WfNS87eqLLPS0DxGz3exBKS2owqVltqe1WaZDHzLYONe7aVHiChPzYqENGduZIbf9TH9W6WUR2OyfDHJC3TTx/lQr9DkWrXu/mLYrRJfYF6fwbInBNIo3bVW7zNM18432NjcSJDBPm7xgAPaQy3HKYFFLPBA5GCorxHz/qcSefqM+rpCgBlvdB0cnYNjIjutfHjFHfMXD6CK21K4yjVQUEnYb0UPEjkrTn8AYY/WE55NjPPlsIO5i/0NhcwDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ve6BcH16WPhgRwmP8Jq6hW2x9Gxypiapsx4FYOle+c=;
 b=scLyeuQgeu6L9MEYfOWaqUAxIzTVn7gNuUPoikB1O2RxA13i9Yg3QkDg2TjdFDcPkT220w38RO+/4UB7NlSMuJUStcfXbSbyzdXxvMHzevW9V2jRUZQulHCXQcvJ4Dol10cWy+UkOnm4HPV1sP0WuChKI5FqzHJF6zurs8sA+I4=
Received: from SN7PR04CA0062.namprd04.prod.outlook.com (2603:10b6:806:121::7)
 by IA1PR10MB6097.namprd10.prod.outlook.com (2603:10b6:208:3ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 19:44:37 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::42) by SN7PR04CA0062.outlook.office365.com
 (2603:10b6:806:121::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 19:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 19:44:36 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:44:36 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:44:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 14:44:35 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MJiZks1215811;
	Mon, 22 Jun 2026 14:44:35 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wbkZP-0000000ECex-3B25;
	Mon, 22 Jun 2026 14:44:35 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] packagegroup-arago-base: Move to libpcre2
Date: Mon, 22 Jun 2026 14:44:34 -0500
Message-ID: <20260622194435.3385168-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|IA1PR10MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: bb87c03d-a9c7-44b8-a9ad-08ded096b13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	c5GE2IAHyxEkMUwmBdYyEXHudW1Dhr4aWeoeutabcVraESo9oCkup1ur9u+L5qDw92GaPQQccQcmZdJZld0ax9pzXrruLzCnm9tseq88WH9hvBDtblmehbLaGixoY33GYu+cpChNkNgH8g0J1VGe7/5yiEuNcJzU9M6RIW9RWn+NdreJW5BtlgKr1XIXs8/oXyuDGjRaGt3ddIz4bn/+1/QPWhtIuaAq+ggZK6gJ2ZNZ7YGXCqhZZC89Ox2AkIkyUWb/VMg8f0iEcPcr6wiSq+iuvojYoi+mys2HENafCDvAWq+qMPMUJwViYeMKKtwr7BUkC/6/PwSOckHJzylRgmVEyZCe7HeY7suh/F84rLv49ba4/6s/GUAUqLMU449QKQLqMitbP12vboUcjxJjKGGqCyAZGVFCknNxM9ehtWP/5M9PnL1jv5LJpbzkDNZrI3/SqFe8hd1bq4xDMZqzDWpj8d7Dc/nf01Keujc/TMpLBi2BAF4U9wvw2miZwImrMOx4jnTGZynV8GlKER5gIrPuCG4E30DfBDv/g9bVwY40q4P13jALcSL4kOagaCyr5yswuSauedgKm2PJR5DkSeVjeNmI+5Be5SBx6TXJhluNOxyjo45BddtgjIhkxFrm/iDm2TNSp3PB+erzCmtLLXRpMK1xB1OoUBa7WOjFmvPD6/3W2gE85LzwsWSxo8yRpOZdenIoIFnwgNKHDeqXwA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/3p0eWDkgjddNKu3+BD5OHN2a41uEwxQNQwqUwGtuAm71z9YJ5cgHg/71Cu/isPFTkvXRMIgHANo3dlZ5L+HHd+YDYCFOb7EzK8zpzZUG5iKPK66vQHhJLsbs0svUi0Fv/mGBwAlsp+V7JtEx2oBBaS15ue5r5/uMaehYSp44QTldaD57SbCtbsknbgkDElHMPcBXSdsjmfDQWQ7D7cikMQr0On7bIfeng6BHN1y7pvAVVxgb0PNn3oUunqgBB0juZ29ovn21Df5EPS5iRxMc+jIk7eJPqU6oMqtbDyDhtx30mdhLTogz9KOXAgYBtAeuQ4XUsb6suX17QEpKTwvts+k6zwNijmwtJQjHQReQkYVaeJitw6cGN1w2eM90MQ/bHh5hYzwAUhQ09J04OTQWjgKSJPA6y/H6Zev0DZYvOei+elML86l9TEicMVfjT+f
X-Exchange-RoutingPolicyChecked: 
	AbKo16a/Oz+/oNulTdKqPrwqWNVrlC62O334YPR45BFuugp3k5JC6jHhsqFvVvia9PlluFfFmbuZ5tVVnsqiokUSq66OPijmV4ocPb6KpyQrx2nu6hvYtnD3TuFw2T1G1/rt36gklB2LLs4A7u4Wnd1gDsY5GklNKg86qJzRoOi4IsNx87RXQNUa+vMYfaWoQVRGp+N9yDqZeqegDshyYJCRh/B9XQDFN2f+D5QLsVaApsWb9KJ4snKUortU0UDr7O86kSXycCJFYUbZ5gGR/p+xBwRhksxqtD6aFXe/QgwKbe8GPJhm1O7EhB/Dvfeezz0mO4XRLy8Nvj+/wBOBBg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:44:36.9693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb87c03d-a9c7-44b8-a9ad-08ded096b13c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6097
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfX1ZGvTH/V8d9K
 riJmhp2Q4lUUoKJ/xoNu4MLHEc7v4ar9WWFcyoOohTeoCXS7Lo2SLhkGmEHE/DxjB0J8403e9iI
 e1swur4sHTRMwXyohXW1tIuRBYxiEF8=
X-Authority-Analysis: v=2.4 cv=X/Fi7mTe c=1 sm=1 tr=0 ts=6a3990a8 cx=c_pps
 a=GcdpE1at2Es8HfJfZlkF2Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=GLtSDv1vAtqjQl1esDIA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfX1K7Gf5P3J55D
 UfsGu3T7j4XXNYd6aDd+p/GHdeL9EzobEcwBQxqTPlIalrdG0mwa/H6iyGfsr3C4d906uf5aojA
 1XjnmaHTipFpdjVcN76++76Bot4qNFaUSndzugCES5/iojkiLoyYS6CrcGd1thrVvSEO6jZSoDt
 pREICImiEaCjVqXkMpJYcGBeaxxIXg/MkM458afHHQO/iQpN8McFk3OlKrz0LXt+ZJkUV8BxAD+
 9yhJnMH+CBLGP/WPg4faL1jBEAMPi9H1irqhhKeBTr7fTZXlWukmfN6hu818tWDGdCJDtzsiKI5
 Lc62FjncpBx76Jt34vqNxPvuuJsRuxY35a02sFN5+/+FdgtH3BQDRKYaSolZHoTfqGdj/siCQG0
 sy8d88qCnMRgpwnweEmW3MkBnIvlUrvcvJkQQCzLKnk1Pu49rUpPYQzY8CNSynbIX9BQnJ8yPKS
 +bjw8ZynMP70t8/2iYA==
X-Proofpoint-ORIG-GUID: kK0MmCNcJtZ_CA6R9OVjyEllsMmsmpqj
X-Proofpoint-GUID: kK0MmCNcJtZ_CA6R9OVjyEllsMmsmpqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220190
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Jun 2026 19:44:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17570

A recent change in oe-core [1] has removed the libprce recipe in favor
of libpcre2.

[1] https://git.openembedded.org/openembedded-core/commit/?id=057cccd9576e1dd0f947fbfc390bc06b210f71cb

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index d36b4397..34e95926 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -38,7 +38,7 @@ ARAGO_EXTRA = "\
     expat \
     glib-2.0 \
     libxml2 \
-    libpcre \
+    libpcre2 \
     iptables \
     iperf3 \
     netperf \
-- 
2.43.0


