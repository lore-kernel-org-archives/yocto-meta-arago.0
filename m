Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C983ACA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:20:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17602.1790785254123838459
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 09:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CjquEF4f;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=mj+zZOtd;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Vho3890149
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:20:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=glde0tQQ45++7
	ZhdqUMc61SuLJbE5ckDCtEmBe33FD8=; b=CjquEF4fn0yOarK/JPuDRZwVfvMBo
	bDLMZfng6MAJySmB6IysqoTV5qMqzTKjdxTQ22zjyQX4peuB78+7DsHI1mS3TmYy
	EseFpLB2I8MsVomab5TIBfLM28zczo5G2YU/yBgEPk8mOStRfpv9MB3EZl5vHDkb
	ZoUxr0CDnM2CCNoWnSn6qI/nFYwaOZRk3AptfCtebhTsyVuBQto2kP7kwddU8Ck3
	FRrE88jMnTCZ2JSJeBdQnQsJAkLgl0z2YnmFv7AxXokjfzYslQ45mt4aoMwUnHYM
	Z79stNgflLWvM7H85YaW45AcHPEl2tug4oOn5Sl5Ara8JZCRYejIEd13A==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012053.outbound.protection.outlook.com [52.101.53.53])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s221pk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:20:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1VWQArAfFGxxLEmk3x2aA4hsnIJj6JpGgn62A3lZQmWmgcOe0KYFxJbIS+u1xf43c6pnr0qZ1SxxuY1uWmzhUDIByHLReSi2l1F0WFjPIxP71XcMQcWIQGMDceFCfcALcqD1qsk7H9VaAsx1oayFBTtXL+zv5FgB9v8RGAT5/DRd4twHCro4QiVNI6eXrrSjuiGouV9POpjqNfJkD/483A+3A8JrgXb+eqaoGLtzUkQZWVyk9wnXlI1wSxf1v11p7AZQqnh35DO2sSS3RSofB7kc4hPQfACUn5/Z07ZurEa0m0kZ48D0OZ7G31IRw9fqeRhGPbpkb0Bi7LV56o4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glde0tQQ45++7ZhdqUMc61SuLJbE5ckDCtEmBe33FD8=;
 b=lxWNMN8EyVlCwtnjLhDI5IHpPtg7q2lQOvRTCCv1SXlqwkNNYb9BZ2qly6PEwU+LGLzXG7TxglawSxxMjGYvKgbUI3RQzEWHF0sQC89nP0HHsd1p53Kp/urV0hbOozWrynQhrW/evD92X374PKSMJevQkWvOGrDeQBegh5y1Lk1fRgIK3xNi/QoEfmQGgATIsZ7+DpxdqisxrJVhX1LdmIX93ZADEbxrX4nJAlSEnvFKJRXXzl70szneTRcMf66sgJTYYOktYXKDFHVL690zxfbA6rPBE8EeUJnzmJp+y7nn/gCLfxGSfkYlRHvHCtfXCJH1fEvnBkXUcI16E2XYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glde0tQQ45++7ZhdqUMc61SuLJbE5ckDCtEmBe33FD8=;
 b=mj+zZOtdk3YMqrVNJ2p216h5BopNU+fqsEE7CL6dq+AKZWHvc2uAV2C8i8rBOhGUG3R2gtiC3L5SuSHFdaTJqP5Yxc6l3PgOoGFqs28PEvxxHI3HIfGU1XHuM+6AxK49ikd4k6anjDJe88vCu8MK7rbYXcJJILUjo6R/+xtnjCg=
Received: from SJ0PR05CA0107.namprd05.prod.outlook.com (2603:10b6:a03:334::22)
 by PH0PR10MB5612.namprd10.prod.outlook.com (2603:10b6:510:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:20:49 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::69) by SJ0PR05CA0107.outlook.office365.com
 (2603:10b6:a03:334::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 16:20:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:20:49 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:20:20 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:20:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:20:20 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UGKKdr199424;
	Wed, 30 Sep 2026 11:20:20 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master/wrynose][PATCH v8 1/2] chromium: auto-load arago extensions at runtime
Date: Wed, 30 Sep 2026 11:20:16 -0500
Message-ID: <20260930162017.1163748-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|PH0PR10MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: ff97133d-8e42-4251-7a47-08df1f0eca65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|10067099003|260925021311599003|260925022911599003|260925021911599003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	gFpVRzIO/7wiqCxHUfqgZ93N5TY0KMw1kg562cKn02WQiDzv1x9WBFZQ0M/aoPCkLedLgvSNFcr2jE4ZmKcZRy3ZPRRk8Ei6NUNJBWjJcxzUKKl1nt3rOIktHaqiGNvbU95J79Q6ZNzfcV6VVc0NcrOQxM/nJFtZ4VOs37tQAqjbYU+ZLknJ5Uc96Seiip6D9LTpYt+dV0PlGPQfmB3kwxAHEO6++9hqBgqrcptdo7+CJw8IcFZFLNuaVayw501viKqaoEF2wBTeRxFwh5RHIdg+JKfxIydFdvhNo/B5dHgb/2bslKD7V8Eorvbo6ob1td3qcB7ke25n21e45VGi+kBHPNcWlnSOT34yI4DqJ0uvjDacdCOhVVzv4V2WXI4lDMvNFs6WdKlJwMkgs0NG3/JsPiX0w1lFF8lRQBa/kSyJkZ1PGtDVY1iN+wGX5KFk/Gv1Xf/J+QRFIVAPu6BhQIgO1w6RsS2jrRDwkF1ne5ZXHgkLg08earofM+nfuOlt4jdWCEfueh65gYgvU3Gmx+n09wCC/Bk9MNogvTljr/hUcXdo9EUYjqtGJ5lm2nQDKXC00LpVa4mMSXy+WDPxqoTmWEX4pahU2H/dSe9YHTXQRjMsI0N85VGxxzkj/Rq9mKUf4ESo1mVlQgWoj1U3UnHeC+y6RBqu3HOUMAjVJnDc7CFGadxi52msb4vvi+cq2vnbV5P/2bWrspVqpDUgdw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8n+Y/HHksPwapknNzIHPSmWnb6PelfGCfuXuvq+p01zwh4LdbVwaI1nP4xWvR/4D31RYzElhcksVjMLi130WXuYkvy02KMt/ALOAoJIlfA+vHAlmTvoMX0r+qo9q+3tYiuFaE6si7GiVS+MnL0OXFE26UVDMKtB9RJlBC/X9ftbRoxrK0v7/vRXTw88/Ckz+aVHBgpTJontyvAZS2XSLoSY7mi56U4sMZi5+01ohcxwDXA5VuIhRsncvH+H/rRwVrxxcJZDjJmwbKYpaDO+D6WULRdK/zF2GuhXOR7V20E79POEesDS3mpHxGTle68o9yBBGDxy9ukYV5pKuTA9NouwXcdh8WiJVf1l0GawuTyA0KrB08xe2qsUYuLQxdL/NeAXkv5Qr0yVR4XbH3Z85nartVTuVKD2lrofefc3UMQKLnbGc2JEqpDCzleKJ1m5a
X-Exchange-RoutingPolicyChecked: 
	uKB9dCCUV+mA0l1Dy9XEKRgevZRjHzG0JhSAOiypHHkSdsDaYWCIxEZsu7dZPooW7FGizPZ8R0mMlld7T918bP4x8Hx3DkyXMt38cQPDa7Ucgg/cn1vVZmikcW+mclov1dNYiASRhIYRh8OMqahz5QmqmqNrSb4LUS6V6gwl5fR+pb3lxkYe3qddUqGq07cyArvuJ6g7zT7QaMLCXoSl1YIITyeZYI2kxM+Whsh0yrTQU+n3YtrcOzYVCdr7hR6Sxo4dAHc0reMLeAXDDRSrO7lu26/qF3pfONZYv68cMiAapeFjfpZu/zmDxeV+PwdsXLDdnvxTYD5nr6M6ASz+lw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:20:49.4187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff97133d-8e42-4251-7a47-08df1f0eca65
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5612
X-Proofpoint-GUID: 0FDQAY1Ehk6I7ltQPqc_F2nQ9lWQWiVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfX3TtI3DADEsVW
 T0SwzyicTVrYmkwFTYKn7YN7ReQPFSDgS07gc2ZM2F8DUAFO0NA+otR6C02x0i7CPC7VVKmuxWC
 Du0mPyOJW2wTQR+tlf9KBH42XpX26766Xh57vGq93w6ehk8o3Renki0lbTK6ftEMqYoyjEIDJ+n
 YMR6nSPFMHb7cbI00srAMKOa1qEXye8zbLiThlh8fw+3hwasDVphYkZGKfEZ85uPkiO5hREPaO7
 zIKuid1f0HYMXWBa56cybsOGIacCTBYo7nrCzaokBWFBkZ/5Njh3mlE4DX62I04pIlZS2+43jxo
 3fu5Xq0VOcKCbbVuFC/GLJD2FnrKq9re8oV5EEmKI6ue2Z0ZM24Q55HmT44XHT9IpR6QTLP9xsr
 QaPXc2BqnVAL5fqeTpFnOZK3n+sF2ObAEHG1VV69ZhvoyvEiV0yi2gqDRYPELJAQf0mMEmOj6Cf
 ZA/eBF6b1PgKX1TmWsw==
X-Proofpoint-ORIG-GUID: 0FDQAY1Ehk6I7ltQPqc_F2nQ9lWQWiVi
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd36e5 cx=c_pps
 a=IWYRGtMsEs392uQhKf0YYg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=byG2Hu2Lqfu07KUd7EEA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfX6ZggUcMaJL+0
 LM2INc4HRyn3lSRP2t3SWCoidqctvolFs9m03Lx2/W5Sz9iqMCfPIExrFTCyKMQdGiBXtEEnaDN
 qInMmeNYJ0XepxmJS2rVfOEcUMQz6jc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300065
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 16:20:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17721

Scan $HERE/extensions/arago/ at runtime and pass any installed
subdirectories to Chromium via --load-extension.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v8:
- Move all changes pertaining to h264 youtube exnension to second patch.

v7:
- Split generic chromium extension loader and h264 youtube extension into
  two seperate patches

v6:
- Shorten commit message title

v5:
- Use generic approach to loading extensions by creating arago subdirectory
  and loading all extensions that live in the subdirectory

v4:
- Add branch and layer to subject line

v3:
- Separate the extension into its own package and install on boards with
  Wave5 firmware
- Enable extension if extension directory exists

v2:
- Shorten commit message title

 .../chromium/chromium-ozone-wayland-arago.inc |  1 +
 ...-Auto-load-arago-extensions-at-runti.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index d8eb0204..96796410 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -11,6 +11,7 @@ SRC_URI:append = " \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
+                  file://0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch \
                   file://force-h264-youtube/force_h264.js \
                   file://force-h264-youtube/manifest.json \
                   "
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
new file mode 100644
index 00000000..ec87e35d
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
@@ -0,0 +1,34 @@
+From 5bcdc4db88d908abdeba11270740864a13bafad1 Mon Sep 17 00:00:00 2001
+From: Thorsten Lannynd <t-lannynd@ti.com>
+Date: Mon, 28 Sep 2026 13:22:56 -0500
+Subject: [PATCH] chromium: wrapper: Auto-load arago extensions at runtime
+
+Upstream-Status: Inappropriate [TI-specific extension directory]
+
+Scan $HERE/extensions/arago/ at runtime and pass any installed
+subdirectories through --load-extension, allowing all TI extensions to be
+enabled by default.
+
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
+---
+ chrome/installer/linux/common/wrapper | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/chrome/installer/linux/common/wrapper b/chrome/installer/linux/common/wrapper
+index 3547069c2a..76588abda8 100755
+--- a/chrome/installer/linux/common/wrapper
++++ b/chrome/installer/linux/common/wrapper
+@@ -28,5 +28,11 @@ exec 2> >(exec cat >&2)
+
+ CHROME_EXTRA_ARGS=""
+
++# Auto-load arago extensions at runtime
++for _ext in "$HERE/extensions/arago"/*/; do
++    [ -d "$_ext" ] && _ext_list="${_ext_list:+$_ext_list,}${_ext%/}"
++done
++[ -n "$_ext_list" ] && CHROME_EXTRA_ARGS="$CHROME_EXTRA_ARGS --load-extension=$_ext_list"
++
+ # Note: exec -a below is a bashism.
+ exec -a "$0" "$HERE/@@PROGNAME@@" ${CHROME_EXTRA_ARGS} "$@"
+--
+2.34.1
-- 
2.34.1


