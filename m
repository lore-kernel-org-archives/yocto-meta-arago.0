Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 463EC52A6D
	for <meta-arago@arago-project.org>;
	Tue,  4 Nov 2014 01:43:20 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEH0050WRFROV10@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Nov 2014 19:43:04 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=HrPBwPXX c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=bDIBEl1F7nZItMHJUy8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 86DA22037D;	Mon,
	3 Nov 2014 20:43:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Nov 2014 20:42:50 -0500
Message-id: <1415065371-27167-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
In-reply-to: <1415065371-27167-1-git-send-email-denis@denix.org>
References: <1415065371-27167-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/6] packagegroup*: HACK: qt-tstat fails packaging with qt-5.4
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
X-List-Received-Date: Tue, 04 Nov 2014 01:43:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Disable for now, fix later

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb     | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb            | 4 ++--
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb        | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 084811b..0fe7bc5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -29,9 +29,9 @@ MATRIX_COMMON_APPS = "              \
 
 MATRIX_QT_APPS = "                  \
     ${@base_conditional('QT_PROVIDER', 'qt5', 'matrix-gui-qt5-demos', 'matrix-gui-qt4-demos', d)} \
-    matrix-gui-thermostat-demo      \
     ${@base_conditional('ARAGO_QT_PROVIDER','qt4-embedded-gles','matrix-gui-apps-quick-playground','', d)} \
 "
+#    matrix-gui-thermostat-demo      
 
 MATRIX_SGX_DEMOS = "                \
     matrix-3d-demo-chameleon        \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
index 3615cd4..1f541cc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related sources into the sdk"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -11,8 +11,8 @@ QT4_DEMOS = "\
 "
 
 QT_DEMOS = "\
-    qt-tstat-src \
 "
+#    qt-tstat-src 
 
 RDEPENDS_${PN} = "\
     ${@base_conditional('QT_PROVIDER', 'qt5', '', "${QT4_DEMOS}", d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 3cc26b1..b439949 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -23,8 +23,8 @@ QT5_DEMOS = "\
 "
 
 QT_DEMOS = "\
-    qt-tstat \
 "
+#    qt-tstat 
 
 RDEPENDS_${PN} = "\
     packagegroup-arago-qte \
-- 
2.1.2


