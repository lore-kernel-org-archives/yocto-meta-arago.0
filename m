Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by arago-project.org (Postfix) with ESMTPS id 6488452AA5
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:16 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wc20so1049949obb.36
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=HK1yqtxsnK9phpzCjpIxcxIf+C5aTprSg+02Wh9gEZE=;
	b=TdMMx8qKHoDbavwjqWzlyWGggpBCQM/P4n1DvbEJQoJb0m0/3WaXS1sCuFuG9gfJU8
	dut/VYrxf7yw7f6AjDNoUHeorCwC44UMKEv/+vkzQVIRbVcSzCDSbKJtmrfiTunNaNkq
	6O0HSdUKlC15aE12Qhh/0WGbfTSwYiJu/Rs/QmCYyEGuXRNlqkzFopgDA1uEjMcys0HM
	/QwJu4ZlR/R2Fo1Sh1x1LrgzDOxGRfN2/RGSRlO6FIFQoA0nH59USOyzWIskYRg0jBC3
	e16iU3BS5543pCP17ADwQOA51lImV4YqvA4gQZoSyGdjs+2abis0K2rXYNj94DbtJlH9
	2/FQ==
X-Received: by 10.60.4.35 with SMTP id h3mr5787413oeh.123.1359151095812;
	Fri, 25 Jan 2013 13:58:15 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.14
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:14 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:50 -0600
Message-Id: <1359150851-23602-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 10/31] ti-crypto-examples: Add cryptography example C applications
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:16 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* Added recipe to build example C applications that use the
  openssl libraries for cryptographic operations.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ti-crypto-examples/ti-crypto-examples_git.bb   |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb

diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
new file mode 100644
index 0000000..a35524f
--- /dev/null
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "TI Cryptography Example Applications"
+HOMEPAGE = "http://arago-project.org/git/projects/?p=crypto-example-apps.git;a=summary"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
+SECTION = "console"
+
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV = "d3cc223206367a02097c7ad4e997cf2bef975277"
+
+SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    # build the release version
+    oe_runmake release
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
-- 
1.7.0.4


