Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B74105A59A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:09:40 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20852.1773320980050591806
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 06:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=QtXDhr+i;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.25, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEWa2I9ZkPYvmkjj78uxEHAWSfPSyVC4AUISgSHrZdH3pRpO/Vroe5B0KkqrowbniOti6r24I8GS+1H1ZGVMnPr9ntcjG/Hc9VNou0U4pSMrz+AB4mwR8OoR7gRKUPsRfWRmEAKG0d1Opa1SuFNbuB4oGIEgcaXpsHybw2m3PPSDaNeHuNJTVL8ug9sahi8NfDDyMfcykD2/uytOmGDB4Cvfk02u05KX0UimUNjzvhpnH4eLf+WH4667baeN8NWb5dOPzNOnqwEVeUSUJsLPHcSKBQFv7jEmus93KQOCi47jVlxFaUQbDeArOtaW3gCoU8KO96RNTwzJgHVG2I3zFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBe4qC7/4V8z3fdw1h6KkoIt/nkg5ySY3pyZG/z3m0U=;
 b=iYSNwoqF/n+DcvhNKsp9saKdVzqvdjkErtUTS06o9tg0qpJb9NTFWuiPY4yuectDaqPd0zjm9h9oVANs78mqV7+DqtMqxHpLxs8NPXWjcru+HSsly1jWawFMVY727SAHnzoKcfawfzRg/+3Aai8YwjStM/mHim5jl7aaneIGTfdmAX3g7NOiR3Tk1TSSP+I/7VOuoIgpsHKU4y77WcGC6jH/4fhPxuJxgb58EBUHF5T9z0a/vi2XpJpMj549S4KCe3Jn4jSWMXjdTgMDoOCA5dhGy7qTggufPjPbGMQTTVVOzOXDvRVU5+is55pmcBSGxmhab2/+ERYmWOr/8yZj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBe4qC7/4V8z3fdw1h6KkoIt/nkg5ySY3pyZG/z3m0U=;
 b=QtXDhr+iZeYkae2c32gUdHP3ZojMH9QoYQeMkdjyJ95UmldDBjSm69w07e4GBiiGQACOBIX4326PTiQjgPWBXrrveshiEjgWmRgZCqLRx4lrTVYgoAg84CesYqsdHRQo+7mO1c5x/JKjOw3j8XvUbnrQYhMRy+fuUfykhz9XTBk=
Received: from DM6PR02CA0161.namprd02.prod.outlook.com (2603:10b6:5:332::28)
 by DS4PPF20A8CDC0B.namprd10.prod.outlook.com (2603:10b6:f:fc00::d10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 12 Mar
 2026 13:09:37 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::73) by DM6PR02CA0161.outlook.office365.com
 (2603:10b6:5:332::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 13:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 13:09:36 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 08:09:35 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 08:09:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 08:09:35 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CD9TgO2352409;
	Thu, 12 Mar 2026 08:09:33 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 1/1] nnstreamer: Move test binaries to main package
Date: Thu, 12 Mar 2026 18:39:28 +0530
Message-ID: <20260312130928.889341-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312130928.889341-1-p-deshmukh@ti.com>
References: <20260312130928.889341-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|DS4PPF20A8CDC0B:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dabfc1c-b8fc-46f9-313c-08de80389c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|56012099003|18002099003|7142099003;
X-Microsoft-Antispam-Message-Info: 
	zRmLB4b0/sc3B6dauE0PLG21qimdCE9hxgekXUMFOCg3SWRz+ZIRH8jWEnipEJOue/IlDLai9cpG8oA9BTo9QmsZFXuegUVOQ+SM5hsK66zr0CNPxnCJ0ewp4UtvyhuoJ0Ii5pFiT5z3YGkBu3+rrzmSi8rVKkzMVBFkrDJYN1zPeuQhruGTvxws/wadIB6juDKc+naPZtkONkIDw5Of5HG2Lag/q3dMgi7CrPH+GAQrr9CxivtKzU4g2LI5cao43aFffZ9ZXFjZTc2JBH3xkh4HeBkXR/HTxDZnXCV8Gjfk76cx4lAyZ7Gq8RIDakGjSwIVTj1cmXhbhfV3FQScOwuX7t/EFo7R7ktd4O5dphAXXoxyO90f437y8ny0yxuZtizGZBH/TRV9tbM/O2JhkAUbrS216zUtDyIuOoOF3b+abJ1OvIJKuoCSHFEBeDz3EXO65cD9V34bbeEZd7DqFThYaumZ9J5Ap48BVbzpdLnYN8bNNbDgG4dk8ONDRa+0Jk7pdbecnMbXqJdBEU3zdelhkx4Yy5eNwnZtYf4x+9sMzrkaijNg6pPZH3+SYYqItBw3hoJsXLLvJ99TyAdEIbBSSFO/f8+ZrkND1fRhF1aI8KWessr++5RAPB6Jso3ryZg8LoA8mbrLYFa2xvPJuUmlp3pL5jAr04Fd2Q9rlCBwod3pi2fojGAs90KKutWtHT3qUCHs8MjwSoDLVit182FaerlK9TUnWoXoDE0AXNwTgFMfE25QU6M4XHgggBW0qxQNUO2z7YVpG7X0GEaGlg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(56012099003)(18002099003)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	j6hBa7fQLf7qTsLLVLNIJhr3Ct4dO6PwEz3FPET2y8HGRB4NJ32gV2OVYwlM3WPEqbvs+a7owyetuzdmwg/CrsvuFlAd5zqBuwtzQ9s+E+/g3NXbtsT6pHcOPIwNSgJ9vOHwXINDLjsa8e5ExlYeJ/y7RAq3aVcdWJjI6uwvue3QUwQmGONy0htfCMhno/tgxoGBFXCxFl3/z8WvZDWnAm9vk2S79+WqBRryqJUOAPvOhPbcMA75sHLzOAICtuO1OD5FV+vs3qpW3nyqnMmjQ7wqd8mb082gQw4vUlhAo6wF0hlbNkLjd6BFmJvs5aELovg2f/JwJMi80nwV017MbdSqatCGEWcD8DdTDnktbH59eIa2tCOQdMV8TGM1zIkbGnjfwtjk/ePTHnsmw+OPb5mlllRabikmL47MZMzwwYPwu3ejcNKHiegT3s25m1hr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:09:36.3116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dabfc1c-b8fc-46f9-313c-08de80389c6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF20A8CDC0B
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 13:09:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17316

Consolidate unittest executables into main nnstreamer
package instead of separate nnstreamer- tests package to
fix missing benchmark utilities.

This resolves file packaging conflicts and ensures
unittest_filter_onnxruntime is available for ONNX
Runtime benchmarking without additional dependencies.

Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 2.4.4=
 -> 2.6.0")

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:
 v2 -> v3:
 - Fix runitme dependencies issue for unittest_filter_onnxruntime.
 - Upgrade recipe to make it QA compliant.
 v1 -> v2:
 - Added fix commit hash in the commit message.

 ...ute-build-paths-from-generated-test-.patch | 42 +++++++++++++++++++
 .../nnstreamer/nnstreamer_2.6.0.bb            | 15 +++----
 2 files changed, 48 insertions(+), 9 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/nnstreamer/nnstrea=
mer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/000=
1-fix-Remove-absolute-build-paths-from-generated-test-.patch b/meta-arago-e=
xtras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Remove-absolute-bui=
ld-paths-from-generated-test-.patch
new file mode 100644
index 00000000..345b3eb2
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-R=
emove-absolute-build-paths-from-generated-test-.patch
@@ -0,0 +1,42 @@
+From a5f962b51431ac19c264b8b9baa78ff283a77efe Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Tue, 10 Mar 2026 15:23:05 +0530
+Subject: [PATCH] fix: Remove absolute build paths from generated test file=
s
+
+Replace meson.build_root() with relative paths in custom_filter_path
+to prevent Yocto buildpaths QA errors. The generated unittest files
+were embedding absolute build directory paths (e.g., /tmp/work/...)
+as string literals, which Yocto's QA system correctly flags as a
+build reproducibility issue.
+
+The runtime code already handles proper path resolution using
+NNSTREAMER_SOURCE_ROOT_PATH environment variable or relative
+fallbacks, so this change maintains full functionality
+while eliminating embedded build paths.
+
+Fixes: QA Issue "contains reference to TMPDIR [buildpaths]" in
+unittest_tizen_custom.cc and unittest_tizen_custom-set.cc
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ tests/nnstreamer_filter_extensions_common/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/nnstreamer_filter_extensions_common/meson.build b/tests=
/nnstreamer_filter_extensions_common/meson.build
+index ecd1878b..ba72ee20 100644
+--- a/tests/nnstreamer_filter_extensions_common/meson.build
++++ b/tests/nnstreamer_filter_extensions_common/meson.build
+@@ -9,7 +9,7 @@ tizen_apptest_deps =3D [
+ # Format for adding subplugin into extensions -
+ # [name, extension abbreviation, dependencies, model file name/folder pat=
h/file path, test name]
+ extensions =3D []
+-custom_filter_path =3D join_paths(meson.build_root(), 'tests', 'nnstreame=
r_example',
++custom_filter_path =3D join_paths('tests', 'nnstreamer_example',
+     'libnnstreamer_customfilter_passthrough.' + so_ext)
+ extensions +=3D [['custom', 'custom', nnstreamer_unittest_deps, custom_fi=
lter_path, 'custom']]
+ extensions +=3D [['custom', 'custom', nnstreamer_unittest_deps, custom_fi=
lter_path, 'custom-set']]
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6=
.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
index c62589ac..7bf64408 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
@@ -3,7 +3,11 @@ DESCRIPTION =3D "NNStreamer is a set of Gstreamer plugins =
that allow Gstreamer dev
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25e5c1949624d71896127788f1ba59=
0"
=20
-SRC_URI =3D "git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;prot=
ocol=3Dhttps"
+SRC_URI =3D " \
+	git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;protocol=3Dhttps=
 \
+	file://0001-fix-Remove-absolute-build-paths-from-generated-test-.patch \
+"
+
 SRCREV =3D "b970e9eff6bfb4e915463842422fe14bb2e53f84"
=20
 # Only compatible with armv7a, armv7ve, and aarch64
@@ -53,16 +57,9 @@ FILES:${PN} +=3D "\
 	${libdir}/gstreamer-1.0/*.so \
 	${libdir}/nnstreamer/* \
 	${sysconfdir}/nnstreamer.ini \
-"
-INSANE_SKIP:${PN} +=3D "dev-so"
-
-PACKAGES =3D+ "${PN}-tests"
-
-FILES:${PN}-tests +=3D "\
-	${libdir}/nnstreamer/customfilters/* \
 	${bindir}/unittest-nnstreamer/* \
 "
-INSANE_SKIP:${PN}-tests +=3D "buildpaths"
+INSANE_SKIP:${PN} +=3D "dev-so"
=20
 FILES:${PN}-dev =3D "\
 	${includedir}/nnstreamer/* \
--=20
2.34.1


