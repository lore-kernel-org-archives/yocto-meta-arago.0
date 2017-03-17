Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 17B0052A63
	for <meta-arago@arago-project.org>;
	Fri, 17 Mar 2017 19:38:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2HJc1Jt031503
	for <meta-arago@arago-project.org>; Fri, 17 Mar 2017 14:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489779481;
	bh=Ygfl7NAe6JpwnYcuLe6xXQUdUKLN1xzBgldKLBaneYo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F9r6bTBFvs4ZewWIWle7+3MethK1NahUdXxrGQkOtYFgZamPbpxcqMLjAqbf6J9N4
	99YCqFUhbo3JY+Gir1kiZ2qjQFvvIrqpSMvvkfpzYa+x3jr5wG6+THpXbh0Y/1Pk7n
	ymIl7PjfJzVYDqFqBsnBeLdSa43uUr7Qe/rpv2tk=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2HJc1BU030348
	for <meta-arago@arago-project.org>; Fri, 17 Mar 2017 14:38:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 17 Mar 2017 14:38:01 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2HJc07I007022;	Fri, 17 Mar 2017 14:38:01 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Mar 2017 15:37:52 -0400
Message-ID: <1489779474-16764-2-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489779474-16764-1-git-send-email-h-gou@ti.com>
References: <1489779474-16764-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [morty/krogoth][PATCH 2/4] packagegroup-arago-tisdk-addons*: add voxelsdk
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
X-List-Received-Date: Fri, 17 Mar 2017 19:38:02 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb   | 8 +++++++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb | 6 +++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b31d729..324b0a3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r33"
+PR = "r34"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -140,7 +140,13 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 
+EXTRA_PACKAGES = ""
+EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev"
+EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev"
+EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${EXTRA_LIBS} \
+    ${EXTRA_PACKAGES} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8bfcb82..043c76b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r54"
+PR = "r55"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -108,6 +108,10 @@ EXTRA_PACKAGES = " \
     protobuf \
 "
 
+EXTRA_PACKAGES_append_ti33x = " voxelsdk"
+EXTRA_PACKAGES_append_ti43x = " voxelsdk"
+EXTRA_PACKAGES_append_omap-a15 = " voxelsdk"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${UTILS_UBOOT_FW} \
-- 
1.9.1


