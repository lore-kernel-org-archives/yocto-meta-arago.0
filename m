Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 387C252A35
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 13:59:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7EDxZCc019849
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 08:59:35 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EDxZlK030535
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 08:59:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 08:59:35 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EDxZSh023200;
	Thu, 14 Aug 2014 08:59:35 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XHvZ0-0004qV-P1;
	Thu, 14 Aug 2014 09:59:34 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Aug 2014 09:59:32 -0400
Message-ID: <1408024773-17838-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] qtwayland - update to 5.4 branch
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
X-List-Received-Date: Thu, 14 Aug 2014 13:59:36 -0000
Content-Type: text/plain

* The 5.3 branch no longer exists and the SRCREV points to a commit on the 5.4 branch.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-qt/qt5/qtwayland-native_git.bbappend   |    4 ++--
 .../recipes-qt/qt5/qtwayland_git.bbappend          |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
index 53c1454..64de589 100644
--- a/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
@@ -1,3 +1,3 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
-QT_MODULE_BRANCH = "5.3"
+QT_MODULE_BRANCH = "5.4"
diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
index 53c1454..64de589 100644
--- a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
@@ -1,3 +1,3 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
-QT_MODULE_BRANCH = "5.3"
+QT_MODULE_BRANCH = "5.4"
-- 
1.7.9.5


