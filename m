Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 55E775297E
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2018 16:06:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8OG5tMg046678
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 11:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537805155;
	bh=BYi7LghV/rcMWxjQgYuN7W6o+xgOzhs4VjCJ5MmUNqA=;
	h=From:To:CC:Subject:Date;
	b=fJYZnPyZgKJGnHBkozvai5uluLwL7KbgX07vJHI4fcEp2DhYQC5oP69CV0RegTnBB
	KyER65wc4C+61D33G0MKSd4HdYb2pLp3gve+Awl5JXV6qhlLL9gl9sUHjj2pohRhKA
	m1o171y6W9M04HxVQWwMQpHN49yGb96cb8ZfPWBQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8OG5sTw024907
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 11:05:54 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 24 Sep 2018 11:05:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 24 Sep 2018 11:05:54 -0500
Received: from UDA0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8OG5sNX011650;
	Mon, 24 Sep 2018 11:05:54 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Sep 2018 12:05:50 -0400
Message-ID: <1537805152-4059-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko][PATCH 1/3] arm-compute-library: Add executables to the filesystem
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
X-List-Received-Date: Mon, 24 Sep 2018 16:06:04 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../arm-compute-library/arm-compute-library_git.bb         | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
index d9fa8b0..8a65ade 100644
--- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
@@ -29,20 +29,30 @@ LIBS += "-larmpl_lp64_mp"
 do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
 
-    install -d ${D}${libdir}
+    install -m 0755 -d ${D}${libdir}
     for lib in ${S}/build/*.so
     do
-        install -m 0644 $lib ${D}${libdir}
+        install -m 0755 $lib ${D}${libdir}
     done
 
+    # Install 'example' and benchmark executables
+    install -d ${D}${bindir}
+    find ${S}/build/examples/ -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
+    cp $CP_ARGS ${S}/build/tests/arm_compute_benchmark ${D}${bindir}
+
     # Install built source package as expected by ARMNN
     install -d ${D}${datadir}/${BPN}
     cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
 }
 
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+INSANE_SKIP_${PN} = "ldflags"
 INSANE_SKIP_${PN}-dev = "dev-elf ldflags"
 
 PACKAGES =+ "${PN}-source"
+FILES_${PN} += "${bindir}/*"
+FILES_${PN} += "${libdir}/*.so"
 FILES_${PN}-source = "${datadir}/${BPN}"
 INSANE_SKIP_${PN}-source = "ldflags libdir staticdev"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.9.1


