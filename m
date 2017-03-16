Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B10B6520E3
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 20:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 095F720B6A;
	Thu, 16 Mar 2017 20:23:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hEpQd2auNCLP; Thu, 16 Mar 2017 20:23:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDB5420174;
	Thu, 16 Mar 2017 20:23:07 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 685EA1623AE;
	Thu, 16 Mar 2017 16:23:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 16 Mar 2017 16:23:06 -0400
Message-Id: <1489695786-30661-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth/morty/master][PATCH] opencl: package new binaries into runtime package
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
X-List-Received-Date: Thu, 16 Mar 2017 20:23:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Previous versions packaged only libOpenCL.so.* and few headers in the main
package, hence binary IPK packages were getting renamed to "libopencl1*.ipk"
by debian.bbclass in accordance with Debian Library Packaging Guide.

The new version now adds couple binaries and debian.bbclass no longer does
the renaming. Unfortunately, all the existing binary feeds and shared states
recorded dependencies on libopencl1*, not opencl*, hence breaking incremental
builds or live updates with "opkg update/install".

By packaging new binaries into ${PN}-runtime subpackage debian.bbclass gets
unblocked and existing dependencies satisfied.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 1d39274..059be38 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -11,7 +11,7 @@ inherit cmake systemd
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PACKAGES += " ${PN}-runtime"
+PACKAGES =+ "${PN}-runtime"
 
 DEPENDS = " ocl-gl-headers \
             opencl-monitor \
@@ -39,7 +39,6 @@ RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
 
 ALLOW_EMPTY_${PN}-runtime = "1"
 
-
 S = "${WORKDIR}/git/host"
 
 export WANT_LLVM_RELEASE = "3.6-ti"
@@ -68,6 +67,8 @@ do_install_append() {
 
 SYSTEMD_SERVICE_${PN} = "ti-mct-daemon.service"
 
+FILES_${PN}-runtime += "${bindir}"
+
 FILES_${PN} += " \
     ${datadir}/ti/opencl/* \
 "
-- 
2.7.4


