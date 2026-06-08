Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE1DCD8CA4
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 20:19:24 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64259.1780949957175656171
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 13:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Srj6FuHZ;
 spf=pass (domain: ti.com, ip: 40.107.200.51, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNwHGJ722Sj/kZiIBKBbVzzK39q7Y5g79wM+Diiss2zA2X5f1U7yvA3NgHrc5/XsBrD9yTypKQTsViKfTmLkn76ZPaLwWFVPaBac6Und4CBVVi3fJGiug8qktmPLeYhJ6B310E42cGdlnCENN4Y7h+Hvj9/DfzlKgNKq2G5gKJGLuq8HzwhySKgY4jteyqjTWepJllJlpWuvAGLqU0C5BZyFnq4PfECh5rk8uNhi/KKFE3qDvmp9MtlDIhZUBHPR6mw0g/gX4EweqgcrtGLa1UVkVWCiVbejpoVD8QDwvdNo1SNzobXtWsi5fPQrWBNMEBRRG2+6ZFiTB4st97Y6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/MlBaKp+aS+GGnF1qiOu9hcQ5pqFYAlbTbLtLIQ3SA=;
 b=oLB2gnOFlwGJXU2yV+Re8xZK+NnjpQtl+gXXUkrURTxbs+viZz5PgjWaozzBN1KMuj4wHHU3ngASiMwx9iU0GipSDRtFypW3JW/LhPbCpOXdmdvyE7u8XMNqhTHaiUzMdK0rzHGjA9qmxfzZw7TJFs9ErBpA+KA4ZfElkWxRHtZPJoyqW+UWCCRcIHZ9LT7XekatStxAfgx3n+88Gz02jMFcQI7YbCyMxsu/OvxlM2NYvkASS9PJunWZPTtglH73nxpY2B2d9CrprruaDYnzxbCESQMwPZQldBJ0zJR7pfYLj8BwK0gnbtYSQqem8EGZRVaAKq6nv7azo0Kr9XHjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/MlBaKp+aS+GGnF1qiOu9hcQ5pqFYAlbTbLtLIQ3SA=;
 b=Srj6FuHZyxxLnz7vVl/xS6+yaK8ow3q52hyd/HuVm+j7dU8xn+jjtQBnnv4H+FuJ/7u5uyhcQmovgfVpUiN9NYNgPg/QBoqD0QKIJC9EDLDtU4Qvm0ROYn88abEz9blG1BGmLF2Co3iBNsLYa9LSge8fyshBPm+HqhwA1TwGX54=
Received: from PH7PR17CA0043.namprd17.prod.outlook.com (2603:10b6:510:323::9)
 by SA1PR10MB5866.namprd10.prod.outlook.com (2603:10b6:806:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 20:19:11 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:323:cafe::70) by PH7PR17CA0043.outlook.office365.com
 (2603:10b6:510:323::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 20:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Mon, 8 Jun 2026 20:19:10 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 15:18:45 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 15:18:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 15:18:45 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.160])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658KIji13782905;
	Mon, 8 Jun 2026 15:18:45 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master/wrynose][PATCH] meta-arago-distro: chromium: add force-h264-youtube extension
Date: Mon, 8 Jun 2026 15:18:27 -0500
Message-ID: <20260608201827.3937832-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|SA1PR10MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 71af82af-e716-451f-ecb3-08dec59b3331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Hu0y7EeQ0+p8ghUS8c5cOKMwYdozE3t3X7ZWz/qc7nPI/MzmvrZPrOQ5Sr1/S+0Wgb9M2fkqd3C7/zJkuiAx+5RA33fTagaXnizIufgiD4oVvowFMSdDvhvqJCO2Z7pT6fgYT8G8x+ICf0CixyUp0BS/rBHbBatPVMzwqFQC7WAbOHV7x5F2YtTEESqLQtyKKeppAwvNYVOojviCZc6dE+PwKa7hqX5UBKid2kC3QfgItQ4jC49XvgloNtde+9ldn9QuJoUGi2hE23NJQ05pL8aEsDovMobI/EzNgyRQFdjvFto15RvqFHlcbNlBRyKmKCaf3h7KG4WDoF1gkAvs9xbpaYYxWLXIOZfFzEyhaTVvBi3Ir3ooTCNT5zjFS16WQXqHo3y82bblZonZQmgI0W0jc6BkwLh4ERQfjFDOgeFr54Pnbgq/UCOjEgFQI6Q4t/l+t52goRCZcGNjOSfP7lUP43G6DNCM0E64dpp8rA4zfRFHZhOq75WGVxOoAq9c0VgPgckPScpajbs7crFms8LtL1RZhB7MfR5VdM2apegq8JFqsuQCzXszLwVTYLI+8iMSFYMLrkCREKqx1d5K7eAgQYq0CJMdtFLbLfoSlsAec2GUDN6UAADPS2BIT8xjMRIOkvXOq+tirz0vcFiQGrK7pYu/yBPuGSf9VypiXef8xauKnvxlA37MZ9Do9Tru7YQV/rL9qQMihKhUvVS3p+vpLoBCZ+jyrvQlvGi8USc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	d7P7Fu/MaW4wpif+qEsQXhkRdcJFL5wMH5NnaET1uVQTf4q7FaLhAUJW+A7T7VGMFjF9/9b1ClkCJkXBrn1coBZdYpcqRlvC5LMjJOLsAwT2ZxwpkBGGzBZSRjkk/L5GBkkvnCDqgLi2OQW1kYPzKBIsmrJnTLA8pXvZxIVch+u+gzuuK4AkPO/1cDJydyY9D2sUWIW8SfwbrmF6EI0ZDxsdTPqDi0w1Nl13M5oF7hRjIxsefQEdCL0+qmvKVbMSw/LGsofLg9KHJ3UbE4xeob0MmmEZ8uGyuBtLli5rN++oCjvzVYaglEjovcKTNz0P8micXLlQOOO5AK9yGGwaBxS7VFPRSK0wXQKd0KKjoFUySD+XW7bSC/UOMdQJWuM3PrjZIwNqSuw/KbR2J1BJ1wn+uX7GYLkLMZCgUTMp6qq5llSQk4SFn73Ibjm7r3QV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 20:19:10.1365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71af82af-e716-451f-ecb3-08dec59b3331
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5866
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Jun 2026 20:19:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17553

Install a lightweight Chrome extension that forces YouTube to serve
H.264 (avc1) by blocking VP8, VP9, and AV1 via MediaSource.isTypeSupported.
This enables Wave5 hardware video decoding on YouTube, which only supports
H.264 and HEVC, without requiring a third-party extension to be manually
installed through the Chrome Web Store before use.

Installed at /usr/lib/chromium/extensions/force-h264-youtube
and --load-extension is appended to the chromium-wrapper launch script.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../chromium/chromium-ozone-wayland-arago.inc | 15 +++++++++++++++
 .../force-h264-youtube/force_h264.js          |  4 ++++
 .../force-h264-youtube/manifest.json          | 19 +++++++++++++++++++
 3 files changed, 38 insertions(+)
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
index ab092fa1..14c12767 100644
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
@@ -9,4 +11,17 @@ SRC_URI:append =3D " \
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
+    sed -i 's|--ozone-platform=3Dwayland"|--ozone-platform=3Dwayland --loa=
d-extension=3D${EXTENSION_DIR}"|' \
+            ${D}/usr/lib/chromium/chromium-wrapper
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


