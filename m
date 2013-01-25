Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by arago-project.org (Postfix) with ESMTPS id 0C9C5529E1
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:18 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id tb18so731503obb.17
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=id9nn0B6d3X39Fz7euWmb2xYh039ysn54D1FXai1m6Q=;
	b=0p6EyoYAiUI2PDlV3yDYhkTssl4EQQJkU6gJn0+laMUygKj9FaHn0c9O9yq2JbFBBl
	nqYUTQlN6jB2EKckO4wZijIyeWhKJ6kQ/tQWBdr0zr/LKDusBH2R8gbMDdQaZqTFK55q
	y6SnhP5JLYo4xrxYLSr41RQPviTLBrbFaj4prHpJRJoCQq5QHj/yaZu3upcVHoZCkps5
	Sqd997S4XbmjRDEiIShFZ5597KedU33Wfj/YXqlMcddzvjG2pC2Mbp9XhkZHCk2WRLzs
	57QKhqQMiHKWez2LirjbNygibgZfdmZUru9G5zZ+lJNXZGCDACQnDNSmR/dVMPhXrGFg
	1MxQ==
X-Received: by 10.60.30.201 with SMTP id u9mr5860411oeh.28.1359151097465;
	Fri, 25 Jan 2013 13:58:17 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.15
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:16 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:51 -0600
Message-Id: <1359150851-23602-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 11/31] crypto-tasks: Add ti-crypto-examples
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:18 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

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


