Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84B5C44532
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:01:49 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5034.1784739705868866778
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 10:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=glElOblm;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=BBynKdOL;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFiZ9P4104371;
	Wed, 22 Jul 2026 12:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=CfVXTCQcdJ1yd
	NZv9MEL4xbUNFPeEy3rKCbD7Cean1E=; b=glElOblm4nASQIFnr19Yniw/jdoRz
	SexXxGZNCqBSy8Ly0iTtU4EpvYaWWutMmIbV4OnyJxb63HUlNWAmTqDoxJ6z6WgH
	2smParC4c0GSdfE38vfpgbE2ERoXudXC/HnuTgO2h/k/Df3CFyKNv9AknSjJdq8X
	ds0GcwpjoNlHb6scJqSg41zn+f0qyLo2vsx2M1hv3rgx1uSGEzzWRsFdaH6+i927
	jk7jyOEfrLiWzJPr4VA8tu5/MRgNsi44QzGR0TAHmL8w4R1FdWIdttEy7OUtlqBu
	EgRaiNHUy3/QBoVAC103cln64DzW6Foqjwqk1CrFAbnL0hwX4DtvARqGQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013009.outbound.protection.outlook.com [40.93.201.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fjwjv1txb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:01:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siFbpFcLTxuyJEZp8PXuBVMWr+ZKx4EljmU8014iC3ntOZYB2a4ifzWpekd0pnzmcpxuzvli4TqEVaDv73YmQGUUKQ/oFB3fPI2KaDVLzje44G/NH32fcFpWrXBNpe4sSbw+pkyOLBZ0wCwd39IlanXjmB5OkfXufjmtrd6pYawx+Vj7FxiOLa8QIrkFBypDUxxk1RfiJsWAStyAeTxOJsVQl2YP2tC92n2SUIEQJEcQ9BXq2qTbf5lXvMILWb5+QPOHdQkzVFgqyp7iqxBybOiwHTneO5so5tozUVNRm3tBKz7HHgiTXlhlfCvQcxLtb5iegj6BhnqF6g7zRqupww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfVXTCQcdJ1ydNZv9MEL4xbUNFPeEy3rKCbD7Cean1E=;
 b=zNhFETp1ivwiYUVHHYzej2L8LSGqcEKf2vhq/80Wx1QzT48imly/77FQOqZUjPSH71iSfe37Q9cko+q0OkAG9ac+rVYKU9egN0pOzZajpdk9BfyvRmqKitqEIU3MmbyON1ueP1Ug6NqhdHIh35fppSd1iz260A+yYdUeFFkosVwL6MJmzqBU0ELxysqnrOr5TtaLzlJbEVX7WheYZ3TLnJDgp0xi0yhTwUYroRYV1H0tH7GFgpvn4J+jCP5X+TkBxP9PeTr0pYYjCy1w4wCrCdLzjZuoNi6dP8j2AO0ovxWLRpVvmm6OfSyvA0OX3OOsMu8Wdvhyv0v8ACiVcc0rcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfVXTCQcdJ1ydNZv9MEL4xbUNFPeEy3rKCbD7Cean1E=;
 b=BBynKdOLQcEoxrB896MK9kGZ5yd1lMJlxtGXDmFbikDqNbccBHw0i17p3DBmQg32ufpPTCZ4qoLhwIqF+BCLNCEic5L7f0nzRpgnLW3heFNW20piRVcDMHb82Vh2jxN+O1D9qqNIuoz3wvwuJx4UxxyjBVkfmED1qJMxraSyMNo=
Received: from SA9PR13CA0011.namprd13.prod.outlook.com (2603:10b6:806:21::16)
 by PH0PR10MB5848.namprd10.prod.outlook.com (2603:10b6:510:149::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 17:01:33 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:21:cafe::c) by SA9PR13CA0011.outlook.office365.com
 (2603:10b6:806:21::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.4 via Frontend Transport; Wed, 22
 Jul 2026 17:01:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 17:01:33 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 12:01:20 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 12:01:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 22 Jul 2026 12:01:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66MH1KmL3575676;
	Wed, 22 Jul 2026 12:01:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wmaJs-0000000CszO-1kdG;
	Wed, 22 Jul 2026 12:01:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] libyang: Fix CVE-2026-41401
Date: Wed, 22 Jul 2026 12:01:20 -0500
Message-ID: <20260722170120.3071307-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|PH0PR10MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d05f880-e6fc-4e50-e45e-08dee812e208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|10067099003|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rUjA/E2Uwe4gplRWVyT/Irr5R80t3vGpnzr6QZKbFPTNGniitOSf9wW6OOwLc6xp9KwsvYmgnpdXFTxO3chocN4m43U0B85b47aAmI+zhiZ/dEFvDDRAYkuKA8gXP8C+jdQc94wdir6lMF7QpsMvd6KIOilE1vJ+pkyF9jenyDizU+w3fwuBzC5Q01pnJVWj2JMlVcBwd75hM48USoF440iwn7MeSlZBUfuTPTR9U+Mqp2RQu/ew6INu4kI+UBKiX9zBKhg3CD+RuPlyHUtfVauHhPL+oLoNUmSY2Eih/REX7jdP78AIfcPBq9FDgCXq1DZPp/GbL3fQm/TkkHOrcpB7XCE0qrKz/A7PpJD5VBJg5YR48c3BhfhOQE0jwqyEE7+3ODRcar60EcpDSP4jDAi4NaReWQeCPoRxsVIazmjsec+ZirtmNBhWlyoHMyY9B/bswiZTmPzW+nmYTmTya8+t4l3veaNbXDhgwy3IWcsGHPAp7OXGLFeQ3tZPCKy14D/B0VfShaDl8mnGY1+8XbO8UJe4NqMNwbFWKDNx0LMBEggyLHNyzU5XaV6W5WzQxlhEfOmf4qa5pE8uMvUTH2u+ZO3s9CmAxPdouzS+X7G5NfRfu3IvTiO/ZAF9Lncr/xkuLOqoZLfN9v6MQrZ5FewzYuioLFyIIfAbvKxDnrq7g8em3kgidkWF00Kgg5uHCOhSrCtmTYRyT9ksnROXVg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(10067099003)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	x1UUNNwgdvZCp3lrvr6a5CgxkBar8yG45oxjQg6DKgAlYj4F/ZeiZ/QFbkXCOEaimHuFTN0/m6qrtaQdb6X101XOBlghIfly5zPIsQ0xropWvbKHhCfDE/lU3FQJD3+W5yI8Mdgryo+EFNy0/eYbn8zF4c2gF0TUNcURN68scXe2ST294Qu5ZOLz6rG2yS8TudwZTLOKLG3lbFnuk7iNyrnRrwXFL6Zz9A3q5U9N8wVJbD6gLjA2Xn9wgfu61bJcL1iN+Nd/J/pe0rcl73SBuc46vuzvJVd9kSnJ0L1i2vD5H4hFhz9heoUQWaWD4GxSRuu5JBNuEPuTM5EQw/dx3CxakBMwLkFNvh5etX5Ytg46woZP7Vui3T/1nENSlbZCEyi2WmncpNlXNNGq8x71Yt0mbmn5SGvlToSEmhWgOVx6og49WSHM2IVGwYXh85WL
X-Exchange-RoutingPolicyChecked: 
	B3RZMS4fO4FPjWZ27kKAun6HxzvCHSYUC6kGNdfyvvdfVCZl7rEmvpiR0XJfLRaPjp+EhwVWPFnzkmtgsp71lTwyOFJRGPVY1F/u00mNard8a0FEuM456TRPulCcxYluppT59Nzpx9I0heVPw6Yc+vFJRlE92p4KC5FLeu45yHKs+p+FTk6190WWYkvj61eEvaDSubZ+Kb9yVb2Afuqc5fq0tQyL6c26quO2F0pRAT0/0Co6/uQbmN2Q47Ku1QSPky6LBfqrsnXSBiV2BDhVdV9bCpmI027AkNUvBz0FHQAy8dnkb3l5lDrx4iKj9KqlQ8ju9G2C4OGjlGmuctb6Ag==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 17:01:33.1775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d05f880-e6fc-4e50-e45e-08dee812e208
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5848
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE2NyBTYWx0ZWRfX/C2EQDJ8i/Sd
 YsjQPfOihp6EDFjOgSAYVwB7fsy6cfBDQudYZYX/uEvLS8DMx6qzlWuGSJCr0mEX63jQJJ6G670
 kY9NQvLYIvSILRB4tcCSV6bOZXN9aNM=
X-Proofpoint-ORIG-GUID: BLwSb0FV6iQkAB4pm2uwp89mpIcucMUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE2NyBTYWx0ZWRfXxu5Ceh/O7NqD
 oFN28CaGVjzM4nM/Jmea/TvKFaXoPtIEg6NAsoRGF4s38ijar+0y5ENSeU7FkWJXugRua2MVD8Z
 pztfCj4cYTvLB0PcJgyYalkRkeDdA66RB9bs7WI58XmYzLxGaX3tSb2TPXPa/xIxs8L17JB6rTh
 kzJtaeMBg6b65iHfXiSMp4sgS2uO4Dj2rr5Xw1iZqVcj+reY9P1KioFj/YO82K252IvM2gr3IDV
 KOGJMX+4FNaf8QlicW6hIj8OqlhHzngT5PUcP/48F2zihteW3zu3VFOTqb4foG8HJFYY4vpqAL3
 COZYLkLcdNcKDLDypGj6QQGUDRsIbr3tcif/MICwFTtkqABP8R/VoeJPNTcZvHUAWBSGU2/sv28
 tVThTVHQzpS9luBMTqe9hnA2RjFaUVvfQpmMQvjE4SPnOr8zBDGfiA7ht0ovaVtq8yiFwoJcFzo
 JUSoPz+9fO56igI8NcQ==
X-Proofpoint-GUID: BLwSb0FV6iQkAB4pm2uwp89mpIcucMUI
X-Authority-Analysis: v=2.4 cv=PsyjqQM3 c=1 sm=1 tr=0 ts=6a60f76f cx=c_pps
 a=bo0f5OQ5EW/jR9k4kEC/jg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=YzU0ttJQtqbNimHrLfkA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220167
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Jul 2026 17:01:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17594

This is an adaptation of a CVE fix posted in meta-openembedded [1].
We have advanced the libyang version to 3.7.8 and one of the patches did
not apply cleanly.

[1] https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=c8dc986a39e74c5611a3e3222d55b0d1239a1119

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../sysrepo/libyang-arago.inc                 |  2 +
 .../sysrepo/libyang/CVE-2026-41401.patch      | 48 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang/CVE-2026-41401.patch

diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc b/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
index 9744ea3a..7f20c94f 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
+++ b/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
@@ -1,3 +1,5 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/libyang:"
+
 PV = "3.7.8"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang/CVE-2026-41401.patch b/meta-arago-extras/recipes-extended/sysrepo/libyang/CVE-2026-41401.patch
new file mode 100644
index 00000000..7b2ba37a
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/sysrepo/libyang/CVE-2026-41401.patch
@@ -0,0 +1,48 @@
+From 54c3276d871023da266d4ed3ceaee7e8d71d0b04 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <mvasko@cesnet.cz>
+Date: Thu, 26 Mar 2026 08:33:44 +0100
+Subject: [PATCH] parser common BUGFIX invalid metadata removal
+
+Fix incorrect metadata list pointer update in lyd_parse_set_data_flags()
+when freeing the head metadata entry via a separate meta pointer. The
+condition must verify that meta2 is actually the head of *meta before
+updating the list head pointer, and must use meta2->next (which is
+saved before the free) rather than (*meta)->next.
+
+Without this fix, crafted YANG XML documents with specific metadata
+ordering (e.g., operation + default metadata) can trigger invalid
+pointer states in the metadata linked list.
+
+CVE: CVE-2026-41401
+Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/54c3276d871023da266d4ed3ceaee7e8d71d0b04]
+
+Backport Changes:
+- Adapted for v3.7.8: The fix logic is identical: change the else-if
+  condition to also check (meta2 == *meta) and use meta2->next instead of (*meta)->next.
+
+(cherry picked from commit 54c3276d871023da266d4ed3ceaee7e8d71d0b04)
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
+---
+ src/parser_common.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/parser_common.c b/src/parser_common.c
+index 32152759e..f8a3b1c01 100644
+--- a/src/parser_common.c
++++ b/src/parser_common.c
+@@ -411,8 +411,8 @@ lyd_parser_set_data_flags(struct lyd_node *node, struct lyd_meta **meta, struct
+             next_meta = meta2->next;
+ 
+             /* delete the metadata */
+-            if (meta != &node->meta) {
+-                *meta = (*meta)->next;
++            if ((meta != &node->meta) && (meta2 == *meta)) {
++                *meta = meta2->next;
+             }
+             lyd_free_meta_single(meta2);
+             if (prev_meta) {
+ 
+-- 
+2.43.0
+
-- 
2.43.0


