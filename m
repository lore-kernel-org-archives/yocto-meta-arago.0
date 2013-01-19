Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by arago-project.org (Postfix) with ESMTPS id 4233852AB8
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:53 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id k14so5038593oag.0
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JGoIDQJm/pRNjHv4uqxjzKKYuQC0HU6UMLNKKJEgTSI=;
	b=X+QGEdksd5pQZjQ2lYPRUpJwozecH41NzKIisW30fqhnogv/wjLptFMz2TJ+Slur8a
	aqQQJIQiMl7cuHDmd7wGD/VTS7vMbeYNdHRfK36SUwTlVBxCB/0qaZGzDw3HBlsSdHEd
	7FuRqnlwP7lOzRjATcWv6ImJugXJzk/y27iTAUwcp0YTrt0AvMAM8PG/FJFPp5m6RaJ+
	w6tpK5JynZMn9NVqdVKG+FiBslF6WeO/5rPrvQBwaKybTocalcgf0ARdkY/YhMiGS4Oq
	lbg1b2Ehje9jWM2GPVJClH/IYR5GI9TBgJTjcbM2rXydyfXKmVquG8JwK9fwjjk/pRek
	JDmA==
X-Received: by 10.60.31.49 with SMTP id x17mr10682450oeh.33.1358632372705;
	Sat, 19 Jan 2013 13:52:52 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.51
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:51 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:54 -0600
Message-Id: <1358632316-12266-29-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 29/31] task-arago-qte-toolchain-target: Add additional packages
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:53 -0000

* Adding additional packages that were automatically installed with Qt in
  classic Arago but not being done now.
* This insures the packages installed in the old SDK matches the new one.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-qte-toolchain-target.bb       |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
index f724c2c..331e235 100644
--- a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
@@ -7,6 +7,12 @@ PR = "r3"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+
+QT_SGX_SUPPORT = "\
+    libqt-embeddedopengl4-dev \
+    libqt-embeddedpvrqwswsegl4-dev \
+"
+
 RDEPENDS_${PN} += " \
         task-arago-standalone-sdk-target \
         qt4-embedded-mkspecs \
@@ -30,4 +36,8 @@ RDEPENDS_${PN} += " \
         libqt-embeddedwebkit4-dev \
         libqt-embeddedxml4-dev \
         libsqlite3-dev \
-        "
+        libqt-embeddedxmlpatterns4-dev \
+        libqt-embeddedmultimedia4-dev \
+        libqt-embeddeddeclarative4-dev \
+        ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles','${QT_SGX_SUPPORT}', '', d)} \
+"
-- 
1.7.0.4


