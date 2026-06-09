Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CB4CD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 17:13:26 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.871.1781025198399768551
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 10:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=RXCpTskL;
 spf=pass (domain: ti.com, ip: 52.101.53.21, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPPesxzAkPibzGol8fke/1rLDDM+Udn4e4if+V0IksFcauCEYwzRAh2Y0m0BigncvkyXXHFNEbHYQwXAAAYaoJfsC9Z2TTESI6ugn3GeFM98aaETAF4wMTR1YSaDu6zMrdntP9eqob252+a7mr4yWmshlnx/AEARDNBCPqSbYe+rQxNbzRwjHNyu/UFZ8ECuVjIs56e4zR4/PswqlFEWKhKy/++4sZetRRqMcjiJu92XE7KTU6Jr+eJbrSDuFvDZpJcF8SqZy5MuisjDg2NyefwKbIbHusEvpcR+f0+sDzYNEwXmIUAU4UWY5QwbGMJD3r2IUOyfcKnPnCFLM6FsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nWOBYXrE5r5YUz0IsVG9LA5B2McykuuufoBnQil2kc=;
 b=cl22HbRNqaWj/oCkn60wsMWXyvUgg+wT65L4REZ/82JpYhJu3fa9lk6tasdUIFiablLCKNwXC1qZKFbiILIDcotxGVC+QGI3f/gufUfckcfewy+YFcV+l/JNflxnh+nnjPJ51UlqkvZsdagfdmKPhve/CpkdTCnFjtw/Q4ubGtakQOLpsGhlEOvAYh4BhEVoFm95PFfFeIfojkAadIYwZN+WMGFrSv+1lmT2GMHCtXZgp7WJ9Cw5cuHWr+fqCdafu5LRp/dN017thAUjHq+glkBvQztv7nrEKC3bmIf7f3Q5xUkrOpCvOkjrFTst2SZaFSiUVm9ETcuDKC64/4MYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nWOBYXrE5r5YUz0IsVG9LA5B2McykuuufoBnQil2kc=;
 b=RXCpTskLerEQVaddP9wiKmXPrYY7KXx7sKYAzq7Uv1n7eITt0McYHvi4h3jzexMyoyI1A7dqZ/O6mGmKrlMZ7kbdllVMaLZFWhLmMNBQ+hK1ea8oAEesQ5cx3nJ9R64kYbkgvCPTC2bcfpD2CV38Z7Zc/vsT8EIkPKSJaBtoSfM=
Received: from CH0PR04CA0067.namprd04.prod.outlook.com (2603:10b6:610:74::12)
 by PH8PR10MB997905.namprd10.prod.outlook.com (2603:10b6:510:3d5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 17:13:16 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::10) by CH0PR04CA0067.outlook.office365.com
 (2603:10b6:610:74::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 17:13:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 17:13:15 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 12:13:15 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 12:13:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 12:13:15 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.160])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659HDEQR1530941;
	Tue, 9 Jun 2026 12:13:14 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master/wrynose][PATCH v2] meta-arago-distro: chromium: add force-h264-youtube extension
Date: Tue, 9 Jun 2026 12:13:06 -0500
Message-ID: <20260609171306.238854-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|PH8PR10MB997905:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1e79b1-77eb-4d70-048c-08dec64a650e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	24GcbTe1xCLs4AnChUM4YLGt2lJQ2Sh/AcXa4OrgwQZR/q6cp0yJ65VBoknifHDHtNTfMjb6dulYaUaQyH704TfwNCtWopnqWDw0GVDVSvej6EYxKMLpPV8nmhD2wZwEPctnffmJI3HMuDZt3I/xRtsiAfXkDU8oSOkTMndDtaWVSRe73c+IyY1SFLPGstqdKr35ZNgOlQOcEodSAjlEwtGGvEIhtJO1yjVWRCPJrnkOxLaMLhrPK/FkUz96qeAKBkg23v/Mq6YKe8SPsVmgjleLSnMv8LyIy/oJRewUeoyBXnTY9gKW7gTLekpPOLie7uN3nH7x+KO2BtXVhtljq86h9KVAToc83ThvHaAcSWcD7lnjHBv3nr4VKDpHlkSz/S5UPABwzeOsLQ/x9PmAbn1jUXmjZ4WGXPIEQTwqj5OE69ImgVUeIcEp/i4CaHIAI6Md0r1OT1Q5Wl80IqljnNx6JOjl931JKz1C6p0nsw3Z7r6FXvxvIYuXv3WpFW17dV680apRBZ7EqbtE9FpwC0Iou4qHjKS1x11MHM/GnEtU5afx9Iyc012ue+/K9cSm9d0ik1VQlYsUl4ljqBA5VAqcI4uOir0gxzusSUMiBKI1ejrjxk/8QRxaZAk8USu49CU3PA6/x/RIdt1/BR7YFrnsw9Tsd9VKUF6JW5OvGq7gUzy7ixiPSezpKDnx+yaeCJLFlail+5Lk5wxQnnX0YPIoW/C1daR5pLee2DcDEfo=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	k1e/bIUR8BaSQqhj2ZPs4QCU17OXZkprs7PJsdVPrDWMsHMkS0aycJckWWbAB9w8LTBp2Bm3a9CMHLZ6QzcdWh/4sASbGUsD7Xa8ppbnDY3jtPUsatrJS+J2sUa7Wc8aliFdh4iSkZNIlw4RcweT3yE7CHfaBT08RdDYQpdnVaf9sX1dqbhsmn0JQmdi8Lzj/S/de1tps+5aoGPpoFY0awbU9jJ3/YbTyDrnlxH7WNVsaUDjFJ45ybA54VQQyZkjXjIp8gs7Sz72SOKRVN+cpEEXeW5SdjFfVXTCXrVmxvWDJUhlo0PhlbGN5Amzx5RKxpp4m9+vEHHEOvxdomacyV2Rcc5ktFlgKMO2xcBcDJneFHeXiZqcnLgK4XSzsZMPyx8hxiAZ9gA5lDTRQ2TpYkjQLhd0yXN9EK4BFvXNt7ZBcSChRS6GUR3iNIVWX4ON
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 17:13:15.7476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1e79b1-77eb-4d70-048c-08dec64a650e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB997905
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 17:13:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17557

Install a lightweight Chrome extension that forces YouTube to serve
H.264 (avc1) by blocking VP8, VP9, and AV1 via MediaSource.isTypeSupported.
This enables Wave5 hardware video decoding on YouTube, which only supports
H.264 and HEVC.

Installed at /usr/lib/chromium/extensions/force-h264-youtube
and --load-extension flag is needed to enable the extension.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v2:
- Remove the flag that enables extension by default as not all SoCs support
  Wave5 and Chromium

 .../chromium/chromium-ozone-wayland-arago.inc | 13 +++++++++++++
 .../force-h264-youtube/force_h264.js          |  4 ++++
 .../force-h264-youtube/manifest.json          | 19 +++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer=
/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h=
264.js
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer=
/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifes=
t.json

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dyn=
amic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-=
wayland-arago.inc
index ab092fa1..d8eb0204 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
@@ -1,5 +1,7 @@
 PR:append =3D ".arago0"
=20
+EXTENSION_DIR =3D "/usr/lib/chromium/extensions/force-h264-youtube"
+
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/chromium-ozone-wayland:"
=20
 PACKAGECONFIG:append =3D " proprietary-codecs"
@@ -9,4 +11,15 @@ SRC_URI:append =3D " \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-acces=
s-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming=
-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264=
-access-.patch \
+                  file://force-h264-youtube/force_h264.js \
+                  file://force-h264-youtube/manifest.json \
                   "
+
+do_install:append() {
+    install -d ${D}${EXTENSION_DIR}
+    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
+                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
+                    ${D}${EXTENSION_DIR}/
+}
+
+FILES:${PN}:append =3D " ${EXTENSION_DIR}"
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js =
b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/c=
hromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
new file mode 100644
index 00000000..5e942321
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
@@ -0,0 +1,4 @@
+(function() {
+    var orig =3D MediaSource.isTypeSupported.bind(MediaSource);
+    MediaSource.isTypeSupported =3D function(t) { return /vp8|vp09?|av01/i=
.test(t) ? false : orig(t); };
+})();
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json =
b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/c=
hromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
new file mode 100644
index 00000000..fc69be22
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
@@ -0,0 +1,19 @@
+{
+  "manifest_version": 3,
+  "name": "Force H.264",
+  "version": "1.0.0",
+  "description": "Lightweight extension that forces YouTube to play H.264 =
(avc1) by blocking VP8, VP9, and AV1",
+  "content_scripts": [
+    {
+      "matches": [
+        "*://*.youtube.com/*",
+        "*://*.youtube-nocookie.com/*",
+        "*://*.youtu.be/*"
+      ],
+      "js": ["force_h264.js"],
+      "run_at": "document_start",
+      "world": "MAIN",
+      "all_frames": true
+    }
+  ]
+}
--=20
2.34.1


