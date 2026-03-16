Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEE0F53D70
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 16:25:29 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54807.1773678323577608856
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 09:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=M0r4fzUI;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.10, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWbPsXpb1bFS7v32+II9FO6WP+0OGQCBPEJg38QJPT02m8P6lHVq2bVLv6GNtOe4mO8v8Z3Ti6XUSZAmazWSoxX7aKHBPKmMcKHEHQ3vlXGZqkjKxbyvvsbhqcyFDHnM5DZOXFaqsvOV1nc04meVDyU5TZOybtsiEXHdgk2HeIGeyvSJgwg4YDFsYrd70vqCFJv+jRMQWr1CbJ3W0cPjgeSYrmv3pc3g7Rkl+ZtnJmfjvjNR5X74PTIDcAwpQCM0O2QMgN0CwxH3O/EY5CGVIGnxwfMGbZivBmhCS1JdyCnG8ttHD/FsnuKIXzKLif0NFK0Pkvot6qaldYH9Z0cVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEatXOuMTS7OXlNVPGLyeg99Yv9hUSMAm5+jUU3YnDQ=;
 b=JdenD5SwqI4q7Qp5dJ6ee9ZzwHbjvmmbAHmXurx44GC8rNRQ0illF16LofLmkB1ZXI0oPZiKKtq5ZuAM/Opu0Nk6BdQmtBtGzoLIf5EGcFIwGwrxwxQiw7NnZ4P3eYOZ2o9ihC831y4X7+pKxau88SFkx+QVT+/x/nD842nNVoM6k0x4koFXbkEjGzEZr06dgCy9e5hPOwOgw7oq2RhbbtfbR3FRxceKn0/4fd0jyz0BgtbTa9DOaACnJphwit8H577Z2kieYCM1kpXkMZMUEewKY6rwWQYW8qaoduSF1O7iJRCAlEx37G+dpf6XLA8Mgv9FatikISSO4VbiqgAytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEatXOuMTS7OXlNVPGLyeg99Yv9hUSMAm5+jUU3YnDQ=;
 b=M0r4fzUIGBXEMrSowzh9copKz1lgDFgo7Ocb+OiAAJrkvCF6IO3CKdczAKjePxNRXyMVK5MkFCIX3QXZNCQ9xPqNIZ6C3SRfvDUhzqlcNCRUsq4CDGC0PSzXI6F6MH+gr50CFwRkmwoRiA9OiBgnf95qW3kegHAcKsc+2upt56Y=
Received: from PH8P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::26)
 by SN4PR10MB5605.namprd10.prod.outlook.com (2603:10b6:806:208::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 16:25:21 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:510:2d7:cafe::85) by PH8P222CA0016.outlook.office365.com
 (2603:10b6:510:2d7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 16:25:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Mon, 16 Mar 2026 16:25:19 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 11:25:16 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 11:25:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 11:25:16 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GGPGRA1111839;
	Mon, 16 Mar 2026 11:25:16 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v3] flutter-wayland-client: patch build to include cstdint header file
Date: Mon, 16 Mar 2026 11:25:16 -0500
Message-ID: <20260316162516.22885-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SN4PR10MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 078e700b-6f5c-48b9-57ba-08de83789d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|56012099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	NI8HWUqzvk+IPVbYVBF3czaN3BfUOaG/0KZgXlQYAJGqvjRMIpEfr+cDf/TZ788M06/MmfPDTseb3IS+9NS7d/aePvdeRHx6JInDbOhn4nrHvchJmj0bwU/HdN7SDDpAzK4EdUs3ttmFSRhZ37AQN5iQkyiQ6vnVnuLlUU1sI9hgyroWl0XhbmQ6N4Ul2ZgDOwuNb1Tzc4/h9/kQV+aWeLoXdpjOXpsFXfnPLzOmaGfK0P0EaY+GOnzsMkV9jzvMS776Nb9+00tq915vkzguXMZb+XpwLDz26EPnQvSFBEAjaTLhh6nQYXo0ZV6e98Fjx8O0OPhQT77O5gdhfLJ76XR6BNpUPVluacjRcjCzUD/Km00C3SzT4TE2/LPTZzbJ8Bwq2O9Dq3LmktHClRhuY0q4e9ikaGKJ6zriLCS1xwwwCisksC4Mq3YBlZHY1tlJusdc2VeySUElXMfkVvGmWiux8Cs0LS4t4w3X4Mo3E+AlumuUutTv1QcY0QBFVRFDXEa2ci1fQQO/rvnfo1dZbHXHRy5a0wR1upHRqYmcOf7Fymggb3+Kx36RXWrXMdivrVYDFwnR2gAWzh1rEGPpojfbxhn+HylaW3vTcOq++pxThBatzzaGe6aoy1muc+XmWW9Znh5VRRzj15ODtcqM9XW4nMtOpJ1bfPAbPEEx1jiEzFQUmiyp7DYpOt1pVfvRobMlq13BvWxUuAdNxPijm+3Pu15YcMyT4KvmdCpwkX3zBXj9IJxzj95xIM64DS9QAOz7hbwXe7wGtDH48SSLhg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KW85UyWuuqfK1VTxtu4L5v878qaq5fRo0i11QdPeUlmCCltuSKDPA2unvqMxbGpP7bLuTzNh3OmTCMugOFprxNk93fesk6uhHbuAF+FYQufGXTstacm728ucFirEUSPcGEK6mBff1dFy4n3Q9FVaj+cfdZe7nYqOf2jahS4+H+FGZrbdAKaQ4h4+cL+JsqhJc4GO8X+RyOOay7uh21w8tg5SkMkYIpdBvt20pujdSVAGgExoymu8s7QfXcosQGSOc6IiX4Se+lVyiqgiF2WfXyUKZlnNzsoZGSX0A7i751Tg0R/NDkXe848uyF67BXbYRwkY7O1nmZ92LwRlHorop2f9gpSBklpruQA7Ws6RHtf3pxEDc1ws1u5vb0T+kgeJyjw0oHc/lRr30B1Ca3GQXSMR3QcUNootm9u3iP6EQEC7wRPxEewByk5tZ/dAvRhk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:25:19.5038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 078e700b-6f5c-48b9-57ba-08de83789d94
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5605
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 16:25:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17352

From: Antonios Christidis <a-christidis@ti.com>

Add a patch as part of the SRC. Patch includes the missing header
file cstdint.

The patch is labeled as Inactive-Upstream, as Sony has stopped
support for the embedded client. On the meta-flutter github,
there are discussions on creating and maintaining a fork.
Nothing is concrete yet.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v3:
- Fix EOF whitespace
- Prefer to use "+=3D" instead of ":append" for SRC_URI=20
v2:=20
- Setup dynamic layer support

 check_yocto_rules.json                        |  1 +
 meta-arago-test/conf/layer.conf               |  1 +
 .../flutter/flutter-wayland-client-arago.inc  |  3 +
 .../flutter/flutter-wayland-client_%.bbappend |  4 +
 ...-message_codec.h-Include-cstdint-lib.patch | 93 +++++++++++++++++++
 5 files changed, 102 insertions(+)
 create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-gr=
aphics/flutter/flutter-wayland-client-arago.inc
 create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-gr=
aphics/flutter/flutter-wayland-client_%.bbappend
 create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-gr=
aphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 93a784b0..25c8c952 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -22,6 +22,7 @@
             "meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux=
/linux-ti-staging_%.bbappend",
             "meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend=
",
             "meta-arago-test/dynamic-layers/qt6-layer/recipes-core/package=
groups/ti-test.bbappend",
+            "meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics=
/flutter/flutter-wayland-client_%.bbappend",
             "meta-arago-test/recipes-benchmark/stream/stream_%.bbappend",
             "meta-arago-test/recipes-extended/bc/bc_%.bbappend"
         ]
diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.c=
onf
index 7e8bf1ab..3a5ed925 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -25,6 +25,7 @@ LAYERDEPENDS_meta-arago-test =3D " \
=20
 BBFILES_DYNAMIC +=3D " \
     qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
+    flutter-layer:${LAYERDIR}/dynamic-layers/flutter-layer/recipes*/*/*.bb=
append \
 "
=20
 # Codecs in ffmpeg with questionable patent status are not included by
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter-wayland-client-arago.inc b/meta-arago-test/dynamic-layers/f=
lutter-layer/recipes-graphics/flutter/flutter-wayland-client-arago.inc
new file mode 100644
index 00000000..3814c9cf
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-wayland-client-arago.inc
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/flutter:"
+
+SRC_URI +=3D " file://0001-message_codec.h-Include-cstdint-lib.patch"
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter-wayland-client_%.bbappend b/meta-arago-test/dynamic-layers/=
flutter-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend
new file mode 100644
index 00000000..ebcadafc
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-wayland-client_%.bbappend
@@ -0,0 +1,4 @@
+FLUTTER_ARAGO =3D ""
+FLUTTER_ARAGO:arago =3D "flutter-wayland-client-arago.inc"
+
+require ${FLUTTER_ARAGO}
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch b/meta-arago=
-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-me=
ssage_codec.h-Include-cstdint-lib.patch
new file mode 100644
index 00000000..7a9bff41
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter/0001-message_codec.h-Include-cstdint-lib.patch
@@ -0,0 +1,93 @@
+From dcfcb92c7f42cd6bd92b1048b5e4ea6f01d40e21 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Tue, 10 Mar 2026 11:01:28 -0500
+Subject: [PATCH] message_codec.h: Include cstdint lib
+
+Include cstdint lib within message_codec.h.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ .../client_wrapper/include/flutter/basic_message_channel.h       | 1 +
+ .../common/client_wrapper/include/flutter/binary_messenger.h     | 1 +
+ .../common/client_wrapper/include/flutter/engine_method_result.h | 1 +
+ .../common/client_wrapper/include/flutter/message_codec.h        | 1 +
+ .../common/client_wrapper/include/flutter/method_channel.h       | 1 +
+ .../common/client_wrapper/include/flutter/method_codec.h         | 1 +
+ 6 files changed, 6 insertions(+)
+
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/basic_message_channel.h b/src/flutter/shell/platform/common/client_wrap=
per/include/flutter/basic_message_channel.h
+index c081946..fcc6b23 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/bas=
ic_message_channel.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/bas=
ic_message_channel.h
+@@ -7,6 +7,7 @@
+
+ #include <iostream>
+ #include <string>
++#include <cstdint>
+
+ #include "binary_messenger.h"
+ #include "message_codec.h"
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/binary_messenger.h b/src/flutter/shell/platform/common/client_wrapper/i=
nclude/flutter/binary_messenger.h
+index d552b49..82e47da 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/bin=
ary_messenger.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/bin=
ary_messenger.h
+@@ -7,6 +7,7 @@
+
+ #include <functional>
+ #include <string>
++#include <cstdint>
+
+ namespace flutter {
+
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/engine_method_result.h b/src/flutter/shell/platform/common/client_wrapp=
er/include/flutter/engine_method_result.h
+index 3cc8b6a..9634ead 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/eng=
ine_method_result.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/eng=
ine_method_result.h
+@@ -8,6 +8,7 @@
+ #include <memory>
+ #include <string>
+ #include <vector>
++#include <cstdint>
+
+ #include "binary_messenger.h"
+ #include "method_codec.h"
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/message_codec.h b/src/flutter/shell/platform/common/client_wrapper/incl=
ude/flutter/message_codec.h
+index c84d25f..c007b1e 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/mes=
sage_codec.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/mes=
sage_codec.h
+@@ -8,6 +8,7 @@
+ #include <memory>
+ #include <string>
+ #include <vector>
++#include <cstdint>
+
+ namespace flutter {
+
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/method_channel.h b/src/flutter/shell/platform/common/client_wrapper/inc=
lude/flutter/method_channel.h
+index 6e39a64..34687a6 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_channel.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_channel.h
+@@ -7,6 +7,7 @@
+
+ #include <iostream>
+ #include <string>
++#include <cstdint>
+
+ #include "binary_messenger.h"
+ #include "engine_method_result.h"
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/method_codec.h b/src/flutter/shell/platform/common/client_wrapper/inclu=
de/flutter/method_codec.h
+index b40fa64..edd14d6 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_codec.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_codec.h
+@@ -8,6 +8,7 @@
+ #include <memory>
+ #include <string>
+ #include <vector>
++#include <cstdint>
+
+ #include "method_call.h"
+ #include "method_result.h"
+--
+2.34.1
--=20
2.34.1


