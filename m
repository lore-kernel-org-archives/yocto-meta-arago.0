Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0789CD8CAE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 06:22:17 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73437.1780986130884455284
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 23:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=nPr26J82;
 spf=pass (domain: ti.com, ip: 40.93.194.48, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCE4io+6/Loiji7Seo7qi9cl2MkfqDj8i2U0vMMyA0AozQ2spnevFmy83kt6Tol3BSdUXJW9MswC9/bX9xHjKZ6VT/N5ufH724n1b4kZa5lqN7U0JqNrIIlTt+YsbVhD12Nc0evDnEm0rICUfFVCJs6AmLatRc5/Ek/kaEnIrKPcgZSbc3tz3U2PT9jXkb+Dz8aMVoAKVLTrVcQ8Ez8HF5Wfc6tM0tM0/XcjduJNGZakXgnnd9/wixsUAJQa4xZZxLiSwLb4cbkLbmJUnpg+jRbRB1af7TZXncUTC+stRSPT3pmtYTijV6QEVxnTtzGNjAYuElb+yCjPMrtM7JC05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lbLNuYCakW6ssW8I4huQcUvn/vZvE8GIPc9kC4xBhY=;
 b=Rw/zjxRqSsmL2u/L6jz7lXlzcgV1pBToJE2BrIZRbz5YQmx+iwOnUXRZvggMALEvLiKQ9jy1aBGENsaKMn/aJXqsZBZycLJmYFXBf0z8RnBl5icAq3TGm17aItAsCUx8Xuw1YzYnyfB/gcmDAzenAYRPizZlD6QKObX2wTeNDHCCjOjgfUY+R281+CjiK/P4x57FGkw9t0adgKQxNkdAGRHHeqQQ9q3vn044W4KeeqFwwkN8tA9kPSK2iRlYthVv1uTglWuzwXvU6Cu+z/pIyZQN5AYPRoV2wIPyHjfrP88dXPu9V1C/xa6ilP5lMptMCWdC5L8q7O/fJs5UkpRE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lbLNuYCakW6ssW8I4huQcUvn/vZvE8GIPc9kC4xBhY=;
 b=nPr26J826FKQbuGUAOMwJe6qVxbZRTWxkRiMRvDXWo6idSb/vSHNutEzq/a55Xd2JSeGv72doE5tRv8bfzBxUBOw8I7kZVsg3RsucIA8sKB127U11qOg/czNlTsl4X6wTJT4uJudDWMAqsuYZFCwHYTQMJPNN7QSTSsjeZ++P5Q=
Received: from CH0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::19)
 by PH7PR10MB5769.namprd10.prod.outlook.com (2603:10b6:510:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 06:22:08 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::a7) by CH0P220CA0001.outlook.office365.com
 (2603:10b6:610:ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Tue, 9
 Jun 2026 06:22:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 06:22:06 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 01:21:37 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 01:21:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 01:21:37 -0500
Received: from [172.24.233.89] (yogi-work-pc.dhcp.ti.com [172.24.233.89])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6596LZDI510393;
	Tue, 9 Jun 2026 01:21:36 -0500
Message-ID: <1139b2d2-097b-4ecc-9eb8-9824d5a5e983@ti.com>
Date: Tue, 9 Jun 2026 11:51:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/wrynose][PATCH] meta-arago-distro: chromium:
 add force-h264-youtube extension
To: <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20260608201827.3937832-1-t-lannynd@ti.com>
Content-Language: en-US
From: Yogesh Hegde <y-hegde@ti.com>
In-Reply-To: <20260608201827.3937832-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|PH7PR10MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d764eaa-82ec-44fc-e6ad-08dec5ef6e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	GqF0iuDnsKHJ2oKIpkKimkFpdzJQkjgX+jkKYtW1lGl1N+6gFOvpEZtePY8i+OBDyisJP5DIBscwbnJva7PMQFrKrFe4cAHva0JMhNTHSIpoX/Z1ADFEEih+xPXVyGGVa69+ywt/HM4UZYNRR8wU+NR+pcNrwrviM8wRjBl8Rf+iNMniMST+GaV37URUdT6i0IMnHYcDidsZSJb07zOWPHbKYwduzr1S4XcmtOKWKI+pJQ4P8J7L2+hhqcO3zBGC7pGuwkUjjGJRMPUDTEeLtU+6x0dQbZVsGgFQE6bC5KOEhx7XLQ5XZkVjcB5K6rpYxoeMtKfwOIOTVeFJlDFnGiv8UpGZxGBaEgK2EnDgIB66BAFAuNoUbFLkr0KU/6XrNg+RqHEDMRzJ+osoJiQsgBsQ3PpZN35jfTQ3KHtID3mgZHC+6NQhi+1SndwCg8900auoT/kdAs0LIyzSAkeAo4fECppL7rya9O6rGB2m/8hKc26h+B7cL12sSCG12RJloA5+IGnFciWBSo4B0B1mwzjE1EcwpgEGex3mCV4oPKtSAO1amE6PI1cbN/LLhllunox19qJSiQ12STViLqo6CLqYe+KlgePiwQFddqGAHBbAdOcB6DL+42mlMqQR0RclH/KBA3qTbXTkHF6eTQxby/34Iv3TYEPq718h8vZe9QLWouIQbSLxUJmWh4vv77lC/xAKKc2fYLkWX+gCAVSsDc3rl6bNPQZNR0FrUlQET+s=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZlTHgoPUsuWk676W6Up5mLLN63aeOlsoHGH93KqVzFHufjHNMjIjt1UUk7AHGWgh0lk4tCHuwB9bQZpJL6bZ4eanrXvDE7Nn1SdONY2RvNUhxKYn8dQOMzEtK6kPt8Lc7X3QnOpGbCDdhACyIoQ35EShNOaMO3ic5HfXAwmN9pz0oPmv6jSRLATzNOR3tM7zMo7BUL0K58lACkhE3dNDc0DeVtBhHTaHOU8kFHsHd80QsX2RnoV4Ydgo0OLhpOKOaxi6EPvTPYAepGs1gzXQcilX5Gi65CokSOLHMVwLaOVmRvsYWrswWxeo3TOgd2tVntCAnhbPuNBOZUs+Mrwb0dmYjcfhqTQJ/CyrbsSxN8SpU4d/6z2+aDgHzdCtDmq2bnNjD59d5GtMRMbb9+pnUztVG2cy9rN/z2pTZAWhn5JINijgSZCk+MwXn2n85QF1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 06:22:06.6829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d764eaa-82ec-44fc-e6ad-08dec5ef6e13
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5769
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 06:22:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17555

Hi Thorsten, 
Thanks for the patch. 

On 6/9/26 01:48, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Install a lightweight Chrome extension that forces YouTube to serve
> H.264 (avc1) by blocking VP8, VP9, and AV1 via MediaSource.isTypeSupported.
> This enables Wave5 hardware video decoding on YouTube, which only supports
> H.264 and HEVC, without requiring a third-party extension to be manually
> installed through the Chrome Web Store before use.
> 
> Installed at /usr/lib/chromium/extensions/force-h264-youtube
> and --load-extension is appended to the chromium-wrapper launch script.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>

Is Wave5 hardware video decoding supported on all SoCs? 
If not, please limit the patches to SoCs/machines that support it.  

> ---
>  .../chromium/chromium-ozone-wayland-arago.inc | 15 +++++++++++++++
>  .../force-h264-youtube/force_h264.js          |  4 ++++
>  .../force-h264-youtube/manifest.json          | 19 +++++++++++++++++++
>  3 files changed, 38 insertions(+)
>  create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
>  create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> 
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> index ab092fa1..14c12767 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> @@ -1,5 +1,7 @@
>  PR:append = ".arago0"
>  
> +EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
> +
>  FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
>  
>  PACKAGECONFIG:append = " proprietary-codecs"
> @@ -9,4 +11,17 @@ SRC_URI:append = " \
>                    file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
>                    file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
>                    file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
> +                  file://force-h264-youtube/force_h264.js \
> +                  file://force-h264-youtube/manifest.json \
>                    "
> +
> +do_install:append() {
> +    install -d ${D}${EXTENSION_DIR}
> +    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
> +                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
> +                    ${D}${EXTENSION_DIR}/
> +    sed -i 's|--ozone-platform=wayland"|--ozone-platform=wayland --load-extension=${EXTENSION_DIR}"|' \
> +            ${D}/usr/lib/chromium/chromium-wrapper
> +}
> +
> +FILES:${PN}:append = " ${EXTENSION_DIR}"
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> new file mode 100644
> index 00000000..5e942321
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> @@ -0,0 +1,4 @@
> +(function() {
> +    var orig = MediaSource.isTypeSupported.bind(MediaSource);
> +    MediaSource.isTypeSupported = function(t) { return /vp8|vp09?|av01/i.test(t) ? false : orig(t); };
> +})();
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> new file mode 100644
> index 00000000..fc69be22
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> @@ -0,0 +1,19 @@
> +{
> +  "manifest_version": 3,
> +  "name": "Force H.264",
> +  "version": "1.0.0",
> +  "description": "Lightweight extension that forces YouTube to play H.264 (avc1) by blocking VP8, VP9, and AV1",
> +  "content_scripts": [
> +    {
> +      "matches": [
> +        "*://*.youtube.com/*",
> +        "*://*.youtube-nocookie.com/*",
> +        "*://*.youtu.be/*"
> +      ],
> +      "js": ["force_h264.js"],
> +      "run_at": "document_start",
> +      "world": "MAIN",
> +      "all_frames": true
> +    }
> +  ]
> +}

--- 
-- Yogesh Hegde


