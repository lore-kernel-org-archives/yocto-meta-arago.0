Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B800152A9A
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 66BA540C31;
	Wed,  8 Apr 2020 00:45:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id waqapeAnLgr6; Wed,  8 Apr 2020 00:45:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5110C40C3D;
	Wed,  8 Apr 2020 00:45:10 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2A22B171C2F;
	Tue,  7 Apr 2020 20:45:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:52 -0400
Message-Id: <1586306702-7953-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 14/24] linalg: require dsp machine and opencl, openmp distro features
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb    | 4 ++--
 meta-arago-extras/recipes-ti/linalg/linalg.inc                       | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index 4b3e9db..63b9f20 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -17,12 +17,12 @@ EXTRA_PKGS = " \
 
 #    ti-fftw-examples
 EXTRA_PKGS_append_k2hk = " \
-    linalg-examples \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples')} \
 "
 
 #    ti-fftw-examples
 EXTRA_PKGS_append_dra7xx = " \
-    linalg-examples \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples')} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index 60a9b4b..6883b99 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -10,6 +10,11 @@ COMPATIBLE_MACHINE = "k2hk|dra7xx"
 require recipes-ti/includes/arago-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
+REQUIRED_DISTRO_FEATURES = "opencl openmp"
+
 SRC_URI = " \
 	git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH} \
 	file://0001-Makefile-fix-toolchain-variables.patch \
-- 
2.7.4


