Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6FC2B529C2
	for <meta-arago@arago-project.org>;
	Tue, 23 Sep 2014 15:53:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NFrrSJ005187
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:53:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NFrrxR017719
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:53:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 10:53:53 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8NFrk2I024814;	Tue, 23 Sep 2014 10:53:52 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 23 Sep 2014 21:20:24 +0530
Message-ID: <1411487426-31949-4-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1411487426-31949-1-git-send-email-a0393906@ti.com>
References: <1411487426-31949-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master 3/5] libdce: Single planar encode support
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
X-List-Received-Date: Tue, 23 Sep 2014 15:53:54 -0000
Content-Type: text/plain

Other changes:
* Klocwork fixes
* README file updates
* Compiler warning fixes

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-multimedia/libdce/libdce_git.bb        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb b/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
index a127c4e..308eadf 100644
--- a/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
+++ b/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
@@ -4,13 +4,13 @@ LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31
 
 inherit autotools pkgconfig
 
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 PV = "2.0"
 
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "0c7eee9ffdd480063a579013161bcf85ada376b1"
+SRCREV = "1916cfef94c4ee41c2beedc9cd87b8916ad29895"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
1.7.9.5


