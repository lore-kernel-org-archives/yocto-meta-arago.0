Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CE2ECD9B4
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 22:56:23 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33649.1770332171076544497
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 14:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FWIG4wKt;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.61, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7HFUeB8TF73whFr+7Gr7sDkPxPzdGQlbhE5An0rfU3yY92acBA+obZAlprwzGxUAwUCufm2SzJnSn6Mf25xsfORCb1Bc7DfU35XaxZdRSZHbJrTKTqq43B+icrfLUtfFP9wMw6iAYd2UvRuf/2M/UBqJmEUajDKpZ8Kub7Sxo0exA9KtxiRjSXTN6HQOYxEWxYF8wBC4pvQaFifzvDGVH1DHXlau6418KVSHOT7+A7O/+z+i2OmO/FiYdBmMp+6gEt3iKMSDWa7G7FdmwalsdcBQ0qkrvG6XiriI5G5pD7saNT8+kyzpQUdRlZ7aHO+JVaLHmcmK4Kovjm8A9ZXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mYGHp1PxQBdQhGeZirvOWdBFq+U/Xu8Cs0kqF4IoHM=;
 b=mko1HOaJhoUt2PSIud0dVKKR9K76/EiV/KZNu0q4So2hEmfuUQqv9iZLgNR/xuLHEeVJKosWiXR6mdikQo5SvmU1zFd7mNWlMnPKPNQBAM1Og4JbBvt505UUtPNQtnFoRFsrKv/xfclryj3TQ3qcdKAyYTDjlANspcI8nvQnMXwQN5P5GcmC56M3Tyu/O67wZazy7N+jeWuQ1rE+1BC1RkYTfJZ6M0aGelAPXKqEmu95qKAfApQoOP/Z2AZKwXEY8fp4At/puU6BpDJs44my6c9YvFODdNMjTt1CO8+/kKWcSngnQJY2L/YqZPc650AFzVoyLKB7dtUxQZkbNAGNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mYGHp1PxQBdQhGeZirvOWdBFq+U/Xu8Cs0kqF4IoHM=;
 b=FWIG4wKtvgSelw+vviWbFybEG5NAlbVR/fYkFL+MUB6VwTlWgxXXsSEkCm1Hq3Vca2KoMn8BlbbAOng4q7aRWx8+S7B9JzOXIiT7SvHG0TRvYaLHfTMT8UbctqtgKYpzMuuE1g0POLXCm1y3QTk0nWH5K0NSrWaM/tcvNci/lOA=
Received: from SN1PR12CA0064.namprd12.prod.outlook.com (2603:10b6:802:20::35)
 by SA1PR10MB997715.namprd10.prod.outlook.com (2603:10b6:806:4c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 22:56:09 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::98) by SN1PR12CA0064.outlook.office365.com
 (2603:10b6:802:20::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 22:56:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 22:56:08 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:08 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 16:56:07 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615Mu7v8034061;
	Thu, 5 Feb 2026 16:56:07 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <jcormier@criticallink.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH 5/5] oe-layertool-setup: use git to trim ref parts
Date: Thu, 5 Feb 2026 16:55:29 -0600
Message-ID: <20260205225528.92769-7-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205225528.92769-2-rs@ti.com>
References: <20260205225528.92769-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|SA1PR10MB997715:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4854ef-3700-482e-d98e-08de6509c065
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/XBp2TCYI13pwOm2K6k9JYcJpEVocGVejEKe8m7ny5pq2ND88zgDyWyhLCKK?=
 =?us-ascii?Q?frKEq4OHIU3V5rDvTuRMUU+dOfZsfnxbw8kSyVRMmhyX2uzHdadARZHjdGSj?=
 =?us-ascii?Q?UfxAB+Fm6IxMgonjoyPCKnRHykszYYH5peJC+tcQSPFKGLsgQiQ8jOIUkKXR?=
 =?us-ascii?Q?zA+Mhp1QlkDte947EAoX2nQ7GUelPGBtPpNaenKyUzvBc52ZxUxiC7smuRuv?=
 =?us-ascii?Q?dvBCad17ojpkJT+rftQH+/fW9E/QbxYt65WjT89lWCv1Xr0bGbpwGmJ+f4Jk?=
 =?us-ascii?Q?KzdjSnj/MLiTBQnsSUeoiU5Sjx8nc6O8dd5J1wjrwk80mz4XpQ4jnt4vAFom?=
 =?us-ascii?Q?xO/c+sMjV2JlTTdnRAc6vQkfybmeTsI9MZahSHFr4DgVjytFeUIIPey7y+pW?=
 =?us-ascii?Q?08bRZfccKVKfDi7EmToVYhjZoFSCAbyoaapryziRftrhgOoKNBuLxTk+lDKT?=
 =?us-ascii?Q?1j7ABI0s02mQ66ac0wuEzL2DpINiF7KdxU0isYAvKS/i/ERX5GxXSG584gKG?=
 =?us-ascii?Q?vkJpMcKHkFZB5rpGiYKGSoRAJzHYBTxyCY0tz50pKFr32SdQtj6wvmfEQtWP?=
 =?us-ascii?Q?OWPix5mV/3nu8qyI0uc8xhPdSbHhrX2Lo/RZi33TyD7jAQo28SlBDG6k6pHm?=
 =?us-ascii?Q?E+zD/5fFAR+9W2ZWFOR6BtGaVRa497n/DMO92fu0QrNtMpOi7CNpZvrwUNgH?=
 =?us-ascii?Q?vbHVc3F5x2Aujn+L/NLCwkA+YpkoayKbDwBCFyD7Rm64RE1MNQvdVPJcmHGH?=
 =?us-ascii?Q?rojpmitZPR6mlTIJDhkvO5OR3yQBeelQkkfCOVqpRZ8T36aEO73cYg2svU2B?=
 =?us-ascii?Q?Zpa0l7Q2ezYr0ce3BTV72OsyaD4KgSlEbJ9tTk192gKmCVlcZ3xPixynClXe?=
 =?us-ascii?Q?eeB13T38OoErcrAQ18A+MvWISFUgvdhjF5T3T4U2pMakliPXpuwVycJV+sdQ?=
 =?us-ascii?Q?icQ94l3VIWODBiwxMkBSutpsfok1ZFQiFLL3wSpu9l3ikPN742ewTa0bjNTw?=
 =?us-ascii?Q?JST+vZE5tiS3GxLDlLucpWJhxnIU0O5XD39W739m/oqAS6Az6RybgLhGfuwT?=
 =?us-ascii?Q?cVrhNMXOSj+Qr7+fcrQPMLftZdFRsX0OOJpFVIGr+69QljeSMIr+1j++Jb34?=
 =?us-ascii?Q?fMK3oxJsP8jHIbd1DTXyWQkytGOFQn/j8o6iChYwYKzk6zH38CqJQGj5CSyT?=
 =?us-ascii?Q?Dccl0D084B4wnbhJhQ/bfBjbLAmvH9GKk4K5ZCKfNF3jgm5hS3Jr3/vt50no?=
 =?us-ascii?Q?M+ppTV/QIh8k2xi5QHskHvSmtBA+aq9l2s1rHcq7FMBZ/uENARCQ97KDkQqR?=
 =?us-ascii?Q?PISOH4SM8F6xLlg3wx+SZcqDgzKNEN9J79ks/5qSmvjC+049k190po7gBgtc?=
 =?us-ascii?Q?gHGfGsL9FAcY02i0jdiv1BSK9xkfU7E7aKcvrnsaZwWeoRspMFw4U2njmuzR?=
 =?us-ascii?Q?tpf+TRjkm1OnA7etFDlBWoiRAP0cxZ302S8tGr0vCCifPPgCuV1cSEbAXgeP?=
 =?us-ascii?Q?4AI2C/YGU84A7N5TRYdeO1TK9CQEDT5dbtwjFCWhacSrkbK/g0jFttsYglRv?=
 =?us-ascii?Q?YRlPwpwxYwSUOTX+sBm3nqjCpValn/MTRido/JNPcED6DP64hezr28v5JKRF?=
 =?us-ascii?Q?swXVc8+9HEHA4+ToIOcorb20mSLHSLNVJyE9j9tpL5JHB7boDsruNlxM7SFI?=
 =?us-ascii?Q?SbQYfA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IP9PTDGlrE6wJHTgKPOTadASvbWmlYgsUCcKtImaQzz3m0fmQyNj2azEoo1DP7jLiZhSE/1YFiJY+IU9IyVuwV75OPyAz4//4CvNx5lffcAL9lzx/QG3KFsmpkt22ph8IDEr7g1toUY/Z/J1Xxx26dsxWheDwvkHbk8r/41EgnFS+q+agcjl00S+TcxiyQelELa4R86c8Tq0lCXm2KHxdQVPVXAXSbNZx5X7QqGdJFBrUCnhRxALMaxmoyspAcVZHSD0hoHWt7e2WIMN0b2RartLye03jakidsN5HXhahEPPDM06RmcDRiI1wI/xo67Z7FmwkzCOZcOl7A9BmbGcSNHNijegOwbEZFYpTKtG/zX6D5I0Tumg/t0P1r0IYAkX2QjGXSIIUCCzlzecb/CHqiGkuo61qrIdCPcZdz/v+nVvcFzakwcM7raaNxEWHl3d
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:56:08.9802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4854ef-3700-482e-d98e-08de6509c065
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997715
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Feb 2026 22:56:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17087

From: Randolph Sapp <rs@ti.com>

Use git formatting to strip ref parts more consistently. Tighten grep
patterns to make sure we don't get any partial matches.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 oe-layertool-setup.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index db870af..dff2565 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -416,10 +416,10 @@ get_repo_branch() {
=20
         # Get a unique list of branches for the user to chose from
         # Also delete the origin/HEAD line that the -r option returns
-        t_branches=3D$(git branch -r | sed '/origin\/HEAD/d')
+        t_branches=3D$(git branch -r --format=3D'%(refname:strip=3D3)' | g=
rep -v '^HEAD$')
         for b in $t_branches
         do
-            branches=3D"${branches}$(printf '%s\n' "$b" | sed 's:.*origin/=
::g')\n"
+            branches=3D"${branches}$(printf '%s\n' "$b")\n"
         done
         branches=3D$(printf '%s\n' "$branches" | sort | uniq)
=20
@@ -460,7 +460,7 @@ checkout_branch() {
     # Check if a local branch already exists to track the remote branch.
     # If not then create a tracking branch and checkout the branch
     # else just checkout the existing branch
-    if git branch | grep -q "$branch"
+    if git branch --format=3D'%(refname:short)' | grep -q "^$branch\$"
     then
         git checkout "$branch"
     else
--=20
2.52.0


