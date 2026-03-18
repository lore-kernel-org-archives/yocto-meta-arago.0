Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25648FCD0DD
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:30:38 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9252.1773822628082240445
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 01:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=v7e/naWu;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.36, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qryLSF14fmC3bZgTz2Ba1Y62TnOdFAyiN/6rZyC+Sy7CQbYGZGRIQjgIXLkXR+li+4V85xO66fSoPokfZaJyJr7wI2fH/SWAoyLjK8+FLVkk2KQ4lh8BEkIVwWQo7/AVIYG1lqmHVgZFgLDP+AmcXJXeJDkZNtBA5YkvPePRfc8ScCoYBwWM2a8p2UApwx2n5iYyZ/ai2epKPUjFqTWE77YFfEVTZ4wXNv44qe/xPrvVn0ceu7Msq5/L+mjFysU39I2YWvSg6yD/tXEaLny+t8mulEO5wjCRo5w/Zo0vWjE6YC1G738xHM/UhyHiNbipUh/IAfll2JPgoH7+TX1vRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHXIcM+ZES5h1GTfhLrWgIu4Z2Mf0ilcV5yn3bp/4z4=;
 b=kC/koyEa0eFLtV6+bXHr8RGsMhg2Sqc4NGHasRfLI80I/X6donNDPJCJ9fA9jqxgndYyR0JkQWvQ3pYb1WmSUst6iazvBEQzq7op8I4RdnveiDjF7vUrgkHRLUbPTZFvlaiJua3moa3vJgDfmG3rC77nIiDyfblrGUuycR9vMVukHh37nURTmxEhvS0XXZGS17Swfnxo0QNkXo6KbN/Fzf6E1JTDXz6jsTxG3uufN6NxAY4IFvLTTa2XbATChoB99b7wKSXzjz0Oz/9AvwZ1FzddtttvwOuvfEoLP50YXApLV61bwPMC4bzwypww53p7Yg7Bg72VmWgSC9w0Rgfbuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHXIcM+ZES5h1GTfhLrWgIu4Z2Mf0ilcV5yn3bp/4z4=;
 b=v7e/naWuDG4MblX+hECXtasPGnlo30tLuac7eXS7vP4ljmxvAVeyzwtwui4UwAnVfsrTE/mhDO3x5ONKg3YU1ft6UXTP34nlThhlRW1ZUcbOgnCR1gFFJR5A+832O54WFa6yhlnI7DUjVJ4JV2+cMpnm0xi/xb69Wwg6/Syo2zY=
Received: from CH0P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::20)
 by IA0PR10MB6819.namprd10.prod.outlook.com (2603:10b6:208:438::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Wed, 18 Mar
 2026 08:30:25 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::11) by CH0P223CA0010.outlook.office365.com
 (2603:10b6:610:116::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 08:30:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 08:30:24 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 03:30:23 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 03:30:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 03:30:23 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62I8UH1V025981;
	Wed, 18 Mar 2026 03:30:21 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v5 1/2] nnstreamer: fix buildpaths QA issues
Date: Wed, 18 Mar 2026 14:00:14 +0530
Message-ID: <20260318083015.2295406-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318083015.2295406-1-p-deshmukh@ti.com>
References: <20260318083015.2295406-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|IA0PR10MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 2089d036-7ca1-474d-8d81-08de84c89a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	oiO8dcQmlL1RGd9O8aWtq/xMALKN0gDlpw9zk2nLc1Y/vkOrYaS7M3IVLvR4FoBeW/GmZc0jMhEnyEk/2GyZ06FvjHFVp44Y/Lh3D+1dQGbxwvkxsYTTUN5bUpZ0+67tpPAmOSTS3WZiMmiyJeENBZ+9DHBd9dhChN3gLu1zClDr+GjjLd129dTOHfoZVzbWIJ1ar1Gj4juPn0qUaZOc976reSxMHczDDZbBXfJ8txCgIhAITUkOsVf0CRtav83jSCzCCBU7su3vsGyrX1H9z+5isi6rYVhGuAboit5qAdsCyxxtkj86XDy6Stdv8n9asa5AWYpHegfiuKJ3EmSj65iBgR8x6yQHg8SlHnxEnbPnjACU+hrsn7wzc4jBcQY4pA9HqOM5Z/PQgwFjjU73mmKKeCYylTs1TS/XxL1P//gmdjoCzLqlZkNxcfHW+3ZCZ7O6xTmVBBA3rEAp6KGNOztcnNKQgp4WQ7OU88FoWeVMdKBx9aNQnnH8L5qNQkdVipGGV6HpV5gjvrv0JBQiotuOKOf7/RweVBrGVT77uW2TxIykW7GLXsS+2b5sAxJUNfoPjshTQ/iMbcxtD71hoAusOZuPqAhUCxVaokp/BpRZm876Z62HQQRDCIGUCid320D3XMO+I6CfDmUMVfCKc5OIfNsAbDFZvNr5dylUwM/q3ljaV+LDumuPHI89PmhE7p4hA+Oa3s+oOJqVMlY2AbyqhxzmfyJci4hKbnLTgyfcsURFlnZNMMUF6n0vlNIh+xGfZEUIneJ+TgsrLXoZ4Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LrCtT29UBZcxgvH8cJaq043LzlOgq5yzPhOqDKhAiRrjD82bOY/VgKRMxzqWWJFdxgmnEgHS6DHVfmvnM2WAVZ4B0ERHRDUftMetvd0V/yyQn/8mb8ccVWFSyyViMbcczww2PiYGVpbpjznTsd3SkU7ysSvSEVWrAz9XO8ZDJ1xZtveDxSxStVaiymyyi819+iySv0x/QDgFV8L6pdl9prn77g35Wr52jz337U+PAUnarIAdPt5uqujzLIbTw/cZs8/EL0LcUqIeTA9ZQ1l0DXaSQuU9Zee21uCUc6KWqrOgq3GONIkaHwbGhOLh9/R6Oe6vpvu+2x76r+0cFYcrvUhevGIbVVPvHozmFY7NzbRFM0LanxI2SYas0JOzyMkXW1erjJvd6k/Kv3l8XXgD6rA0TyGuZjfHC9HZ55bevHAgYuofacCpxFEEYTo4o9Yl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:30:24.4974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2089d036-7ca1-474d-8d81-08de84c89a0a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6819
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Mar 2026 08:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17396

Include buildpaths compliance patch that replaces
absolute build paths(meson.build_root()) with relative
paths in generated unittest files, resolving QA errors
"contains reference to TMPDIR [buildpaths]" in unittest_tizen_custom.cc
and unittest_tizen_custom-set.cc.

Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 2.4.4=
 -> 2.6.0")

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:
 v4 -> v5:
 - Split buildpaths fix and dependency changes into separate commits for
   better review and maintenance
 - Establish proper dependency directions where test components depend on=20
   core functionality for testing
 v3 -> v4:
 - Use RDEPENDS approach instead of package consolidation to maintain
   clean separation between runtime and test components.
 v2 -> v3:
 - Fix runitme dependencies issue for unittest_filter_onnxruntime.
 - Upgrade recipe to make it QA compliant.
 v1 -> v2:
 - Added fix commit hash in the commit message.

 ...ute-build-paths-from-generated-test-.patch | 42 +++++++++++++++++++
 .../nnstreamer/nnstreamer_2.6.0.bb            |  7 +++-
 2 files changed, 47 insertions(+), 2 deletions(-)
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
index c62589ac..0fd5cac9 100644
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
@@ -62,7 +66,6 @@ FILES:${PN}-tests +=3D "\
 	${libdir}/nnstreamer/customfilters/* \
 	${bindir}/unittest-nnstreamer/* \
 "
-INSANE_SKIP:${PN}-tests +=3D "buildpaths"
=20
 FILES:${PN}-dev =3D "\
 	${includedir}/nnstreamer/* \
--=20
2.34.1


