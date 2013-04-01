Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9C28352A39
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:55:09 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31Et78I028593
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:55:08 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31Et624011627
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 20:25:06 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 20:25:06 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EsxCd020052;
	Mon, 1 Apr 2013 20:25:05 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 09:54:42 -0500
Message-ID: <1364828095-28755-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364828095-28755-1-git-send-email-fcooper@ti.com>
References: <1364828095-28755-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 04/17 v2] ti-compat-bluetooth: Add back old r5.00.18 compat-bluetooth release version
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
X-List-Received-Date: Mon, 01 Apr 2013 14:55:09 -0000
Content-Type: text/plain

* Current am180x-evm ships with a PG 2 wilink 6 module that isn't supported in
  newer wilink 6 releases.
* A newer PG 3 wilink 6 module is available for am180x-evm but needs to be
  purchased separately..
* Bring old r5.00.18 ti-compat-bluetooth recipe with updated recipe name to add
  support for am180x-evm default wilink 6 module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Add patches to SRC_URI rather than depending on the .inc to add these patches.

 .../ti-compat-bluetooth_r5.00.18.bb                |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.00.18.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.00.18.bb b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.00.18.bb
new file mode 100644
index 0000000..fa789cc
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.00.18.bb
@@ -0,0 +1,12 @@
+require ti-compat-bluetooth.inc
+
+PR_append = "-r0"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/865/5622/compat-bluetooth-wl12xx-2012-05-22-r5-18.tgz \
+           file://0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch \
+           file://0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch \
+           file://0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch \
+"
+
+SRC_URI[md5sum] = "85118756a605ebd8f4fbff19995368a6"
+SRC_URI[sha256sum] = "d250a6447de54f0776a12ca604bf2a2a48b022108b699de5008f48462e535393"
-- 
1.7.0.4


