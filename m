Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id AB19A52A16
	for <meta-arago@arago-project.org>;
	Sat, 14 Dec 2013 18:00:37 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXT002O260KBDB0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 14 Dec 2013 12:00:35 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2A6CF200AC; Sat,
	14 Dec 2013 13:00:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 14 Dec 2013 13:00:19 -0500
Message-id: <1387044019-18574-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] packagegroup-*-crypto-sdk-target: fix conflict between cryptodev and ocf-linux
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
X-List-Received-Date: Sat, 14 Dec 2013 18:00:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

Different platforms use fifferent crypto APIs, so make the packagegroup machine
specific.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-crypto-sdk-target.bb            | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index cb9a68c..a9e4150 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
@@ -1,10 +1,18 @@
 DESCRIPTION = "Task to install crypto dev packages in SDK"
 LICENSE = "MIT"
-PR = "r2"
+PR = "r3"
 
 inherit packagegroup
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+CRYPTO_API = "ocf-linux-dev"
+
+CRYPTO_API_ti33x = "cryptodev-dev"
+CRYPTO_API_ti43x = "cryptodev-dev"
+CRYPTO_API_dra7xx-evm = "cryptodev-dev"
+
 RDEPENDS_${PN} = "\
     openssl-dev \
-    ocf-linux-dev \
+    ${CRYPTO_API} \
 "
-- 
1.8.3.2


