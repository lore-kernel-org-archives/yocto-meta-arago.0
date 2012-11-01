Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id D5022529B8
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:37:40 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2649562oag.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=upW7w+jLSoV+sIO0IrbwwLusSvCh0zLIJC6rimjAj88=;
	b=mr8CoOnQo2mQEoPnLEqAOIGcgILWr4SRUTwV7zBxmEPo7PpzTHth2dzZU93+nrs7ia
	8yYifs5TehiOj40/QK/d78FZEHjzmDLJwtI3ok0MXVH0wmH+9nR1RMXb1k9bl6lSPYk3
	A716ztmPxydALKWnsn70VEqV68j/U99hx2jVnnVc35F3xlHKxm/p0PiPDoS7lJdZ5xsu
	qbTVkPEdXGyeiN52TBcxzjmmpomIFH6voiQX5tVE+luGUIKJGKGZqyuxssFEYfGeYJhE
	zmqMz8INXgwH1JULn9na4QdJ7thLhMje8VvcP6sZaMkwBxzx8tLEpF/jfNIQZlSEo1KS
	ZdFA==
Received: by 10.182.157.45 with SMTP id wj13mr34331192obb.58.1351795060381;
	Thu, 01 Nov 2012 11:37:40 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id c18sm3128522obc.17.2012.11.01.11.37.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:37:39 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:37:36 -0500
Message-Id: <1351795056-4531-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] matrix-gui-clocks: Remove ${PN} package and fix RDEPENDS
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
X-List-Received-Date: Thu, 01 Nov 2012 18:37:41 -0000

* Nothing should actually go inside the matrix-gui-clocks package. So remove
  it from the list of packages.
* This also fixed an issue where script files were being pulled into the ${PN}
  package instead of being packaged with the appropriate clock frequency package.
* Each provided package should use the same RDEPENDS. Update the recipe so each
  package has the correct RDEPENDS.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-clocks_2.0.bb   |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
index b8d4e50..62028ec 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
@@ -4,19 +4,27 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 inherit allarch
 
 S = "${WORKDIR}/git/clocks_apps"
 
-# Make sure power submenu and app images has been installed
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-power matrix-gui-generic-pm"
-
 # Break out the individual files into separate packages.  That way only the
 # clocks supported for each device can be installed.  Prepend the list so
 # that we can get the files in ${bindir} first
-PACKAGES =+ "${PN}-275mhz ${PN}-300mhz ${PN}-500mhz ${PN}-600mhz ${PN}-720mhz ${PN}-800mhz ${PN}-1ghz"
+PACKAGES = "${PN}-275mhz ${PN}-300mhz ${PN}-500mhz ${PN}-600mhz ${PN}-720mhz ${PN}-800mhz ${PN}-1ghz"
+
+# Make sure power submenu and app images has been installed
+CLOCK_RDEPENDS = "matrix-gui-apps-images matrix-gui-submenus-power matrix-gui-generic-pm"
+
+RDEPENDS_${PN}-275mhz += "${CLOCK_RDEPENDS}"
+RDEPENDS_${PN}-300mhz += "${CLOCK_RDEPENDS}"
+RDEPENDS_${PN}-500mhz += "${CLOCK_RDEPENDS}"
+RDEPENDS_${PN}-600mhz += "${CLOCK_RDEPENDS}"
+RDEPENDS_${PN}-720mhz += "${CLOCK_RDEPENDS}"
+RDEPENDS_${PN}-800mhz += "${CLOCK_RDEPENDS}"
+RDEPENDS_${PN}-1ghz += "${CLOCK_RDEPENDS}"
 
 # Split the matrix files by clock
 FILES_${PN}-275mhz += "${MATRIX_APP_DIR}/power_set_275mhz/*"
-- 
1.7.0.4


