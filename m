Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id CB13352099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 07:11:40 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTZ00CD4AMSBFN0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Oct 2013 02:11:29 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 41E8F214A1; Tue,
	01 Oct 2013 03:11:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Oct 2013 03:11:01 -0400
Message-id: <1380611472-23600-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1380611472-23600-1-git-send-email-denis@denix.org>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
Subject: [PATCH 02/13] matrix-gui-browser: replace ${S} with ${B} in do_install()
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
X-List-Received-Date: Tue, 01 Oct 2013 07:11:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Replcae ${S}ource with ${B}uild directory when installing the binary.
Normally B == S when the build output is in the same directory where sources
are, but it's better to use B for when build output is in a different location.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index ecb97c2..0e508a0 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -7,7 +7,7 @@ SECTION = "multimedia"
 # Make sure that QT font libraries have been installed
 RDEPENDS_${PN} += "qt4-embedded-fonts"
 
-PR = "r1"
+PR = "r2"
 
 SRCREV = "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
 BRANCH ?= "master"
@@ -20,5 +20,5 @@ inherit qt4e
 
 do_install() {
 	install -d ${D}/${bindir}
-	install -m 0755 ${S}/matrix_browser ${D}/${bindir}
+	install -m 0755 ${B}/matrix_browser ${D}/${bindir}
 }
-- 
1.8.3.2


