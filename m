Return-Path: <p-gupta5@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C644C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 14:17:15 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15307.1789049832178954595
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 10 Sep 2026 07:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OFbFEryU;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=wB1tPMsA;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-gupta5@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68AC9dL81085797
	for <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 09:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Tt5CVNxexY+nD
	Zetf6gf4aXzF0OWIWEAj9Z+2xp4Bno=; b=OFbFEryUH8RjBFjUCaSXjmYcsE2dx
	oyUTAeB0ZjE+g3dYG+MUWH8wpVR7s61YGIyfYMW0o3DxzwkagSb9LfFQokoRjHnV
	FkrWpELMlsGd2+zAEmsNVwT10dyXqCQY/AYUn0NG7JUEWlJqaAzmwtkw9R2dyV2I
	0Ds7oO1OixnKmf9W/1j5QZPPyLDkzm0Kw/TI4xjT8MEj0bZ9kESluojO2L7Xh8bl
	b6ncSRZ5lhuU36LL24i3riP+VlXEcDD+92vpVsyXgP+pQdNNydj8gwPKN6xYSsA3
	HKNZeMy4J5T54sUUksCPvvg3SoTbt9PJj1D6O+5kcp7XxwpyuDKcxEWhQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011033.outbound.protection.outlook.com [40.93.194.33])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxgduck-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 09:17:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAAVxIkfKORPjR4MVeOzi5veQmYwc3qzZyXPOw+/lS7sQJbMGruTBaB42a1rzAkSxeHuT2JBXiufU4UPqoVR4JwMOz1WmF0ErtwNvNSYbCB7I1Yived52CQLsBjEVkFDp3zI5oRXAD79x32qRoB6ILdZlcIhnnkK47vOatCQOm4S65DF+LLBaHax2TJgyQTuParNIjFBnHSQHtcJ6t64w1m0anA9m/O1XNz+DtaBIdlqAxGVGblxZy6GQJL1dQNNNhfXzvB23KVpO1IuNlkQLb4lVioJWRdQwUgJDuUvZTb7ZUHBH6YrEL1K4rRKyfkIKDYSG4a1oTnk/nzEWHhOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tt5CVNxexY+nDZetf6gf4aXzF0OWIWEAj9Z+2xp4Bno=;
 b=dQxslZvD3K3QbzvuLse9UYH/+CEy2hQQfjtVpyDfhG1ngWo2ElGMYr+2znowPBjNeiBgjEiQgqgf8fKgBV5v2febMxqU0+M7MyvHQRGZfMSdoAzkw8TcKYz0uR/rHqOiKzHrcYEMp41CexyblQGFYHoN2PgogRPoe1oIgQvZqc9seRfg3udIsv3MvOBLcwpO9waUKB/WQtYdiyRcf53WUmzRVi9ahpYfvNaWv941vjupf+OJkB/KQjmVZcDwUQ31NLuoQk/CG9jLngM25kKCFMSWuW9irFL59mw19rCt4Ms9wMgqZZVVQOrCGj+S5N8zuOhjzlAKKX6PRIsHXEcDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tt5CVNxexY+nDZetf6gf4aXzF0OWIWEAj9Z+2xp4Bno=;
 b=wB1tPMsAQMWl9Inwa2y7OXttJwfBhw/apvVkwexeeBf2AbXpRVgt0Jnmdan7S+RLUpOlcLMCloPoYfKvQ861HR15vvn7hOuqj6dh0NGKgd9OL/vc496dbzccKFq3QA2Vz8Hbz21i/hKLXBkbEWrbjehi/0jnLTEQfY1G5oXWtaU=
Received: from BY1P220CA0043.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::11)
 by PH0PR10MB5780.namprd10.prod.outlook.com (2603:10b6:510:149::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 14:17:05 +0000
Received: from SJ1PEPF000037AF.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::3d) by BY1P220CA0043.outlook.office365.com
 (2603:10b6:a03:59e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 14:17:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037AF.mail.protection.outlook.com (10.167.244.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 14:17:04 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 09:16:33 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 09:16:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 09:16:33 -0500
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.51.155])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68AEGV172476946;
	Thu, 10 Sep 2026 09:16:32 -0500
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>, <p-gupta5@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.02.02 release config
Date: Thu, 10 Sep 2026 19:46:31 +0530
Message-ID: <20260910141631.1176922-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AF:EE_|PH0PR10MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 15cac142-6846-4951-e5b7-08df0f463094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|6133799003|13003099007|20052099010|18002099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	PQ9ZYvl5YlLMvBS6K5qMGyXYJfjQdcVdDlw8mkKbY17S9kOBZk4FI+O60TqMZK/3MICqdxksVumckF9N1rCY9zEDmHlFok7R2JG1qNC5c17woyMx7mmamB07SPYyQ0FxcpJjQn+zaYvqThfKnZLZWtghkXODu4poOAccAgtG3+F0RPlJMzHAubOth5MCUWdJoQt4uouu3rzTP+Zx+yv9visDP7qEIrjcyivA6Sv9RHiEsEWJENjhSz85MhYJfXGrVOQMDaCb6LYPcTWqG3ejf8lvX+Z9/7l+3t6MP2zhuOEajKlzEiwArVZclQW+Koe4oP11i84K3WYe7IsITU2SciYyjLltnYByxo5VVXfpb5lsk/H5IzJCTjwA0rS6Z1tK7Jay5majgUURdQuSIWWcLw6jzX+uKTMl4zzfehH08Ecn9GYBFcsjQjpOQX3bbu8dz1SS3/mDSLdO5/8oNJAzQsFwf6huhqhw0VdHXan8gmyVPdhO2zAkFsCbqI+T3YGRm5jJXrCAmxUX57ZvEa5n2TQXVhNO5hUZJilOaLJ6leKF0oqr8vCFNYw7cu2I6g2v2gwUmpb5WF+cAh7s4RTcPviOfVFMya79bpiviEQHT3RhNkf0JOAjdUhUmjxWc5bWLt4m/J8BFZVESPBYJwhbAw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(6133799003)(13003099007)(20052099010)(18002099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UAGHfFnmipN1QQMPY86zKXW0JfXg52AOme7NUsYb6NR7y3QqYBkqYNSvOVp9bs1/TOkffwf3gNS3VDY7Fv931zUZDflahV/A0/c391K4ts9j5cMGclG0gefqz0uak5ub81QC2N9zkBXBz7/27KmffHLBSEakqiwFpTENQe1hcQTg/mb+Yr/dTb+3+Evf0a3WT865guRKyDTx/+TyGqkaoijScXMK5C7+RH8ei88I1hmBmCJcHkD377dFBPv/G7P6jhzkNUkCU5BJeHbtdTpdnRQMIOQvDyFTbvv0sYYGxwiat0KB6ffRsoEkNgTbXX9X9mkZxhX5D0InsYOEw+uNRm0niDB4esazApFch4CFECLoP/VNEU0kvszlCs4eOb+2OOrQaDkB3IIgnAQzsvuiCGpV9P6iDLLGrGCasZh8OK28fkRkA+ghDXAV5+p2Y/zH
X-Exchange-RoutingPolicyChecked: 
	VtEov5E9jeGVbW5Q0J475DKIjMq/RkcBu4BPuCfGX0dCfmxMf7f9JEMZUQN5fApKAd2ToF6NmWQdQu/REzUXLAAvv7F8wUWb1zoG+fYdftMYT9SaGJSRnBCAGBuhx956VUObHumwOA2Pbz9EINNODEdpql+qrZY7B28Eh/+Ezy8gaoQIVRKtJwV8HS4GGE7++L/KffZV1HpgSjYbp2mozyMH8RCY2RikW3pXmxnLXFdZ5Br+zaQFPS74EV1IKr83sFHKNfdUdNNb+gX1Arrfko99CMY2oKoeZIIvxrIlb3Obt/wb+nw8mnj0upD+tVeAFDs5AV4/bZiH+USVpT6ovg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 14:17:04.5683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cac142-6846-4951-e5b7-08df0f463094
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000037AF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5780
X-Proofpoint-ORIG-GUID: 2hLp2xWtuv80YcyXr7nMAQhkLkAPsyVo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfX4rbLih/6gIHN
 Y2TuoccrQYrE4DJOHBySgAm5bLkDUR1XdDgq8qVLZ6GKOLlZy80PxfzFv3LEIIagnEF1ekBsd13
 hHU7uthiwAIosS42+yiyIrEN9bAuzJI=
X-Proofpoint-GUID: 2hLp2xWtuv80YcyXr7nMAQhkLkAPsyVo
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa2bbe7 cx=c_pps
 a=Ik8WVU4vKgjy7N2tmpohTQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=WNDY76dxAAAA:8 a=NEAV23lmAAAA:8 a=SSmOFEACAAAA:8 a=zPih7YL56EWOkBT2xlgA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=HFDSX3BADwN2sFIQuyTb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfX/2GXItCnazVS
 PG3cd+9GJ2/yC1fqAE/Irllw53LrdgZPYadsOV3mjaaAMKAQ8PrdNT6pXaMfFINlj2SSdcAJWYC
 afgufXK/5lmVLuvCsTwq25werNN2WhkVzSAQoK8PutwNJKtbKeSyGSTCgajjfaHQWwxyFTN64VB
 hiH+XkjaCWcUaT+MDEt22t4TEEhumHLkvs0xmWEHIFLLte1vAbR3fvhkD3XnwYFZeGcBuxuqaO8
 zfWfavBPnXb0Jj3Wjv+4ZOgsR2ASeTjLoctPc4K8UsUSmqstcbNOcjp5/sF33VSCzeP0O6P6MC9
 9MDomWu1z5mJMTaUKwPCGH7RU/az9acd3HgBKcUDJQuazPVLcqmDvgjCs/LX6hQ2MQGbJ+yj2WI
 I7Yp+IyLpFT4Y5i0ftpl5rT0wbY44Buzwu5plJNWYmkCc67XPCBKGVutCqQVhiOJ/loQDv0EScc
 3513PhLD9AARvPGXHRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100172
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 14:17:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17663

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
index 0000000..a880208
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
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,5fa4830828e5b14b9598948a2088adbbeed45642,layers=meta-ti-foundational
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,47437a7817c1f88213b1f27403b4b7966aaac813,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+
+LOCALCONF:BB_NUMBER_THREADS = "8"
+LOCALCONF:PARALLEL_MAKE = "-j 8"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml
new file mode 100644
index 0000000..9b2cd7c
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
+    commit: "5fa4830828e5b14b9598948a2088adbbeed45642"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+
+  meta-edgeai:
+    url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
+    branch: "scarthgap"
+    commit: "47437a7817c1f88213b1f27403b4b7966aaac813"
+    path: "sources/meta-edgeai"
+
+local_conf_header:
+  oe-layersetup-local-conf-config-specific: |
+    BB_NUMBER_THREADS = "8"
+    PARALLEL_MAKE = "-j 8"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml
new file mode 100644
index 0000000..50fae69
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
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='5fa4830828e5b14b9598948a2088adbbeed45642'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='47437a7817c1f88213b1f27403b4b7966aaac813'>
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


