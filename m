Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11663CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:04:08 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17273.1790784244128462124
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 09:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DjwtwJgq;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=DMLm7GL9;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Kkl3057453
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=2HTap7bMBelX+
	sg0Xc/DELN/zPu7Xq83SQxsVlCGA2Q=; b=DjwtwJgqTx5x0l72m7gkbP+5qOaZn
	3aTvRc+TEiXM0J+ZADowrVcU9uS9MZa+G/Annr5FGmUM//zLPaIZEVbMpyefxzaJ
	m2/kl3S+cAE7azZ2Af4FwfCEdojyhpfarVIY5w6kFosujMhu463mMUkvgQXq2fdW
	RByTJ3/0YwijBqqrBehIQYwi3QZA0tPdlJ+RdgdmxGFjcf+mLyX5C/p/cIJRU3KD
	37gacLlrLsY66WqJ1zpPt1jyGUIbC794JCzl2LUCI+a0hkdTTPtsbvbt88mEPJ+l
	KGR1TmrvrGa9Ss2ul9D0hZ/tQtfLSJsAZAbT8DUaEJtUWM6yRMGfjJnog==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9feh8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:04:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5QiIBHDKISmFdm3gMvjNs5PevbuyfsxngYyO9iVV6WyZapJ5agvj6JVAZRIkTOlDxdKOyVXn4ZWa5F1fl+bz7JtGZj/bdWO1j3m25Q58xwOp4/5h3qxK5qdAku+2tmR5iyjxjYHe9voBK2KGd4ybdokWzZidsv7wvXQI9yBJjRVa/F3ADnLOfGDeiI4Ruc/d5qqG/zkqztOlkUEoALwhUbZ4IgNxm9YFWKAheX8Sb7c257qGlOP1FyLNV3Hf4+dICOMygLIN2++BSOcVxJWKutjXrv9AvcPpVVaRv0NryjlPzEbyT5sqSaEvkbtxdQ5iYDxpI4yzP2mI7pUIzX0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HTap7bMBelX+sg0Xc/DELN/zPu7Xq83SQxsVlCGA2Q=;
 b=TsyiLaEGyk8i/QiM4fI3i7O8To4Eo0Q8bDonnSuh3eyLMbUku2FE+fYrAK6JaGhdbHNj0paEsWpCuoJYdHowx/raO7ymWiGnS6Su0+SB5s8cVx4YV3hTWNr6Fna7H6BpbPf51YVrkj88wW3pBEW3Su87ZjbN1ClPCpXJSzACwe4yEpQD2VOUqiEpZV4lmmY4D0BJH0fRhWxvn2KMOPtoJ3H42FNXejnJYM7TGyayjR33ExdRvOxVCdEAvHNCwOZuy5FktX9uiQBr82UZgUDMj0z+CEVtCeLSf4Oph0C4MMiEZeQ3XRJmzRH3t6FGaWQfNIq7gHC33asUDpUK3yMvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HTap7bMBelX+sg0Xc/DELN/zPu7Xq83SQxsVlCGA2Q=;
 b=DMLm7GL9nxOV3sGZTS6OSYGFFpL09vlzq7IZi3bkZlgI1M4S2wQM7jHeakjiBh8ourx3Xs5yrC7GtVTUj7IbUFHm+2TWNI4uoZjJx4uTt3nMrQg3jQKzbrZ+vk0v5dxT9VQwYr+M6PY/vlU3BacEnMWkjg+kSRYdXZJASGCSzwk=
Received: from BN0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:408:e7::32)
 by MW4PR10MB5775.namprd10.prod.outlook.com (2603:10b6:303:18f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 16:03:58 +0000
Received: from LV8PEPF00000066.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::9f) by BN0PR03CA0057.outlook.office365.com
 (2603:10b6:408:e7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 16:03:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 LV8PEPF00000066.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:03:58 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:03:39 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:03:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:03:39 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG3dkO172033;
	Wed, 30 Sep 2026 11:03:39 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master/wrynose][PATCH v7 1/2] chromium: auto-load arago extensions at runtime
Date: Wed, 30 Sep 2026 11:03:37 -0500
Message-ID: <20260930160338.951001-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000066:EE_|MW4PR10MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: b637d181-2328-445c-0c97-08df1f0c6fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|18002099003|3023799007|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Li2N6ME0nHjo1VHtLs9/2lhVOabO9q0MkEW3KXBL1w1AVslx5k3bGcy0XzRf3KKRbxeu1qZIeipLGrYRv5kKOxzTgsTn/HdrZf1dtUPc1aRYDxT10WciKOBCNdOcR5rNrOkQYlntPaf4jAldABmSykk0fh+ef3UxFVO1T01qQK0d3cC+Syxb7MKJBLU2wHIkf0wRHlVG9OVYWp39B/4uy1Ppn3WSHS0iZwqcO0FcvqkwTEi0uhTOrIN18ft9iEYMp5Dg49FCAxcKhEzj6D9Qm4XmBHmkgUxq/t4dJpmBhCpnTiQv3RDeDJ1YrjkDYOvCkOlj7vymqRj61hQEho55Xyubnh0yP1TDnHyg53U3iO2GeR9Ugv2tmsp5POjpWu8B2XRw4KePWbgfbBogBdSXspdtrgNkQJe11vsRXvLQ4B9psVucgCFn/AHJBbzJrzKAXC9uIpksJVhJOB339vjt/bedl3qAPWku2zxR89QCXxsOCfDja7EXg5pKD73n0xoNcLDFWoQ+DSK8ehFYWb7gJv73QahbS1ejFlH5s7Knr5cD3bDBqUrHzT3s8aotKAbSukC+Jw2OGBgc4XrrcyHwCTZq/HyN8rYNnVB92b4CjQrqJR3paBT6tf2eiJFVVx8juBZLWzoeELxSgkwQgOnKEdGX/C5+8tDIfHv8abuiEiw2bWRBAaKgEoicWuke47OhGoF3r4M6AmEqJ/eMtw3HUw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(3023799007)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RXb4eBPfn7bj2adS/BFEvbNOhcqWB09lIF8O1apLxSsyGqKoWe3WVJkOYfxPvFfE1t9Z+oYr3E/3XGqwwD8osu0LcQTRTHmxEPvyqW4BIlvJu9FRQt+0qQVXhogcUuJ75yo4EW/e2n+VsuAWhqiwaTNF7L4fEMMpoY5cg8ujjiK8G87+c8ChbttxCpuhBmmEIMyeTb+O+fUsrBuDBe1WArvLE56QTmFYE//iBp1mF33EswHE5B41BQIRWvpkHW9deAmznmHUSQExdgWCRv6ehKeucbrXCmzMIrkN8G7R7ESBxqAEbAzj2a7MBTv2nPskDa33h7y6gU56Yz3QlxbHe3Y1IWWcOoQA43RwxQjLQwBq631SqFJLpyzFRwUBbf2f4/8eZSy/nXT2OWflV2AUCnN+Gq829H2b7ybyAzjZ1WZhIpQAfjg9SgaWeC5cKQsj
X-Exchange-RoutingPolicyChecked: 
	td5Lc9H1clT6fuVTTJpu36G1/19gHkLIft7DlwS+z9fXf8nRzdpZakpFlM1sxjcP47TDQ6OauR+FwpJRX3SQ6MITN2w4IuhvI5Jvpm9kgub7x1BXpzhrL6PzK+qjEXPYGtrdBItqK9URSHC2QoGAY6GkW8WE4m+3x0VxPaumHYckl+QPy0PTTO4o42p5KLbqBd1NXIqD/qNDwlgDSLUVGBW9pfpND3+FyCys8n6lhgSy7B4aH161QOs+d9D7i53pusV8LzkxiStCpoBvLCuon5hTqjakzX4/odwXtPycbYvuIKzLo1K6qXvnhsyzulJt7FzSvkn2X/H6lyfOudy1XQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:03:58.4972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b637d181-2328-445c-0c97-08df1f0c6fd4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	LV8PEPF00000066.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5775
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd32f2 cx=c_pps
 a=M67J7PRCWxeF1x+4vZEXtA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=byG2Hu2Lqfu07KUd7EEA:9
X-Proofpoint-GUID: Bh7Xaqwzfd4zyaF4_L33Ot5BhiSschYy
X-Proofpoint-ORIG-GUID: Bh7Xaqwzfd4zyaF4_L33Ot5BhiSschYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfX4LjOEFsBZgG+
 +cqvJGT+Q/w45CFMlKVMeIErGNQ070Hz8N+ltAHRuk4e9KRuy1BYqx7NpfHLzOlTF4wLeRiEHE8
 dqtDUAyyr7PxegSSQNv74gk5l/8dWDSd7eTNdVb20ku3JplIPJNxE6SppY4iUbYwjdNRtn9aumU
 DIfLf3tB1lh3X6DrL5Bb780WYM9j/GL/+XVdQvv64L4Y6H2x8ysWsjlNX++PmmXLcYG32XUTtOZ
 hhv9fUGMhhyNa5F3VZpRoZFyG1r68+4NRm8EyQa0Co425Vi4qarwL6tzLFY86o/BnJ0VeNeipT1
 Rt5I8rUgWz8u7mYtyangMu1lsMJFfFPdJ/9smVrems+BfA3t/a59wygoDuzAYz/AKNnnI/kDtyW
 mv/ZVEE7tsYqf+rmo4xtO/p8wzsEfk0rmqJZchofIpisTU1Ay6kExQi4rW1XZ1YW5sJ39LSN+dC
 gX0F93toGvlRnCs2jvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfX8dgOXgw9ixDt
 njs6YUu51J5bAHcG8N1dmAokO8U3+Qp8EjtQS3v7MawSsae+rG0MXxKzePARlYqnDN3k1MwydPO
 Lpq4RiRkjnj6x14qFGF5yf5VdXQun3E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300063
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 16:04:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17718

Scan $HERE/extensions/arago/ at runtime and pass any installed
subdirectories to Chromium via --load-extension.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
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

 .../chromium/chromium-ozone-wayland-arago.inc | 14 +-------
 ...-Auto-load-arago-extensions-at-runti.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+), 13 deletions(-)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index d8eb0204..40b74c18 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -1,7 +1,5 @@
 PR:append = ".arago0"
 
-EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
-
 FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
 
 PACKAGECONFIG:append = " proprietary-codecs"
@@ -11,15 +9,5 @@ SRC_URI:append = " \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
-                  file://force-h264-youtube/force_h264.js \
-                  file://force-h264-youtube/manifest.json \
+                  file://0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch \
                   "
-
-do_install:append() {
-    install -d ${D}${EXTENSION_DIR}
-    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
-                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
-                    ${D}${EXTENSION_DIR}/
-}
-
-FILES:${PN}:append = " ${EXTENSION_DIR}"
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


