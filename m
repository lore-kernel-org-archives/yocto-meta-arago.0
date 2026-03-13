Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685FD106FD66
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 01:35:29 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6256.1773365722880072752
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 18:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Vyi8ii3T;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.45, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZlqowNWHTxA8Oye2aDGu46OchFKxnFr/2cXXrVwJ+ZTipH40Wt3tPg7srmUSj8HBukiZAB4WAtpX+h5nX5tTYto9aBzMOgIlflWLV4stj+89l2twZfdjeqxHBX8zjOb1es0gZpTIte9VTUivKX6PjvvGt75OjeBWH30yDUFGt17xYPaB8aLCC++3MemDEBYHVDsW0sdBywayJJ2bnEGLLZjH3KtgxV7R4B334BRykgSdJsot9p5i8urj03gK6Ih/CZDruDgs7jfhd6kVzPpd3w1O4gwgrlqKpVf+Xkjj3unYQ/yIMGei35HLalo40WCKbyFwypxX+ZBewdKVSztrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpMDNPqdBA5TNvTVS05xKzxVVnwMTOUgbuOSEIqZO7k=;
 b=PPk/p6Q3SKVijWAI3O6Z7Xj9JwJQD2r8KV9fd4QtbCyq9RgcDiL5acBcQuLvlt89WlV/x9uIs3+2Lrs4ePgj0iIZJ5ZEKbyJPFPOlHKDyZqPV5zJT34u7zwYlbvwdw/8EI6hbwrWC8JoicyDDHZSOhP8RbLBfuTDZNl67AwJqYQUi/7KXEKgy9ZaaiEritdYNqFE2apfVSVCIdho40PHH84O5GOHf9OsXFfLhBpC23ezwxjTyDdsRl6S44Zeu0i2fjpODP1n305ySyk5KmIf95dxi0YxkxvGC5R1NfHAFgZZnjpSdm7Vo22GiUmcL5SOXN5KtyQCIwGZceUBEC8vwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpMDNPqdBA5TNvTVS05xKzxVVnwMTOUgbuOSEIqZO7k=;
 b=Vyi8ii3TZi1/YanIbFGnnWIP8t/6MgX4syaPi7KJpadZ6yBplMFcPAo/GamIPMMEC3X8SGRp/u0xuzSBhaooPD9vYGi3thrQlIP0VbcK0PCJmNurYaAErC3uvCWyp3YgMMA/zpriv532q2QLd7hXo8Bc3msiV8UKIgZKMExpx8I=
Received: from BN9PR03CA0719.namprd03.prod.outlook.com (2603:10b6:408:ef::34)
 by MW5PR10MB5806.namprd10.prod.outlook.com (2603:10b6:303:193::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 01:35:20 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:ef:cafe::4e) by BN9PR03CA0719.outlook.office365.com
 (2603:10b6:408:ef::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 01:35:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 01:35:20 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 20:35:19 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 20:35:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 20:35:19 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D1ZJ9n3344473;
	Thu, 12 Mar 2026 20:35:19 -0500
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] flutter-wayland-client: patch build to include cstdint header file
Date: Thu, 12 Mar 2026 20:35:19 -0500
Message-ID: <20260313013519.1055960-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|MW5PR10MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c06e8b-8ecf-4798-b693-08de80a0c9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|20052099010|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	kTvE0nwDaDfAfoI1/xAJhlxYN2XyhTHi2gAMxuLksMI5fMZg8xg74hFr1qhEvwSCn1ebm6zy8qb3H4SwxT2lrpCgzoUKJNLRXZWT+Bgn87CUYgVhHQisGZdjrZnolxhNzPlrpk3zGsa0NlHeq/Z+a39X/zYM/uNiun+qKrdG8JWciu2TycUVxK/HJF6Ol72cHlDdhg2b4klBE6AfUaBM4ACo03oaLF7fwll0tFy8SufdTmfSYJKAaWFGPE1ZLqdunT8xjVDIJIuZh8VrdpOUv+pHLSAlMwpDql956mivUrX4GL0CE5GZvDMRkNqsH3Vb8jUN08nWUiF62uAICpzWwbtZiC70C4K4Kq8HgD+AVA8t+8kFz0CkDOve32DNpYMZRbdjpvrQKNqEO+xqjP5b24YE9aqyyFqc+qAQk+ESlmtJCW4735TR1iq3BIFL+6UW1AClzxPUbB5W0b6U4kJVP1QoGclkknqJgQYYQi0zCxZtkkdnYttyZzweH+j42Azl74MW078OWCS/er2AbNnza37G3HnIs/aNxi4q834ys67/U1gylJ7o5oRIVOhLutPNeJiDL1h0PDe3I2KadjVuAvkzUwar3vYFCQVLfz9bh9LZyRFbcLA9dZe+Kua65XLoX6cYbkoe3RCQbxtF6nH5/zER2QenVek2N95A8MNdRGy0XTLL6DwBRra2yFPiceORoGzavikkc9YyHmBfFQLX2+4sr9dJ25oQQBzZRsJSl5CQcSJguiwqKH/Kl6FpVhQEnVlhwK8LS7gIj6M/1krN1A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(20052099010)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BcxK/jy7FgFX+ok7MgQRf+ZXwzkUUiimEAJxtnTG6EcqOHNZlEP+hstum5A1ZP30hVCbFTPfa6eJGtWZFDXo37epiKSo+YIps0uSnMXEAAF8EjR5w+49SHi/kmiJcdjgGQwJsVOOsVJvaqVZIunsAuxEN1X3OgNur5eiCDEadwJxYTtwZ4q/jYkAceH7LuA6pV1Q/PRsVyaqTUYP9wh9CPzmcZn73pf+bI5CyfEp4dhi8uPCyICZEormhJbbfG7zF674RZye4fbrV9wGL8Ef2X+ZjLyMhWNtbs+aUbE+AO6qn++5/ZiqN4YMk1EYA5X9H4kjLNFfixLi5Edgg9oFD6tiRSkK5OYkSWlkcPe0YnO0x9oCh4bjrShsOJt0F4QO6nBGUYSlLlQEeRUL/SqtAFpe6EruD/jVkV0gz7kT1lL/5BTx9yBUTLvWkLtU/Alr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 01:35:20.0458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c06e8b-8ecf-4798-b693-08de80a0c9c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5806
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 01:35:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17331

From: Antonios Christidis <a-christidis@ti.com>

Add a patch as part of the SRC. Patch includes the missing header
file cstdint.=20

The patch is labeled as Inactive-Upstream, as Sony has stopped=20
support for the embedded client. On the meta-flutter github,=20
there are discussions on creating and maintaining a fork.=20
Nothing is concrete yet.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../flutter/flutter-wayland-client-arago.inc  |  3 +
 .../flutter/flutter-wayland-client_%.bbappend |  5 +
 ...-message_codec.h-Include-cstdint-lib.patch | 94 +++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/flutter/flutter-waylan=
d-client-arago.inc
 create mode 100644 meta-arago-test/recipes-graphics/flutter/flutter-waylan=
d-client_%.bbappend
 create mode 100644 meta-arago-test/recipes-graphics/flutter/flutter/0001-m=
essage_codec.h-Include-cstdint-lib.patch

diff --git a/meta-arago-test/recipes-graphics/flutter/flutter-wayland-clien=
t-arago.inc b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-clie=
nt-arago.inc
new file mode 100644
index 00000000..ed7bd5df
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client-arago=
.inc
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/flutter:"
+
+SRC_URI:append =3D " file://0001-message_codec.h-Include-cstdint-lib.patch=
"
diff --git a/meta-arago-test/recipes-graphics/flutter/flutter-wayland-clien=
t_%.bbappend b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-cli=
ent_%.bbappend
new file mode 100644
index 00000000..58fb5497
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client_%.bba=
ppend
@@ -0,0 +1,5 @@
+FLUTTER_ARAGO =3D ""
+FLUTTER_ARAGO:arago =3D "flutter-wayland-client-arago.inc"
+
+require ${FLUTTER_ARAGO}
+
diff --git a/meta-arago-test/recipes-graphics/flutter/flutter/0001-message_=
codec.h-Include-cstdint-lib.patch b/meta-arago-test/recipes-graphics/flutte=
r/flutter/0001-message_codec.h-Include-cstdint-lib.patch
new file mode 100644
index 00000000..33edda42
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/flutter/flutter/0001-message_codec.h=
-Include-cstdint-lib.patch
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


