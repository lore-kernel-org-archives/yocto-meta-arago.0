Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEFD107BCE4
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 20:31:31 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25747.1773433884989809662
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 13:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=QWofHw04;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.23, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGz6BlYwNAzel0LoBhwXRM/kbxPw5lo6oTQnU4faWxrn81CXevGvyjEsrCCh+bCi97bSLYbxM0lmporYw/Ni4aJf1Jbkp3asLlhrJz6tjjGLx/2ebEIWb4Qw0Qq4hgO/t/DPxXG1oQlSB+0HyYum1CChIIfOH/WG6hwDza1K5GA+u6+vgbAo5yt8GW1YPS5ORFCWWf0Vk5lLQJuHeMMIZ9NPZ9AUyUHZOWfWAeDsr5Z+9lY3oo+jHPCqFCQ2AhL0/YBwznb0l7Ur1O4XkIbUNIC5X5ZTIisbX/fg8TOVzOwEyYWTwELcer6eYY3Ms47hMwEpxz8b8j8UY6VDWNUm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5XMlRHM1ZiHPSe9ld8hGZwDTowTGtdd/Z6f/44/hFk=;
 b=EDqaBEu8GvKVJsfJalFRZqGz2PBTIfEXM/mjCpwezjrSKBwMXGlp82gprSshqRuYnTjNuHjmlfXSyxV1PqIiD1YEeawEmVL2CPv3geTLNJDIhYq6nw7ByHkLR44qpJ9M5NRlT3Jr0HutpLmad9l/J3xJ8pSdYoL9waivaZ//4enRtVvOqqrl/NgGT8ndjH+SOWb76A6SY28kSD4K4y3zd0s/vnMtEziesyXXEGuM8cap8Kk6MMEMHvL/ZvvWrWF2/KUd8oCIrgaiwX4Kxnq68FRW0fInsI/FywA+AQSNDfvXxhG3jRMQLeA2UXsWiwjow1lZYFfriwZB++WTIwcbzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5XMlRHM1ZiHPSe9ld8hGZwDTowTGtdd/Z6f/44/hFk=;
 b=QWofHw04LrWW1kr3khUhHWb8i3zWYWn0CLb5uesjkj0oDiikhNc/tZB6vUJpFc5mQVJh8EYcOcBj+ih8N9Wd4AV5G9ZPi29+w1e+LtGQ2dsjIztJingxcQXa7ldGzYFXeEYmlglGB3tz2Ziqy6BwNvbgq0SjRsxp1yJtt4YnDCc=
Received: from CH2PR12CA0014.namprd12.prod.outlook.com (2603:10b6:610:57::24)
 by DM4PR10MB7476.namprd10.prod.outlook.com (2603:10b6:8:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 20:31:21 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::d0) by CH2PR12CA0014.outlook.office365.com
 (2603:10b6:610:57::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 20:31:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 20:31:19 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 15:31:19 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 15:31:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 15:31:19 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DKVJqb657009;
	Fri, 13 Mar 2026 15:31:19 -0500
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] flutter-wayland-client: patch build to include cstdint header file
Date: Fri, 13 Mar 2026 15:31:18 -0500
Message-ID: <20260313203118.1128401-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DM4PR10MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: e55043c1-598a-47b6-ef26-08de813f7c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	RG2ay8gbmjQS1/00VOc1ofDvvpM39KOnKkK2d/s7ov53VXFUoOIARXvRsN3B+snSdxK7mIkC65JKvZ0l9yqRvRw2Sa3oOKdNAeXO8rrnZ59283M9/jSTfk4fOGvytYz+lB209pvsgvfuqU+b6y+FcE/9fSX69pGZtqrmIQL0D+7kshUDEvQ3SClC3PUPVPkr91TADkTagxPmbU/lZTMB420DNMu8JWSgNRzdiqKjc+/7q867A/A0duCVmUFfAjtuy80ALClaxgWTIzPV+Tp1wKxdbu94tPF6wy8QvroU6aUaty1b+zjtHFhcKu/FjuQKxXnniEedqa8uU3h9984ZLM1ibPsO6ofgFNHylsagmGSrure1m4hd5Lah102N0C5LadDVvmeto9RPOiiPKPIJto70p1bOAL2igdEzxl/OuV2Tl4uXb7EsjGOt/XYa/foDPGprj0w905blwnE5lBKvjkvxt7/rKmPvZclNsKlw4/GZ5xXnBaHx/2OSYujAXbLpm28LpqudZ27jj6jp6hkrBxJPhdHSHHgo0MkUhZFau1YF7Yh3SIia/mPfHBs1ePHQVEzj0YtLKhvLKFKurgDDjje0MeDThy9vqzgUsWuPchhp7w0PT5qc5C1BRs+6OmFLf0hzldNsqCclugUGAz5Cx1tx3vyMJsSFwbIFhPyDLaoNLj3KKg/3kTiUfc8NEupQuvLLmcyAVZEz38v/yG8pYFsQwXehWr9If4w+NyJP7fRt82TctuYNZQtttesgt6zUTE0wcOkEbEIU/SSXhaGVhg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	78hLESXU5yLsTAFMWENC1s+4PgQn4X7cXaIzdk7BM0Q9xwU5t4m7oznJiN/m8BhtMODHBTExAY3YARbZ9u/aXNkKbg/yI7KIV8a8V+dbvMju1f6UxH7U7ntUoILFRrJwuC8ZocpkbXEc4ZhYQR9yQhl+ayelcY1xWdrsW2/S8bvxYqDnjroeaFMlwlPP7lWGWzLoADXkehnFy/Qs2lmfTE43kXxUYl8U3jm15FtHsYB9sz/wp+dQaJeHz4IT8cxN9lSDcjY1B8grC9VANj/ik4ZLtPSEFKsNFrLjLXo+xeALDd9idZHzsK2rnk1ZU14exZsKBQptYklWWJ+IOu8wzGvpwGt2TnM9JJ8RWLxb8hyzDX0xrTHBS/hXtfnqEnPzZUotaCTJhxVPE+DgMDNUcSekR3dE4t5u7PXWFOIN86DqxAh0NOBLSIxgjmqA1Vvx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 20:31:19.7273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e55043c1-598a-47b6-ef26-08de813f7c1a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7476
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 20:31:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17340

From: Antonios Christidis <a-christidis@ti.com>

Add a patch as part of the SRC. Patch includes the missing header
file cstdint.

The patch is labeled as Inactive-Upstream, as Sony has stopped
support for the embedded client. On the meta-flutter github,
there are discussions on creating and maintaining a fork.
Nothing is concrete yet.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:=20
- Setup dynamic layer support

 check_yocto_rules.json                        |  1 +
 meta-arago-test/conf/layer.conf               |  1 +
 .../flutter/flutter-wayland-client-arago.inc  |  3 +
 .../flutter/flutter-wayland-client_%.bbappend |  5 +
 ...-message_codec.h-Include-cstdint-lib.patch | 94 +++++++++++++++++++
 5 files changed, 104 insertions(+)
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
index 00000000..ed7bd5df
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-wayland-client-arago.inc
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/flutter:"
+
+SRC_URI:append =3D " file://0001-message_codec.h-Include-cstdint-lib.patch=
"
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter-wayland-client_%.bbappend b/meta-arago-test/dynamic-layers/=
flutter-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend
new file mode 100644
index 00000000..58fb5497
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-wayland-client_%.bbappend
@@ -0,0 +1,5 @@
+FLUTTER_ARAGO =3D ""
+FLUTTER_ARAGO:arago =3D "flutter-wayland-client-arago.inc"
+
+require ${FLUTTER_ARAGO}
+
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch b/meta-arago=
-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-me=
ssage_codec.h-Include-cstdint-lib.patch
new file mode 100644
index 00000000..33edda42
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter/0001-message_codec.h-Include-cstdint-lib.patch
@@ -0,0 +1,94 @@
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
+--=20
+2.34.1
+
--=20
2.34.1


