Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DA69852A93
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2012 14:55:11 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAREt9rJ007195
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2012 08:55:10 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAREt9BA012537
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2012 20:25:09 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 27 Nov 2012 20:25:08 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAREsqoN026073;
	Tue, 27 Nov 2012 20:25:07 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Nov 2012 08:54:47 -0600
Message-ID: <1354028089-4919-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1354028089-4919-1-git-send-email-Chase.Maupin@ti.com>
References: <1354028089-4919-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] crypto-tasks: Add ti-crypto-examples
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
X-List-Received-Date: Tue, 27 Nov 2012 14:55:12 -0000
Content-Type: text/plain

* Add the ti-crypto-examples package to the list of crypto
  tasks for both the host and target.
* Add the ti-crypto-examples package to the arago-source-ipk
  conf file to generate the sourceipk.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    3 +++
 .../tasks/task-arago-tisdk-crypto-sdk-host.bb      |   10 ++++++----
 .../recipes-core/tasks/task-arago-tisdk-crypto.bb  |    3 ++-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index bbc0662..d23e564 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -46,6 +46,9 @@ SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses = "docs/licenses"
 CREATE_SRCIPK_pn-matrix-gui = "1"
 SRCIPK_INSTALL_DIR_pn-matrix-gui = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-ti-crypto-examples = "1"
+SRCIPK_INSTALL_DIR_pn-ti-crypto-examples = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-qml-carinfo = "1"
 SRCIPK_INSTALL_DIR_pn-qml-carinfo = "example-applications/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb
index 12e3362..aca04f9 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb
@@ -2,20 +2,22 @@ DESCRIPTION = "Task to install crypto sources in SDK"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r0"
+PR = "r1"
 
 inherit task
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 ALLOW_EMPTY = "1"
 
-CRYPTO_RDEPENDS = ""
+CRYPTO_RDEPENDS = " \
+    ti-crypto-examples-src \
+"
 
-CRYPTO_RDEPENDS_am37x-evm = "\
+CRYPTO_RDEPENDS_append_am37x-evm = "\
     ti-ocf-crypto-module-src \
 "
 
-CRYPTO_RDEPENDS_am3517-evm = "\
+CRYPTO_RDEPENDS_append_am3517-evm = "\
     ti-ocf-crypto-module-src \
 "
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb
index 0adfc7a..32841d1 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -14,6 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 CRYPTO_SUPPORT = "\
     openssl \
     openssl-misc \
+    ti-crypto-examples \
     "
 
 # Add crypto hardware support for am37x-evm
-- 
1.7.0.4


