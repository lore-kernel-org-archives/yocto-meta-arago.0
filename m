Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ye0-f173.google.com (mail-ye0-f173.google.com
	[209.85.213.173])
	by arago-project.org (Postfix) with ESMTPS id DA7C552A89
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:47 +0000 (UTC)
Received: by mail-ye0-f173.google.com with SMTP id l5so920878yen.4
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=8cmF6TAt2zQJWg1uxdimBzdhiuXbyOeAaBobJdzG4O4=;
	b=Yb3RQInLfstnpAMsk+eJNNupN2ADrfIuLNd6L/B2jdFxDv9E4ZUOwRZouyQVH/jRsF
	jzZQfwGksrj9WOrI8D6rDHM7l0afWhywpzJqrVmBV0QCahffFh5TyzrNXaM1mpkpS54A
	EbB63A3L4g+Swd3Sop3lq5nG1oelJl/Ko5Rm6napgIaIF6utpuYmPdxqB1940tWn1/EH
	YRTpzqiBS5dyy0lYG44oJFcxi89zGniKPvwoJ1oBKoOx1dV5JacFyI/Q/HinkijPOEoH
	n9lCduAXJBiJ7l1rd305LFFgz1dyCm1Yrcq93WLJgzEUWUU5pT1SQf7IaHgaVuaUkzy2
	lZWw==
X-Received: by 10.236.85.76 with SMTP id t52mr17069395yhe.61.1361141627376;
	Sun, 17 Feb 2013 14:53:47 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.45
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:46 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:08 -0600
Message-Id: <1361141595-1687-13-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 13/20] arm-benchmarks: Move makefiles into ARCH directory
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:48 -0000

From: Jeff Lance <j-lance1@ti.com>

* Moving makefile into Architecture directory making it possible to install
  only one ARCH on a target system.

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index b19c1ed..0e4ae85 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -4,25 +4,24 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-PR = "r3"
+PR = "r4"
 
 BRANCH ?= "master"
-SRCREV = "e9fbf7990e93d97e7471e509626969d244cca214"
+SRCREV = "f78411fbd9cb81c36c7067a74fd415ce7ce45dc4"
 
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


