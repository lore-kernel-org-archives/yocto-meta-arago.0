Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 5AA0252AC6
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:36 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW0086J5S6V7F0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:35 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Jp0M15MC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8 a=lRBHAqtIAAAA:8	a=NEAV23lmAAAA:8
	a=k7CeUJAlab61aPY1PsgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 581E5161AEF;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:02:06 -0400
Message-id: <1435892533-6046-48-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 47/54] openntpd, matrix-gui, omapconf: fix LICENSE field
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb | 2 +-
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb           | 2 +-
 meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
index ba8a9d3..3ee6305 100644
--- a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
+++ b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
 Network Time Protocol."
 HOMEPAGE = "http://www.openntpd.org/"
 SECTION = "console/network"
-LICENSE = "BSD ISC"
+LICENSE = "BSD & ISC"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4b4f5158007cc97e6b0e2325bb99854a"
 
 PR = "r0"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 67276b2..df17ffe 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Matrix GUI Application launcher"
 HOMEPAGE = "https://gforge.ti.com/gf/project/matrix-gui-v2/"
 
-LICENSE = "BSD MIT"
+LICENSE = "BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
index 5bc8a9e..7f87644 100644
--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Diagnostic tool for TI OMAP processors"
 HOMEPAGE = "https://github.com/omapconf/omapconf"
 
-LICENSE = "GPLv2 BSD"
+LICENSE = "GPLv2 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
 
 PV = "1.71+1.72-rc1"
-- 
2.2.0


