Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by arago-project.org (Postfix) with ESMTPS id 2DDAA52A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Mar 2013 03:11:02 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id l20so4943137oag.37
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2013 19:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=59QzYKwDV05eGByBRTz7tdB3lSbx94g1vqC8e+bCRbU=;
	b=CA55pSU5OnQozLN3pK++VVs408u2POBPvZ5xXmL7vSGhgW+cRNdj6TTZf8C1GzscFX
	O52WDq3xAiUwwetsqHOECV95ZQ1ZH/Udlp1AAMmWZ1rOxsGv6ZnjjUNWGECQPlhR8p6W
	OnckOpr4yNeI72spRRzxdj4+JJXW0Z5vJp8WsV8+zy8lKYf8MLL6hVKQjyt6gLKCL45H
	VfMWDfGHT3jEsC9h9GZPpd1V1uYN0uy2BBVJC7PD8n4UqjFmssuy1eALLvJ2aKrvSj2X
	PLDHHY+ZVV7RcmM+ji6QoKVsVNn+LmGlCEhIiCeVAyYxKUQ21zjX1CFv7CyRh+0m0rio
	FOSA==
X-Received: by 10.182.220.10 with SMTP id ps10mr7564156obc.21.1362107461795;
	Thu, 28 Feb 2013 19:11:01 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id i19sm15854877obf.0.2013.02.28.19.10.59
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 19:11:00 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Thu, 28 Feb 2013 21:10:41 -0600
Message-Id: <1362107447-11234-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362107447-11234-1-git-send-email-fcooper@ti.com>
References: <1362107447-11234-1-git-send-email-fcooper@ti.com>
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 3/9] arm-benchmarks: Move makefiles into ARCH directory
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
X-List-Received-Date: Fri, 01 Mar 2013 03:11:02 -0000

From: Jeff Lance <j-lance1@ti.com>

* Moving makefile into Architecture directory making it possible to install
  only one ARCH on a target system.
* Update Rules.make relative path

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index b19c1ed..23acd42 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -4,25 +4,24 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-PR = "r3"
+PR = "r4"
 
 BRANCH ?= "master"
-SRCREV = "e9fbf7990e93d97e7471e509626969d244cca214"
+SRCREV = "9b7b4fbde8fcf796a23da2a464dbf934e550f6c9"
 
 SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
 PLATFORM_ARCH = "${ARMPKGARCH}"
-# Use ARCH format expected by the makefile
 PLATFORM_ARCH_omapl138 = "armv5te"
 
 do_compile() {
 	export CROSS_COMPILE=${TARGET_PREFIX}
 	# build the release version
-	make ARCH=${PLATFORM_ARCH} release
+	oe_runmake -C ${PLATFORM_ARCH} release
 }
 
 do_install() {
-	make ARCH=${PLATFORM_ARCH} DESTDIR=${D} install
+	oe_runmake -C ${PLATFORM_ARCH} DESTDIR=${D} install
 }
-- 
1.7.0.4


