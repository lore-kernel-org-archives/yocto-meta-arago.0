Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB59FF47CA9
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:08:44 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50774.1772734115731187898
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 10:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=afQOWx7X;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.32, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PM1RAq50t6PCYifAXwf1YhRi6WnDjyYMBy43+Pe9aubAkLDBAvEhiG2OnKm/8v/p/cjnfBAZEk0hkEhX2RFJZ4vV0KRBTTKVCkQPtQjYqKMhQDao75o4ckLNw1ol+YpapI4yxXCdxRd/Rs4bLObdvLLeyEwmrATU5nDGe9ElLZ1TnGED27X87R+9juseOMc31vNOc5MrDX3rBoGfiIh++pLl4dCkculidTtFbns9Z4l0eCOxDVFAWYZJ5dT2Kg4bwAA3cUVIre/742ttNscqOQCAekZbVnslzhUVTlCjvNPRvqv2LOJIsDpUcf7+Xz25DpaUOoHHhE9voC/1iKH2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUnx8/ridueXTqo53BPDOL5DFlHhO6XGpJhZy0fZxFY=;
 b=g8Oa6MedJ0sxFIrT4YYOOTWWKzw0wJccXvsqUGVeklRxSh5qnaI+Cht/GacP2IIWNUzrl0QnF7wzO97nsaDN4fEICAzDEA/bGolPhJNh9hSmY7ZC2ZadEqdS5fO1txnzfVwb0Ru3p1QR5xw8qbbK5JDM6vX/S0RGaW9iIYNr9ViMOcobC1JESiUebr5BitoyG/EjcU9LQF4qiX4zZSjarJrJrllQZnlxnQrXUd3y/ALCUY/jb6r4RvUr1SzxJ3dwV4OrrmtAwXd2L26l9POTMEFtRgWxJ2p7scOBpN/+LTB8S9QBoq+HtePtIfN6rYCwWKqiRIC9oytHnXrmGWkaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUnx8/ridueXTqo53BPDOL5DFlHhO6XGpJhZy0fZxFY=;
 b=afQOWx7X//jdwIOXf1xVx7GHSjCMyz9x/o6bUvgelouYEZww0gsbxiE5HK69GfJJ63n5DQWeQkEfmuP7s7gtZXMPtTm0bOq2vZCAfxjQ9j7BGCM61U8akI/OtlMXuhm9kHYvL/66qByf+z1dsW6P9A7ou+uf1yFgSLGQbCsnf1A=
Received: from DS7PR05CA0084.namprd05.prod.outlook.com (2603:10b6:8:57::25) by
 CH4PR10MB8121.namprd10.prod.outlook.com (2603:10b6:610:247::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 18:08:30 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::1c) by DS7PR05CA0084.outlook.office365.com
 (2603:10b6:8:57::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 18:08:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 18:08:30 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 12:08:29 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 12:08:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 12:08:29 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625I8QIS2809740;
	Thu, 5 Mar 2026 12:08:27 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v5 0/2] Migrate ONNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Thu, 5 Mar 2026 23:38:22 +0530
Message-ID: <20260305180824.1823814-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|CH4PR10MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: e9795e94-f073-493b-75e1-08de7ae234f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	7Hxpe/tF8JZaqowvzh4e0mX/SBl8q6GQZgSB4RJIM+9WUVYmbOvQhrYy9vHXPyOpdqR9uxKrkmVT33jOz0YQ8ds55fdF8wmKEDBk94WOsUoSa/+dDpQtkNwvD/mt9qJ3FyEvbyas4iqeWahQmAhHGdotYXm3YrWuOk84fNLuCOOsuaxYQ5QJepWqCMk/qH7KEi+eX853/FJZyaOMVd+JmNw6U0cDgexjV/J7sp/6PqgB0/QhM6HCnDrmseGMSMp+9xO3bdumysPxBbsxsTY5ajIIInuMjz9c5TAg931T3ovwzmreQW4mpFMgm6Is8BdhgYfkkfwtibZP1gTOGsi1JZftfqam7MDH0QMD764+qy2ZTNiCUxXupgD8EILC7ryhX6RiZDKGr0f5PAuGcoTwH3ZO08cazLNvPoaQRg8TXpgswHYOR9mVBLFfSWi56CGUMtaQR//D9+Mg2SG2dO3nopUQfpCLRyGhvIZHmeGrDKMxDkw8uCJZDLOJiCK8jJs3QRumjyxeIyTqlskQzwHqsJbL48pzShmYFkXrAsZCmcVpGDZVUbec/lSkEr3SEDtA0hwfhy/oyWNgm3SdHdl1f/Sf80vjhjUl0l7B3gglZ0EjfqFeaCcohQaDFLKirgI4Y9IMbkYStwGJCprDlfRqGlclv8Pna47s97gNJDvwwlG7INXNsCnmzeUyor+utJ2ww0ED4WS1YpbHmRzOk3djhEl5dAv2SPu++dItwTjbxLA=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mfVZYgW6TMh5sVnzV4y2fgFYUxN6hksOTVlTtUsb0ze9QkVWSh4nOQOtpYYdmwVGo//J++SKVLFfL4Ow91WGwEI8Q985/4yUwyraCY8FD0ctWm/8wYtm79KZmmgZrcaZAGPjV73tZt2UaPPRPtV+LyO/2kVl+mgUqWG4TdRNZvZwX8/lZiQ6Zfao9pE0VvKscTqDyrCv0Y3AyMcJZN+rhHpoOF59zR/xAiOB4VkPH/GEDRdtsIMIv4dHM1z02N9+Z+KZtvYLS0wJLUMpcnmLow8YfWOAaYFxALUgSnGTsnlDMjz71+TMfMry6bKvVSp+hMdTUy7dWEiWSBXVf1Ou2+/GCiL//GssFbu6sCowSouqHGRnu+lmX+jamz65+ClvO7/LdTFzyLJQqhR868e+5FV+pcA36ypB2lp/71lRqoy2sG0prx/TH24XEwxdWx49
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 18:08:30.1589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9795e94-f073-493b-75e1-08de7ae234f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8121
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 18:08:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17250

Hello Team,

This series migrates ONNX and ONNXRUNTIME to the latest stable
version ONNX v1.18.0 and ONNXRUNTIME v1.23.2.

Benchmarking Results: https://gist.github.com/PrathamTI/e362321e3cb8eae86c7=
22c41d9c27ae2

### Build Logs:
 - ONNX: https://gist.github.com/PrathamTI/e0dc24c07081c4fd76374ff36d781b22
 - ONNXRUNTIME: https://gist.github.com/PrathamTI/ddb5b6e3f8f9d7434af4c4262=
45b7993

### Change Logs:

V4 -> V5:
 - Fixed incorrect patch version in v4
 - Clean indentation issues
 - Link to V4:
   https://patchwork.yoctoproject.org/project/arago/cover/20260305154820.14=
61983-1-p-deshmukh@ti.com/

V3 -> V4:
 - Removed redundant google-nsync dependency
 - Fixed improper tabs/spacing issue
 - Link to V3:=20
   https://patchwork.yoctoproject.org/project/arago/cover/20260303135623.25=
64012-1-p-deshmukh@ti.com/

V2 -> V3:
 - Fixed recipe file patch filename references (REPO-1 fix)
 - Link to V2:
   https://patchwork.yoctoproject.org/project/arago/cover/20260303081105.21=
11463-1-p-deshmukh@ti.com/

V1 -> V2:
 - Fixed commit message format to follow meta-arago standards
 - Added proper [meta-arago][master] tags to all patch subjects
 - Fixed upstream commit links to point to actual commits instead of file l=
ines
 - Improved rename detection for better diff readability (-M20)
 - Addressed review feedback from Andrew Davis
 - Link to V1:
   https://patchwork.yoctoproject.org/project/arago/cover/20260302145846.82=
8106-1-p-deshmukh@ti.com/

Pratham Deshmukh (2):
  onnx: upgrade 1.16.1 -> 1.18.0
  onnxruntime: upgrade 1.20.1 -> 1.23.2

 .../onnx/onnx/0001-Apply-onnx-patch.patch     | 197 ++++++++++++++++++
 ...f-target-check-by-calling-find_pack.patch} |  29 ++-
 ...obuf-directory-exports-from-config-.patch} |  29 ++-
 ...en-trying-to-create-the-final-onnx_g.patch |  34 +++
 ...ol-visibility-when-tests-are-enabled.patch |  36 ++++
 .../onnx/{onnx_1.16.1.bb =3D> onnx_1.18.0.bb}   |  11 +-
 ...g-header-to-fix-uint32_t-compilation.patch |  27 +++
 ...ble-permission-bit-from-source-files.patch |  72 -------
 ...-in-option-text-s-buildings-bindings.patch |  25 ---
 ...D_LIBRARY_PATH-to-search-path-when-n.patch |  32 ---
 ...MAKE_CXX_FLAGS-in-build-information-.patch |  30 ---
 ...ake-Print-out-result-of-find_package.patch |  37 ----
 ...untime_1.20.1.bb =3D> onnxruntime_1.23.2.bb} |  53 ++---
 13 files changed, 368 insertions(+), 244 deletions(-)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Appl=
y-onnx-patch.patch
 rename meta-arago-extras/recipes-framework/onnx/onnx/{0001-Try-to-find-pac=
kage-Protobuf-before-checking-if-it-w.patch =3D> 0002-cmake-Fix-Protobuf-ta=
rget-check-by-calling-find_pack.patch} (40%)
 rename meta-arago-extras/recipes-framework/onnx/onnx/{0002-Do-not-re-expor=
t-internal-targets-directories.patch =3D> 0003-cmake-Remove-Protobuf-direct=
ory-exports-from-config-.patch} (41%)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0004-Link=
er-failed-when-trying-to-create-the-final-onnx_g.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0005-Fix-=
symbol-visibility-when-tests-are-enabled.patch
 rename meta-arago-extras/recipes-framework/onnx/{onnx_1.16.1.bb =3D> onnx_=
1.18.0.bb} (87%)
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0001-Remove-executable-permission-bit-from-source-files.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0005-cmake-Print-out-result-of-find_package.patch
 rename meta-arago-extras/recipes-framework/onnxruntime/{onnxruntime_1.20.1=
.bb =3D> onnxruntime_1.23.2.bb} (73%)

--=20
2.34.1


