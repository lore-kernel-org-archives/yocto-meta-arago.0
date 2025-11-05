Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAB2CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 15:47:37 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12707.1762357651783730343
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 07:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=OmYqGbQJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.21, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wisSggArseP81lHpfILM+jpqKofUXL/OGg15TtpCmVsK2lAs8gnufuAobk5t36UeM26nGM2HShiUKAWZQpi1XU2tSVEaDI5SIsRNxPbEO2O2pF+7hZOmQAH60/D0OsBKqrbjKC6ICEmg4ISs43ULHJJXuM8UaS+lDw1/GV11GxvqBPRWT4TcMeOjen8jN7uUPMgKWtds0DLJz0IZQX5RKIrgzPplM6IIrQ/1MwK/9KpzwbPsk3hzEzbzPRcmNAigdUkhx5csMcT4j7g6KNo/2mVP/ciiVCEWT8vgtmnEkGHZrMNCpm/QxxtN2DGKFSyzTyFZDs1MXiora2we2dcnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQOY+WYbFUEvRzgCwfzkcIwccbH9f390snZpyhqSnOE=;
 b=difkVlsAGwkX2Bj8GXZ1G7sDMJ0+9G10hDnK/9BbVBBav5U1PFtLY+Ksd5N/eZyUx4SUPZdjpqeUoazhLv9HI+lw4duMOgtmcyriJkVtkxtkoReCwVjMZArL3q9uRQWaz5on7G7dTLhYXhY76/f0fO98TJ157WeOoU20BLTQv+8lAPi9jAgoWelFNmop2T1D5mkNBsq7KltTSiqNcN42G7hBIScI61TwnDaAS+7ZV/yrfRSdtpNhVELjzRM4oEwOt0AD53830A3o8non7ZsjIE6pKxV9SjcZ+7QHV/OJHyE6vYacx9VFEzsmAnEwJKsXxCiZ/toUAIAGqAbRVhAS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQOY+WYbFUEvRzgCwfzkcIwccbH9f390snZpyhqSnOE=;
 b=OmYqGbQJScBDuCY82D2yP8e4GrJ6uR6cYC8ynVukK14BB2OeCdX4ncLleT3nIrXtqc7QuQ6IautMY552wEuB54yXGJ2emAJ1KwX6Xzg3vH/3DzsO3KqjOQsBj4tHNuexENJbI80IVkdwjVuQKwTdy2NNW9o2uSajasxwRMaY1Zg=
Received: from MN0P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::26)
 by IA0PR10MB7133.namprd10.prod.outlook.com (2603:10b6:208:400::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 15:47:28 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:52a:cafe::8c) by MN0P221CA0002.outlook.office365.com
 (2603:10b6:208:52a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Wed, 5
 Nov 2025 15:47:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.0 via Frontend Transport; Wed, 5 Nov 2025 15:47:26 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:47:19 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:47:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 09:47:19 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5FlJed3945467;
	Wed, 5 Nov 2025 09:47:19 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vGfjD-0005lp-Ir; Wed, 05 Nov 2025 09:47:19 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] websocketd: Update to latest go build methodology
Date: Wed, 5 Nov 2025 09:47:19 -0600
Message-ID: <20251105154719.22140-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|IA0PR10MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc20783-c99c-4fc0-7f9b-08de1c829e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|34020700016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aDbTHFJ07uVoQ1RUnuZZW6iSiaCtVsr7+CeFv6NlQz3wc7uaWv6+FvMo9r8+?=
 =?us-ascii?Q?vUCC4bqH6QRmcV3x0emLm5f0IrgiIgzZzcUuU2b+KfvD8I6eLHQ6UyCXybM2?=
 =?us-ascii?Q?PJNuncye/Ok8WbyyTqrO38bHjHb3VpVmHPuC1CpfTyQbHwLzhNIPMdmJHih6?=
 =?us-ascii?Q?4i1K7TJ04tquE5a5j5wqpJhhM6yX4JZiWrgkEx7l/+nq8+QeAV0mnQ/+n+PB?=
 =?us-ascii?Q?oOKU/kW+KfX7E6f9yvPeE9BAL+W7GAEnaRaHyVyKzowCRCdq3wUJnA/qQNCh?=
 =?us-ascii?Q?mK/8MUMnTFQvoi9Oc/+jqELZDJ08P5dxGCf/n41ZsvmidH+2qSKQyNjo5JlO?=
 =?us-ascii?Q?Tq1uC3+jhoT5laEwtowkS2zfJlCAM8aaxQIQ74OVfK2gkG5B1pKBDeycpN//?=
 =?us-ascii?Q?7TCDKKHchFqY265vwNjZx1rBJTs64KX3Kf/Xyo26GSWZXMwdpyw4vjZ4GudT?=
 =?us-ascii?Q?z8ZIsPu77Wlsm8mGplR6aCtUdxZWV60NQjnhjnRZn0E1HWWCiF5HCGGDAWbc?=
 =?us-ascii?Q?6sdJ6/RGOdfnnh/eyUtpONA/akm9W437FAyLnsagdIZCQziyq6glGD2yWUJp?=
 =?us-ascii?Q?13u0KBa0RsGxYLyipfBg2n1ifXBxn8JwhLIOqCecCtwUgNilc7bQymKG4zAO?=
 =?us-ascii?Q?ISq2JyIVoPKMHYJUh+A2Cer9764iYZpcv7g2di60ppZEmW5hAlgEy4L/fPk6?=
 =?us-ascii?Q?+E2Qwx6DB3KtIwHnj81zilfWrhsi+JIcgH/Hvyunfc2nuWlejJYhIOqiOAB7?=
 =?us-ascii?Q?WfaJWXCg/5S0rj6+6Fu1bHbBacY/Jcl5jlJ/WHge2odyVZTkiItzpwGDWnZF?=
 =?us-ascii?Q?daJjKHyKRPWToGa18wL1vv2xXE8kKYWKPA/bYonQC0xtFI4dGa7/Y8+/QlJc?=
 =?us-ascii?Q?pV9G/8Jt/GDuu+diuWRGz0nrhpZI3iVkMPjpZpzLOzLBkJsdbga0n9wzQeZJ?=
 =?us-ascii?Q?iVMMbGaTM/kV0aABd/77ned2kKdv1OzyLmIjNonyTz4ZUVq/U5k7xWlnaYLM?=
 =?us-ascii?Q?7f4TYh22AlrNCIjJqnIfPiEmObYJ7L8X1s5Vryzb8tNzwCOm908BWkJ9MFeP?=
 =?us-ascii?Q?0jGNDHyHba8nFFMQaEexbUshTIdjE5fqaCFxnH5b9vgIQ+UiQsqYPmPmN2Wq?=
 =?us-ascii?Q?cgzjKRC7ogyan9+bbt0KbDsCQHVgNeawbHV/3lDdESdFPbrufP0+hXYG6K2r?=
 =?us-ascii?Q?cOEjDEy+86TZgovup5p4mvHqARoUJqf8U5NuKVLe4GkX8htMNGSbEmfuwuqu?=
 =?us-ascii?Q?4eGR65NKxUg3Bymn06e22cwanR1/GLNwP8XMW5TYywffI/7qbnh2TNYE1DlJ?=
 =?us-ascii?Q?8bGjyTfO0Yjyde/qlV/3YahxUPpCG5t/nRiXxEHAl+kGR53rN530K9I6mHHl?=
 =?us-ascii?Q?jfungJetkxx0RpS160oXneWd9WDimOBbYiCiNdn16eKpOt8abEX9aY8nG9AF?=
 =?us-ascii?Q?uKu/V1VAP+Konyn0LESHjaJOCLFGDICUPGNA1yB3eM1aTwG7hge/X+Gjboz8?=
 =?us-ascii?Q?mhA6VhaQ2Il9UdI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(34020700016)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:47:26.4873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc20783-c99c-4fc0-7f9b-08de1c829e9b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7133
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Nov 2025 15:47:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16719

Move the recipe to use the most up to date go methodology for building
websocketd.  This removes the need for the network access during
compile.  Also, remove the INSANE_SKIP and instead list out the correct
package dependencies.  Finally, apply a small patch for the python
examples to use /usr/bin/python3 instead of /usr/bin/python so that
everything lines up with the python3-core recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../files/0001-examples-Move-to-python3.patch | 50 +++++++++++++++++++
 .../websocketd/websocketd_0.4.1.bb            | 28 ++++++-----
 2 files changed, 65 insertions(+), 13 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/websocketd/files/0001-examples-Move-to-python3.patch

diff --git a/meta-arago-extras/recipes-devtools/websocketd/files/0001-examples-Move-to-python3.patch b/meta-arago-extras/recipes-devtools/websocketd/files/0001-examples-Move-to-python3.patch
new file mode 100644
index 00000000..c3c12f19
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/websocketd/files/0001-examples-Move-to-python3.patch
@@ -0,0 +1,50 @@
+From a3b4b0a7d996dc6bade0454ecf0e56d80fce399a Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Tue, 4 Nov 2025 16:33:03 -0600
+Subject: [PATCH] examples: Move to python3
+
+The examples are hard coded to look for /usr/bin/python, but we only
+have /usr/bin/python3.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ examples/python/count.py    | 2 +-
+ examples/python/dump-env.py | 2 +-
+ examples/python/greeter.py  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/github.com/joewalnes/websocketd/examples/python/count.py b/src/github.com/joewalnes/websocketd/examples/python/count.py
+index 8023750..3bd43a9 100755
+--- a/src/github.com/joewalnes/websocketd/examples/python/count.py
++++ b/src/github.com/joewalnes/websocketd/examples/python/count.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ 
+ # Copyright 2013 Joe Walnes and the websocketd team.
+ # All rights reserved.
+diff --git a/src/github.com/joewalnes/websocketd/examples/python/dump-env.py b/src/github.com/joewalnes/websocketd/examples/python/dump-env.py
+index 2962468..b88b25d 100755
+--- a/src/github.com/joewalnes/websocketd/examples/python/dump-env.py
++++ b/src/github.com/joewalnes/websocketd/examples/python/dump-env.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ 
+ # Copyright 2013 Joe Walnes and the websocketd team.
+ # All rights reserved.
+diff --git a/src/github.com/joewalnes/websocketd/examples/python/greeter.py b/src/github.com/joewalnes/websocketd/examples/python/greeter.py
+index dddf24e..464c021 100755
+--- a/src/github.com/joewalnes/websocketd/examples/python/greeter.py
++++ b/src/github.com/joewalnes/websocketd/examples/python/greeter.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ 
+ # Copyright 2013 Joe Walnes and the websocketd team.
+ # All rights reserved.
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
index 1f5f8f5d..c6880b7c 100644
--- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
@@ -3,21 +3,23 @@ HOMEPAGE = "http://websocketd.com/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
 
-inherit go-mod
+S = "${UNPACKDIR}"
 
-GO_IMPORT = "github.com/joewalnes/websocketd"
-
-export GOPROXY = "https://proxy.golang.org,direct"
+SRC_URI = "\
+    git://${GO_IMPORT}.git;protocol=https;branch=master;destsuffix=src/${GO_IMPORT} \
+    git://${GO_IMPORT_websocket}.git;protocol=https;branch=main;name=websocket;destsuffix=src/${GO_IMPORT_websocket} \
+    file://0001-examples-Move-to-python3.patch \
+"
 
-SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 SRCREV = "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
+SRCREV_websocket = "66b9c49e59c6c48f0ffce28c2d8b8a5678502c6d"
+
+SRCREV_FORMAT .= "_websocket"
+
+GO_IMPORT = "github.com/joewalnes/websocketd"
+GO_IMPORT_websocket = "github.com/gorilla/websocket"
 
-# bitbake only exports proxy variables during fetching, but go handles
-# module fetching on its own during compile and needs proxy settings
-# along with network access for the task
-export http_proxy
-export https_proxy
-do_compile[network] = "1"
+export GO111MODULE = "off"
+inherit go
 
-# Development package contains all the examples in different languages
-INSANE_SKIP:${PN}-dev = "file-rdeps"
+RDEPENDS:${PN}-dev = "bash perl php-cli python3-core ruby"
-- 
2.17.1


