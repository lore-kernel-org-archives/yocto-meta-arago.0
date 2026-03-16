Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A48F53D73
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 16:41:19 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55336.1773679277079045141
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 09:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CtrzvBlg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.64, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIYP9eyOITyGmlzDk8DQ9sYlrZGC38/0fdPqJz2oPBf05qpP/Tj16hkdreawxOxP/8G6Ls1yzDMwQyp+4xhzOyjIXcEHdxu+UMOuvFMledbB2iMOYvMBqD3J98dJhLZ6GAypVZ4vzNMyPn/WHkUCARlBhhOK5EZnZMO/ytJIXwrGKhghD/uOm3UCGUc+Qgf33vMvYG607ptjuwCDkg5ph5OC+64JWnXq5aQSHvjVLH6usy4mEWX7miqKsShdLLhXh3mcUj3gli+lgfiIbSO7/BpnQTNXEi85xXMQ194ifL+J2SMS40b99/s1izrtJC2/dsYtr0Pe4tn+sbFLDcE40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hn8HXx8Ji77G5BW0rwzzHZjrsYq4Vng+VJ4PRKNTGrc=;
 b=X3Q0kFytrTFPO9Cl2c0J0NrT+055gS0OZDdX7if5V8oDqazg13jS1U7EuTw0hTRC5Lo4tMcaobNrCoCKG+UqOMcbuwQaJp7G/PCbouztnLPA+yW5/HmP0mMFMFCNwzXRdlWknwHR0wnV5tUoGMnkhw2HaY3XG5h+U05ByHvULWsSaBC/5gU5htPGBTFfljeDyuHfb9M5pnfq13Q6uYGP35GDCmkT22+QelP4TngR1fWcueuiH3Ak5O4lMH+r4mwh/WnYVZE0RP/K1anNOrMZkq8Fr1WIAvACH3us081XTSZaFMgOSDEqpopACcpwSgMBbqKSlKO6JQvqK3huO+XMCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hn8HXx8Ji77G5BW0rwzzHZjrsYq4Vng+VJ4PRKNTGrc=;
 b=CtrzvBlg9qtUa6bi154MDaLepSLNQobipq1uJFOBQNU9mkscK2sCZM59KOQJWbSGo0imuvRGg9aFM03UxQe7B3GYYEc8+Z81uM6/F48SknpoaGt+wfhPvjsvFLrGn5fRF8bk9kY+d5MOQTfeQx9/zKdbSaoJipYKtlOMujUvqos=
Received: from SJ0PR05CA0088.namprd05.prod.outlook.com (2603:10b6:a03:332::33)
 by CH3PR10MB7458.namprd10.prod.outlook.com (2603:10b6:610:15a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 16:41:12 +0000
Received: from CO1PEPF00012E66.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::3d) by SJ0PR05CA0088.outlook.office365.com
 (2603:10b6:a03:332::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 16:41:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E66.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 16:41:11 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 11:41:10 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 11:41:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 11:41:10 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GGfAUK1618609;
	Mon, 16 Mar 2026 11:41:10 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v4] flutter-wayland-client: patch build to include cstdint header file
Date: Mon, 16 Mar 2026 11:41:10 -0500
Message-ID: <20260316164110.24729-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E66:EE_|CH3PR10MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c22c211-8008-4c02-0bba-08de837ad4c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|20052099010|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	meC1sS5iV1Ow+mGUb1fOFZsL8vPBCEksjasodwjJtX0SmBxyBVqUWNtThw52Og1nPEHM0cXE9YyMX+Vx5e8kxkqGPRrK9ka6bGhCWPyhp6Qq5/Jwe16wvhBwSOdBOxUIYey9SCB3zD3C43hK+lnikNC0ik1WvScc/crhKpHLeGsqxTPhndzZXy+ddWt0beHahF1vL2mPPQ/dUTaC/rNHfFzjMUJAoM+fi5eN3yxVEzzNrjPf1SoBS4C0Wab34Pt7vYRlIoUqcRmmEAl4GlPCICAP7U6vF5G9uiWx4STUQWz4UCQByyTp60cgBt4+rhJUpCiZYVKRrt5Nc1SBM5etFjcriq7LrwpzHzbj0xW/jJ0zqVzEM34n3Fb3GAXHNPbo4RPgHrHLUWePB7r+dx/aEyNnHxVqd0a/RGSNcpfVwnRjU3Y+L5zHZpreB/dChZwAJH9p3oA22tCjWPER6OCGWf1MQS8F1MgxibUU/flQGRykvgSFsctt7kG4pxpBLrN3Kj+QGxS9WO3AOcLtmeYt8HKsNN7OeL+OAmDt7OejYFxUvnT1rcZxRbLjVUQ9jrm+Fda4zNudjLWFc+Sqpi9QWBxOiGFCtYdm67/4XaGL9/5WTMSOntsdRIX3V9uzWwDWRAjtkChSRXb521USPXqoKTjfcmUrtPAu7vegT33XdLWuoITsVs2rxewPUbYq65oKS6F0ICUStar5x/Kr180JjJems2sCdSkp1OumhO7KFNNGy0jJhzlzMF4WWLpk/X49EgsXlQsuquVUSsMEbdHkkQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(20052099010)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	564/XdzxTYpVPidYbt3bd1eMv61w5KlGhq3vcd6nxLvlzIK9J+iWrL0ixPgsWIg3GUX6/Y7kOdsWzJ8xDA4OLDUMU6wigtYRUdSIjNMk4Xof+0DDhn1yHq4lDho3RCvAPGepPXZbFZ4VaJvrP5GuRb7JLK5c3CLK8OKJgOHNz7dutAegw2CS0NcLY6T9Edlb6b2luBCKqkhs/uG49fBIzFtqsoyL+jQqTnmFN5l7Q6vHH4DW6ygA4H2WtVIanbh357Xj8yH0Zw/RlaY4rlX97O3KFc3BTgO2xQG4jrUFjrDvxiAvb5mRClC8tvkdftQxq/qAmE0X2t963H3KGh+Su1yAdrLUGO+LV+hTTs0HvSkH+fWEpXXkOL1NRIs0pwpX5FjRP/84Y/izVTAIO7sn+xGwsX9vIuZ4+4XJpNyGQWsGwACHMGwId2lPbVYQ9UBg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:41:11.1138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c22c211-8008-4c02-0bba-08de837ad4c9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E66.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7458
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 16:41:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17353

From: Antonios Christidis <a-christidis@ti.com>

Add a patch as part of the SRC. Patch includes the missing header
file cstdint.

The patch is labeled as Inactive-Upstream, as Sony has stopped
support for the embedded client. On the meta-flutter github,
there are discussions on creating and maintaining a fork.
Nothing is concrete yet.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v4:
- Remove unnecessary space from SRC_URI, as "+=3D" handles that
  - " file" -> "file"
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
index 00000000..4d211568
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-wayland-client-arago.inc
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/flutter:"
+
+SRC_URI +=3D "file://0001-message_codec.h-Include-cstdint-lib.patch"
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


