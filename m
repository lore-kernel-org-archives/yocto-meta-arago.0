Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1D4F47CBF
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:31:47 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52700.1772739105329767818
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 11:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=c+4yux0P;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.21, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDScFbfBQTLnVlbNPs9/PM7Zpil/+DhTQHjLovgZyo3iFcOfLci/YGm9NncvHZoTeC2zvtMp0wV2l2NjDokpTVxEd8t6XLgvytXFa/8Pemf9JKZH8dLmXWUV6vz4qczDV26byvnaSVzl5Ru9KsyTWnlZr3ferdcJztzAVyXw+xIO5c9DeV5Bpx0DoNxIfVJzdCj74YHYlWPjUkCEZm3v0KRRDbYqJ7gJF41C2EjCRhu72+5exmVdPU8/eYHeBgFGC2br4z5+50Nsd4xoPvTYjNYXieGL+mhMifCs4jvuPiSe+QkRpyGfta+8Vb2yg0Fo7/e7IEZwzPvg0mFSS2twUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PLkWRvq7YQFybYkBhTMsAyAi3tDBpAxAw+CNGS+0R4=;
 b=HfMyPjJe3K+lcougtc2KV1VBwLJibBlHlKhEeaRorQm6uK6+Fm/t1PfWyD3FWvhRIZc+5t4knf7tdtQsC+ljLrGwOSGCcyUDElTf368AhiC/lJD74OhukEOJwxZfByafy8PtGSUICk9/HeplubHj827gmTxxn2sRgrTkJzxHmpEGXWWPXToDxf+WGPPZs5WyvH1SpdAM3vArP7P52MtPuP5zGMUzGSxF81FDZCIcr0fzHaYXBng8q7c5KffSgPiR4m3Uhj/XLUL0ghPuaHm08y+qEWZdUbeZFbhOqNfaN7LS7CEYpmgPiH0q+JzSJU3MybdsS8abOr34pJv3lT86Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PLkWRvq7YQFybYkBhTMsAyAi3tDBpAxAw+CNGS+0R4=;
 b=c+4yux0P2N7xbZBKgeXaT2QBWzShcPv/BT0tElIp60i2C0NuYn6Iw2lc6QZefBxhIowS/nd9odYKoRGjI7dACjL4/mXYL6Kveu/fXp+Qd2EEXCWOkDgCjvUDFTQwsZ9YBqja/HAVCyt3/lNkHo1ipJN+WrELejOYutJq6GVAgDU=
Received: from SJ0PR05CA0113.namprd05.prod.outlook.com (2603:10b6:a03:334::28)
 by SJ0PR10MB5801.namprd10.prod.outlook.com (2603:10b6:a03:423::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:31:40 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::e6) by SJ0PR05CA0113.outlook.office365.com
 (2603:10b6:a03:334::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:31:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:31:40 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:31:38 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:31:38 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:31:38 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JVQ322427052;
	Thu, 5 Mar 2026 13:31:36 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 3/4] tensorflow-lite: upgrade 2.18.0 -> 2.20.0
Date: Fri, 6 Mar 2026 01:01:24 +0530
Message-ID: <20260305193125.2045659-4-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305193125.2045659-1-p-deshmukh@ti.com>
References: <20260305193125.2045659-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|SJ0PR10MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: d55cc041-93b0-4562-b330-08de7aedd343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|34020700016|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	jpIbV7buD1MkrwYvTS/tZMnedp+EGhKbaTpiLuqr7Z2Xe95/YZajpZ8czOeqU5Z/3xqTwHU5izAnIUvFFqjSfOHCsheZGiuvl3EgjGq8k05fB3avnosJ8U4BAWJanJM+1p7leksBfo08cBBe3wxJmEYMGBZCfnkSJSnB5bS75CiLqMiSdXVCqi+dUYA2hjn8J0t4gTTZTRQy1mxP6zLyomGoZuKv2NOOBC3yJtXVsE6A/n3GmJ5fdvBYjyUwfBWf+SJE4y/FpUv0iVJTrefmMXPeKoTc6iYPQSEVpAWhyv6eHBT8kHGaWcTtf3Zmk0uEULPK1KDWgaa1XMqHFX0qWx5D0kQ4h6B7agjmXKWUVgxehkVOJLGWvHqwzoZP6nefM7L0NkxwTIqunIQv3KEjul/52PlEWNMQcbcKpGKHrp1Kggu0Ea9HrceQeELTkW/OE5e8GzhauSfCiqlkq5GT/usi70j6WnCbgueLBZhtM8HghDwmqXo3nU2zwnK1089xBEneKGBJyJ7eO1OnMFqGfTPoyI5QRQR+Hi2tk6kM5seaZudjgJi8df4yf3uT/X26O/ODusYiZxISD4Us9eWb00OWpkWqBsgJM9Mx+NF9lSLW7j0WEcTjP2lSveMZllkGhYzmRCZepIvJq74lAbrvrqo3iidZS6Yjyk7ECdQ+XYOUSxF0aDZM/IQdXMhxbjXF0CUnhZoGwpORK4u7ff69DdY5YbiHMkZzOB+jFZ/etik=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(34020700016)(376014)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	66VQRMdSmkrx+oCZ1RmXlywY+a3FVz92KXxm5yuKD2YPPNEFSxIJgXS1YjQutpbD4/46l9qPyDa/ekxSzn+TLtv4B6FOXjmLWBcY3fBYtIhQsJb84rpymjb/r3x5xuHo4w3SK8WyXz9JJwoWhEL1sK/WK4SCRnB69uuw5peTJ0r3BCfVDt9DxuvzYzSu84PCAM0cr5BGmDwWR+ZeKFiV9ceFa7yZqhD5wt9msmSsalJ7k0wsYAcneJNh6ucDua26A4NHw8g56UF1BrcmfUwPuuMQfPbSTD11I4srUs+5R88r1L1PhPhTGQelidA7kmH67kBcBIKr0NAkFbLY5lH+cOX4SP2WAqHfNDHTxQRhllqSDDEpW4NUsRehHDbwCtmrfnPEimRFYZoaIFwItoIcgFzypl5YCLNfBgstNwEvP5MLapdeFHcvyMtSpFmBpMIR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:31:40.2190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d55cc041-93b0-4562-b330-08de7aedd343
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5801
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 19:31:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17259

We are migrating Tensorflow-Lite from v2.18.0 to the
stable release v2.20.0

Key Changes:
 - Pin flatbuffers-native and protobuf-native to use the same version as
   TensorFlow Lite 2.20.0 to avoid version mismatch
 - Updated SRCREV for all the dependencies
 - Updated recipe to meet the build compatibilty

Removed Patches:
 - 0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch
   - This patch was TFLite v2.18 specific hence dropped in this version
=20
Rebased Patches:
 - Updated with new commits:
   - 0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
   - 0002-lite-Update-CMakeLists-for-building-shared-object-li.patch

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:

v2 -> v3:
 - Added Authored-by signature in relevant patches
 - Link to v2:
   - https://patchwork.yoctoproject.org/project/arago/cover/20260305173419.=
1735480-1-p-deshmukh@ti.com/

v1 -> v2:
 - Added patches with new commits
 - Fixed recipe to handle proper versioned library file
 - Link to v1:
   - https://patchwork.yoctoproject.org/project/arago/cover/20260304123221.=
1450993-1-p-deshmukh@ti.com/

 .../flatbuffers/flatbuffers-arago.inc         |  8 +++
 .../flatbuffers/flatbuffers.bbappend          |  4 ++
 .../protobuf/protobuf-arago.inc               | 18 +++++++
 .../protobuf/protobuf_%.bbappend              |  5 ++
 ...0001-Update-CMakeLists-for-building.patch} | 20 +++----
 ...akeLists-for-building-shared-object.patch} | 54 ++++++++++++-------
 ...uild-issues-observed-in-TFlite-v2.18.patch | 35 ------------
 ...te_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} | 51 ++++++++++--------
 8 files changed, 108 insertions(+), 87 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuff=
ers-arago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuff=
ers.bbappend
 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf-ar=
ago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf_%.=
bbappend
 rename meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite=
/{0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch =3D> 0001=
-Update-CMakeLists-for-building.patch} (70%)
 rename meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite=
/{0002-lite-Update-CMakeLists-for-building-shared-object-li.patch =3D> 0002=
-Update-CMakeLists-for-building-shared-object.patch} (49%)
 delete mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patc=
h
 rename meta-arago-extras/recipes-framework/tensorflow-lite/{tensorflow-lit=
e_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} (84%)

diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-ara=
go.inc b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.i=
nc
new file mode 100644
index 00000000..d85efc8b
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
@@ -0,0 +1,8 @@
+# Pin flatbuffers-native to use the same version as TensorFlow Lite 2.20.0
+# to avoid version mismatch errors
+
+# Override version to match
+PV =3D "24.3.25"
+
+# Use specific commit hash that corresponds to v24.3.25 tag
+SRCREV =3D "595bf0007ab1929570c7671f091313c8fc20644e"
diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bba=
ppend b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
new file mode 100644
index 00000000..2a627698
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
@@ -0,0 +1,4 @@
+# Conditionally include Arago-specific customizations for flatbuffers-nati=
ve
+FLATBUFFERS_ARAGO =3D ""
+FLATBUFFERS_ARAGO:arago =3D "flatbuffers-arago.inc"
+require ${FLATBUFFERS_ARAGO}
diff --git a/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc=
 b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
new file mode 100644
index 00000000..489b1444
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
@@ -0,0 +1,18 @@
+# Pin protobuf-native to use the same version as TensorFlow Lite 2.20.0
+# to avoid version mismatch errors
+
+# Override version to match
+PV =3D "3.21.9"
+
+# Use specific commit hash that corresponds to v24.3.25 tag
+SRCREV =3D "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
+
+# Override SRC_URI to use 3.21.x branch and remove incompatible patches
+SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3Dmain;p=
rotocol=3Dhttps \
+           file://run-ptest \
+          "=20
+
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8bda4266b \
+    file://third_party/utf8_range/LICENSE;md5=3Def460f31070fd7184bd9059de2=
e4b132 \
+"
diff --git a/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappen=
d b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
new file mode 100644
index 00000000..51c679a5
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
@@ -0,0 +1,5 @@
+# Conditionally include Arago-specific customizations for flatbuffers-nati=
ve
+PROTOBUF_ARAGO =3D ""
+PROTOBUF_ARAGO:arago =3D "protobuf-arago.inc"
+
+require ${PROTOBUF_ARAGO}
diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch b/met=
a-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-Updat=
e-CMakeLists-for-building.patch
similarity index 70%
rename from meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-=
lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
rename to meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-li=
te/0001-Update-CMakeLists-for-building.patch
index 6c2b9155..308b029c 100644
--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0=
001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0=
001-Update-CMakeLists-for-building.patch
@@ -1,7 +1,7 @@
-From 050127548d7f28464cbe5dc9caa83c8023676d80 Mon Sep 17 00:00:00 2001
-From: Chirag Shilwant <c-shilwant@ti.com>
-Date: Thu, 13 Feb 2025 14:33:50 +0530
-Subject: [PATCH 1/3] lite: Update CMakeLists for building
+From b730b1086d715048f6e00c65dc6777f635df0428 Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Thu, 5 Mar 2026 19:19:20 +0530
+Subject: [PATCH 1/2] Update CMakeLists for building=20
  _pywrap_tensorflow_interpreter_wrapper
=20
 - Update the CMakeLists.txt file for TensorFlow Lite to include the paths =
for
@@ -13,16 +13,17 @@ target that relies on these dependencies.
=20
 Upstream-Status: Inappropriate [configuration]
=20
-Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
+Authored-by: Chirag Shilwant <c-shilwant@ti.com>
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
 ---
  tensorflow/lite/CMakeLists.txt | 3 +++
  1 file changed, 3 insertions(+)
=20
 diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt
-index bce9627fbd3..b7bb39869b5 100644
+index 3198ec61..63801efb 100644
 --- a/tensorflow/lite/CMakeLists.txt
 +++ b/tensorflow/lite/CMakeLists.txt
-@@ -810,6 +810,9 @@ set_target_properties(_pywrap_tensorflow_interpreter_w=
rapper PROPERTIES PREFIX "
+@@ -827,6 +827,9 @@ set_target_properties(_pywrap_tensorflow_interpreter_w=
rapper PROPERTIES PREFIX "
  target_include_directories(_pywrap_tensorflow_interpreter_wrapper
    PUBLIC
      ${TENSORFLOW_SOURCE_DIR}
@@ -30,7 +31,8 @@ index bce9627fbd3..b7bb39869b5 100644
 +    ${NUMPY_TARGET_INCLUDE}
 +    ${PYBIND11_TARGET_INCLUDE}
  )
-
+=20
  target_link_libraries(_pywrap_tensorflow_interpreter_wrapper
---
+--=20
 2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch b/met=
a-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0002-Updat=
e-CMakeLists-for-building-shared-object.patch
similarity index 49%
rename from meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-=
lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
rename to meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-li=
te/0002-Update-CMakeLists-for-building-shared-object.patch
index 3450cf81..d1412cfa 100644
--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0=
002-lite-Update-CMakeLists-for-building-shared-object-li.patch
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0=
002-Update-CMakeLists-for-building-shared-object.patch
@@ -1,8 +1,7 @@
-From 339b5a7e5f17a60df1e3d6d2ffe607786ce34978 Mon Sep 17 00:00:00 2001
-From: Chirag Shilwant <c-shilwant@ti.com>
-Date: Thu, 13 Feb 2025 14:38:01 +0530
-Subject: [PATCH 2/3] lite: Update CMakeLists for building shared object
- library
+From 799d46ca08223b6f936093a790d510e9247249ae Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Thu, 5 Mar 2026 19:41:36 +0530
+Subject: [PATCH 2/2] Update CMakeLists for building shared object library
=20
 - When building TFLite with CMake, it builds static library
 (i.e. libtensorflow-lite.a) by default which isn't self-contained
@@ -16,45 +15,60 @@ inorder to generate a shared object library (i.e. libte=
nsorflow-lite.so)
 it ensures that the properties are set correctly to manage the shared
 object version.
=20
+- Implements conditional versioning using TF_MAJOR_VERSION, TF_MINOR_VERSI=
ON,
+and TF_PATCH_VERSION variables passed from the build system, replacing
+the previous approach that used undefined TFLITE_VERSION_MAJOR variable
+which caused malformed SONAME generation (libtensorflow-lite.so.)
+
+- The proper versioning ensures benchmark_model and other dependent binari=
es
+embed correct SONAME references for successful dynamic linking at runtime.
+
 [1]: https://ai.google.dev/edge/litert/build/cmake#step_5_build_litert
=20
 Upstream-Status: Inappropriate [enable feature]
=20
-Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
+Authored-by: Chirag Shilwant <c-shilwant@ti.com>
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
 ---
- tensorflow/lite/CMakeLists.txt | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
+ tensorflow/lite/CMakeLists.txt | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
=20
 diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt
-index b7bb39869b5..92b05e42446 100644
+index 63801efb..7e0004ef 100644
 --- a/tensorflow/lite/CMakeLists.txt
 +++ b/tensorflow/lite/CMakeLists.txt
-@@ -671,6 +671,7 @@ set(_ALL_TFLITE_SRCS
+@@ -684,6 +684,7 @@ set(_ALL_TFLITE_SRCS
    ${TFLITE_SOURCE_DIR}/kernels/internal/utils/sparsity_format_converter.c=
c
    ${TFLITE_SOURCE_DIR}/schema/conversion_metadata_generated.h
    ${TFLITE_SOURCE_DIR}/schema/schema_generated.h
 +  ${TFLITE_SOURCE_DIR}/schema/schema_conversion_utils.h
-   ${TF_SOURCE_DIR}/compiler/mlir/lite/schema/schema_utils.cc
-   ${TF_SOURCE_DIR}/compiler/mlir/lite/schema/schema_generated.h
-   ${TF_SOURCE_DIR}/compiler/mlir/lite/schema/conversion_metadata_generate=
d.h
-@@ -697,7 +698,7 @@ else()
+   ${TFLITE_SRCS}
+   ${TF_SOURCE_DIR}/compiler/mlir/lite/allocation.cc
+   ${TF_SOURCE_DIR}/compiler/mlir/lite/allocation.h
+@@ -714,7 +715,7 @@ else()
    list(FILTER _ALL_TFLITE_SRCS EXCLUDE REGEX ".*mmap_allocation\\.cc$")
  endif()
-
+=20
 -add_library(tensorflow-lite
 +add_library(tensorflow-lite SHARED EXCLUDE_FROM_ALL
    ${_ALL_TFLITE_SRCS}
  )
  set(_ALL_TFLITE_HDRS ${_ALL_TFLITE_SRCS})
-@@ -773,6 +774,9 @@ if(TFLITE_ENABLE_INSTALL)
+@@ -790,6 +791,14 @@ if(TFLITE_ENABLE_INSTALL)
    )
  endif()
-
-+# Manage version for shared object (dynamic) library
-+set_target_properties(tensorflow-lite PROPERTIES VERSION "${TFLITE_VERSIO=
N_MAJOR}")
+=20
++# Set proper version properties for shared library
++if(DEFINED TF_MAJOR_VERSION AND DEFINED TF_MINOR_VERSION AND DEFINED TF_P=
ATCH_VERSION)
++  set_target_properties(tensorflow-lite PROPERTIES
++    VERSION "${TF_MAJOR_VERSION}.${TF_MINOR_VERSION}.${TF_PATCH_VERSION}"
++    SOVERSION "${TF_MAJOR_VERSION}"
++  )
++endif()
 +
  # The kernel tests.
  if(TFLITE_KERNEL_TEST)
    enable_testing()
---
+--=20
 2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch b/met=
a-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMake=
Lists-Fix-build-issues-observed-in-TFlite-v2.18.patch
deleted file mode 100644
index 38cbf185..00000000
--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0=
003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 577192caa67660f857f2869896d01db3611b4128 Mon Sep 17 00:00:00 2001
-From: Chirag Shilwant <c-shilwant@ti.com>
-Date: Thu, 13 Feb 2025 14:45:46 +0530
-Subject: [PATCH 3/3] CMakeLists: Fix build issues observed in TFlite v2.18
-
-- Improve regular expression for filtering neon and sse
-related sources. The improved expression avoids missing files
-in case the absolute path contains the terms neon or sse.
-
-- Fixes [1]
-
-[1]: https://github.com/tensorflow/tensorflow/issues/70730
-
-Upstream-Status: Backport from master
-
-Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
----
- tensorflow/lite/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt
-index 92b05e42446..737f754621f 100644
---- a/tensorflow/lite/CMakeLists.txt
-+++ b/tensorflow/lite/CMakeLists.txt
-@@ -605,7 +605,7 @@ populate_tflite_source_vars("kernels/internal/referenc=
e/sparse_ops"
- )
- populate_tflite_source_vars("kernels/internal/optimized/4bit"
-   TFLITE_KERNEL_INTERNAL_OPT_4BIT_SRCS
--  FILTER "(.*neon.*|.*sse.*)\\.(cc|h)"
-+  FILTER "(.*neon_.*|.*sse_.*)\\.(cc|h)"
- )
- set(TFLITE_PROFILER_SRCS
-   ${TFLITE_SOURCE_DIR}/profiling/platform_profiler.cc
---
-2.34.1
diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite_2.18.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tenso=
rflow-lite_2.20.0.bb
similarity index 84%
rename from meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-=
lite_2.18.0.bb
rename to meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-li=
te_2.20.0.bb
index c76939ac..43562303 100644
--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2=
.18.0.bb
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2=
.20.0.bb
@@ -8,18 +8,19 @@ LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4158a261ca7f2525513e31ba9c50ae9=
8"
=20
 # Get major of the PV variable
-MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
+TF_MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
+TF_MINOR =3D "${@d.getVar('PV').split('.')[1]}"
+TF_PATCH =3D "${@(d.getVar('PV').split('.') + ['0', '0'])[2]}"
=20
 SRC_URI =3D " \
-    git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=3Dr=
2.18 \
-    file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch=
 \
-    file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch=
 \
-    file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch=
 \
+    git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=3Dr=
2.20 \
+    file://0001-Update-CMakeLists-for-building.patch \
+    file://0002-Update-CMakeLists-for-building-shared-object.patch \
     file://tensorflow2-lite.pc.in \
 "
=20
 SRC_URI +=3D " \
-    git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts_2=
023_08_02;name=3Dabseil-cpp;destsuffix=3D${S}/external/abseil-cpp \
+    git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts_2=
025_01_27;name=3Dabseil-cpp;destsuffix=3D${S}/external/abseil-cpp \
     git://gitlab.com/libeigen/eigen.git;protocol=3Dhttps;branch=3Dmaster;n=
ame=3Deigen;destsuffix=3D${S}/external/eigen \
     git://github.com/google/farmhash.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Dfarmhash;destsuffix=3D${S}/external/farmhash \
     git://github.com/petewarden/OouraFFT.git;protocol=3Dhttps;branch=3Dmas=
ter;name=3Dfft2d;destsuffix=3D${S}/external/fft2d \
@@ -28,35 +29,35 @@ SRC_URI +=3D " \
     git://github.com/jax-ml/ml_dtypes.git;branch=3Dmain;protocol=3Dhttps;n=
ame=3Dml_dtypes;destsuffix=3D${S}/external/ml_dtypes \
     git://github.com/google/ruy.git;branch=3Dmaster;protocol=3Dhttps;name=
=3Druy;destsuffix=3D${S}/external/ruy \
     git://github.com/google/flatbuffers;branch=3Dmaster;protocol=3Dhttps;n=
ame=3Dflatbuffers;destsuffix=3D${S}/external/flatbuffers \
-    git://github.com/Maratyszcza/pthreadpool.git;branch=3Dmaster;protocol=
=3Dhttps;name=3Dpthreadpool-source;destsuffix=3D${S}/external/pthreadpool-s=
ource \
+    git://github.com/google/pthreadpool.git;branch=3Dmain;protocol=3Dhttps=
;name=3Dpthreadpool-source;destsuffix=3D${S}/external/pthreadpool-source \
     git://github.com/google/XNNPACK.git;branch=3Dmaster;protocol=3Dhttps;n=
ame=3Dxnnpack;destsuffix=3D${S}/external/xnnpack \
     git://github.com/Maratyszcza/FXdiv.git;branch=3Dmaster;protocol=3Dhttp=
s;name=3DFXdiv-source;destsuffix=3D${S}/external/FXdiv-source \
     git://github.com/Maratyszcza/FP16.git;branch=3Dmaster;protocol=3Dhttps=
;name=3DFP16-source;destsuffix=3D${S}/external/FP16-source \
     git://git.gitlab.arm.com/kleidi/kleidiai.git;branch=3Dmain;protocol=3D=
https;name=3Dkleidiai;destsuffix=3D${S}/external/kleidiai \
     git://github.com/Maratyszcza/psimd.git;branch=3Dmaster;protocol=3Dhttp=
s;name=3Dpsimd;destsuffix=3D${S}/external/psimd \
-    git://github.com/protocolbuffers/protobuf.git;branch=3D25.x;protocol=
=3Dhttps;name=3Dprotobuf;destsuffix=3D${S}/external/protobuf \
+    git://github.com/protocolbuffers/protobuf.git;branch=3Dmain;protocol=
=3Dhttps;name=3Dprotobuf;destsuffix=3D${S}/external/protobuf \
 "
=20
 SRCREV_FORMAT =3D "default"
=20
 # Matches v${PV} tag
-SRCREV =3D "6550e4bd80223cdb8be6c3afd1f81e86a4d433c3"
-SRCREV_abseil-cpp =3D "fb3621f4f897824c0dbe0615fa94543df6192f30"
+SRCREV =3D "72fbba3d20f4616d7312b5e2b7f79daf6e82f2fa"
+SRCREV_abseil-cpp =3D "d9e4955c65cd4367dd6bf46f4ccb8cd3d100540b"
 SRCREV_eigen =3D "33d0937c6bdf5ec999939fb17f2a553183d14a74"
 SRCREV_farmhash =3D "0d859a811870d10f53a594927d0d0b97573ad06d"
 SRCREV_fft2d =3D "c6fd2dd6d21397baa6653139d31d84540d5449a2"
 SRCREV_gemmlowp =3D "16e8662c34917be0065110bfcd9cc27d30f52fdf"
-SRCREV_cpuinfo =3D "b73ae6ce38d5dd0b7fe46dbe0a4b5f4bab91c7ea"
+SRCREV_cpuinfo =3D "de0ce7c7251372892e53ce9bc891750d2c9a4fd8"
 SRCREV_ml_dtypes =3D "24084d9ed2c3d45bf83b7a9bff833aa185bf9172"
 SRCREV_ruy =3D "3286a34cc8de6149ac6844107dfdffac91531e72"
 SRCREV_flatbuffers =3D "e6463926479bd6b330cbcf673f7e917803fd5831"
-SRCREV_pthreadpool-source =3D "4fe0e1e183925bf8cfa6aae24237e724a96479b8"
-SRCREV_xnnpack =3D "6b83f69d4938da4dc9ad63c00bd13e9695659a51"
+SRCREV_pthreadpool-source =3D "c2ba5c50bb58d1397b693740cf75fad836a0d1bf"
+SRCREV_xnnpack =3D "585e73e63cb35c8a416c83a48ca9ab79f7f7d45e"
 SRCREV_FXdiv-source =3D "63058eff77e11aa15bf531df5dd34395ec3017c8"
-SRCREV_FP16-source =3D "0a92994d729ff76a58f692d3028ca1b64b145d91"
-SRCREV_kleidiai =3D "cddf991af5de49fd34949fa39690e4e906e04074"
+SRCREV_FP16-source =3D "4dfe081cf6bcd15db339cf2680b9281b8451eeb3"
+SRCREV_kleidiai =3D "dc69e899945c412a8ce39ccafd25139f743c60b1"
 SRCREV_psimd =3D "072586a71b55b7f8c584153d223e95687148a900"
-SRCREV_protobuf =3D "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
+SRCREV_protobuf =3D "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
=20
 inherit setuptools3 cmake
=20
@@ -91,7 +92,7 @@ OECMAKE_SOURCEPATH =3D "${S}/tensorflow/lite"
 # to further optimize the build for production use.
 # Hence, activate -O3 optimization and disable debug symbols.
 OECMAKE_C_FLAGS_RELEASE =3D "-O3 -DNDEBUG"
-OECMAKE_CXX_FLAGS_RELEASE =3D "-O3 -DNDEBUG -flax-vector-conversions"
+OECMAKE_CXX_FLAGS_RELEASE =3D "-O3 -DNDEBUG -flax-vector-conversions -DTF_=
MAJOR_VERSION=3D${TF_MAJOR} -DTF_MINOR_VERSION=3D${TF_MINOR} -DTF_PATCH_VER=
SION=3D${TF_PATCH} -DTF_VERSION_SUFFIX=3D\"\""
=20
 OECMAKE_C_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-a -mfpu=3Dneon"
 OECMAKE_CXX_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-a -mfpu=3Dneon"
@@ -112,9 +113,8 @@ EXTRA_OECMAKE:append =3D " \
     -DCMAKE_SYSTEM_PROCESSOR=3D${TENSORFLOW_TARGET_ARCH} \
     -DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON \
     -DPYTHON_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${includedir}/${PYTHON_DIR}=
 \
-    -DNUMPY_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/n=
umpy/core/include \
+    -DNUMPY_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/n=
umpy/_core/include \
     -DPYBIND11_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR=
}/pybind11/include \
-    -DTFLITE_VERSION_MAJOR=3D${MAJOR}  \
     -DTFLITE_HOST_TOOLS_DIR=3D${STAGING_BINDIR_NATIVE} \
     -DPTHREADPOOL_SOURCE_DIR=3D${S}/external/pthreadpool-source \
     -DFXDIV_SOURCE_DIR=3D${S}/external/FXdiv-source \
@@ -122,6 +122,11 @@ EXTRA_OECMAKE:append =3D " \
     -DCPUINFO_SOURCE_DIR=3D${S}/external/cpuinfo \
     -DKLEIDIAI_SOURCE_DIR=3D${S}/external/kleidiai \
     -DPSIMD_SOURCE_DIR=3D${S}/external/psimd \
+    -DCMAKE_CXX_STANDARD=3D17 \
+    -DCMAKE_CXX_STANDARD_REQUIRED=3DON \
+    -DTF_MAJOR_VERSION=3D${TF_MAJOR} \
+    -DTF_MINOR_VERSION=3D${TF_MINOR} \
+    -DTF_PATCH_VERSION=3D${TF_PATCH} \
     --compile-no-warning-as-error \
     --log-level=3DVERBOSE \
 "
@@ -143,7 +148,7 @@ do_compile:append() {
     BUILD_DIR=3D${B}
     TENSORFLOW_DIR=3D${S}
     TENSORFLOW_LITE_DIR=3D"${TENSORFLOW_DIR}/tensorflow/lite"
-    TENSORFLOW_VERSION=3D$(grep "_VERSION =3D " "${TENSORFLOW_DIR}/tensorf=
low/tools/pip_package/setup.py" | cut -d=3D -f2 | sed "s/[ '-]//g")
+    TENSORFLOW_VERSION=3D$(grep "_VERSION =3D " "${TENSORFLOW_DIR}/tensorf=
low/tools/pip_package/setup.py.tpl" | cut -d=3D -f2 | sed "s/[ '-]//g")
     mkdir -p "${B}/tflite_runtime"
     cp -r "${TENSORFLOW_LITE_DIR}/tools/pip_package/debian" \
           "${TENSORFLOW_LITE_DIR}/tools/pip_package/MANIFEST.in" \
@@ -167,9 +172,9 @@ do_compile:append() {
 do_install() {
     # Install tensorflow-lite dynamic library
     install -d ${D}${libdir}
-    install -m 0644 ${B}/libtensorflow-lite.so.${MAJOR} ${D}${libdir}/libt=
ensorflow-lite.so.${PV}
+    install -m 0644 ${B}/libtensorflow-lite.so.${TF_MAJOR} ${D}${libdir}/l=
ibtensorflow-lite.so.${PV}
=20
-    ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so=
.${MAJOR}
+    ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so=
.${TF_MAJOR}
     ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so
=20
     # armnn expects the the dynamic library of tensorflow lite to be named=
 as "libtensorflowlite.so"
@@ -197,7 +202,7 @@ do_install() {
=20
     # Install pkgconfig file required for NNstreamer build
     install -d ${D}${libdir}/pkgconfig
-    install -m 0644 ${WORKDIR}/tensorflow2-lite.pc.in ${D}${libdir}/pkgcon=
fig/tensorflow2-lite.pc
+    install -m 0644 ${WORKDIR}/sources/tensorflow2-lite.pc.in ${D}${libdir=
}/pkgconfig/tensorflow2-lite.pc
     sed -i 's:@version@:${PV}:g
             s:@libdir@:${libdir}:g
             s:@includedir@:${includedir}:g' \
--=20
2.34.1


