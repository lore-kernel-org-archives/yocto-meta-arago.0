Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47E2CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:04:17 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17278.1790784248232019069
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 09:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=WN3tCfjM;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=quYNRa+h;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1bxX3556035
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9lpMvMFHiUQY21lKt/JqmCvGPsC5/hyBRKDVWbY5O
	Oo=; b=WN3tCfjMSE1e6/kWdX8vpJmQrQjzpUd0YG9hX30zC6Q/6OpGJV52Gk5Al
	EgPOQkCaAN9O0yGHLUz7QS6lSArz6C35VVYYGOUklWp1iZiJefw/dFZv3BVveUJg
	WQvu54xcnQs8DAHPaPyRtk0QOmrmdlrYzZp2faSR2nh2bsYmlQxI9ucvSBR3cc4m
	XOCquKWOSoyluV2pcORvfMOeQEpun8v5ZMxoODjA0paogmt9I1XE4vlWHyrv0ZHh
	AvAdP9wvLkVMc7/QtnBrk2r6SQUuhOKZMwudbXLZsb/fJb0+1usdcLwktZpQJhcJ
	NKdLf0eW+yu72v5pG6vlKaLCs4D1A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013001.outbound.protection.outlook.com [40.107.201.1])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvabvp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:04:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCDsjHlsoyCpw5SKqhSWJexW+8VDW1o3W2hR4R2InGD45GihWy5coQTBGG6QxOCZ/TmFF0oWN66+NC+DVoX6s4N/GK+rnRyP/3qkmlZYp96mQrVz7JBgtmXBDdDlKmYERlxQ5nuVX6hBxFDO+D7DZwVz/3MHQd8BPtZsUpZ8ZWvFkY9IJSxVDQKTi46pTf7X1yM4+E5G1YoXJsgra6mhEe/IW/lbc1EE6tmQnxDLd1wUxSfArgjoIPMW1l05Brl53n/92F2EZiKBjxC121ZgtBpcksLPPRuyJmPI7KV9XH0bc8bDkO0yOlOVvFmK7kE7yHhep/ZtQuyqwLqY21Rb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lpMvMFHiUQY21lKt/JqmCvGPsC5/hyBRKDVWbY5OOo=;
 b=if6DYL5ue0v0vmH6Ie1J69oVaK0XfVgXeyvq6WhKoeXjziUFGL6T2Jc7tltRMHgjmcrH/SpEtzbox4EyGbAuWvsix6JL/JBiH0whfnSvagbCt1FhkhtL63YIo+AUfS02lsYO45kTb+j2/qDsbSgdYslzJUv1Ig8lViHkbiHPugJRN8YQ8gS//W6zJxWHEUlORhBnQP7+KuLRLQhUXaZ+rG06IS2GpEsE+Djik/somwgzPSVU8RHZfxtEBM9DAxEC0z6xF4b3G/4CSCGN29Ep6ElzRdsyK1AMKwLoGm8vPkPQ7gNgf/Jy9V7XLQLbLmTHYutVA+EZwkwHNAaPyjuxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lpMvMFHiUQY21lKt/JqmCvGPsC5/hyBRKDVWbY5OOo=;
 b=quYNRa+h5d6a1nfV2NfKZ6L48wPPoKmF/5HYVxWtytXNwPORZ/Ehh1h+D8BuZ0PNydiD1p1u0Q7O3aut3myuIMIJwnRehJIubQKsKvHGwPYoI/2KXEulud7lsioRLcUMaxawGfbaK68+VsMPhIpfVo5DX/SNoJAPj8g7Ezewi0A=
Received: from BL1PR13CA0376.namprd13.prod.outlook.com (2603:10b6:208:2c0::21)
 by IA1PR10MB6877.namprd10.prod.outlook.com (2603:10b6:208:423::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:04:00 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:2c0:cafe::8e) by BL1PR13CA0376.outlook.office365.com
 (2603:10b6:208:2c0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Wed, 30
 Sep 2026 16:04:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:03:59 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:03:43 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:03:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:03:43 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG3dkP172033;
	Wed, 30 Sep 2026 11:03:43 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master/wrynose][PATCH v7 2/2] chromium: add force-h264-youtube extension
Date: Wed, 30 Sep 2026 11:03:38 -0500
Message-ID: <20260930160338.951001-2-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930160338.951001-1-t-lannynd@ti.com>
References: <20260930160338.951001-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|IA1PR10MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: abdf60f9-481e-46c7-a619-08df1f0c70ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	cGWuzrF5IZvhQQufMC+8fzZd4iPEBTciqxjzmibR+grxwvIwn8gz32iw5BMyUAj4GWSQM7xqWCJX3CyDFiMjkwzAF+W4hPmHoGKdJubao0HMm3aJ0YcTV4Nud52IzTvytqiwP2yh0G7bl/WlMA45PZlRxSlwbCtFGmRtAvOfusIwk8mqOr1r6qbyLCiR0ePEnaANkGM8S6m7wN8O9YtBi+dDXN+3ks/Wg9KTfcD1BKtufv4/E/ETyXYP2UXgDCeOrgpaa8tUCsxZRqMmeSdZCjYCDIi+2knYp7j0sonP/WHGeg6gEF9RLGw4twCzXX+sfDCucgK+VYpGDQV50rGXJ5AFzngZKGGxF7jBMjOO9WEQPfl3ThaRdNaheNsLs1PcTONn3ba7PEScOyDmLXvk6Zc91u1RL9f/uQcyPuHWYntkMC/AJokMhr6cuX2iDL3WmCGfys9TNBLq9dGySPjEl2rkapE0slOJ/5xbT2x60KbnJf31W6vZPEG8OyWmr72WqanD7lNH22Q8sUwyAqfNJkSXUk8EcbebwTmdoMAci69EbAg47beGzUyU5mvgY3+AtARSomFITWJ9yUkrRfIHSS2Po7KxE7sBUVSQpSyfAt8Zj63e6QIqmrCoI2r5287wNiueXqfIXICs0NHrMHILxsZHQ8CvJ242XLYYQfO/NgbUovcjzTqt5ePH0l1gdU7f/Nx5Zjtc97Ia9EBUgaisOg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	s1zbUJHUCd/f7AM4uD48ELeEOMbfz0qdlie3ZL1c8CW2r0kGWONatZ8GMeN8uewJi+HLFoRLE9XMG7/hb2snZfEH66g4QV5X5ehIdjmOSE5k3nXiz+svdK9U1E69o2oG+SiHiCYRxlQimU04Rv8R4P0CYok0zQckpi5Bice2uOfTppbSc56hcRRBhuTf5IS4B0dAG8pQvgsQAOZyKPEOgu4pZzEK7D/utNTEDKczvxXL2fg/Qk88x3L9vydEcPsxJa3/ClqJb0IajkbUU8EM3ZPYaEJtRIZEaE4ZLhiuW7OZo8W8DbEYlpbpEYMvSF49eYIV5xmc1OM20u4lRHYdlgbj6z8HReB//conl4pmrL07bGssMXKyxGTA8bbnxHZfnGxTNhWx2TCp2NbLiPZGuOR4cddMezqNumdnEnSPoaGxySTpPDkB6SVGhAy5o5Ys
X-Exchange-RoutingPolicyChecked: 
	LmVbqnDEmbmDMTUKu20ARSJJGOhRtLOujLkhO9lYGyLDIYpfzqfmk/N8OJypSkEb2N0MAtPHUlgsr440TfNQ8SgnhMmqXHPVh4olWw+wTxYIxV7R4JgV7b91vrrgG04BpG7IFlVShMG2MdH4qYcAkemt2qpMDFgO3xdqDi73EDilqbcGKBBGw87vElfbUSe5WQ30Dpae19sIjerSLHHF9sQVWWbRpyOFSQc1SANIyZr6wuAKbSC8v4puARMG4btZ9m7lgv5rOXz+8UzTGFbk0McOKOehWeUrl+MVi6E45K3No+cs+OMWDjhIYWkMXWVLIQXTGl1Rum4IOigBpXNKkw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:03:59.9756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abdf60f9-481e-46c7-a619-08df1f0c70ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6877
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfX1IXxwDiva0ul
 Z+pqTYlnxdKcKtUMDdYVbeEebU/GcNEq/6/RiujN2/0n+Yu0/BtZBIEM+HvZvaZUAqChIrLImir
 6oPBo2ijyhFMePqypqULSoMrpJTtF+I=
X-Proofpoint-GUID: FVltxKm7vxyZfuHb0mZLKKcwWTn26f44
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd32f6 cx=c_pps
 a=3079EDIPZoP+OxznWXLZSg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=yJg8KQRXyWgngIJ6kPsA:9
X-Proofpoint-ORIG-GUID: FVltxKm7vxyZfuHb0mZLKKcwWTn26f44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfX8jvgmcY5KjXk
 VS8jz5DtCpFB11APwP2LbRi++QUL/iyFf4si+ss4+EX/qj1glSUXZVs0DcbV0q1voOSMiL2zqoZ
 3WVtaB5zX6Jd9c2fFhHfj2LZ0rGVqnjpifw4gCYFgAlofT42AaU1+t6Z2i+tDOVqRG6FsbrsUKf
 Xq1q5J43S4fGCi39HGN7cJ9hOrB7yEIIpabwpMtthluLocp8ZbZIUbl8NR2N3dCXn8zeX4NhawM
 LF1e80hI1yZK+lDolkX2mDE1QTq5bkA30HIGLeTykv4eSbFDVofV2jMXhMvShgFcbiB4G6A2K+v
 vMlZdqNIsyGetPP2mETvXZAuTlQQuRj6jTIcSo0GtJdExdfiONC1haQ+r+PiCj66Wr2v5Jy9dH/
 f8Yok9wUYoz8Ru0Od701goAmalToz8o+AuTJ+o5Z/psdWiuprE93bUS0tKjKvkf5uSRrmCJYaI6
 oaPY4bP3wJMu3wrcsjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300063
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 16:04:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17719

Split force-h264-youtube into its own recipe, built only for boards with
cnm-wave-fw.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../force_h264.js                             |  0
 .../manifest.json                             |  0
 ...mium-extension-force-h264-youtube_1.0.0.bb | 24 +++++++++++++++++++
 3 files changed, 24 insertions(+)
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
index 00000000..bdc3d223
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
+EXTENSION_DIR = "${libdir}/chromium/extensions/arago/force-h264-youtube"
+
+do_install() {
+    install -d ${D}${EXTENSION_DIR}
+    install -m 0644 ${WORKDIR}/force_h264.js \
+                    ${WORKDIR}/manifest.json \
+                    ${D}${EXTENSION_DIR}/
+}
+
+FILES:${PN} = "${EXTENSION_DIR}"
-- 
2.34.1


