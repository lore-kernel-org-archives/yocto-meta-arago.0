Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8541C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 20:12:26 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4458.1790194345531104861
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 13:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Uioe7Q8y;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=rIAiYyaZ;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJkoxv2099210
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=9YunKrmPs5t1A
	N/wQuD2FTqYnj5QcFXu2p2Ld/QQJtQ=; b=Uioe7Q8yHzL6beVFjPJr/88v6BZf6
	JmF9/xlwjhvqJxXPNrSgIlrAbasrmIBR1FTbVquShLEW/xlkIw7ZLVg/I+sVNyu5
	XLH09uD9/8cJHVSeW5eMoD2UlMYlxvnQJyta4CBBvE+uCTgWgYwHAnAza0mlQ+Lu
	cW31qbox/CNJliyODOMk+Dr7i6pf48hJKHdxZ1nG8TyZK1+ZneNvdfCBo0/Va8An
	pXI1RbZ7/d1NYbZV1P6KOSdD7Mzn9uJ7vWBenw9K5xH8Wjb8fvTPzOhqqyoRitIh
	dpJZGHIzo01hL/5hmxXe0tYP/kxVhKNeCYCMNoSRUJ5NjuBYjgf5vUwPw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycy9m7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:12:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dh44Y1XAWtSnlwjsSP+J39+R1R6on+dK96cmFzvtxWn+DP4koFvJZHBOcPcxM7eyoYHtl/CHythKTowaM6e1CEwgBi4XaCHPC4/91rI+IkH2y/ckaafuEdRLtNhLQtZ+Uf2A/9oTwAH7co5KSUarRx4a2sLGHVKQNrniwt8pMA5tG/9g74qWVfIUr7yBKscQbuqj8EEDXIm06zRpb3Irv2MJM1a5mnsNnLcqFT6Wbpx1eAVb8bfDjsIlHvVKmzG3FacJLrAx0KBlKe1AeWA7gyyWpoaj4CDTmp+Sb73Q5nDmIPqqoqVbFsSlfgktSBmHiSerM7leHzsaH/Pzexh0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YunKrmPs5t1AN/wQuD2FTqYnj5QcFXu2p2Ld/QQJtQ=;
 b=G3h3VN4WOuMrvyPaRyyeGLBRfnySnp1CNpl089Qmvj9e+BnQ/jM9KGQWUEA+LKVUKJ9aoqAL5n1HnkM6nt9bm4v7UIDVOLuMCHbFoROjGIOmr2WflS0OPxG1cm2ov0dys9bAxcdhDNrxEC0FxMGfiDf3evab0f7GxzZzu+U3OZzUSophr228zrIRr+emHobACGeExiDNEbFWwC8TYYMCgq+5DiWFmPYVnrnZEoI0JiiO77+/gX0Ix0cNKVCFQ+WJoYccZwrSvsRY/bosEQeM4a0BwVZk/EyGmCxtDkHCN4693WsOIhab1s8naNwKeOfRXHScrZdW3EK+dszTc7WZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YunKrmPs5t1AN/wQuD2FTqYnj5QcFXu2p2Ld/QQJtQ=;
 b=rIAiYyaZJCwDqDGhDz3VWndXOwo3qyoTndgON51htFSXC12Uue2oTOAbQaadP9rUbkE0NZpPQqafi518f5Osl+3oFFvS2PNbj6rPSxLBPmYOBtk70VFq0RnsPo0bGGEonshatmTaH/L2RuCPCMXIZGmwA/+5WnU1wepRj040ll0=
Received: from BY5PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:1e0::36)
 by LV0PR10MB997685.namprd10.prod.outlook.com (2603:10b6:408:343::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 20:12:20 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::c) by BY5PR03CA0026.outlook.office365.com
 (2603:10b6:a03:1e0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed,
 23 Sep 2026 20:12:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 20:12:18 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 15:11:31 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 15:11:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 15:11:31 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NKBV8a3595987;
	Wed, 23 Sep 2026 15:11:31 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v3] meta-arago-disto: chromium: split force-h264-youtube extension into its own package
Date: Wed, 23 Sep 2026 15:11:26 -0500
Message-ID: <20260923201126.1084567-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|LV0PR10MB997685:EE_
X-MS-Office365-Filtering-Correlation-Id: c68ee2ac-e0a9-46b2-bf85-08df19aef83b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	02Ngz6YluHpDBFV+6aVT0GcIBBnpTJlIu3g8570Eqn8rwUTj6N4cxACR4uvil1Dqvl2vjhchCwKt0e4sX3vblQ1StLYxrHEb3a9dmki67xVLRxFfFEF9NOht+ZIq00IZkidIswMaSUdyj2uFhMMxiTA++uTksk13IgUm1CY5zbBF78cNE0WyRiF7JQGCrvC8pUq+/EvJW5/jN0lwKt8/Z2quBemO1BINtCriClHTrc7lfC6h35ivsUlMAQnwN/2I0JnShYIJnBZK+t9yPvB1DMZQ368/66phEv0QJ5+G08Mnkk19xLNJ9l6A8drXYYVYOoHy03ZMQ8AK2MahGTJfWJtP9d9hh9/vx2uW4MIPH/vv80BqQDUqrpStXva8u9U3nCGPFQUkeXy0hwwdGl84bBv2P/pGWC4uHng/ARX+9Ep47iYye5Epr1/ObK3X/sSHuK3k0Vm+jALqpVrdCmE9EpDTRqm2AoFPZ1svx8JwUiPBRT+GVlkBG19H+Nbm3yMD9YpCIMVinHp/XHwFJMBPLZwJ8//ZewZuTSTz6TPIChGeGhFpwMD8N0xkT5EG0L1aa8XoEgZ4hqRHbeVmpcaFusIdlmlT3DbIP91fv3c65xJ18lC3mZWdB96PKHPiZvjnf/KvJGz16Hv2dOuMEowN9oKOXPJqCEfmfp29zwtn1+1ubiuvWt7JofvUrtxnnw9X1/jHooxRo8JgJKoi9qJU5Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+BxLZXI+UTKNdX8xh5hovUqyfaFIpDtIxKToPpVJEBuVoI6ixfZJm9y4vqh/gbc5n+C+MeR//Oea+zfWdLvWVrs3pq4+7cvBoT7/TRaTVNWIQj2mtHyWpyNuzuoGq3Qb2qp+q5dO+e9vvrQPFD+q9LCrR/wO6n8QJRFI9K+e+8Pi3+bAonDHqDwwbllncken3r3LI+lJqSt+R3qlBVICew+oFIEfrghuEwjE9KMR9AxDYcbTyKzYTUlwCemcayC4iY3BUlI/1NFfYlQu722/HsW3anKk4bjyFjdeIS0gb/Hg86dMpE1XnLWBYV59FJeZCrvo48BgG6/FNRgBg9mAqr1d3rgo2OklUGVIzpKU12ukGOPzP/6gAovLm/s2MRfbLCHwOsUSeu7HU+oAsL5kDC9sG0SdTyyJ0ZP52TmluZDnXOrNAH6eDeSzImr8Q8TA
X-Exchange-RoutingPolicyChecked: 
	J7VSdc8GEB2WJoAwtWM8yxl8NlfqLLEcXRQuaKA0TNf6xk0HUhgStrjlKT9yGklnmK3TbA5EQ6HLMisS5bXr7ft3Utq1hH+WcqZbTI1FQNLEyHe9Rzc5A7Yqp04QIE58MtGdH1p17kShpm2NWYAt3g2u13/nahN7uHxsjjS1L0QufIsGxaAvAzQdguXgNRwMQC3m4Wpewx5exzX0vJQwao+akZtH36PnXKwo6I6RIU5YvOc2amEp0gRuAtOvudpmKkjmjKcRvqPeTwNGX0YNm9PqDRcTNduPo63bx7KXDXZXbgFOUIjj2VgzvGkDF+SCC4hsvEap2KIFpChLVYrhhw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:12:18.8307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c68ee2ac-e0a9-46b2-bf85-08df19aef83b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997685
X-Proofpoint-GUID: FGA0AXXsP9s1EsmtvPti9ZncZfxh3O4j
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab432a8 cx=c_pps
 a=aOchWjQmdX1ADhYh+yUFEQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=MJ22YsZ5dQk7D5SWMRcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA4MCBTYWx0ZWRfXy5bSkPVrnVd1
 bwQqkpcWh40diWh56hmia/yITZvh0+TmuKaYeUKcfDrpadvWDtDUwqqpjwb6H45ll5OUHAsz1UN
 6lVNNeVUybmqm7McKuxXSVtIy1zAXg6IQeifNY/pCFk4Va9PyCjIOHNO6XcRp933vdOtQwFnDVn
 gsCPZj5GytekITcEly+ua6hhrJfsMvxtSkgDgLsK5vhLeH3FuoOSVqM8xTd2is7QcuK8VW76IAt
 Yd/8Mf97LDu+gYINuts4rl4eKqj0c0GsgFrLn8PhYNCsm/hq6aftxjUvS1Hi/S+lxp5FeImLTyf
 0xGaem9iU3kiIutBSoeE5m8TlxYDw5loacOgHF3ULndLux6tqI1xKFAxwXxZ7I/vz3G3wA9x/ml
 Oc83hqLuLJFJhaAkrel/pfjueJsZi/cGnXGhN2ksk9/bD4+o6u9jAXyd9PW2I5yhjO8s2LS2zE5
 lHIEPcCwxaSoJ5mOdJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA4MCBTYWx0ZWRfX8f0MTJKYCuE4
 FqLI9qLOddT++4OomV3nt56qLSDllc8ThEfPXPZ8wuM5zxL7keu+FhDPIzFy/qPiXKoZBQSBROY
 EBWVTehqGa8n9H5E9yJ1AaUNyCYJuvI=
X-Proofpoint-ORIG-GUID: FGA0AXXsP9s1EsmtvPti9ZncZfxh3O4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230080
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 20:12:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17701

Split force-h264-youtube into its own recipe, built only for boards with
cnm-wave-fw. chromium-wrapper checks for the extension directory at runtime
before adding --load-extension.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

v3:
- Separate the extension into its own package and install on boards with
  Wave5 firmware
- Enable extension if extension directory exists

v2:
- Shorten commit message title

 .../force_h264.js                             |  0
 .../manifest.json                             |  0
 ...mium-extension-force-h264-youtube_1.0.0.bb | 24 +++++++++++++++++++
 .../chromium/chromium-ozone-wayland-arago.inc | 12 ++--------
 4 files changed, 26 insertions(+), 10 deletions(-)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/force_h264.js (100%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/manifest.json (100%)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
new file mode 100644
index 00000000..16473415
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Chromium extension that forces YouTube to use H.264 codec"
+LICENSE = "CLOSED"
+
+python () {
+    if not bb.utils.contains("MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS", "cnm-wave-fw", True, False, d):
+        raise bb.parse.SkipRecipe("cnm-wave-fw not in MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS")
+}
+
+RDEPENDS:${PN} = "chromium-ozone-wayland"
+
+SRC_URI = "file://force_h264.js \
+           file://manifest.json \
+           "
+
+EXTENSION_DIR = "${libdir}/chromium/extensions/force-h264-youtube"
+
+do_install() {
+    install -d ${D}${EXTENSION_DIR}
+    install -m 0644 ${WORKDIR}/force_h264.js \
+                    ${WORKDIR}/manifest.json \
+                    ${D}${EXTENSION_DIR}/
+}
+
+FILES:${PN} = "${EXTENSION_DIR}"
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index d8eb0204..93c802a6 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -1,7 +1,5 @@
 PR:append = ".arago0"
 
-EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
-
 FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
 
 PACKAGECONFIG:append = " proprietary-codecs"
@@ -11,15 +9,9 @@ SRC_URI:append = " \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
-                  file://force-h264-youtube/force_h264.js \
-                  file://force-h264-youtube/manifest.json \
                   "
 
 do_install:append() {
-    install -d ${D}${EXTENSION_DIR}
-    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
-                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
-                    ${D}${EXTENSION_DIR}/
+    sed -i "/^CHROME_EXTRA_ARGS=/a [ -d \"${libdir}/chromium/extensions/force-h264-youtube\" ] && CHROME_EXTRA_ARGS=\"\$CHROME_EXTRA_ARGS --load-extension=${libdir}/chromium/extensions/force-h264-youtube\"" \
+        ${D}${libdir}/chromium/chromium-wrapper
 }
-
-FILES:${PN}:append = " ${EXTENSION_DIR}"
-- 
2.34.1


