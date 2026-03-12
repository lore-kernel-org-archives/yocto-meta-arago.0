Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB86106ACE5
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 19:54:21 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1731.1773345258222903578
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 12:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BeoeFyqU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.33, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vY9D3qfvdYiH7WOmsPOqlPgpIqv8PHouUVdLZ4oeP5LkHNxflh1ZsiHneVMS1cXR4Lu4r6RzxEeyZh6hTzlFeIfxyHZHJ9Qd8S716fey8WCLDbB1xuJ5SmlQ6n7TXf1NzvjWvPiUaWJrATBl21wUbIEZ+X6pFQkCW35rziD0vDtBQwLeNTtSIF+mlfixrcPug5IBZ5vtppKWGUwBz7ufum59wiS+FIQEJ7psK9OSGEtGsRXG2clRCyn0b6CdTlOCWp08M6qo/8GYSev280X7hhf2DMce2lUGU+nVekNPd61fCEv9q7mDdHFU9sNHk0eABp7eYkEl8Rl5ql5pNhFpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wa4l8npzca30J/QtM05ablHdSfNhXWLvNU1QNIKeiY=;
 b=kLc7dLioZf3BNWWmxfSKqYj+T30WYhFoCEZxD5fkFq4gop60fUSJRGDFirBMQO0NjSRPgi5e6jzZwarH30Za4wxXoED7MpqCPOq0c4c1d2U5sO3fYI0IFXUN5jn7YmVtmyeW/Rqc54J2tm3H8qHMwPZfoL614XbeupcG+jYz+EkpN36vxVCvZvoye8VUhp9C/ljuj5Ol9X5i/EXhwZQR0dArIDxMOGNZ0OardfSh4PydsWoGrDyUCktBz4uYIhtbfF59rQoQuAfOtid8F+kt3Zlagfv8xnRzxSxXyGFcnTVnrJLvw3hMzkocY9+eYfRHM+HYQuP4x08WdfAsQgD0Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wa4l8npzca30J/QtM05ablHdSfNhXWLvNU1QNIKeiY=;
 b=BeoeFyqU0nlrzaXQecW5xQYC+EPZ7pcWy4CXoTIEP7LTnQ8jbWDoKMOcTmA24St2M8q1iE/ihArPZ1oa58uSbXGdvuSHOc301Snv1Sa/D5nGL3+HAYIG7mwR8P2XCg1Dm7Wvbbi9dA3A3za+t8Zn71vcHN01BkvRUCz1XehRfY8=
Received: from SJ0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:a03:39c::19)
 by PH5PR10MB997759.namprd10.prod.outlook.com (2603:10b6:510:39e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 19:54:15 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::f4) by SJ0PR03CA0344.outlook.office365.com
 (2603:10b6:a03:39c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Thu,
 12 Mar 2026 19:54:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 19:54:14 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 14:54:13 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 14:54:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 14:54:12 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CJsCOq2915899;
	Thu, 12 Mar 2026 14:54:12 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH] chromium: Remove obsolete workarounds fixed upstream
Date: Thu, 12 Mar 2026 14:54:01 -0500
Message-ID: <20260312195401.1469941-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|PH5PR10MB997759:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8b4707-86bc-4a13-1002-08de80712368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TOw8yUETziVO3iapDSnjWVV7S/8Zc0F2nQLFuFhKRtnIgbzjkx1q0EPEkEDJi9ZG9Kh9wZ7e+2pF/NAsIFlTWdd6Ot7OO88XdmnJuAYkbmQdQ1j9XXL58vfRqnhZQZOk093TerJviS2OOYSJOa9PiHrevESlljSXtaXyWLV+zt4g5T5wUoVpUQdlE3EWqbSEA+eTbqjRmuEUUgV9XiOhftkZ2sYPZsqOSmgFNYpYKyl3HLMWSA4yrsGBAfcgTZ6xle4Kmc82uu7JPexbO6GSHufpIF0cnZdoRMcWqhn6w9CuRcWS3GV1sjj1SkXrVQRBM/Y1DeY3UZHw1TAfTBlbl8gVPZQYmLk3q6T6vfJFhAC7yQgjJ6ebvb7cMj0DSF6V2LTmMYsW7RpWcnuZniRZtiylwBKc5fE5ec8aq1d13Ix2h76vDigMKpSGnh7s5IPzmroD/Zow8HlSgMJifxSDrF0H23ZONb+ywmOsIUMUH2yL5018J9oKX33pBBceNo4hZ+sl6wnvU3k57PIdcsbwtdzRQrMfzSAqYvcOqflMoaRUJAw6JrA25JZxJXFCU8cOCglv8SBuhedu1xNi+jwJs1F5Gaz/OC5laFg+5zmzUvCvCbDX/lcF1gremiMkLYzzzWVWjnZ6yEA3P4GG30sYS9RaL9kdACN4XU3fpw04NnagHiB0bsvhR+/rkbQ3ineGkPTuvjM+Ymsl6J0N8PBmmBIJbrLxBniDNGv5HfF6Vpo=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OLM/eJYT6V6VKh9Ofkasbra8OONsh6BnnR5FhxWdaLjbAVcvqQCViEcY6mSq85Bb23H+XJrh4+t8D7Mi3sknmPMgpHhmsGaLxBYGcMmR2eE69Ogi3IPagHGMMsGDewWd7wmcO/gbxs0TWPcRZWt/iQc7N4JplMNx7NTENE9qPi4MRdj66lLoqR8d/LeV1YsKdTv6FIU15k2G9o++ueiBzGYHK9D4lqEMO8GLHzl290e32cxG8pF+R9Z2bHvjGbouDTLr0m4kk5dz4m9foFN/T8NEOTDjUYFHl8XnKtLgFwNivV81ZyuTH54sAcs3M3XypDuneoCyR87wNASIWSICxbZdOHazC8yVYQmc5junf0NUxa+IJ3aY3BDpFcJ1IRLOZok5zfObkjSEnkk4wcMaIphBB2UazcGNmJOK2HS62ZjudmsxM7vPW8chmODNgZMi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:54:14.5479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8b4707-86bc-4a13-1002-08de80712368
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997759
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 19:54:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17329

Remove build workarounds that are no longer needed due to fixes in
meta-browser:
  - Rust 1.8x patch removal
  - ThinLTO linker OOM
  - pkg-config detection setup

These issues have been resolved upstream in meta-browser, so the local
changes in the bbappend can be removed.

https://github.com/OSSystems/meta-browser/pull/957
https://github.com/OSSystems/meta-browser/pull/958
https://github.com/OSSystems/meta-browser/pull/959

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../chromium/chromium-ozone-wayland-arago.inc       | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dyn=
amic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-=
wayland-arago.inc
index e2d55180..5b0f2703 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
@@ -4,9 +4,6 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/chromium-ozone-way=
land-142.0.7444.175:"
=20
 PACKAGECONFIG:append =3D " proprietary-codecs"
=20
-# Remove incompatible Rust 1.8x patch (for Rust 1.93+)
-SRC_URI:remove =3D "file://chromium-142-crabbyavif-rust18x.patch"
-
 SRC_URI:append =3D " \
                   file://0001-media-gpu-v4l2-Use-ChromeOS-style-dev-paths-=
for-all-.patch \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-acces=
s-to-V4L.patch \
@@ -14,9 +11,6 @@ SRC_URI:append =3D " \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264=
-access-.patch \
                   "
=20
-# Disable ThinLTO to prevent linker OOM crashes
-GN_ARGS +=3D " use_thin_lto=3Dfalse"
-
 # Override do_copy_clang_library to handle both target and host architectu=
res
 do_copy_clang_library() {
     cp -r "${STAGING_LIBDIR_NATIVE}/clang/latest" "${STAGING_DIR_HOST}${no=
narch_libdir}/clang/"
@@ -69,10 +63,3 @@ do_copy_clang_library() {
         fi
     done
 }
-
-# Add pkg-config setup for NSS detection
-do_configure:prepend() {
-    export PKG_CONFIG_PATH=3D"${STAGING_LIBDIR}/pkgconfig:${STAGING_DATADI=
R}/pkgconfig"
-    export PKG_CONFIG_SYSROOT_DIR=3D"${STAGING_DIR_TARGET}"
-    export PKG_CONFIG_LIBDIR=3D"${STAGING_LIBDIR}/pkgconfig"
-}

