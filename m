Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 54138529C3
	for <meta-arago@arago-project.org>;
	Mon, 16 Dec 2013 00:12:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXV00IS6HW8ODY1@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 15 Dec 2013 18:12:13 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 73A06200AC; Sun,
	15 Dec 2013 19:12:07 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 15 Dec 2013 19:12:06 -0500
Message-id: <1387152726-12006-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1387152726-12006-1-git-send-email-denis@denix.org>
References: <1387152726-12006-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] matrix-gui-crypto-demos: enable dra7xx to use crypto examples
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
X-List-Received-Date: Mon, 16 Dec 2013 00:12:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 7cd9f2f..ad9be99 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -4,13 +4,14 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.6"
+PR = "${INC_PR}.7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/cryptos_apps_scripts"
 S_ti33x = "${WORKDIR}/git/cryptos_apps_program"
 S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
+S_dra7xx-evm = "${WORKDIR}/git/cryptos_apps_program"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
@@ -19,3 +20,4 @@ RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl"
 
 RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
 RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
+RDEPENDS_${PN}_append_dra7xx-evm = " ti-crypto-examples"
-- 
1.8.3.2


