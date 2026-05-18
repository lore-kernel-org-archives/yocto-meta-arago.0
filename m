Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962CACD343F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 21:08:06 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7768.1779138485341281785
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 18 May 2026 14:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kzhawssB;
 spf=pass (domain: ti.com, ip: 40.107.200.36, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkFAT/XPQX490TApAIENkvCmMgZwC/6uwAJyZOpaNkGOFF6Se9+FVbE/Vq6OA/S2U0KXsWG7hbJ6fLLLaMTVT9AkxHX0bYAJ9rrNgGl3NgWrEJPXHS+i381DgcOoTbc2k8U+68IqXEsNJa50bZg10eGquOcI73gDhW/xDd785REIaDylT4Xiry2QzZPKZCx4Ee1g1oijrhme1eLAFT4Ve+YRWBld4YB0mDeov25h6ic2e2wkVW9Pp4Sra08TdX08isE8TRposZRKN2OuK+Oz3IGquQZzn72tRow8KSzMakX/qKeQ+QcRPB6x2MLLljMLA+rHzEr+4W+ztO3lizmmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF3HviB7W1xOWpVrdEJeWTis2SHu7w9I6i18j3m6aIg=;
 b=VKZpjVamfqUFAHIH7hCuzydeCbV+SXbPnl6kImuTcKPVOHWeSw5V/BhGV/egfnlfdKRlkPDxs7//cjk9IYNKVhRWQMTXYvwUgFlA2liblIvSKfb0Ft1oyJLsM8oNK5H+BY61dVpos7ZMJlCpGpRbDOo006pbbdizbn12sJS6ZmnC7k6rZRCouo0xjfUID+kX3R+VFTBf3eOAkJ6lWwNIu6keROqQ+J14BfFOfPHo7YjfocP00T/JSeGHncB/4ETbuyC1JhcfBVu+YqAGHoGRq7l9FCARd3ndDLcxs/isvUweLDCUL40m9Iyyb+E6f20RNMNaWs+UwYNbqIyfwlG/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF3HviB7W1xOWpVrdEJeWTis2SHu7w9I6i18j3m6aIg=;
 b=kzhawssB+yVb8a5T2TGt3Y6uXnohG4qVyEPFZ1oG5baHku8sHRk1Bdc/1CTmEjSnYjdubHDZ1qF4bfybbs3WB1ZRxJ0EdqOz4Qxv42WBkijAmyaM6QPB8ouY5upEfISX1dphuGFM9MC269XFfLVW6zX5ijotx8/xVhU4mdW0WnE=
Received: from DS7PR07CA0010.namprd07.prod.outlook.com (2603:10b6:5:3af::29)
 by IA4PR10MB8279.namprd10.prod.outlook.com (2603:10b6:208:55f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 21:08:02 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:5:3af:cafe::f8) by DS7PR07CA0010.outlook.office365.com
 (2603:10b6:5:3af::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 21:08:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 21:08:00 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 16:08:00 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 16:07:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 18 May 2026 16:07:59 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64IL7xP52643517;
	Mon, 18 May 2026 16:07:59 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master/wrynose][PATCH] chromium: Upgrade to v148.0.7778.167
Date: Mon, 18 May 2026 16:07:46 -0500
Message-ID: <20260518210746.1595618-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|IA4PR10MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f7fb38-f93b-4fa8-0ea5-08deb5218b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|3023799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	kzEUk0lcGrKyuqQ5s9oaAqYB6+VhI8hODLoaMf89NhjuNY5ZTkd0vueXHSUFsxPpqrrxN4+2zxWHSKdne/reJsAym1pFIGkNntCQa60jh0lZEb+dkP2Ufxs6OUNmEOIS0bhASz5i5vdqeSlnh9QhmjN3S8BqfIebXb05mn0fvyfGcS1Vlku49tlp+bp/FykccgYSEe0s95FkdiUM3Fp48Bxw3GKL7xY/I/5wXTAXF9YU1dqbCTc71CeJdH6IS+fMdUeUVKFMkkBxlbIsgFSykr1ZTS2oa2Q3GkEOT7bjZdttG4+eL/IL2zOCn1RYCCHkffHZRn4RBN6fGcphH4Srd1loKeLJ3tKtBXyoOS0h8FaCg/A4IL5MsDJ6rwPD9xv/DFjcs4FneygSvGn04GRzjIET/LLBj3imT3yYT5Oin9eRdurQ38lcSNpcraA4P0uwxnBu5qanOQz4sfyC2DIE2N3xbUqhNIlc2iCTv2nuJyGGfSYXOpMnWPOlpIERf44cpmTzyd2NIkIcFaXcwdxRIU+RhjjZlNbDdHRGwjyB2CLZ6ZAOswhWHMsQ/0FcdAtWLFJqiEy8dceNAt1OhN1VZkya/7ev+XeFQ5dftCA4REbyeiZP6qrRei3NM38vztgwcYAL9FJ3xUkUKNPivEkmTVUjg8vLXr1l9wlg+XcL/2jK2AP2JDT9Cy+4m8RyXwtOFhJO1wVTs152i5N3ygpSyjAawFCQwyQDec7ZtHH4OpY=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(3023799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qpMfbj4CUBBdUhntSfB65O70zlR7mXPpYhByiPrNtBK7zGw10+jbJKEDbl8qCN3YwQ410SmBx1EO5no/+27ejIrrY/H3hkAFsCXsgtHjqUyps4B5CW+xO0PRfqNUNbrGEhAL3RN5P5UMdr4M4tYV6VmBngkjNkw8bux3sUPQwIlXx0jDNT5XZoHE0qcSsdA2w+TS4UT+tn2QQCCInZACbhz2mTe1D7FZqHyj+g3OZQF5t2iMVptDIPoRzaL0xvSjGjuFUiUnNoo2DXN30WCF5qF3nUQ/tZH2VkNo91mRC0YJiGOizBvTpbX24sEoPXdZTJDBYsbjJMJDABjG86937Hv7Pl2VkALsE7HKK6/u1ntlzbRqbpyrPF/3sMv2x1jyWFEeunJtKLnYrP7tBAzzClRxl401UWUH7hcKOx3VZj22YoHQ6T2cfAvGCa54E9NL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 21:08:00.9022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f7fb38-f93b-4fa8-0ea5-08deb5218b60
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8279
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 18 May 2026 21:08:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17528

Upgrade Chromium patches to v148.0.7778.167 to align with the version
currently used in meta-browser.

Remove the version number from the patch directory name to reduce churn for
future version upgrades.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

This patch depends on the following oe-layersetup paches:
configs/arago-master-*: Upgrade Chromium to v148
configs/arago-wrynose-*: Upgrade Chromium to v148

 .../chromium/chromium-ozone-wayland-arago.inc | 55 +------------------
 ...se-ChromeOS-style-dev-paths-for-all-.patch |  0
 ...dbox-Allow-GPU-sandbox-access-to-V4L.patch |  0
 ...2-Fix-OUTPUT-queue-streaming-in-V4L2.patch |  0
 ...void-placing-incomplete-H264-access-.patch |  0
 ...ium-ozone-wayland_148.0.7778.167.bbappend} |  0
 6 files changed, 1 insertion(+), 54 deletions(-)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
wser/chromium/{chromium-ozone-wayland-142.0.7444.175 =3D> chromium-ozone-wa=
yland}/0001-media-gpu-v4l2-Use-ChromeOS-style-dev-paths-for-all-.patch (100=
%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
wser/chromium/{chromium-ozone-wayland-142.0.7444.175 =3D> chromium-ozone-wa=
yland}/0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch (100=
%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
wser/chromium/{chromium-ozone-wayland-142.0.7444.175 =3D> chromium-ozone-wa=
yland}/0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch (100=
%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
wser/chromium/{chromium-ozone-wayland-142.0.7444.175 =3D> chromium-ozone-wa=
yland}/0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch (100=
%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
wser/chromium/{chromium-ozone-wayland_142.0.7444.175.bbappend =3D> chromium=
-ozone-wayland_148.0.7778.167.bbappend} (100%)

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dyn=
amic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-=
wayland-arago.inc
index 5b0f2703..ab092fa1 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
@@ -1,6 +1,6 @@
 PR:append =3D ".arago0"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/chromium-ozone-wayland-142.0.7444=
.175:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/chromium-ozone-wayland:"
=20
 PACKAGECONFIG:append =3D " proprietary-codecs"
=20
@@ -10,56 +10,3 @@ SRC_URI:append =3D " \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming=
-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264=
-access-.patch \
                   "
-
-# Override do_copy_clang_library to handle both target and host architectu=
res
-do_copy_clang_library() {
-    cp -r "${STAGING_LIBDIR_NATIVE}/clang/latest" "${STAGING_DIR_HOST}${no=
narch_libdir}/clang/"
-    cd "${STAGING_DIR_HOST}${nonarch_libdir}/clang" || return
-
-    # Process both target arch (aarch64) and build arch (x86_64)
-    for ARCH in "${TARGET_ARCH}" "${BUILD_ARCH}"; do
-        echo "Processing clang libraries for architecture: $ARCH"
-        target_dir=3D"latest/lib/${ARCH}-unknown-linux-gnu"
-        mkdir -p "$target_dir"
-
-        # Determine source sysroot based on architecture
-        if [ "$ARCH" =3D "${TARGET_ARCH}" ]; then
-            search_path=3D"${STAGING_LIBDIR}"
-        else
-            search_path=3D"${STAGING_LIBDIR_NATIVE}"
-        fi
-
-        # Find and copy library files from the appropriate sysroot
-        for lib_pattern in "libclang_rt.builtins-${ARCH}.a" "liborc_rt-${A=
RCH}.a"; do
-            lib_files=3D$(find "$search_path/clang" -name "$lib_pattern" 2=
>/dev/null)
-            for lib_file in $lib_files; do
-                if [ -f "$lib_file" ]; then
-                    base_name=3D$(basename "$lib_file")
-                    echo "Copying $lib_file to $target_dir/"
-                    cp "$lib_file" "$target_dir/" 2>/dev/null || true
-                fi
-            done
-        done
-
-        # Create generic names without architecture suffix
-        if [ -d "$target_dir" ]; then
-            cd "$target_dir" || continue
-            for file in libclang_rt.builtins-*.a liborc_rt-*.a; do
-                if [ -f "$file" ]; then
-                    generic_name=3D$(echo "$file" | sed -E 's/-(x86_64|aar=
ch64|arm|i686)\.a$/.a/')
-                    if [ "$file" !=3D "$generic_name" ] && [ ! -f "$generi=
c_name" ]; then
-                        cp "$file" "$generic_name" 2>/dev/null || true
-                    fi
-                fi
-            done
-            cd "${STAGING_DIR_HOST}${nonarch_libdir}/clang" || return
-        fi
-
-        # Copy to native sysroot as well
-        native_arch_path=3D"${STAGING_LIBDIR_NATIVE}/clang/latest/lib/${AR=
CH}-unknown-linux-gnu/"
-        if [ -d "$target_dir" ] && [ -n "$(ls -A "$target_dir" 2>/dev/null=
)" ]; then
-            mkdir -p "$native_arch_path"
-            cp -n "$target_dir"/* "$native_arch_path/" 2>/dev/null || true
-        fi
-    done
-}
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-142.0.7444.175/0001-media-gpu-v4l=
2-Use-ChromeOS-style-dev-paths-for-all-.patch b/meta-arago-distro/dynamic-l=
ayers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-waylan=
d/0001-media-gpu-v4l2-Use-ChromeOS-style-dev-paths-for-all-.patch
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland-142.0.7444.175/0001-media-gpu-v4l2=
-Use-ChromeOS-style-dev-paths-for-all-.patch
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland/0001-media-gpu-v4l2-Use-ChromeOS-sty=
le-dev-paths-for-all-.patch
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-142.0.7444.175/0002-chromium-gpu-=
sandbox-Allow-GPU-sandbox-access-to-V4L.patch b/meta-arago-distro/dynamic-l=
ayers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-waylan=
d/0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland-142.0.7444.175/0002-chromium-gpu-s=
andbox-Allow-GPU-sandbox-access-to-V4L.patch
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland/0002-chromium-gpu-sandbox-Allow-GPU-=
sandbox-access-to-V4L.patch
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-142.0.7444.175/0003-chromium-gpu-=
v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch b/meta-arago-distro/dynamic-l=
ayers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-waylan=
d/0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland-142.0.7444.175/0003-chromium-gpu-v=
4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland/0003-chromium-gpu-v4l2-Fix-OUTPUT-qu=
eue-streaming-in-V4L2.patch
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-142.0.7444.175/0004-media-gpu-v4l=
2-Avoid-placing-incomplete-H264-access-.patch b/meta-arago-distro/dynamic-l=
ayers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-waylan=
d/0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland-142.0.7444.175/0004-media-gpu-v4l2=
-Avoid-placing-incomplete-H264-access-.patch
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland/0004-media-gpu-v4l2-Avoid-placing-in=
complete-H264-access-.patch
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland_142.0.7444.175.bbappend b/meta-ar=
ago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/c=
hromium-ozone-wayland_148.0.7778.167.bbappend
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland_142.0.7444.175.bbappend
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland_148.0.7778.167.bbappend
--=20
2.34.1


