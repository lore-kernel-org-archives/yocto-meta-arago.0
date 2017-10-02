Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E090B52A65
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 21:45:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92LjK6W012494
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 16:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506980720;
	bh=Q/dpLhT3JFyQWKhk0RzqbtEbSSfpki8TH68oHuP8FLU=;
	h=From:To:CC:Subject:Date;
	b=Gxt++t5tKvok6tnYg1uuA53yJ6EmRQWvdP6ME62qMhRAD2chQLgW6jSXH7J0D+Mjr
	nsfhU8QFNgVQgYCuRxz2EhFffkOLduSs3eUgXaJdlzze8INa+vm03mle5tMCAvFTeQ
	4/q2wyVUKR2yOR7KTWtaevPG6w5Sx7HEHmzAydWM=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92LjFnE013861
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 16:45:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 16:45:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 16:45:15 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92LjF7K007309;
	Mon, 2 Oct 2017 16:45:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Oct 2017 17:45:14 -0400
Message-ID: <1506980714-9971-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH v2] pm/vps-lld, cmb/audk2g-addon: fix double-inclusion warning for ti-paths.inc
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2017 21:45:31 -0000
Content-Type: text/plain

ti-pdk.bbclass already includes it.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - same for vps-lld, cmb-addon and audk2g-addon

 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb |    1 -
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb       |    2 +-
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb             |    1 -
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb           |    1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
index 6959864..0cb9ff1 100644
--- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
+++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
@@ -1,6 +1,5 @@
 SUMMARY = "TI RTOS Audio add-on software for k2g"
 
-require recipes-ti/includes/ti-paths.inc
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
index 4d69863..0fade74 100644
--- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "TI RTOS software supporting circular microphone array board"
-require recipes-ti/includes/ti-paths.inc
+
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index 6fedc80..05388e5 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -1,6 +1,5 @@
 SUMMARY = "TI RTOS driver for Power Management module (PM)"
 
-require recipes-ti/includes/ti-paths.inc
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
index f13e2fc..88f79e1 100644
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -1,6 +1,5 @@
 SUMMARY = "TI RTOS Low level driver for Video Processing Subsystem (VPS) "
 
-require recipes-ti/includes/ti-paths.inc
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
-- 
1.7.9.5


