Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B44FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 15:10:45 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15412.1777389035792281606
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 08:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wSk0BW5W;
 spf=pass (domain: ti.com, ip: 52.101.201.29, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEG8fhnT1eVDh/vgYq1HUTmwpVEOcRVDPEmU5TMQLbdb46b3hLtDWpqCNh4V5OOw64xqmt7UIX9+Hcdu1pfNgg+KtGvU86XutU+MTIT+3jhblOkm6SC4Q9r4MyQlH449jNclw2EdFkC+3LOfVZgw5Q5LSroqyryzTOk3oGUyRCqDfIM44RKhFyiq1f8QAu6G1+LzHPtjmNFEpM3c70SoM+bchG7p/L7YSeqANMlGa+ITmoryciU7E214H7g4FSXoiEGt+ddbltYZ1+bcu421FalJo8+TGbI8L5M4VgPRHZGyhSvD7hGqQ/BLwFi1m28bGWrClIiM4aZtmzLECEmBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMMKXhRjXdM6G8+RL48MVq+TZtZfTRL56Qeg4UlALJI=;
 b=RqDba9d0+TyikBzcrnWFdtRMGFc4tFCfsS6ztuwFgHzuTJJkcxu51nmJKrrGl20Ee9fCQxUGdv1f6qB13/7xoqezK6qSOOxA6cePSwR5QgpIhXaDO2HcJPH7vQ98KMOSIpbymWALZb8YR0sU6Oz2Z0oFnLqVTi/b5zWXMs0UN3DUjZPpKBG22ylOUfCrz9MjRU8NS/IFlw0sKacxim8AKqSqIBX0WzFTu5DBMNOfGfbiGoI2whnRnSZlUB2X1lGU4d/c0vXDWoT9niIl8vGioSnnAb4zsramsU22aMJ/8hFaSZ4NFbpsXsIy1Um46EhP3hMDCODQv0J9kQ3ZPAIm+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMMKXhRjXdM6G8+RL48MVq+TZtZfTRL56Qeg4UlALJI=;
 b=wSk0BW5WQvmMuXAbEDKfGNE91SfALEoOZVFE+B+sHLgcLXi728Rz6YbHqKI/skUwYMAMzqji+cm58Wzw/NhEz5uzFn/dF++sfvrF0GGMxzidTsFrEoZwTKBJK5GUqR96HvbXL7hcNIX/02X+ukBIQed2f8hOAPqP3iTUrKCxEkU=
Received: from MN2PR06CA0005.namprd06.prod.outlook.com (2603:10b6:208:23d::10)
 by CY8PR10MB7267.namprd10.prod.outlook.com (2603:10b6:930:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.28; Tue, 28 Apr
 2026 15:10:33 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:23d:cafe::a3) by MN2PR06CA0005.outlook.office365.com
 (2603:10b6:208:23d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 15:10:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 15:10:31 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:10:19 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:10:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 10:10:19 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SFAJBN1428403;
	Tue, 28 Apr 2026 10:10:19 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wHk4p-00000003ZXj-2cxR;
	Tue, 28 Apr 2026 10:10:19 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] ltp-ddt: Fix install error
Date: Tue, 28 Apr 2026 10:10:19 -0500
Message-ID: <20260428151019.851603-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|CY8PR10MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: bd6a32b7-6f22-42d2-f80b-08dea5384a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	MO8m9fSLCBg297ZgmBh3XaVDdjmID+mVeDbxKQCrHqgTg3HY8TROVmZtIfcqRl5HvqRcxrPECD1vSTKWWJvRbj7bNqM/ju44q4jsB3b9/6GTqfPXozT4FcNG92aCy7k0JsAOSmxxNbD8RQjOS0SQr9BlNhDnJh707FC0sizWmqAizoSJi/gObSilfvqRA0PfoYHALXzZ3GH5Ikf2YiIqzK/3IMH+6KJhG/lO6Hy7BQ9aftwxIQGLLjU6Mj7xy56Rd3Zycb6IWmFNQwrxEmZSU/40u2ujtV0laYTZDfhMvrJYxGti7izisLzkTDL2hCNML/+BJiRMCB3YDk8A9a6F1hH/8ci6C/aJ7SaLmsisglUFO5jlgDSVMlRcTFytneJm1dplPNxxlJFJAbVNA9ot9zLuq90y12I7bd9C1b9exj3UWhruS5rK8/Ke77a80e4BBJoGO2LRoGmxwTD63v/CvueDIY8U9QQzaXSTRznF7niTfwG3Dd2V78+dlnWl8kOuZeFFBog6iFUA/BgczjR7XLMPUlYvp+9FBjdpIide7vm2JBTqtW0CPFom79L3RmHe1181jw8uk+QF5/82M2ouP6JEEWMoDLGTxK0zO0bwHcNMwYImjQE/0f26QYsTi+433lR8EpW4WF7dOP1hXRoX/wCTjoVs57cEVYUTcOKO9e4kT4X77kVg5YUxXTcQL0Fh5YdXCis32eGznTzK2n0/8dgX6bUZhBcTa298+5zCxiz+9pPza9Yd4IiAJzczlQ93kGAbB6WtkMy/i1Slojrb2Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pRZMnXXKvhWGeUITEfKjRtSyFU1PezyJmGJHpf+uYxjCPecR3cKlTykNJm5mvKAPwSJ8Z0k+l5RZSpDhToCkMFkTKGO/yRkTDCHrX0zrCOBLnBCOoS4xdVZT2M4fMOOFoBOcfPT+UDjHGuZbW/JBQaCOeXBXYjZjnHqKe5tBfwiUEBhLKbMYkHHcJtK9kTMQKRS964pvgfNNpBs2SHYRCNAnQKmYuXZvEAXmiV/MXbc37yLP2RqZhYo5IRP9KwOC+3tfedVVvcVgsoGuh1TKVzR7/JvSpJYUrA8vOz9veNjRyDwxVOAzyuomVVs5zZi2UcVIYGGplI2oFoqYBve00PsHW2tUSA2mSOXWB2M7YrX8jzYGnt9KOjjhBHuI4ogtXdMyPnI6LIeZIrTxPScDh3COqUAJNguQ6ArOtBUsJCPTvr+mQ+vaEkGWl/3IMumO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 15:10:31.3261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6a32b7-6f22-42d2-f80b-08dea5384a2c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7267
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Apr 2026 15:10:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17502

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
v2: Move the SRC_URI change to ltp-ddt and not in the ltp include.

 ...01-include-mk-Fix-installing-subdirs.patch | 49 +++++++++++++++++++
 .../ltp-ddt/ltp-ddt_20260130.bb               |  2 +
 2 files changed, 51 insertions(+)
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
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 0168d125..6afff2ae 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -17,6 +17,8 @@ BRANCH ?=3D "master"
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
 SRC_URI:prepend =3D "git://git.ti.com/git/test-automation/ltp-ddt.git;prot=
ocol=3Dhttps;branch=3D${BRANCH} "
=20
+SRC_URI:append =3D " file://0001-include-mk-Fix-installing-subdirs.patch"
+
 export prefix =3D "/opt/ltp"
 export exec_prefix =3D "/opt/ltp"
=20
--=20
2.43.0


