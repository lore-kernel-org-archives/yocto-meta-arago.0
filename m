Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by arago-project.org (Postfix) with ESMTPS id 178AC52A6B
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:36 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id j6so6851639oag.22
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=aUKKani/FkAb9cM3POg9OJswj1q+XuZYn/3FPFH8zlM=;
	b=bNruiOSpH3XaDvZeQ591GLyAY1A3B9rGwqNy2IWNUId0OZ0H//n3lo1j/w5JGgcWNI
	RnN+BgTlaXTh/XKDIJrqy6dWgxqtanOWzMSH3jOQRkRL5L96fJ/x8Kc1E6r7QEofDB2o
	65/1OcFfmLN0VHzT1AMMcoukW9OnoIjFhXti/3ri6zjsq7AANbkiJd5NSCJU6J6ghRJx
	wy6iYInSgPEjMv6ZdGZ8n7GcAEPai9C3UQq59c1noxb6lvM3TphbyqlksXQ3kYom6+nr
	6YW7LhEKv4eE3k8n2Nw9Wp43wszickYiCKheyUD/qyXN+QYtHpVaUoPBpJDSCLz93A+h
	NlVw==
X-Received: by 10.60.8.65 with SMTP id p1mr12508685oea.4.1360629995495;
	Mon, 11 Feb 2013 16:46:35 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.33
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:34 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:06 -0600
Message-Id: <1360629979-24789-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 05/18] ti-crypto-examples: Add ARM9 support
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:36 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Previously crypto examples were fixed to cortex A8
* Git repository were updated to add ARM9 support by placing ARM9 and Cortex
  A8 versions into separate directories.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-crypto-examples/ti-crypto-examples_git.bb   |   19 +++++++++++++++----
 1 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index 43810e2..648d7dd 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -1,24 +1,35 @@
 DESCRIPTION = "TI Cryptography Example Applications"
 HOMEPAGE = "http://arago-project.org/git/projects/?p=crypto-example-apps.git;a=summary"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
+LIC_FILES_CHKSUM = "file://armv5te/AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5 \
+                    file://armv7a/AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
 SECTION = "console"
 DEPENDS += "openssl"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH ?= "master"
-SRCREV = "37aad72a4d49d0a6dbe934495e5c3bd973a72f1a"
+SRCREV = "95007ae6a4284841e624680afff8e0859f28d429"
 
 SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/"
+
+# This software contains two directories depending on ARM architecture
+SOURCE_DIR = "${S}/${ARMPKGARCH}"
+
+# Specify armv5te for ARM9 devices
+SOURCE_DIR_omapl138 = "${S}/armv5te"
 
 do_compile() {
+    cd ${SOURCE_DIR}
+
     # build the release version
     oe_runmake release
 }
 
 do_install() {
+    cd ${SOURCE_DIR}
+
     oe_runmake DESTDIR=${D} install
 }
-- 
1.7.0.4


