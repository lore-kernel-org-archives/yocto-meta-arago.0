Return-Path: <p-gupta5@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDA7CCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:28:32 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33143.1792412911739558929
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Oct 2026 05:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DAAZJ4AM;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=KYsqOftw;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-gupta5@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69J8N1MZ3814472
	for <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 07:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=9apaPPTnjSqu8
	LtpyTROW+bRkNYhnWQs6XyXMPFgRvo=; b=DAAZJ4AMKnmBxlfS7QNkuKzcnKAsX
	Y5IgUleNpBORjYcZEAUpwnJL0ir+FgD8oAfVruor2wksPkAbh2YlpdUxRbNbUzlT
	Ff8Lr6sfl09UXj1ek5m2tuSkFUMpuZE/RUX8wUqE2njurmNsKs4cyG3pEOdIEdIb
	i2c/3Zlu1MfGIONRCC7Dy+RwS+GkJybF5CVNcoZJhvXd9v+r1q3VUVzILwDhVsmy
	KTnQv+FI6ri29vyPl0qhjvMzH/ULvhLWobnOgyRiuFIGSnWYgBJvGMLOg6AVLMXF
	SkYpDW0PnaeEIvEaEtcmpzoV2KK32I30GU0dF//2KJsKJ0oRLCqU8LDew==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012009.outbound.protection.outlook.com [52.101.53.9])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hct1jnnj9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 07:28:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywiOnPJSl52Jau1dU0VzIaxBkMon6eK0IffBCIz1mcOBOpO3M/oBBonvf0Y2Oo/Y3B1ghXhU9baQ/3ir2oD6AEhvVVK7NJcmE9APv3RX8w3atFmbRxYpk6odLmqFTjnsNW447sdCezcR8QAwe/7hbqRYfVyXeTaBw+CZyNMhwbaxF8WYOcrspOjUcoWjthKTSCS7Bp79pnHOEJEHoyUY18L7w7LH+zKk9NLwVEzu8UyNG//uoO2SzdMo5Sj4xfrifOO303B8uzwA6oQrJIW0yResVUdJQlck6GqrKgQpfq0bpTWZ2b92EmTcoQL+M+nc+M0q2yvQpJzMI6t5GDE1SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9apaPPTnjSqu8LtpyTROW+bRkNYhnWQs6XyXMPFgRvo=;
 b=fxJoCbnCXnZKdsYc/qY47uWSYVoaJt3S/bUlYWKUtToFpGjeYvctUzqR+UIezwpDsJggfIoNWAmRaZzHWqKD6/CvrvshUwIq+y39JsUHbkiFL4lA6Z/wFw9nMpixnbCY+RihDc/v3HU0PQOVIlw5Ce/UGzedsC7jeNDODWbmhZWKVzpAEYFczg+Jl5BaF71X9atUGzDEIEpRr+E1UeG73FkQQEBhzn9VDhTfnXBJaRsYcnwCpUxw5QInE2y5KgDjZuGOz6LYwA4L2GhuU4bj8o/baCfl8vuFJJTp/J9jjTcWquCvzLYbxLMr175EbzqMXgYGKxhgRUkI22r7gu4oiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9apaPPTnjSqu8LtpyTROW+bRkNYhnWQs6XyXMPFgRvo=;
 b=KYsqOftwRV07OdDhSjY1gcdYz7Kh4DMbzXaGUB9QdBB8MwJ6Ht6zYdPss+4Zhsl51DvmbS32K/VCxh3hj15bOqh0zzYZwgKSBb9C/fuzw0F/ysAhSupOXhmWqUHf7v/uIr0l4H9TCC8B1tIIvaePXt/NNRC+3Cdxol3boQB0Hpc=
Received: from MW4P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::30)
 by PH0PR10MB7077.namprd10.prod.outlook.com (2603:10b6:510:286::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 12:28:23 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::60) by MW4P220CA0025.outlook.office365.com
 (2603:10b6:303:115::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 12:28:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 12:28:22 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 07:28:07 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 07:28:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 07:28:06 -0500
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.51.155])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JCS4lR2786212;
	Mon, 19 Oct 2026 07:28:05 -0500
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-gateway: Add 11.02.02 release config for J7200
Date: Mon, 19 Oct 2026 17:58:04 +0530
Message-ID: <20261019122804.472036-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|PH0PR10MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5d95ac-9b62-4102-b946-08df2ddc771f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|56012099006|261009223027099003|10067099003|18002099003|20052099010|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 
	3WeTGM6J68MUuJjHiR+gez4MmWD+abWSTClyk0MVYJNzLtJTlh0SZFwh2uGuA/3/nQ8KL0NF6KvjG/T+U/3V7eENZIlrGIr1n4UbEP4p+Z34zM9QDfSZbXyCd60si6q6PF6XeCBh04sV/g4iD/T1MEhrot+EYIA+h5dAedFPcp64dx8/CV+Y5GfJUULPJqWGiNA+0r9uy4aFsvyRuYpPqNBq1695FEP/C/HGGedeZUUiqp0rA6v4un8oRRI1LMNXFy1XyAm4BOaeVytqHoBjLRbKnqvBr+/H/1r4hRNwiKLsaasntJximOFxW5Z649ivuACsEQiAls4RCvPg06xKJVWWcFYjedJBQMStN6MioJyVRP7yY45GWD7qiyvDGQqpxcqAlehsnvioiwPVjhWuFL93HGRmcdg4XudTQJepvRV0w2E/jZVg0kopFzEJiWifGLPZlCwTRZ8gbuGcUI3zEixwubd9TTR6GCNGjnUymfTNIitD99ZQUmikJqjFQLl7rubltphzEx4NAK/1MJ595bZjQ2tKvcHD99efV9BvIcjFXgUk2PXgr9OdZpVEGr2b73mZfnGhT9h2zFhGoncThd95muM9Fl+OQRMMdj2NMaYX4dzRxAuIScNzNEOKEaim8qbyg5tUm+QYAsD1ebbQhQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(261009223027099003)(10067099003)(18002099003)(20052099010)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gLHOA9IVMM34h8Cu3q5yZVLKrQwyh4Tbelj3TjAzy/MBllObVUtUWzxPnFTOCTgfzOgsPRZwnkDRIZ57x/BZ6TcKcqNUQOzTGRcInf2TEA/3X7kHM/6ehdZ0HjDJLHvIMbx+OMJ7Ae8YAq08wYWhYjeq7of0vPgHrCHJgaUUMWS9lfOPkTFPEPogyXTLqUSVzsn2zx5Y2bfTYLNZqRybKBoKWkVOuWXe15L72k7Aj1ALZaV1tlVIIbreBHhjLnyft0fxBkWWnHD/cjH8Pj1HACyxaO7k1yGjF0uZasVGLCueUDi9IvpoAn0HVZtN9J7Q3hJGkhR/RdecyzvwjuY7L9BrXKAY8Nis/lswNAMshLUwMhM5BDsHsuBnQk6XAkzm/2A2dKJiBlSDxO0SoUrYvzMfXOcvKtwJcN99xzLbsbzyXGi9ccWh0XyhBNlrQ8xT
X-Exchange-RoutingPolicyChecked: 
	xjg4pfKErdG8HAglBqFRPslOvrxfMXuhEn4QkFLVLouoHDXkyz8H3kTrVygIkK2pLlVxh4IIVwm9+qIAGbNAu53oWwi2QniFXfqWBiVCx2Ylza8xRu2Lu9DqXtNUaqzIxSI5aAZ9FtcM+NCiq24zkOCjzL41KbsBIt3NBBBULepsDsyRzNj74/YO3bZz1sqxjJPnUB0Frb4gsa50tpv8BX36MCFy+Jgp4FPBfUOyck2pOxQCX6Bfr09LkNpUUW5FSYPrQZLOVaxmROL2jOW9SxPfjCIja9pyWIUaJJyr/jeYEqXYSWjzDnvBHb/On49EPjqkGq2pfpqUpyZpv5SSvA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:28:22.3239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5d95ac-9b62-4102-b946-08df2ddc771f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7077
X-Proofpoint-ORIG-GUID: sbrraqlfHl6TnI_RQOmzBppurmkwamGw
X-Authority-Analysis: v=2.4 cv=ZN9CCn7b c=1 sm=1 tr=0 ts=6ad60cef cx=c_pps
 a=XZql7kJaNSG894ZXpSE/kQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=WNDY76dxAAAA:8 a=NEAV23lmAAAA:8 a=SSmOFEACAAAA:8 a=rigk-JvWGIb3QcuA13QA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=HFDSX3BADwN2sFIQuyTb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX5YtQDm/LAczM
 YRDqcf/v0xIRXk/a/WYWkEGvvzV0q3DIZFooYCF0qCwymNZStZ9zbClWCtWS/7RjxdylqXeJSSb
 GZ62KfhkegHb9b6RzBzSaI/vfanzEhCxV1O8wn9gOV/Zp+/R8sTAtTm8bRAFedryHAnrBnWRJZE
 Oi1ukwMMFOCyOB/N2k+QUcs+xPbeCQZKyl4vyt47QAYBcF3Fa7TQkSpefKv9zSydertd2I4Gc30
 RA+VtEa9VUq4hNhrCuC3FPUvsclrjj5Xk3mxKCr+YGC7Aboru5SjSUwT2h2RNV60WNaRHY8utuZ
 opEJ9fZch/DqKQFpOZAdxRgWIU3dE/xvxUf6B+PCpoDB0tdb1QPZZlnrStk6/eiP98QVdR1vOUL
 hVoWbdLgbBnj4LUPSXpK52378ig0+KVZG//jhlR+mYe7s/QNoEAVejAefyz0uHPbn4aFkEic8sD
 l9slxP2D4w0ON3U6NmA==
X-Proofpoint-GUID: sbrraqlfHl6TnI_RQOmzBppurmkwamGw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX7Vf7UYFBeVDu
 8ae1QBrfxPCIzPkH9OvsTmsNA8d0eGrmfv+YBfTpGGQQbvhqpU1Z5x9PjOQ2KTy6Q1WlN6quMy+
 cgK3xe1Dg/KyIBpezKHshhtZUyD2wWw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190049
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 12:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17742

- Add gateway config for J7200 11.02.02 Release

Signed-off-by: Puyush Gupta <p-gupta5@ti.com>
---
 ...ssor-sdk-gateway-11.02.02-config.conf.json | 158 ++++++++++++++++++
 ...processor-sdk-gateway-11.02.02-config.conf |   5 +
 .../processor-sdk-gateway-11.02.02-config.txt |  24 +++
 .../processor-sdk-gateway-11.02.02-config.yml | 104 ++++++++++++
 .../processor-sdk-gateway-11.02.02-config.xml |  91 ++++++++++
 5 files changed, 382 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.conf.json
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.conf
 create mode 100644 configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.txt
 create mode 100644 kas/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.yml
 create mode 100644 src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.xml

diff --git a/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.conf.json b/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.conf.json
new file mode 100644
index 0000000..4dac993
--- /dev/null
+++ b/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.conf.json
@@ -0,0 +1,158 @@
+{
+  "version": "1.0",
+  "description": "",
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
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk/meta-ti-foundational","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.conf" ],
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
diff --git a/conf/fragments/localconf/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.conf b/conf/fragments/localconf/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.conf
new file mode 100644
index 0000000..64ceabc
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-gateway/processor-sdk-gateway-11.02.02-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-gateway/processor-sdk-gateway-11.02.02-config"
+
+BB_NUMBER_THREADS = "8"
+PARALLEL_MAKE = "-j 8"
diff --git a/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.txt b/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.txt
new file mode 100644
index 0000000..9e1ada0
--- /dev/null
+++ b/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.txt
@@ -0,0 +1,24 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,d3b32587c2314febf96897f97e0172790b4fc1cf
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,dd1b7f9b85c093931f3eed954d28eb6f52e271c1,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c945b9bd40ca82960e05,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,ee1ec1ee542389a3fc3692fdd232f9dd86c849a5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,0f00f8b9a21950640da8c5707343e5540133f86e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,a28461e373c3b7c05d7eddb5067a114babcf5537,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,0a4b911d9fd63ab29c4532a907fae3282dbdcfe4,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,cc29beb210ab94eacc53bbd67e287e4e33ede342,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,07ca97baad7b182849ee50f0bd629b68dc9f53b3,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,1f96dccc01f10c73295e0bac6a15a97d3d4562fd,layers=meta-ti-foundational
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+
+LOCALCONF:BB_NUMBER_THREADS = "8"
+LOCALCONF:PARALLEL_MAKE = "-j 8"
diff --git a/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.yml b/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.yml
new file mode 100644
index 0000000..d4e79c5
--- /dev/null
+++ b/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.yml
@@ -0,0 +1,104 @@
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
+    commit: "d3b32587c2314febf96897f97e0172790b4fc1cf"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "dd1b7f9b85c093931f3eed954d28eb6f52e271c1"
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
+    commit: "ee1ec1ee542389a3fc3692fdd232f9dd86c849a5"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "0f00f8b9a21950640da8c5707343e5540133f86e"
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
+    commit: "a28461e373c3b7c05d7eddb5067a114babcf5537"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "0a4b911d9fd63ab29c4532a907fae3282dbdcfe4"
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
+    commit: "07ca97baad7b182849ee50f0bd629b68dc9f53b3"
+    path: "sources/oe-core"
+    layers:
+      meta:
+
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "1f96dccc01f10c73295e0bac6a15a97d3d4562fd"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+
+local_conf_header:
+  oe-layersetup-local-conf-config-specific: |
+    BB_NUMBER_THREADS = "8"
+    PARALLEL_MAKE = "-j 8"
diff --git a/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.xml b/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.xml
new file mode 100644
index 0000000..701630b
--- /dev/null
+++ b/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.02-config.xml
@@ -0,0 +1,91 @@
+<?xml version='1.0'?>
+<config>
+    <description></description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='d3b32587c2314febf96897f97e0172790b4fc1cf'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='dd1b7f9b85c093931f3eed954d28eb6f52e271c1'>
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
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='ee1ec1ee542389a3fc3692fdd232f9dd86c849a5'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='0f00f8b9a21950640da8c5707343e5540133f86e'>
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
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='a28461e373c3b7c05d7eddb5067a114babcf5537'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='0a4b911d9fd63ab29c4532a907fae3282dbdcfe4'>
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
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='07ca97baad7b182849ee50f0bd629b68dc9f53b3'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='1f96dccc01f10c73295e0bac6a15a97d3d4562fd'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
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


