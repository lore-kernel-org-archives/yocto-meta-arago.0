Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 203415299F
	for <meta-arago@arago-project.org>;
	Thu, 19 Jul 2012 23:58:09 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6JNw8Ih019281
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2012 18:58:08 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6JNw8Gq025887
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2012 18:58:08 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 19 Jul 2012 18:58:08 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q6JNw84U024937;	Thu, 19 Jul 2012 18:58:08 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1Ss0bI-0001F1-7D; Thu, 19 Jul 2012 18:57:44 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Jul 2012 18:57:43 -0500
Message-ID: <1342742263-4743-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] am-sysinfo: Spell out protocol
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
X-List-Received-Date: Thu, 19 Jul 2012 23:58:09 -0000
Content-Type: text/plain

* Get rid of the warning that complains that in the SRC_URI proto is used
  instead of protocol

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/am-sysinfo/am-sysinfo_svn.bb      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
index 11ce229..40daafa 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
@@ -9,9 +9,9 @@ PACKAGE_STRIP = "no"
 
 SRCREV = "16"
 PV = "1.0"
-PR = "r2+svnr${SRCPV}"
+PR = "r3+svnr${SRCPV}"
 
-SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;proto=https;user=anonymous;pswd=''"
+SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;protocol=https;user=anonymous;pswd=''"
 
 S = "${WORKDIR}/trunk"
 
-- 
1.7.0.4


