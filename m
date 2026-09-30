Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2C4CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:21:29 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17609.1790785280645286638
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 09:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hBH8X5tq;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=IqVAMe7u;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Iwv3333409
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0pRbAnIEVTuHyhprZMSgdA69wbu1Gjn1bBny0pC05
	VI=; b=hBH8X5tqJgyluwSeeeC00JcYkUk3yxCTKLYxeEyv/0Z7AQmsGcrm1eXie
	yh2wJHb6sAkcpAvfFhjcRkyeeO9Hi2NdZ3k72FCtM4ORdYQIOJ+t/1NHyjglDV5L
	AORqncBZ/82cn2g/67bZydU/w7CmcOg86Qd8i1bLwZr667U35233QMptRSRP3qkx
	RCzfbDbEmY/WPp0EyVpZzlkBDy42sEGpjVcy1aCRh2OwxYnwKZ0t6KBnQ181h1MI
	bkRm6pSuQaW0R9iCsRsWYrkLPFIvA7G1kSctGYCBomAXOd+T9bVrZAhG03AF8Z1S
	8kGzb5IF0PJz1i6VgPqHP94HNYmTw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1syaa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:21:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmcC3JZgHMlqDjkojb1ifKxhZXtizmLiOtOdC5fmnZ9O6ZmXJ4m0u64xKvT4Rm2zrVR7JgdfsPslho0u86x7ML6fNTRu9963wO0i70IPcdigoAaJwlg8ZLygFee3lZBrVEmHfJ6GZm8QoaqKF9pZj15Y+zzS6NVaP8OgzIvNEESfi5ti+eRN3ES6D8kJXEnY7WXT+NrGlpXQIREiuhPeDwUPHc68ome8NM7klFSOailY2MdoQtT3G4BibDj4eG7DPbhF+Yz6Qj/AU3hokG6RGXxvg1ssyNEBBw8eKJelNuWUeMWVJ3sewQC5GO9z7M6zZl8z/w/uGnufm3e8+NAwvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pRbAnIEVTuHyhprZMSgdA69wbu1Gjn1bBny0pC05VI=;
 b=vbQnjkEVypYtNjew0OyDNXQe0Mqk2Yr2DYSMkGdvRogR4vobHlul8G8lJ+CbWIhZhXe6gH49FBJBlemBHvwo9C+uZb9f+pJyi2A3qxvhw1V1LlmiacWenrVySAPXbnPmys0Vb8dLj6agVgMHpvoD49OonOCaolcNvHxFvhN5Fut01Yaiwc4r9hnQvobX62A2+2P2BmlfoUGS2APIyIoXq8srf3mTfnn0+dImwIzV4r+M/64afYG0caHLBug13ug7JrTf21P70yzNwGq+DgR0VK0gE5CqoxMjGBYtN7f2Qcl9ZGRBzAA6cykyC6uVj8z+aOBgsTtFt7Se8ASr5wwPDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pRbAnIEVTuHyhprZMSgdA69wbu1Gjn1bBny0pC05VI=;
 b=IqVAMe7ucNYQ4kck9NcNnV9SHBAw81yVJxjEsY3Mytj4tvlsRNLiSX5V3sx0+eoCKaib5ranNK0CR0dSjCZBWN+KqJXwLgiJeIt7uVIDIW+8f3Hq3M6pL6y5kyARfvjqFXpORMlqYhVTumHLXe/isXvELSXsZyZlyNPNgtqDW8Y=
Received: from BL1P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::35)
 by SJ0PR10MB5891.namprd10.prod.outlook.com (2603:10b6:a03:425::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:21:11 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::79) by BL1P222CA0030.outlook.office365.com
 (2603:10b6:208:2c7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:21:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:21:09 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:20:21 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:20:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:20:21 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UGKKds199424;
	Wed, 30 Sep 2026 11:20:21 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master/wrynose][PATCH v8 2/2] chromium: add force-h264-youtube extension
Date: Wed, 30 Sep 2026 11:20:17 -0500
Message-ID: <20260930162017.1163748-2-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930162017.1163748-1-t-lannynd@ti.com>
References: <20260930162017.1163748-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|SJ0PR10MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d7af88e-a946-47b9-3311-08df1f0ed659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|3023799007|10067099003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: 
	uNUJBGyzIDFrBSc5Yd+bED0rFNQwwuiWKPmodIeMKxFoOLgx1W8L3iZCq6MMuDfDrFDOgfnOd/z6XnvI5EH3qKZkSNWOQLtkLAkZ6usL56cIboMGk5sRH0AyS09QhJ49MaSr0htxTitzzr0bvglTEgAZYA/1D/yRo89if6kvy7hfKcPnIVki8EKa24JYruVBbjBoP4wVXEQH0ZDnFDiF+FahfV/nIy/CA6JiXQxYju/A25oRXfgd2kHcEbS7qttE0z5T+iuf2LZdwiY1vrswytSlO8SsSVJGRQlHKAmLXBkCI0NEHh2uJv869B2MFF1As/wHOonBL5qk0VTslTTYqCfDod5UL1zDbKRFpSScQq0e13JdAStdiMmrEpRPyDxcnwCqGv6hKQyrqEidP19m0T/iHLzrQ6yF7A6AcaBPcKKk1VORF7TRwO4NXNJBUv/o4QnMspE8IvffnB2NOzeNKna+bF3IpfQFXLv7kTZn2SicMQL6YPDmfTNXz92WBFNvb6nuHDTyBF64Z0NBPUGlZHIkTbppgHftExxl39IJrUCctv5i1qZ4NaFdj7tp4gsa4xh4mpb7HDMzrcUNY2gVJFJl1i9ACvujqPNMRMnzCSFd1IaS1f+kwalUf3HjemZnGyIoVaNuevlizUgNeY7PGGeQCwx2Rz6yRGGQKa9FmszD7wnFIFAUZI/8ARJs9j2QItXqWGrui7UjYPa9m9aDzw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(3023799007)(10067099003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9wbeyWLgsg6LFyY3dbEnlEoJtulxq5Zy1uxIQ6xS4LdpBSatlb1riQ3KeaTyTvdxUMXcagK93+swsDsbKNHLAwk6dcX9TMM2I1ZW3+vlDaAH5h6hKSTwmOWi062YzFScSgYXce8VWaCLqGVi/oXUIFrRivtxZfjeRJlfW7I98vC3lbjGA8n/fszf+3Sg2ztZl03xT9SSE29ss8jzZWIwrRGQYebV0aMd16c2HfymRfQjlN3BnlRFPWCJR8p6taDmZd4KgaYgOQtxteMnmPEdEU2dgOSRT/+a/G8M4Q42KyZlK7lJreHvvlja5IjPQfzK4fESGlpU+Ar9yosuj2RfmW5+QM2fmErKBRHd6Q+QauAMhYCJDxh5PGPmw/bz04+8jRli/nexbwckEJ4H0sY7tBN+ZDkUWtRMdXV7wN6rceSKN2kArZ/uI0RYy4/fFO28
X-Exchange-RoutingPolicyChecked: 
	O2riVJ9MGynHi//jHmBSo3Mu7YPFWA0k+XzAYxy1hfR3Rpmvu120bIKKQMUbwOIXWcgav6w0twOeHREasrqg661kzIqCwngIA+nEf4BEXM6s9ihHyaMR5xFdw5Rbi8bFgGf4JFlW+9KctRfQun9XDZsKhwHxYjVYtdPjjxPPeSy+DFFCqgBG8xNSpRaPkXV9n3HS7UgWkTSkBtrHASjjUZYc5SL4d7duwo/2H8L+Cja/VUB0iq20xNu4H/lPeXZwqbumPV9zMbo5nq/8Et+SsIBWL8gah3QgMKEfU6co0gNJXsW6b9+foi/UEEpl9KZSC8Htq5ikGz7Y5uYtig5CFw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:21:09.4933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7af88e-a946-47b9-3311-08df1f0ed659
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5891
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfX/CxIRqzxhXVd
 gfU7+lZLxkeyOTX0F0MYU728IwNbry9wKIQBkgntTzu9uPy7rcaws+RKdsBPq77QFVNJMaJOGAS
 TTib7UxNHlxzFOVkp95mr0jX7pVEgkQ=
X-Proofpoint-ORIG-GUID: mFpX_iBZcniNOfRDyqAdcPKBRRgO2VZz
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd3700 cx=c_pps
 a=kBTuJkHEWKOaoYTOH1TR3A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=MJ22YsZ5dQk7D5SWMRcA:9
X-Proofpoint-GUID: mFpX_iBZcniNOfRDyqAdcPKBRRgO2VZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfX1fZFscBFAMEx
 /bhD9zf9FebPhlSnXvImd0G4yPIfGmypKgjSa87HIZSLAHfR6N5ZvC+QoZYogbsUdgPkcM5uS8b
 Txv7DbZvlA7xl7XxFQz5ckfeEzl8gcd426RnBT4IdmnIMP3pl/90Q+CgBWJW9Jswxdx1yLG1jLU
 It/pAcOKIDISaP94RaF0ovjHttSEqyjoAsQ0QwcYuk6WlYulbAWuIkb7bE6r8H/Cjm5ACLi3MvC
 5AS069veKfXdlRtDKR9yEAMcPylGMgdvVUO+NMuKDzEUeyBsw/dx6bAVZTrlhKW7iOy0LGSwrQl
 BFMFVSTUL5QYd1jtMjyXhyxeMDVTGzm8eeZjyy68Lu76s0zq01ukMcc/dd8nOSHq5uV1dm9Nld7
 //7QXDcJ8KQXqc35LYFSkn+dxRh4aVQ4s2lqYnOJBWtt2VVIjSeq5ioj/hyIDurfE7vQ/6xMFzL
 yON1eK1SVSgyzG7u5NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300065
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 16:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17722

Split force-h264-youtube into its own recipe, built only for boards with
cnm-wave-fw.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../force_h264.js                             |  0
 .../manifest.json                             |  0
 ...mium-extension-force-h264-youtube_1.0.0.bb | 24 +++++++++++++++++++
 .../chromium/chromium-ozone-wayland-arago.inc | 13 ----------
 4 files changed, 24 insertions(+), 13 deletions(-)
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
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index 96796410..40b74c18 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -1,7 +1,5 @@
 PR:append = ".arago0"
 
-EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
-
 FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
 
 PACKAGECONFIG:append = " proprietary-codecs"
@@ -12,15 +10,4 @@ SRC_URI:append = " \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
                   file://0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch \
-                  file://force-h264-youtube/force_h264.js \
-                  file://force-h264-youtube/manifest.json \
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
-- 
2.34.1


