Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 483E752094
	for <meta-arago@arago-project.org>;
	Tue, 16 Oct 2018 04:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5A5AC20D0B;
	Tue, 16 Oct 2018 04:05:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VvVfA7ivujBL; Tue, 16 Oct 2018 04:05:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 324F420CE1;
	Tue, 16 Oct 2018 04:05:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id AB18A164879;
	Tue, 16 Oct 2018 00:05:21 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 16 Oct 2018 00:05:21 -0400
Message-Id: <1539662721-45556-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539662721-45556-1-git-send-email-denys@ti.com>
References: <1539662721-45556-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/2] arm-compute-library: do not hardcode Linaro toolchain, fix gcc8 errors
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
X-List-Received-Date: Tue, 16 Oct 2018 04:05:32 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/arm-compute-library/arm-compute-library_git.bb  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
index 8a65ade..1c4bed0 100644
--- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
@@ -9,7 +9,7 @@ SRC_URI = " \
     git://github.com/ARM-software/ComputeLibrary.git;branch=${BRANCH} \
 "
 
-PV  = "18.05"
+PV = "18.05"
 
 BRANCH = "master"
 SRCREV = "e2542c9f35ca427286822cd0c9296f49914f78b0"
@@ -17,12 +17,14 @@ SRCREV = "e2542c9f35ca427286822cd0c9296f49914f78b0"
 S = "${WORKDIR}/git"
 
 do_compile_prepend() {
+    sed -i 's/arm-linux-gnueabihf-/${TOOLCHAIN_SYS}-/' SConstruct
+    sed -i "s#env.Append(LINKFLAGS = \['-fopenmp'\])#env.Append(LINKFLAGS = \['-fopenmp','--sysroot=${STAGING_DIR_TARGET}'\])#" SConstruct
     unset CC CXX
 }
 
 inherit scons
 
-EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0"
+EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC -Wno-unused-but-set-variable -Wno-ignored-qualifiers -Wno-noexcept ${TOOLCHAIN_OPTIONS}" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0"
 
 LIBS += "-larmpl_lp64_mp"
 
-- 
2.7.4


