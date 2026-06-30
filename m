Return-Path: <p-gupta5@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B640C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:10:33 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16658.1782810629912948163
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 02:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fDgAZ4kS;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=D5wMjCjb;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-gupta5@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5eixa4172347
	for <meta-arago@lists.yoctoproject.org>; Tue, 30 Jun 2026 04:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=6lGs86YzsMwgp
	mwOQHeWsORfF794/KgccJP9zkNnEkQ=; b=fDgAZ4kSU4cxZtUeeUUXc/Jferw1J
	99/xeKPu6mzUelK77BO6TQNqPqMGOs6RrYtnM2oWxts22+eELXSVuriyv7Y/kioc
	mLJrAA3CY3BqzGMEqWScliLfOUVKeZmLSOXWdUftHcz8XpvS8ZQBcbJdkCEDqBzo
	fs1iBHMRXNTSYupieasGAe2jGQM4WgciHZOcbx7mJpVPlOK6+NGc6Sq9aTzPPP0I
	DrBXfdjy+xOpzbBgBd+Ypuyurtpuc+T4/iBoNFMyQBZYN2tF8rUpH6dRczSDW0zO
	giPeIIkZC7G82XjZxtk82lO1pTK6C1J6K3OotaGEyBDMqDKsLf7/bOI6A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f3qp5j22n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Tue, 30 Jun 2026 04:10:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFbA0c4I/Ih9cOgGO+TZ05YXZ7c9FJHgFswii2s1Wlwjhym65PmvTvk9wbDpWEU4pgMtPT0HbX28FTyZU/Qvbf+fyQfDxw+2Fq7LEJiPFhOEDKbBJYLRdYWkoLhDMZQLAGW2ZGFdpl2FeGF01pKVSKWVhVc1MIldycZL6fAzcvIIGC7tKHAd9p5LMJkxdfZmlTC8Agz1Ov5Jgzjkc+Ih5C9b1mquRtriywSCmmUoTlX8l7YxRw4VZLDghkIfpwdolAS9vUCTXxV+8XeeCntwmDiPeT72vl5QQzVkcezuh/W88JRUKltGeHFXiQg8fIKI0M1k+aN+xRLD0DqMtATEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lGs86YzsMwgpmwOQHeWsORfF794/KgccJP9zkNnEkQ=;
 b=jezRMdQUWq5ZE+SKnzqanq7wgdXpOYjhE1yOil0jEneOwMNmyfwjNqvcKk0jOud7cKY5tckSL2sSpcygSDSWYSKOydczSiG8Kis/orlfZvdfGxLeMF+ka0dUVr6qyKE7DkqziAZdoLDH2nBTOKC7UrnFs629VZ8q4jlFH+JXuIf6sAGPnXYNc2UwL5P4lR4JcDsmwP044B5mPuNQR+M+jMhQ3Toq4Vl2PemZ6dLL91uJfkuiUhdWQ/ylN+AH1CZmRUb/Z4mDydrO4zGuW7uj66neTUrayC9bE2UEk+eYW7IWK1O0/W5qwNKL9+KY6xTY4NWFuYAeCaZlVx7kww5xnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lGs86YzsMwgpmwOQHeWsORfF794/KgccJP9zkNnEkQ=;
 b=D5wMjCjbw1/DxSc7qIj9vo05bZaw9IwmU1HZDbI6ADHv2mZlXMVVjO4w4ncWtdhW+gix4TtInJKs7lNLMkRyA9XB5q6wFocwdFHjLT9XZJ8L4RAtIXvYDJ80Li0vPI27IaSBhthEQZZ8inNS/oXgfcjYE/gMBwD3hggCDsQcP/c=
Received: from BN0PR04CA0195.namprd04.prod.outlook.com (2603:10b6:408:e9::20)
 by CH0PR10MB4937.namprd10.prod.outlook.com (2603:10b6:610:c5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 09:10:22 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::32) by BN0PR04CA0195.outlook.office365.com
 (2603:10b6:408:e9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 09:10:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Tue, 30 Jun 2026 09:10:20 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 04:10:13 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 04:10:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 04:10:13 -0500
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.51.155])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65U9ABOS2138717;
	Tue, 30 Jun 2026 04:10:11 -0500
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.02.01 release config
Date: Tue, 30 Jun 2026 14:40:10 +0530
Message-ID: <20260630091010.1796650-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|CH0PR10MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: 80abc0cd-e3a6-4183-a51d-08ded6876940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|3023799007|20052099010|56012099006|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	9BAEo3gYRM/VEtjnYRqsPdFiDVoOQ+DLisB1ZYWJi7szreyJtrmc20im/Xb2F8tLUs60t2MNx69Q+RUQgl4nPTXnl89njOnX14YH8I94eKEh70GnJ3i9euv2LTJAJ7K2AGkGI0cdxbbQtAe14pnu5auFS5xu3Biqz//T3Cd0GaB8tVvWar5iNznRh7H+8qe3FJWtLF2whoncf3bOPfssQzDyt7ER5CTdosZTvxXKO+EUNEo3h0W+90e6nLsg9iL34h+OpM38vowWldyu8I9GreNsFMYm0Huixco115vrTeMrQO9egh9o8q1gNOcYZZROpAASlaMOR9BBN3k17zRN6HBKmJGOLzgJszhCOjZys73t8W0/jWbd5zuqD5xGgWWONSJQf8IPjLVVkhPefppwyquiSvRIa3rx769ks7Xi4RnliotABudpkGh/qBlMW6dyMFr3durUy7+zYNkG0vxCqOKn/VWN8eNPLU3V/3zpBvxiK3O63noyHbhKBShK/11p2DZ7df+CRMK021390kp7pEi/6j386BwGFei51dMddBV31NajMVssEdBieFRubTH/tNJPdXSFW4qSXN5HNhWLTAJoikxnCOwc/TiBDJG4EmxFe5aqlZb3xkCn/aRegxkWSpp5/UarfqXW75IIQBpGoQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(3023799007)(20052099010)(56012099006)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	21VaUG1qNM2fqCNbBIMDn4Tvqae8XLwDg4D0JraDgC9C+c98YSWvvbfURtVDrZnyCOb2uqM4grBYoYkhsz2OJ8YZkBS/fT7Y2bPf1v7y90BYQMtvEzuUvlAsdFqZM8HvtYP44jeieJpIHVeoxw0fjGx7dGSVhz2zzwonqA57L+2mGU/QoXPrPwrG/mkFXjVqLpBYw2niSynDm30oeMJyD36heJmC3nLWNC0Yl1MfQwH/MVA5f0Xn/h7ZFyzE0kRfNE2pZ9BeSl39sI++kiT+4rT2alcV73i54ELW3MI2hr9hx0kF5mUIknqN++cnnPJ35olpMI0nN+Ydvio7pcka//+sz8/achG2WSCdFYcYs2Qr/4Gf9D/u2TOSEFgb9DoU/9Qx2l1OrDpHTCAX1gXcnN0UDjar4TpyBE4pQFtcIO0CwBPB97viUIGBAKTnBlRS
X-Exchange-RoutingPolicyChecked: 
	l5UVeX/8eHUVUBuYbDgyuzb0cAxzNGiUrg/PsHZuNcop7WBEOhHAHhFh2o+7tinMQI2/5Jc9oxqgyxem1+ADqLO5AcUl/HEdgAqKZZVx8sjBWYOFubQU3ZQcaeOAH/92TNnWQlOrEgOsVqhshDq3zPk8L6KRP5XokB3pYzu67JrkTyLpMS3BWWvzZQQAvetrncY0+HIqLWg/YU1w/5PZ4s8bzQgS8rxFYTvnHUgyGcc1OF1EAwzd517M6rWI4ZVl2rbdN/p/jyIU8CI7XcCjaQAKynYwqAs64EM1fe7TEpH0oW6iE9npghQDULt0sr+RcS3BdUZXLDs3BZp5R1x3Tw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 09:10:20.6805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80abc0cd-e3a6-4183-a51d-08ded6876940
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4937
X-Proofpoint-GUID: IrR7I7dbYuTyA9A6Kx5Ta1kSsFOevFs6
X-Authority-Analysis: v=2.4 cv=ObOoyBTY c=1 sm=1 tr=0 ts=6a438804 cx=c_pps
 a=KKuy1w1gR68tVOnyqteslA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=WNDY76dxAAAA:8
 a=NEAV23lmAAAA:8 a=SSmOFEACAAAA:8 a=LJPH6ROh-ywWrxKlJU8A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=HFDSX3BADwN2sFIQuyTb:22
X-Proofpoint-ORIG-GUID: IrR7I7dbYuTyA9A6Kx5Ta1kSsFOevFs6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MiBTYWx0ZWRfX9QwAzq+S1wtX
 W+CSQZFbYJyrtmOzLS77ba/RyVv6rdL3srybiuPjBCwoOjImelUvR6zHdYdo3ISWtdl912d0mpr
 lgaOnCeYIl00C702j8QM0M6sZOGsDq//FYspuk8fO/x2a8SzCMgylBeq5WXbQ7N8U3uX3MBPsmK
 lbjXsTDUbLn33W0amIhOlJi9xOReepNrwQ55FHMkJ+nrQL0alu4VGIqSzqJY2iRSTAwB+6JeGLX
 i/DcuP4owAEswuMFVpWCr7XU4/gkTfBxF35hqMET53iO1szSoGOhRXkgleoq9zBWT80Kt8L7VJ6
 VvtbEQlnlLP1B0ypP22rTn0kgSJ01W7qIM1nDPraAIZ6mor77tBeqOa7Hqho6cjw0KQ2jvTZu7n
 6mYrV0WTHVTMT0fGVPZqazRsoPAb9ikZGWIHemf3f1DCjMHp/fbi7YY5H+Ny/xNfk0QBAvsj8IA
 HeN7267ZVouSfENWCwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MiBTYWx0ZWRfX+fhIwp37rTES
 NrtXpgr8N5X7FzE1WImKrJgCO6bddWGRaSg1pp26njCz4zhLEuWhF6AZLVHFLYFc78h8SCld+B7
 R8ILPHnYs+pv3EiphMCVuob+IWkFF/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300082
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Jun 2026 09:10:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17576

Signed-off-by: Puyush Gupta <p-gupta5@ti.com>
---
 ...or-sdk-analytics-11.02.01-config.conf.json | 169 ++++++++++++++++++
 ...rocessor-sdk-analytics-11.02.01-config.txt |  22 +++
 ...rocessor-sdk-analytics-11.02.01-config.yml | 105 +++++++++++
 ...rocessor-sdk-analytics-11.02.01-config.xml |  89 +++++++++
 4 files changed, 385 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.conf.json
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.txt
 create mode 100644 kas/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.yml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.xml

diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.conf.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.conf.json
new file mode 100644
index 0000000..76a5964
--- /dev/null
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.conf.json
@@ -0,0 +1,169 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK Analytics v11.02.01",
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
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
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
diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.txt
new file mode 100644
index 0000000..bd118eb
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.txt
@@ -0,0 +1,22 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,a4daa14312d659333984aa1ae58ddfe0c96392f1
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,f6dc5e4817c6551ea5250ab1beed6ffc6fc235f2,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c945b9bd40ca82960e05,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,9d0007a369deb4a6346f5ab7a9e6d432a8ed14fe,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,d8cc4e44001c7257273d290ce8c4496e93d32841,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,9859d582984a87b42db107127e829c976f315ee3,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,c4fd56386ee30f8b46f8e4eb1220edaf510d2ac0,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,5bce7e26a38a58bb52242494e54ab2af40009574,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,e2864ea1ac022e43af92badc701fa1e2a9571f46,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,4298b217a5049718241a0ad523b00c4390e62bfb,layers=meta-ti-foundational
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,04db1a86f468b1072eaf72cb723b0d1b76a505ce,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.yml
new file mode 100644
index 0000000..3e3cb0e
--- /dev/null
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.yml
@@ -0,0 +1,105 @@
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
+    commit: "a4daa14312d659333984aa1ae58ddfe0c96392f1"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "f6dc5e4817c6551ea5250ab1beed6ffc6fc235f2"
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
+    commit: "9d0007a369deb4a6346f5ab7a9e6d432a8ed14fe"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "d8cc4e44001c7257273d290ce8c4496e93d32841"
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
+    commit: "9859d582984a87b42db107127e829c976f315ee3"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "c4fd56386ee30f8b46f8e4eb1220edaf510d2ac0"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "5bce7e26a38a58bb52242494e54ab2af40009574"
+    path: "sources/meta-clang"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "e2864ea1ac022e43af92badc701fa1e2a9571f46"
+    path: "sources/oe-core"
+    layers:
+      meta:
+
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "4298b217a5049718241a0ad523b00c4390e62bfb"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+
+  meta-edgeai:
+    url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
+    branch: "scarthgap"
+    commit: "04db1a86f468b1072eaf72cb723b0d1b76a505ce"
+    path: "sources/meta-edgeai"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.xml
new file mode 100644
index 0000000..0c83ee4
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.01-config.xml
@@ -0,0 +1,89 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v11.02.01</description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='a4daa14312d659333984aa1ae58ddfe0c96392f1'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='f6dc5e4817c6551ea5250ab1beed6ffc6fc235f2'>
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
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='9d0007a369deb4a6346f5ab7a9e6d432a8ed14fe'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='d8cc4e44001c7257273d290ce8c4496e93d32841'>
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
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='9859d582984a87b42db107127e829c976f315ee3'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='c4fd56386ee30f8b46f8e4eb1220edaf510d2ac0'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='5bce7e26a38a58bb52242494e54ab2af40009574'>
+            <layers/>
+        </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='e2864ea1ac022e43af92badc701fa1e2a9571f46'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='4298b217a5049718241a0ad523b00c4390e62bfb'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='04db1a86f468b1072eaf72cb723b0d1b76a505ce'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
-- 
2.34.1


