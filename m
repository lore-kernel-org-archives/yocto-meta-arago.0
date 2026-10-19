Return-Path: <p-gupta5@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E494CCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:23:22 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33041.1792412594340523198
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Oct 2026 05:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=l7kVcI3w;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=bolVIhQT;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-gupta5@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69JBUrcc3096127
	for <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 07:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=B2O8H/fPdyuwt
	CaqugP4cfR9AcHHi2n3IYHOM/0aHVc=; b=l7kVcI3wJRaCCwovjFnxg4np7gxih
	AqXqUu1cqjOrQwz/psLmkV2cFFcUa+TCcn6tg+3kVWK5XSeBif9Y920BF77cx82S
	Uk9cEkAPzRWO4x7VsWVn+3AII/mfH22vIaYFhgmc5avkTSXTqxL+fKMedwhi+D7E
	CBbJWqsV9i058vxaipYbNPKar0rhqK3oGA6tpU6rJV4l+D7mAm5s7WJVo6R1Q2om
	1olXRhrJCma/Sr3QYqyrFBmVfHypyV24Kr50WLIYGtguFDIGTgemGbJyZVRNSbsk
	SdFRUBvitYif6gDZhVzsGZ/e45jQUecPgOtfIEQmfHFiHgTJc+/o9TiFQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012046.outbound.protection.outlook.com [40.93.195.46])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hdjda8879-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 07:23:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqm2kLGDlsH0a0fYnAXuzL0X5OSw+eWHPEZmj9ZjzvRoe9bxHsXVLCbUBBEWjvn2dkU3RTwa8hcpUUsNhBxkg9RVIfNQGgBSEfzYG2CiTohPblQB9kIPHkeMj0dvaajGbpE2xK7UEThCnzuLrI9ibsFT4d88jYlWxrRiSQYr5NmuIu1Ry84sJPQRwD1h39QNg0ThF6CmABDFhraGHh6zp58T56cHkF1AXYXEYEbVK6/OaIQkUV7TOtuEIOvt/zshEUPYpU2fQHCH228SqEEv6nxBkbLTkn+gHxP4hUsT8jjvVxH1THq3F//o/0PEijLt9ZH6i0iYsZlITjJJ6yJMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2O8H/fPdyuwtCaqugP4cfR9AcHHi2n3IYHOM/0aHVc=;
 b=DjzfUiLJuQM98kxQAA/59fydDgXtLCceHfk3AmF+DnyKAkec1/2j5Z8mOvLLgp/utEuee/TGjuN99Nywl3pMij8xqVnoGePR/bQv/BBgUDbXJUwlgocy6BD6WEkAUevYnFgmKKgzHlH7UO4ugBkWKMysiqLeXZGidAr5cl/AEb8+wMg5Wn+qsM2AdBt50UDxTf0ynj3gk4uvY+yHOWe8XnCSKDGL/Qasldl9NCxfLiNUV7WXDYi/F8Ywk13CH2aIGB1NotIXlHdDVp6GZ323sFS+2/AtoUrvh0V45s5Pmi8rlnBDD2Lp5OSqFCaol0kupBR5TJ0APvMW+mKsipm1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2O8H/fPdyuwtCaqugP4cfR9AcHHi2n3IYHOM/0aHVc=;
 b=bolVIhQT/U/itU4BkHEAsc0HGq27z1yfYZFE3fO+zA3zF411JgxXNdaXePsb+A70ar+F+bCIVPmyZjtWbl2XBLbKSBqbnAj1ug5G04H0T2rO3ngxlJNl5pUAd9uYfS/aCT9A7/hGNViCheQQUSK93yS4aebEjaRpgqCQ+mvQRQA=
Received: from SJ0PR03CA0343.namprd03.prod.outlook.com (2603:10b6:a03:39c::18)
 by IA1PR10MB6242.namprd10.prod.outlook.com (2603:10b6:208:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Mon, 19 Oct
 2026 12:23:08 +0000
Received: from MW3PEPF00001655.namprd21.prod.outlook.com
 (2603:10b6:a03:39c:cafe::4d) by SJ0PR03CA0343.outlook.office365.com
 (2603:10b6:a03:39c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 12:23:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW3PEPF00001655.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Mon, 19 Oct 2026 12:23:08 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 07:22:44 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 07:22:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 07:22:44 -0500
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.51.155])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JCMfDb3723764;
	Mon, 19 Oct 2026 07:22:42 -0500
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.02.02 release config for J722S
Date: Mon, 19 Oct 2026 17:52:41 +0530
Message-ID: <20261019122241.471108-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001655:EE_|IA1PR10MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e514a02-f792-4a30-29e4-08df2ddbbbcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|56012099006|261009223027099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 
	WZMhVImL4TkBGAR1AJc35mgIAybDkNtid8sPJSidSvLUNro1WSorClxDe1BCBLernu0T3yOk5kZXphjOALX9y6c9AbKqtEkhNY2wzt/eefNRwofgh8eDsIyp/RYM9xF0jsl291eMzoTbDi76H5NxCTOOz50vU2wpApafrmT4ApgAKm7c4eVXPvTRvKOwmoHsFDCMsxuGy8E95Q6IllBJ8+GhXK4lVKTQL/OJuWvI+WXzQOyIvk7Lz8nHwC8zQyz8cWSa/WbhY/ta3cHBNIdbfTFKz6aps5+khCvnO0MLVgSKrOdj4eNcsZS3qT2aLtH0r8LmxR5uDqgMF++bAGo3li/vb9N6LK7Gp70KCmpp0ZBP/yzyKAws3HvYYtpywlYf8CiW2NkX96g/QzII7n995sTdFcAzS906ennYDw0sf3NFsshrz5pdhn4RzS6Q8qomyHhaaT89FmiC+DhbO9v+YYd8Q7WHtZYQVYQ70rIBJnIZbfnU/nHJh3dEdbLCO+Z7/QhV4AwPEIvLeBkkkiItWgGfnlkbICKhKb6TxHU1AJsI/TQcVrgepzUS85HHgjPJ2+HAOKJYIF9BSX8ZNRubWWoDAAtusyQGYVgcoFKu/sDbR62m1IwwjbBtPhzBtqcq
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5ozPKJ4AX3HOfGNQ3oB4nHNkppYKPhTVYtGWZX8jIDN1PFHEifUqSki23uqUXWzc3+ES4sUlQRbXSxCh5entOq6q6ui2gYQLzcX4nDVchlypxaVg+RAVLYQBhiibx5nBf4p3OehEbCGgn1nAuvv79GNbtDkJMJlqmQKjA6i6yC34rPYVkR8+ScxbYxuQHcX689ECuyEsby2lRAPaZ3mLuhk+30eLY9//R0pWWS+adKuTGttLU/GrFSuPYY2+kgpQ2O0AC3vg6oO3prfr3rrQjMI20EAIjlrok8Ua8uGcHS+opaK900Sapg2vhNMbwJbyz2pVFof7VyvpYKcG/rWnyHcGz0PhuNVjTKVN1O2doIZIYo7TyZ8GzxE6rq20W4mvfjmV4tNW/asANRhGR4C8sGfggCWiED9iLKreiYLJTxidwTDjZ6Be9u3xks4VV3Kn
X-Exchange-RoutingPolicyChecked: 
	h7iQp0r6HgGGeaiDy4fYOOctCAJ81bOf7qXGp+5gR8beMcMk4jM5B0MHXzUxwGiuMyo2D3R9Bt7u3wnskdjU/NsMd7KttGOFb75kViqWF4Za7rL1BowvVg48+D8ZoXJn7iXMiiiRFVwxBDg+geq72Q2A+2/GOzUar6z87YRaOTsRjaoQ7PANKdn+s928XeCazrz+RTpCoo4dzE3rNffHBzN+fCObj1dHPZRj0ZQoVwoQ33FN+d4B5DqDOzheqimMTXHDqX2r3jsHZDFWW+/kCn91+ZF/Cm6GnKBeG7OjcF+ELSUaOdNTsQQ0yEbAM2EBFUrIdCrpxML3jQsyvzYuoA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:23:08.0486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e514a02-f792-4a30-29e4-08df2ddbbbcd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW3PEPF00001655.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6242
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX3Qro/th96C2A
 nuWc55jCChtpnjYfOdV1Nwqwb3kLVvvh5L2HAemBJqYXa+WdiK+9KEQLibuKARMLPUq61MDOKvG
 hqRPyUHUJhWKeEkV4j+Cxc7q1768oT9daPmljpSKDacMmGUQYogjcy/Ui40toDVo6HncYdnXp9H
 b72O0sZ+JeDQm9nYM+cqhTyYh4C/hyStE9hDZXAYuqmP37npBO9pOEsIdjlCvs8Pckc9SGBViMb
 JH3Q3wBM2xJpiUhdlAJVO22AxNdrzJijJeoscLFrR6m1GAaL22KrUFfJYCmqIkF5qijOaMwyxNl
 OvC7Cav44AT+Gk9X07tVfX1VgnN4CuzV0/A77TLnwBDmboZw2rSvdrMXomFltQ2Kx2Zh0sp5Ym/
 PAn5Q2X8xQBsPhbotBnw/KkpEw8x0IfmkVWPmgpViMtFOtea752UpWQZroyU8X3KwSGgKRY2eQQ
 nCT8c4MbD3L0qsY1wiQ==
X-Proofpoint-GUID: fTuawqeNi5CzgKkElrOe9skOfxWK-rIW
X-Authority-Analysis: v=2.4 cv=HPNWhYtv c=1 sm=1 tr=0 ts=6ad60bb1 cx=c_pps
 a=bI4C2FY7jnHyvFZ3dxthkg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=sozttTNsAAAA:8 a=9vKGkk8ZmcXlTsREfecA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX82hcKqq08eSD
 hjGy/66xhtq5gemQw1TQ2vKLxYxmuauqPKap9xDhqh9+hqPZx5TrIkd+e6SezB5RuyOrrysHm3F
 cUDsHBajZ3v75E45sZXJJTpaqenXHAs=
X-Proofpoint-ORIG-GUID: fTuawqeNi5CzgKkElrOe9skOfxWK-rIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190049
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 12:23:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17741

- Update the config for J722S 11.02.02 Release

Signed-off-by: Puyush Gupta <p-gupta5@ti.com>
---
 .../processor-sdk-analytics-11.02.02-config.txt               | 4 ++--
 .../processor-sdk-analytics-11.02.02-config.yml               | 4 ++--
 .../processor-sdk-analytics-11.02.02-config.xml               | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt
index bef5076..6bb1461 100644
--- a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt
@@ -14,8 +14,8 @@ meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,045eb74bd9abe7d9ccf365a
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,cc29beb210ab94eacc53bbd67e287e4e33ede342,layers=
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,543550522f831479f07d332a40ba343c53ae1065,layers=meta
-meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,3eea2c684b9fffb2c5dda40a569d63e9a0bd0e0e,layers=meta-ti-foundational
-meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,5dc140cfd2ccd2b8175c123bae15b1c6d5a3ebeb,layers=
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,3ab112850d7f52f3ab443b2a01e863ca29d7ebee,layers=meta-ti-foundational
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,32a1b0832dd7f545cd88808419916be71b7b35fa,layers=
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml
index 3b44144..549be2d 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml
@@ -93,7 +93,7 @@ repos:
   meta-tisdk:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
-    commit: "3eea2c684b9fffb2c5dda40a569d63e9a0bd0e0e"
+    commit: "3ab112850d7f52f3ab443b2a01e863ca29d7ebee"
     path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
@@ -101,7 +101,7 @@ repos:
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
-    commit: "5dc140cfd2ccd2b8175c123bae15b1c6d5a3ebeb"
+    commit: "32a1b0832dd7f545cd88808419916be71b7b35fa"
     path: "sources/meta-edgeai"
 
 local_conf_header:
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml
index 2c8043c..0e9d817 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml
@@ -71,12 +71,12 @@
                 <layer>meta</layer>
             </layers>
         </repo>
-        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='3eea2c684b9fffb2c5dda40a569d63e9a0bd0e0e'>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='3ab112850d7f52f3ab443b2a01e863ca29d7ebee'>
             <layers>
                 <layer>meta-ti-foundational</layer>
             </layers>
         </repo>
-        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='5dc140cfd2ccd2b8175c123bae15b1c6d5a3ebeb'>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='32a1b0832dd7f545cd88808419916be71b7b35fa'>
             <layers/>
         </repo>
     </repos>
-- 
2.34.1


