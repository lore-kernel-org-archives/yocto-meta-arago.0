Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C46EB7EDE
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 12:32:45 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17036.1772627562018992673
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 04:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=sB3KzdhI;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.24, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sV5YXMXs3XfrPEVNAabXmxhSG56sZhr9wOYFN0bWKYXFCw969rFxQ0vQV+vQSzovlwmMpsMWT9W79EgriyQRVdZas8lEfQxbg89wOdOfOQG020bfVqQE7gYqy5MDV3uY8weCfdaDXJnFyLnxBDjFRXBCXHOROQZop1uP6J0HZ1Yl6RRmjxm0QUUqMCjz31ltmvg4/JGTkVyCyQYMT7oRbe9pSuCwVDskpWgXQltxsvZmk/aQ8/PvoGzSTHKZ7FcOwdcOQxfjTYDChxaUWolYDX+BIo+AMdY1KktLpMq4Z0SZ9W2IqNCUd8q8iyFBYaMYbwY9hgPYzwvYDMj9DtN4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcfqiYNHY5YJMaPAyDLqk7xKXE+oGqxE/mdoF3ytCK0=;
 b=QxwQIMoq0sTH8V7Iq0PTTirzejhufaFogECDHpaXbHBxYMWVA6R7putmsnv14xEEfumFZNfCCL5jFIILcoRiBf7dv9KipA0oecTilOpthptF8VUeGOQ2Ai8Oy0Yh/1zvpx9/3rVm1aKArrypbs5ohRN/ZGpL51fqAwiajCI3wpyFHykbRc00I6AXDJRbCUS4XURi9dmA/EA2to+lervQd9gdPXZt9pwc+1JP5ScSVubaJAtgKxrofpxLQh1xPyYcGQY20yleB21XIRBOVMWYY2ogOfCFFSHw40iPqHampDypfnEu32E8l2fp80eSa266CZqzZgFI+A7VjbnZGeUSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcfqiYNHY5YJMaPAyDLqk7xKXE+oGqxE/mdoF3ytCK0=;
 b=sB3KzdhIPzs7lEeZeO8iHWSHKpTSqcSqDKdss4zpUAzXuRFX5JpOoeveWP6tJ0FQB23uWjulTwWoevODsZYJcbjZuQN8stmaBFjqu7p+N0aIoHVUsqhHI/OdRELdLzr3Qs//MMm8lW/CXrwGkHtKk05nkknLfp8UydIqjKo9CZ0=
Received: from BN0PR02CA0040.namprd02.prod.outlook.com (2603:10b6:408:e5::15)
 by MN2PR10MB4304.namprd10.prod.outlook.com (2603:10b6:208:1d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 12:32:40 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:e5:cafe::ee) by BN0PR02CA0040.outlook.office365.com
 (2603:10b6:408:e5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 12:32:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 12:32:38 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 06:32:35 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 06:32:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 06:32:35 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624CWMFr4050563;
	Wed, 4 Mar 2026 06:32:33 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH 3/4] tensorflow-lite: upgrade 2.18.0 -> 2.20.0
Date: Wed, 4 Mar 2026 18:02:20 +0530
Message-ID: <20260304123221.1450993-4-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304123221.1450993-1-p-deshmukh@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|MN2PR10MB4304:EE_
X-MS-Office365-Filtering-Correlation-Id: 525097f2-1efa-447a-54d5-08de79ea1f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|1800799024|36860700016|376014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	F0sUcTXZI5Pnv0EwMrk9XaRY6gV4zlS2+LjZs1uPuvo4GytvCQlkQNnWOlmzVR/hrVNPTIAbU3eVxpGhKOgkPJbHUT4UyzJdHQq3X8BNk9mWTpJi+XvgJ9rsZ/eBUub/2yMQiNyod4kmhHfcUGXgXS87KbJz8czewjKyaFGy9BKOuHBkAuX74ZIt19CNvqlZDIgxnskTBQ72pNyzBhN8r0ll/IsPlec5XvDI8dUeTf5GZXXhI/8ZNy1SBGmRySZK1asaG7aC5+nMAMCYgdV0ssmb/nwlQv0DKjDMnvlhQURvSu+tGwJ8OlJQULA8F2ykTTXqYLc0DgRzIEj+46Qoix9q/o3iPJkkANoxf+P5hYc6xTRfJB+6WFaIEZugc52N7lo6NDvoBcNhtXBSvG7msSuyFH71Ue/h1jSKmwAsSb6gqHcWctIChP7rhZpJFPL9aqam+jaReFtJOzEU/tmsWLGjtuOft0dzE3q1ElPtgsMoTMiDeOnqvx+Oq1W/xaVjY6klDKh9NAl3KVz7VTeXYpOjqDLGNzYgRK7rJfSrAJeEAL7I6qLlHq0ezAo93kLk2BfuO/ByUt3LE5VwbS5W6jRv4vaf2nFevnk4UcQM3F2Vt34/SGJ4pmAwz6142nhBE89uFZEUyIK4RcCB8R9nJYA4wLcZ5hA0wVNBSNWkk+xRtD9z7LRjiWtHjE6zzZ1ar/b4oDA7FAReQMNhFY0qv9OS7zvVS1ZmNzvZHCxdXN4=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(1800799024)(36860700016)(376014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bXIK7jPvywFM/OW6URzG9400lZlJmrmMSEao/fphzU1FoPguKowMFIuru7FPhhxWF61PGxCyZdUAbGCOGAncw/mtwqWAki0LGjRBX75IHop/sjwQPz7o0ePV0J0Zh2VC/wyaBhOP2qY89kiC4aJToCIG8CRjjgPGHHSxythu6IrJ5s5KC8UibJJKq4CJy2FpidYGXObxq5zxvW0vz8c4aderl2rVql9C9zAhyGzvLOxUWLnw+98bfOaBi+jM2G6qKmqYF0z31YhkdR+BRr0jG2bsHL/l1Hbly/DUj18FgRZ9aGBf+eE8aYqehWQlNektIML8vJsqJyK3zZGXu/4fM1Uw5GGwbiP+4hubjHMjS7++3u59bDlBOC1ocf3lVHYkch/fraWKbM+QFbwVPS9yXmSI9nsQqAYSCOoys/VPYrV2mw/O7YL7iKF3AeOHbGE2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 12:32:38.5039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 525097f2-1efa-447a-54d5-08de79ea1f37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4304
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 12:32:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17214

We are migrating Tensorflow-Lite from v2.18.0 to the
stable release v2.20.0

Key Changes:
 - Pin flatbuffers-native and protobuf-native to use the same version as
   TensorFlow Lite 2.20.0 to avoid version mismatch
 - Updated SRCREV for all the dependencies
 - Updated recipe to meet the build compatibilty

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 .../flatbuffers/flatbuffers-arago.inc         |  8 +++
 .../flatbuffers/flatbuffers.bbappend          |  4 ++
 .../protobuf/protobuf-arago.inc               | 18 +++++++
 .../protobuf/protobuf_%.bbappend              |  5 ++
 ...te_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} | 52 ++++++++++---------
 5 files changed, 62 insertions(+), 25 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuff=
ers-arago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuff=
ers.bbappend
 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf-ar=
ago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf_%.=
bbappend
 rename meta-arago-extras/recipes-framework/tensorflow-lite/{tensorflow-lit=
e_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} (86%)

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
-lite_2.18.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tenso=
rflow-lite_2.20.0.bb
similarity index 86%
rename from meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-=
lite_2.18.0.bb
rename to meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-li=
te_2.20.0.bb
index c76939ac..57278f5b 100644
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
+    git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=3Dr=
2.20 \
     file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch=
 \
     file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch=
 \
-    file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch=
 \
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
@@ -122,6 +122,8 @@ EXTRA_OECMAKE:append =3D " \
     -DCPUINFO_SOURCE_DIR=3D${S}/external/cpuinfo \
     -DKLEIDIAI_SOURCE_DIR=3D${S}/external/kleidiai \
     -DPSIMD_SOURCE_DIR=3D${S}/external/psimd \
+    -DCMAKE_CXX_STANDARD=3D17 \
+    -DCMAKE_CXX_STANDARD_REQUIRED=3DON \
     --compile-no-warning-as-error \
     --log-level=3DVERBOSE \
 "
@@ -130,7 +132,6 @@ do_configure:prepend() {
     for i in abseil-cpp cpuinfo eigen farmhash fft2d flatbuffers FP16-sour=
ce FXdiv-source gemmlowp kleidiai ml_dtypes psimd protobuf pthreadpool-sour=
ce ruy xnnpack; do
         cp -ra ${S}/external/$i ${B}/$i
     done
-
     # There is no Fortran compiler in the toolchain, but bitbake sets this=
 variable anyway with unavailable
     # binary & it leads to "CMake Error: Could not find compiler set in en=
vironment variable FC:"
     unset FC
@@ -143,7 +144,7 @@ do_compile:append() {
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
@@ -156,22 +157,23 @@ do_compile:append() {
        "${B}/tflite_runtime"
     echo "__version__ =3D '${TENSORFLOW_VERSION}'" >> "${BUILD_DIR}/tflite=
_runtime/__init__.py"
     echo "__git_version__ =3D '$(git -C "${TENSORFLOW_DIR}" describe)'" >>=
 "${BUILD_DIR}/tflite_runtime/__init__.py"
-
+ =20
     export PACKAGE_VERSION=3D"${TENSORFLOW_VERSION}"
     export PROJECT_NAME=3D"tflite_runtime"
     cp "${B}/_pywrap_tensorflow_interpreter_wrapper.so" "tflite_runtime"
-
+ =20
     setuptools3_do_compile
 }
=20
 do_install() {
     # Install tensorflow-lite dynamic library
     install -d ${D}${libdir}
-    install -m 0644 ${B}/libtensorflow-lite.so.${MAJOR} ${D}${libdir}/libt=
ensorflow-lite.so.${PV}
+    install -m 0644 ${B}/libtensorflow-lite.so. ${D}${libdir}/libtensorflo=
w-lite.so.${PV}
=20
-    ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so=
.${MAJOR}
+    ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so=
.${TF_MAJOR}
     ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so
-
+    ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so=
.
+   =20
     # armnn expects the the dynamic library of tensorflow lite to be named=
 as "libtensorflowlite.so"
     # Eg - https://github.com/ARM-software/armnn/blob/branches/armnn_24_11=
/delegate/cmake/Modules/FindTfLite.cmake#L19
     # Hence, create a symbolic link to handle the same
@@ -197,7 +199,7 @@ do_install() {
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


