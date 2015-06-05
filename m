Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 1899652A72
	for <meta-arago@arago-project.org>;
	Fri,  5 Jun 2015 19:52:43 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NPH005WJLV95TC0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Jun 2015 14:52:27 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=N5PUbDJB c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=eIhxMilvRf8A:10 a=0gcC27t9AAAA:8	a=oR5dmqMzAAAA:8 a=-9mUelKeXuEA:10
	a=XAFQembCKUMA:10 a=sozttTNsAAAA:8	a=x5BwiFZGAAAA:8
	a=9Er00GFaP4UzbwKNzG8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8EAFF161A87;	Fri,
	5 Jun 2015 15:52:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 05 Jun 2015 15:52:21 -0400
Message-id: <1433533941-18688-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] libdce: update to 3.00.08.01
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
X-List-Received-Date: Fri, 05 Jun 2015 19:52:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../libdce/{libdce_git.bb => libdce_3.00.08.01.bb}                   | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-arago-extras/recipes-multimedia/libdce/{libdce_git.bb => libdce_3.00.08.01.bb} (82%)

diff --git a/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb b/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.01.bb
similarity index 82%
rename from meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
rename to meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.01.bb
index 76539f4..2fd642e 100644
--- a/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
+++ b/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.01.bb
@@ -4,13 +4,10 @@ LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31
 
 inherit autotools pkgconfig
 
-PR = "r2"
-PV = "2.0+git${SRCPV}"
-
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "bb5786d7ce8ab452ab1edc867e4456d1abf08428"
+SRCREV = "15c5b8f2ea1094226a2f14bacb2441a07049631b"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
2.2.0


