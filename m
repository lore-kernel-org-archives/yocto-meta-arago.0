Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63110CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 15:47:27 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12702.1762357641278600052
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 07:47:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Gjq9LUu6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.3, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeAKg1vvh9mluE6OAlM9SQzC+vzW/dDXTVcbqEK9xtsOF72JjtmQn47zQ4qJvxAyY0DjDgnXUjhAJltaihvrmLb3KyDaoUIqumr0/nkW1/intEcqoDCqIkwzz6fdZ3+MTL/3lL21e9SZs0EOHwDDK6jHUgGqPykI2tdC7JxaMTRpseichzLhaYPUmJv8bKwQFbQAcMShDPc86PkqgSvd0KF01ZWmOKZkilA5FU1K/JgOhSpmBAwI9SJWR3DwCnO16/CkNNAgsCigIGujL5os+EwuMU9dVndC2vhEX548Pgw9LohrSbwa91ukspmylCj4Edulh+M75MvWEbgN37N5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u+BPCpEsL5YREf7s6j3tniMPkfTIZr6mEQqge+CN44=;
 b=EnAnYyeUSQPGHHN+H2s11SrYVAykLI1Bv9xWWOhmoAUKlrWVk/6RQLQK6VYZ4+LnHbGMf8DqRhbI4vA1+v2FKEEOd463K7mq4Ta9s20RneFjDMHeNlyHCeajoQ8Acz2DKu8KwF2hWT+E3sIQOlpvas5TN2JA5zQvXD1IR5n0vC+Xvq6e9Mm1+HoY8ONP/YNDkL7T+qdGjuiOihbcytoedS0DU/gxjUxnADkOsTk6ah6ayejLrsWHrtYxAksV2F0e9wmTMVkmW0WaNs7NDzzgcIvbIiDtBpc+1/njAT5dSI8YF6AGnSNBD48iVnGbg09shPlZSGbeQ6+FkjVj643J9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1u+BPCpEsL5YREf7s6j3tniMPkfTIZr6mEQqge+CN44=;
 b=Gjq9LUu6ZcivrxRrCMSbZjAgZxSdIoZrEtVM2CTSzNXm3gPf+wpekv8hFiBHUR8XYK+7gBt2LBeDzFTPv6CRTychXpdF2OMjlUF0QMnMeeAk2pMUOoJDQkF27SaIqWSJ9kpmjFpwDRM1ox9k8GOZ7gDmBfWBS6a7xNHSLuG/xFE=
Received: from CY5PR15CA0107.namprd15.prod.outlook.com (2603:10b6:930:7::16)
 by SA1PR10MB6414.namprd10.prod.outlook.com (2603:10b6:806:259::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 15:47:18 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:930:7:cafe::73) by CY5PR15CA0107.outlook.office365.com
 (2603:10b6:930:7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Wed, 5
 Nov 2025 15:47:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 15:47:16 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:47:13 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:47:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 09:47:12 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5FlCL53901622;
	Wed, 5 Nov 2025 09:47:12 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vGfj6-0005ke-G9; Wed, 05 Nov 2025 09:47:12 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] websocketd: Update to latest go build methodology
Date: Wed, 5 Nov 2025 09:47:12 -0600
Message-ID: <20251105154712.22069-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|SA1PR10MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: 680835f6-1c78-4691-66b2-08de1c8298b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sd9wQCjzxwq3zYc6VUFIbRFqnl2du6T7DgF9TTgbkj/i9aOSmsnPL3++8yH3?=
 =?us-ascii?Q?jIMERmhA7SBJeMaBqRyCWY3JIzocFgr/XdHjePZUFz9NxAPafQ9X8qyuz0DC?=
 =?us-ascii?Q?MLZMPKuXNRQKXSqFc0ukz5BKWmyEEskLa47zIwFfheqgHuhXPh72yQOsepeL?=
 =?us-ascii?Q?P5PVXfgRPND5BwqBgcoI/t+4NbBG50YlbCuV1xWzLD3APyEZIZAqhlRucnIJ?=
 =?us-ascii?Q?NuOV83vbtP7RS/9efR4wk7YwxLLHPmNXrLUDiq4BmTgxwNGS/NfDSk8exF+E?=
 =?us-ascii?Q?Tl+zYhUda+GjaV0lxMCaf96BrKvRX9V0dIjN2paQSgSJ0T04AdKhZ66x6pE3?=
 =?us-ascii?Q?qDGiojA4dyeqXn62XBnkR+UHKvykF1lj2/sU0iiBDpAJsy4aF8B//pcLofj+?=
 =?us-ascii?Q?g64x2GVQud/qQjHuwGABO4vf8q/iSuo/zDwAHzrpUsJvCUQdAwoxGqxA4WIF?=
 =?us-ascii?Q?8+KnEaM4Y6QNvZfaOQExsRBEThCKEK3awQDOOUd0fldjdFD9lz5dzKHTH/O5?=
 =?us-ascii?Q?7U3OTL5HBNzpxVXSnJkbGW00tFOgTYoQhqPKxjoe/BimfjzML0h7WwNkdw+c?=
 =?us-ascii?Q?u3OaKEDMK0RjJTc1+AxL2wfidVscXmV9e0s1tLqNtN+tTBTdfH0m6DTI/CnO?=
 =?us-ascii?Q?uSTj3D1CfaqxB7p/5d8JKqgS+754LRkTNznBzpy36a8CRgZyMTr7+ta3dTxq?=
 =?us-ascii?Q?hcIGQKacvzr/q7ykkR61FUEhucg0s0pqQodTLMFR5vXk+TExE7UvOu8HCVeE?=
 =?us-ascii?Q?M8hR1bYVSf5VUrEepN8DSX+8x8iZxP0Pq9ZBNO3nu1jTT23jiL/AaO5haPOl?=
 =?us-ascii?Q?ZcIvBXeapnvQckgYB2ts1c5FY44bbX9NNFVDbrDUw2XosAH4oEfm6icb4fV4?=
 =?us-ascii?Q?QKOcwrUwc3f7mJZQ6jhiZg56xm6JgpDejIGiFUniZm4sOOXnoPOUD/tSmxwp?=
 =?us-ascii?Q?RBC8OtR5WqjdCXRTwl+C83HzgXfi/VnsJ7eSpWtftyX2LgElyL3xYClSMwal?=
 =?us-ascii?Q?h3l98SktEasQTxcVaoxmJpNOMtEgLJ5zrndEeVgBVmpx45kQYYSwFnhV2NL7?=
 =?us-ascii?Q?BbylMakxjAonb53RKFQSNuAWGrybYDTmwEc+VqRCPLV0JeA3cRVM9lPQGY76?=
 =?us-ascii?Q?LBLoiOQVEEAuTTHRLXwnao0MmZVtV6YlCZkzTNMNU6xHnCaluGShDEC7ZBow?=
 =?us-ascii?Q?LjM0+e7c2MT1AQaRflq6kEM2589ScnXx4VQOIVYtXyZ0VG2N1P1vWZ/Pe6iO?=
 =?us-ascii?Q?5cPFsE5O0OdmOtLYoEGU4+Argdl6S1U+MtQMEAUwUxeYJHDCaWRxyZXMwUEO?=
 =?us-ascii?Q?McesAsuAPVDzf9IpXn2mCGjKRRwXFcIspT3Rk6d6uNGg90vmBRfIK60k88cH?=
 =?us-ascii?Q?MAak6zJKfOdyVLH/DYdmzhlaaRZ2DagNRciSdXRslr1hW/k0FOHqnYcUw9aZ?=
 =?us-ascii?Q?B8C2uwNrZIQ0ckUtDrW7RpxX3QvCLft4bTyRXiiHWjGURPa1UUcXpbbA4r5p?=
 =?us-ascii?Q?hpbDYYU6RS0sTCk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:47:16.5903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 680835f6-1c78-4691-66b2-08de1c8298b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6414
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Nov 2025 15:47:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16718

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
index 207cd38a..4e1cef0f 100644
--- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
@@ -3,21 +3,23 @@ HOMEPAGE = "http://websocketd.com/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
 
-inherit go-mod
+S = "${WORKDIR}"
 
-GO_IMPORT = "github.com/joewalnes/websocketd"
-
-export GOPROXY = "https://proxy.golang.org,direct"
+SRC_URI = "\
+    git://${GO_IMPORT}.git;protocol=https;branch=master;destsuffix=src/${GO_IMPORT} \
+    git://${GO_IMPORT_websocket}.git;protocol=https;branch=main;name=websocket;destsuffix=src/${GO_IMPORT_websocket} \
+    file://0001-examples-Move-to-python3.patch \
+"
 
-SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master"
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


