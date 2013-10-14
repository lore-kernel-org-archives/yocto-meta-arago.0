Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 66D5C529E3
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 15:07:50 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUN00JEOZCMZH40@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 14 Oct 2013 10:07:50 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4B9372004B; Mon,
	14 Oct 2013 11:07:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 14 Oct 2013 11:07:33 -0400
Message-id: <1381763253-21323-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCHv2 3/3] qtbase: update bbappend to 5.1.1, explicitly enable linuxfb
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
X-List-Received-Date: Mon, 14 Oct 2013 15:07:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/{qtbase_5.1.0.bbappend => qtbase_5.1.1.bbappend}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arago-distro/recipes-qt/qt5/{qtbase_5.1.0.bbappend => qtbase_5.1.1.bbappend} (80%)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
similarity index 80%
rename from meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
index 8ae7706..eaf1433 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PACKAGECONFIG_GL = "gles2 icu"
+PACKAGECONFIG_GL = "gles2 icu linuxfb"
 
 SRC_URI += " \
 	file://0001-qeglfswindow.cpp.patch \
-- 
1.8.3.2


