Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A738EFF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 14:41:12 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15077.1777387269745803606
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 07:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CiFiUUrR;
 spf=pass (domain: ti.com, ip: 52.101.53.69, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMSoXioh0DXokgybs3JDarMaCQhKPViLu92tpM1mbYCjqSM1zXRlwyy1RxqiyIrjozm8BqtQovtXdFQFrbuQ84y3o0JwQNrtMF+GxHc3r/GoYe/Gwv+IWUiRW08xiMjGQN/blioXNFBszUfGIQkdBlKfpZgeGAnrGe7v+tsLRcIXvUv7OjbFj/YacAbqh939rjDUNYECcT/A52IdGX0GxGdbHPITke9WeB2F/qTpFrXyjLotOlILLH9i+iHDtcVxQuZMogHGki2jk/9YNTuovuiA9gotTqmTrqPE67ysMVS5/4M9JjaWp7fPVwnSuUaJajIj0CToNRs7yiQbn5861Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZcJfMXzIN8jaCkbySSMJgHKZa7dbqL3UnHVOPBveHQ=;
 b=F5kBOHLYClvoEopnJz2HPBvA9QifNY0Fd9rLC2to5WtrFrX5diFMjfxiq74GCrfWFRdZiW6McyV+NJtSLJ+HvNin1G4RhFjEPyouwYCyBIjNQ4KIf98dvIH5Z4gU5jZ2mZOyqlUu/8qKDDI4HLl6n+4gqweBZZEXu6WciOYx/GCkJCzUuYsS6SJR/HQlP0oZIJEvqMN86bLpd43e1U3kpNA3+7y3M6QmVft8E/DtF+6oH9KIZbHIVvrlwS/oWHgIDkqbqmoFjOWgDPHsMlxlBGJ14MCCV3p462aM3oTs06J6wE+wDxcpIFlgkOP70UEgec7rJMbRZ9spoZbGvpxgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZcJfMXzIN8jaCkbySSMJgHKZa7dbqL3UnHVOPBveHQ=;
 b=CiFiUUrROhuXpgmGWpx9++Vu1d8z3us3d/064lLIBVK+A+kr4+q1XX6eJXbiyQ8kUzgZgcsD/SYKz+9gv1jNMp/etStTQcGRi2S8XHxglxjEXIk8XIIcLT8bTFgFp1segTQ+oeQj5uM6kkhdQnUIHH5LTWHC9gtptL8v6Mz/oko=
Received: from PH8PR15CA0020.namprd15.prod.outlook.com (2603:10b6:510:2d2::20)
 by PH7PR10MB6506.namprd10.prod.outlook.com (2603:10b6:510:201::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 14:41:05 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::f0) by PH8PR15CA0020.outlook.office365.com
 (2603:10b6:510:2d2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Tue,
 28 Apr 2026 14:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 14:41:04 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 09:40:42 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 09:40:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 09:40:42 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SEegC21383321;
	Tue, 28 Apr 2026 09:40:42 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wHjcA-00000003Z3E-0Ujp;
	Tue, 28 Apr 2026 09:40:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ltp-ddt: Fix install error
Date: Tue, 28 Apr 2026 09:40:42 -0500
Message-ID: <20260428144042.849713-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|PH7PR10MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b28235-30b5-45aa-c6a4-08dea5342cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	W6NM/VlL34BJvZY5tgrzT0En6beUA96RRhljXuU6X+LkevQjpcOTrWPGVwhMjvjWfdBhdHv6ni3ek3E6JfzGY9sLq+Wh9ihkMSk3R4HscWssXT/736ATqpCaxMWa83g0rbKnu6JKzJLZQwWU3qVTxkTsaOE8tnW7qqIFbhB6TYkQiwDDs0y5eR0BUM1tsnIUsKnx41XE4imedl1A+RzUSvJ/tDzjiVvtJO6qLkM+sLyfuXg0d4QJskwPB1zBNmnE9/Up5F2Vgg9fH/UkBTWxF3isde/JsESIrGSNjyhkqxFYLlZLFxNfNuS1uM4CszuladGnZpl/3t+Vpn/3RUAoWsi6o+Hs5ga+1IZw/RRBWHx1B6dKvs2kkqy+JcoSnqqUtRq27HHZGbZNz6I6/RLhMb/nGIiD0wbNAe1jXuk9t3DxAne56zN+QcgcnQxuV1MURSsYsyYsvYjPvCjeQgY2jkT+iUP3/0k3dtG+7Tq3T2QqgR9psL+DeAip5SWgy2KKt74Wk4HPtCPB3Kv7xAcMLCFPjNbwhH9Jc52z54v77cAlD9IKdNGtvW16Zhztf10GTfQc0EeSGW6cSWRhaS+1VQ4cnGMWKZvJ0HrpoNaJTFAlYQeog16REvs1e8BKi/PYpyB7CJQjbPVW6XFyk+Cig9ooVk1J0wRjaKdtZoxUbZGNlHuXIpESHzJIukuI22jUrXGpuNp0BvsmkTTfUezuop3LNtA+gZhWVXj4XFGpFmpOU5dLTRATxCkfFpZ2jv7NvVyJavh481BwktsleNpAdg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BTkl8epO9LlDBUDdRK+C70wz5L6NpFxoNXmj+lTlWGZF++lISjw4U3mfR3xz180f73wIpbaWt6+kPOwL04U/27w08A3x55RNLO176XyP2YqgsMruZAlcZGGp3VLr3jn3AyMmlMK1s3uFFV8mTTEW94Npy9kUeNZ5cHrF7ZNffGyb2z0AYQW1W40kKGPOWp+7dC9KeQFYsSkt10BDkgrgIixVAiURmL5GpJC04DvtNFmCQaxYCNo8HcfyXXxwloHsAiOcGAHp6Sr7gZbhf7Ici1iwgMFQW7JkgLTqfRCH49qrgmnKXcQ4vehXgA3Q0L+1Pix2edSHNAUQK/7n1mZ9Ell/EQruVt0rDvgZ2Ku8vNWI/8m6PptcUmufhvs5HXrkY57LbIoPFjqyph3+3B2Jtsd2l1aVZEHQeQ9b1hrlqcHsN2UQfGSlCnWc7cQuX7Na
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 14:41:04.1915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b28235-30b5-45aa-c6a4-08dea5342cda
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6506
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Apr 2026 14:41:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17498

Something in the oe-core commit [1] is exposing an existing issue with
the ltp-ddt install flow.  The runtest/ddt sub directory was being
chmodded to 644 which stripped the execute bit make the directory, not a
directory.

Attached patch fixes the issue in ltp-ddt.  We are waiting for testing
of this patch to make sure this works before accepting the patch change
in ltp-ddt itself.

[1] https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster&id=3D=
8ea63d320aba32d3894cace9e71e850bdff1d6b2

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...01-include-mk-Fix-installing-subdirs.patch | 49 +++++++++++++++++++
 .../recipes-devtools/ltp-ddt/ltp_20260130.inc |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-i=
nclude-mk-Fix-installing-subdirs.patch

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-=
mk-Fix-installing-subdirs.patch b/meta-arago-test/recipes-devtools/ltp-ddt/=
ltp-ddt/0001-include-mk-Fix-installing-subdirs.patch
new file mode 100644
index 00000000..5f970a12
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-=
installing-subdirs.patch
@@ -0,0 +1,49 @@
+From 5907227ad86a93b084a52a7ff8dd8cb791c228a5 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Mon, 27 Apr 2026 11:02:32 -0500
+Subject: [PATCH] include/mk: Fix installing subdirs
+
+When installing sub directories, the INSTALL_MODE was being used for the
+dirs as well.  But in runtest/Makefile the INSTALL_MODE is being set to
+00644.  This causes the ddt dir to lose the execute bits and stop acting
+like a directory.
+
+Simple fix is create INSTALL_MODE_DIR and use it when installing
+directories.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ include/mk/env_post.mk  | 1 +
+ include/mk/functions.mk | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
+index ab31da73a..c2e85439a 100644
+--- a/include/mk/env_post.mk
++++ b/include/mk/env_post.mk
+@@ -58,6 +58,7 @@ INSTALL_TARGETS			:=3D $(patsubst $(abs_srcdir)/%,%,$(IN=
STALL_TARGETS))
+ # The large majority of the files that we install are going to be apps an=
d
+ # scripts, so let's chmod them like that.
+ INSTALL_MODE			?=3D 00775
++INSTALL_MODE_DIR		?=3D 00775
+=20
+ $(abspath $(addprefix $(DESTDIR)/$(INSTALL_DIR)/,$(sort $(dir $(INSTALL_T=
ARGETS) $(MAKE_TARGETS))))):
+ 	mkdir -p "$@"
+diff --git a/include/mk/functions.mk b/include/mk/functions.mk
+index 60dbed395..8e4bc973c 100644
+--- a/include/mk/functions.mk
++++ b/include/mk/functions.mk
+@@ -18,7 +18,7 @@ INSTALL_FILES		+=3D $$(abspath $$(DESTDIR)/$(3)/$(1))
+=20
+ $$(abspath $$(DESTDIR)/$(3)/$(1)): \
+     $$(abspath $$(dir $$(DESTDIR)/$(3)/$(1)))
+-	install -m $$(INSTALL_MODE) $(shell test -d "$(2)/$(1)" && echo "-d") $(=
PARAM) "$(2)/$(1)" $$@
++	install $(shell test -d "$(2)/$(1)" || echo "-m $(INSTALL_MODE)") $(shel=
l test -d "$(2)/$(1)" && echo "-m $(INSTALL_MODE_DIR) -d") $(PARAM) "$(2)/$=
(1)" $$@
+ 	$(shell test -d "$(2)/$(1)" && echo "install -m "'$$(INSTALL_MODE) $(PAR=
AM)' "$(2)/$(1)/*" -t '$$@')
+ endef
+=20
+--=20
+2.43.0
+
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/me=
ta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
index 4c19d870..560e9b4e 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
@@ -31,6 +31,7 @@ SRC_URI =3D "git://github.com/linux-test-project/ltp.git;=
branch=3Dmaster;protocol=3Dht
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_R=
E.patch \
            file://0001-ltp-fix-build-failure-with-glibc-2.43.patch \
+           file://0001-include-mk-Fix-installing-subdirs.patch \
           "
=20
 inherit autotools-brokensep pkgconfig
--=20
2.43.0


