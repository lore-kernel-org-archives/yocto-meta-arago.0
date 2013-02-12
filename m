Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id 74BDC52A12
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:32 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so7025569oag.32
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=amkHVGJ9OqnGP4diNDDvhGGkroMbJvG0oXkRe8UswA0=;
	b=EU2rSgC3F8WLijiMNv+uMxviTZ8FSJ0A5Z86TvLFAyw50XYCmCi/dXlRZHgZj1RPxy
	w1ZshxaUq5o1ah8wGcDaI3Wjt5qfdBkTh+IDg0QPUQFQz0Om4GvwWM3VwY8lv8vb5s3d
	CcufBO28g21ylG+ilNLI/4sh8ggRPUzbVkQzoasfYdYjuhPBH54NEKngoJ5bHWXRbIRj
	k54qGmqPhZ213fGy4rJ52H/LPKkkXRzODxMTFPwqB0kXtMe9cIQgRFbsDTSlHSXOJUtX
	s72b/5Qs6w5Ouqa88kKYMlLNm5nnb+3gSfAN8IFKW8P243lNdQvYTUZwrmGRlByoZT5e
	ek6Q==
X-Received: by 10.182.167.70 with SMTP id zm6mr12177978obb.93.1360629991898;
	Mon, 11 Feb 2013 16:46:31 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.29
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:30 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:04 -0600
Message-Id: <1360629979-24789-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 03/18] arm-benchmarks_1.3: Tweak to allow am180x-evm to be built
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:32 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Makefile expects armv5te for ARM9 devices which was done in oe-classic.
* In oe-core ARMPKGARCH only specifies armv5 for am180x-evm.
* Pass in ARCH=armv5te to make for omapl138 devices

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 9fda6b0..b19c1ed 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH ?= "master"
 SRCREV = "e9fbf7990e93d97e7471e509626969d244cca214"
@@ -13,14 +13,16 @@ SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=git;br
 
 S = "${WORKDIR}/git"
 
+PLATFORM_ARCH = "${ARMPKGARCH}"
+# Use ARCH format expected by the makefile
+PLATFORM_ARCH_omapl138 = "armv5te"
+
 do_compile() {
 	export CROSS_COMPILE=${TARGET_PREFIX}
-	export ARCH=${ARMPKGARCH}
 	# build the release version
-	make release
+	make ARCH=${PLATFORM_ARCH} release
 }
 
 do_install() {
-	export ARCH=${ARMPKGARCH}
-	make DESTDIR=${D} install
+	make ARCH=${PLATFORM_ARCH} DESTDIR=${D} install
 }
-- 
1.7.0.4


