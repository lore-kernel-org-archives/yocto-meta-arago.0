Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5B9F952A31
	for <meta-arago@arago-project.org>;
	Mon, 16 Feb 2015 09:21:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1G9LDBn016816
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 03:21:13 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1G9LCcc028721
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 03:21:12 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Feb 2015 03:21:12 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1G9L9B6016555;
	Mon, 16 Feb 2015 03:21:11 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Feb 2015 14:51:08 +0530
Message-ID: <1424078468-481-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: libdce: Update to latest IPC 3.30.03.14
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
X-List-Received-Date: Mon, 16 Feb 2015 09:21:14 -0000
Content-Type: text/plain

Other fixes:
 * Mutex protection for dce_buf_lock/unlock
 * Multiplanar encode support
 * Fix multithread client indexing logic

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-multimedia/libdce/libdce_git.bb        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb b/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
index 308eadf..1512e47 100644
--- a/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
+++ b/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
@@ -4,13 +4,13 @@ LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31
 
 inherit autotools pkgconfig
 
-PR = "r1+gitr${SRCPV}"
+PR = "r2+gitr${SRCPV}"
 PV = "2.0"
 
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "1916cfef94c4ee41c2beedc9cd87b8916ad29895"
+SRCREV = "bb5786d7ce8ab452ab1edc867e4456d1abf08428"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
1.7.9.5


