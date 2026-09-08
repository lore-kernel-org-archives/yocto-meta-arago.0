Return-Path: <p-gupta5@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE8EC79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 11:04:55 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4630.1788865492923696348
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 04:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=pkypMhAs;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=NBoGMq0p;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-gupta5@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688AD1kX1304458
	for <meta-arago@lists.yoctoproject.org>; Tue, 8 Sep 2026 06:04:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=3lpqsQI7+j++u
	SnF1Epi3o8jt2hGhCKBIk7Ruh8TxQs=; b=pkypMhAs7J/RXcQXe2CP37u1d5YIi
	NnGVdez+Xsv8++5djIkmfb61K9kMxqGOPECH6cAcNK/1FD2vuVwu+YeATOBGGu3P
	Tzo4PYRgDEXcpBCcpHbLc6LZTUifN61qh9XlaKO9gBqe8zFwAfbEORc4MNUyn0Qj
	btpo81X7y1wK7dFVd+R6gfMCNUGaCY49XfG5J4SC7lYE5TfzEwZUfsJXNYKXrCb8
	pR2d/kAPRc6y9NP5luoir5c6+Tfi1Hd2rgeboaR5OSxiOQFr+t8AWZVRxMa6MdGF
	WuByvaVl+O+f2VCAsbQluNyHGex6ucNxqZVSqb/sYI8zyV/QrWrPiegOw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gj940jgwn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Tue, 08 Sep 2026 06:04:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGc6oo83owEnU9/nGjnW7Tfa62JM71AGQ5mIvbhPTCStbx6qw9lxYLwSpmoTf4oQvbUaIOBO5vyzynCfqBUB98ybXD6qPxTNQVQM5V4thIFjVak1Yja5dKTAd+wmJyxkjoso4EGzbspnngg6/ewMpzoiMLUY1RSulHw4rPIlJYhiQcy2frN2nlDl15ow0t6VeLwd847K9aIqm6SZ+ZtxzCHCU4HvxdarieQi/gTz2a8O64vXXaVf0uT0OWmEvFNfytstM6yEGCDiaN0ZjUD8Xj6zpTSI5TRnu9Idwy40XtUDhVzvWe9k6x9jbPYhcN2Fb6MfUfEM8344TXDzLjs8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lpqsQI7+j++uSnF1Epi3o8jt2hGhCKBIk7Ruh8TxQs=;
 b=LjQaIxV4efE3m5CPu0gAgUZKt4qY7PI1VFM7av9ccScpsM2FM/sWNivTTKtD0VuGU/g0OmHWQGjVtW7gkseDwNUPuORG++4BhQF8//Fai6X7/ryLQf/eupV6WIuvhbURcoYC+nuSTQ82tBhPaexOMWZTv7SbxNjMxrK3ATp5iSborIKzdCxOBxv/aY3NFNMSifAkw0v2PWp/tipnLuxE6exXYnlKVghx3ExsnmtCbI1PC5I6bbqEgg4XGL3Ks+NQCUTDYpWcHEhwSpSROwP4VUqOxfeeu+uGojCPPXfn9wJeSyA8Jf4/iix6ORhrCIbanDODc4xd+posfyiJftYQ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lpqsQI7+j++uSnF1Epi3o8jt2hGhCKBIk7Ruh8TxQs=;
 b=NBoGMq0pfiUO55CUrsEiS2UtxJtmf63EgWTiGN2cH6GKiKKnrGZQEKWnxsxkzVzs6J1IG5GPf4pry9Z8W2QeIzHFM7a95BDMGTduuqrJnAHjU22b1rDFpI8rQ7tWa7YvKRnkL55wQFJAWQV5YvYHUAJKrLdONJUxth+zr8LOsEM=
Received: from CH0PR04CA0039.namprd04.prod.outlook.com (2603:10b6:610:77::14)
 by DS7PR10MB5021.namprd10.prod.outlook.com (2603:10b6:5:38f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 11:04:25 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::9a) by CH0PR04CA0039.outlook.office365.com
 (2603:10b6:610:77::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 8
 Sep 2026 11:04:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 11:04:24 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 06:04:15 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 06:04:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 06:04:14 -0500
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.51.155])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688B4CeH2340528;
	Tue, 8 Sep 2026 06:04:13 -0500
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>, <p-gupta5@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.02.02 release config
Date: Tue, 8 Sep 2026 16:34:12 +0530
Message-ID: <20260908110412.552703-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|DS7PR10MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: f820c731-2ff3-4c45-43bd-08df0d98f193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|13003099007|6133799003|3023799007|10067099003|56012099006|18002099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	9qzKaZ5GizNHsjL885uPnOfB31vNJjrgfWlua+T3XIUliMuOZ9vUQRnL9L5bi2bB/OUZ/BFGjfIWZz6BytpM3N06HaEOTFG/rDHCHQ2gCEQ88Rs18OOE6qS3hwagDEEsExf+/Nf/nFn/0s3gwAO7zwGatOVipgSVhzW6ZrYV+AMFrXnRD6fuqst9eS7utjZauu9gGpTBzyR5vYb+XPRR0g49pactfkXLsBDTTsVZ3r+LvQm73A44SGj4hy+ffvcJUjrhaHNThU1rqAOTSx1Kn7aSbqRbtQ3myOfg9kZ3zSqAmIWlDeuI2ABcpxPnWd3LliFEnyx60SKGfR8R4Lte1QV7zB9yxJgB5dcKu2andaeSqhi691KbGKo5FiuSySYeLCRJzHLRYVCJgALIJ4eqR9hegzx7uxIO4OUEHozwoN60bA62/ea7UpZFy0HTM80zBscLhKv6xGAO/Lpi1puSDdewKrO3rxN9pL0hgA+5jqX+uwk9lCBbwai8fy4/ynR9uMG12Pw4Y+pT/S4NupIPQgogISA846YDI3l0X5p02NtcEeXyHh6NiUojTEmW3cksgpxVGV0Frl9qmZTmO7bkqFQxbCao54BaC0FLovDw8omtOWyBbHrEi/7zrzeQ5l/vmHJsW4u6qMAfQm3sTGymHQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Nd8ykTgAn/mBw4koGJF5VQ3UN3ms8F6MQX74yg08L/UehYqJyUtOVcdgo6y0FrxGrLAI1MXM2u2IQBJf2ED1FRUvki1fdGoeSGZUgW5TG9MYbMjr4QCUrn1ZIlpeC863jDhRO7142K4pfRyZRJyYDyN1wcEp63ZjV3f+sJvF7r4wdWT4YLKNXUJ6GAsvw1vdKaaFB0W4leYGAcwxtY57TAyQ6BbLqojUtIQeHvaO/v3LhhQy5PHadJHnioxPODzkd6qJ9xhGYoBfOm4/X6coGszICrBWGQaor3pTTItqljpfUl549yNH2yI4gD60dHlR8EcQCKLHyHjSEj/vQ3F6Rqylz7fTDvT3A9KRP8eGjKipna1PHq3Lf2QPbsYR8lZx4OPhawcZvK71kLtlG85RlDKutfQWKNv/I8bkuEtYdNvOwFdBwqxAKlYTzaGf0R3N
X-Exchange-RoutingPolicyChecked: 
	0aHZ0KIyvHVsTu3Ma/ZAZkIl3jQzsUlfX1M2R4t0euI0zSkexPaGFRLawf44R1FLnImIGQpc/u4iyrW4O6GNkES+MSMs1auMiTfoy4kfWJQzd0w0pAv83eOhJKGZ7wujWMDC0nbiKUw+gAnu5gLw5N9LzS2dPMpcFJFY/7S+y7BvB6BputCYFZYkKgl7olWuWWWegZTRqvXfT4eu4SGdUPziPp64TBFBeiUOB28I4IWXS6RxqSx5/XXnyWiyCjg9Pxf6wtNMxDqZZerU2R9Ln9zfaasYbFU2SkcqIJkq2N8iMwI6Q0oVb5VgDafZgjIoD24rsqPjPBYWHzN9dF3t2w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:04:24.8064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f820c731-2ff3-4c45-43bd-08df0d98f193
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5021
X-Proofpoint-ORIG-GUID: iDQLMPo5nOZprcS1SQrMI6EL6tWoluKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDExOCBTYWx0ZWRfX2aGsorvu4x/X
 TLlFNBtmGNyYW4MBXONdlqTFi0iaImmv6I1C/X4mQiz/I+s8eCck6L9l91VLRs6EnM8Qc5DjUi/
 4QOWX0l1qC6j17GcZfu13P3vcwG3HIsx290oxdrDHiIpQAedWqvOXQPMcWxny+6HjQ/vU4itDNn
 DQtKzuB0bh/OQCR7FrvvgxYRu9eSxEbq6Kp2kQK9YdxaevZcQVAdreIe7Tv+hXlwkOeNbUQaVZI
 ox8Bdyf0i1Ge6m4r+2DbFHfUb91J9kJbTRIUwPkeHNiPkMOMAY3ItrNnKabVLEKZ95jFDR4MzQq
 AnFlOld8WBlRr8b+l43RzgvWtDoWg4RvC+NMDGyqLGrJrE82TKh9KKJ/bRXjYbha5nO3PHeZBOQ
 265xQHdBfiAP/DAHLTFLk/Wz6Mk4AQB4ecc9ZV2iQi5+R7LNxGlzyu3es4iIy3hIytM+GdF7abt
 TYL1wC6HASduQduNcag==
X-Authority-Analysis: v=2.4 cv=UrNT8ewB c=1 sm=1 tr=0 ts=6a9febd3 cx=c_pps
 a=Z+ESqgFbrcYkgT1kPBc/rQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=WNDY76dxAAAA:8 a=NEAV23lmAAAA:8 a=SSmOFEACAAAA:8 a=zPih7YL56EWOkBT2xlgA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=HFDSX3BADwN2sFIQuyTb:22
X-Proofpoint-GUID: iDQLMPo5nOZprcS1SQrMI6EL6tWoluKD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDExOCBTYWx0ZWRfX3cF+gonb+Atv
 69r6bYlUz9adSzK106h/cesBEtp26bw232RivsWkxvNzqH0oeVULLPrm6J0mWlv3Oi5fLnT7zVe
 7Qvg578mC9ZHjn3oDymIw7+pQfvkx4U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080118
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 08 Sep 2026 11:04:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17655

Signed-off-by: Puyush Gupta <p-gupta5@ti.com>
---
 ...or-sdk-analytics-11.02.02-config.conf.json | 169 ++++++++++++++++++
 ...rocessor-sdk-analytics-11.02.02-config.txt |  25 +++
 ...rocessor-sdk-analytics-11.02.02-config.yml | 110 ++++++++++++
 ...rocessor-sdk-analytics-11.02.02-config.xml |  94 ++++++++++
 4 files changed, 398 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.conf.json
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt
 create mode 100644 kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml

diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.conf.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.conf.json
new file mode 100644
index 0000000..4931b42
--- /dev/null
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.conf.json
@@ -0,0 +1,169 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK Analytics v11.02.02",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.8"
+      },
+      "path": "bitbake"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.9"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-lts-mixins": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
+          }
+        },
+        "rev": "scarthgap/rust"
+      },
+      "path": "meta-lts-mixins"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arm"
+    },
+    "meta-clang": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/kraj/meta-clang"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-clang"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "oe-core"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-edgeai": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/edgeai/meta-edgeai.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-edgeai"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk/meta-ti-foundational","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt
new file mode 100644
index 0000000..66c645f
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt
@@ -0,0 +1,25 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,cff3be6f664f8f07a40727ff63eeeb24d6f5e00b
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,73ab0405254988a501b849d221acf5f468cb8997,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c945b9bd40ca82960e05,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,422dcd49756aef2c780146d54ccb39477759267a,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,bec755063a8b5da65df626f5749496aadaa4f4bb,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,ef43a90c91d5a9754b2f28f09debd553fbc6a2d5,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,045eb74bd9abe7d9ccf365a2417e440ce83bcbb0,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,cc29beb210ab94eacc53bbd67e287e4e33ede342,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,543550522f831479f07d332a40ba343c53ae1065,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,c03cc2d0f40e99da39e444da3627763f4b94dca3,layers=meta-ti-foundational
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,75f2d4860776bddb7c50c6de40480819167a0e6f,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+
+LOCALCONF:BB_NUMBER_THREADS = "8"
+LOCALCONF:PARALLEL_MAKE = "-j 8"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml
new file mode 100644
index 0000000..3380c14
--- /dev/null
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml
@@ -0,0 +1,110 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.8"
+    commit: "cff3be6f664f8f07a40727ff63eeeb24d6f5e00b"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "73ab0405254988a501b849d221acf5f468cb8997"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
+    commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "422dcd49756aef2c780146d54ccb39477759267a"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "bec755063a8b5da65df626f5749496aadaa4f4bb"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "scarthgap"
+    commit: "ef43a90c91d5a9754b2f28f09debd553fbc6a2d5"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "045eb74bd9abe7d9ccf365a2417e440ce83bcbb0"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "cc29beb210ab94eacc53bbd67e287e4e33ede342"
+    path: "sources/meta-clang"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "543550522f831479f07d332a40ba343c53ae1065"
+    path: "sources/oe-core"
+    layers:
+      meta:
+
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "c03cc2d0f40e99da39e444da3627763f4b94dca3"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+
+  meta-edgeai:
+    url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
+    branch: "scarthgap"
+    commit: "75f2d4860776bddb7c50c6de40480819167a0e6f"
+    path: "sources/meta-edgeai"
+
+local_conf_header:
+  oe-layersetup-local-conf-config-specific: |
+    BB_NUMBER_THREADS = "8"
+    PARALLEL_MAKE = "-j 8"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml
new file mode 100644
index 0000000..c205b09
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml
@@ -0,0 +1,94 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v11.02.02</description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='cff3be6f664f8f07a40727ff63eeeb24d6f5e00b'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='73ab0405254988a501b849d221acf5f468cb8997'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='27ca52f635a31f5f9762813a8527dd31323549b7' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='422dcd49756aef2c780146d54ccb39477759267a'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='bec755063a8b5da65df626f5749496aadaa4f4bb'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
+            <layers/>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='ef43a90c91d5a9754b2f28f09debd553fbc6a2d5'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='045eb74bd9abe7d9ccf365a2417e440ce83bcbb0'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='cc29beb210ab94eacc53bbd67e287e4e33ede342'>
+            <layers/>
+        </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='543550522f831479f07d332a40ba343c53ae1065'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='c03cc2d0f40e99da39e444da3627763f4b94dca3'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='75f2d4860776bddb7c50c6de40480819167a0e6f'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>BB_NUMBER_THREADS = "8"</line>
+        <line>PARALLEL_MAKE = "-j 8"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
-- 
2.34.1


