Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3D2BE529F2
	for <meta-arago@arago-project.org>;
	Tue, 14 Jan 2020 17:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E7E4F40B37;
	Tue, 14 Jan 2020 17:30:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1R7kZ_jLRLQ6; Tue, 14 Jan 2020 17:30:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF52440A52;
	Tue, 14 Jan 2020 17:30:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5D1E3174374;
	Tue, 14 Jan 2020 12:30:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 14 Jan 2020 12:30:09 -0500
Message-Id: <1579023009-47524-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] ti-world: drop packagegroup- prefix and add more misc packages
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
X-List-Received-Date: Tue, 14 Jan 2020 17:31:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-misc.bb     | 11 +++++++++++
 .../packagegroups/{packagegroup-ti-world.bb => ti-world.bb}   |  1 +
 2 files changed, 12 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-ti-world.bb => ti-world.bb} (98%)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb
new file mode 100644
index 0000000..091d728
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Task to install additional miscellaneous packages"
+LICENSE = "MIT"
+PR = "r0"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    nano \
+    mc \
+    rsync \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
similarity index 98%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
rename to meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 411ec46..9907015 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -45,4 +45,5 @@ RDEPENDS_${PN} = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
+    packagegroup-arago-misc \
 "
-- 
2.7.4


