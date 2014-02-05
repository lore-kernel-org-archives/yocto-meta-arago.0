Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 43A08529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 18:35:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15IZVj8008042
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:35:31 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15IZVdU005127
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:35:31 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 12:35:31 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15IZSG6008984;
	Wed, 5 Feb 2014 12:35:29 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Feb 2014 14:04:01 -0600
Message-ID: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/6] tisdk-image: change to regex matching
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 18:35:32 -0000
Content-Type: text/plain

* As described in the comments of the tisdk-image.bbclass you can now
  specify "or" matches for devices that do not have a consistent naming
  for their DTB files using the regex matching.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index c365eaa..59e467a 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -532,12 +532,17 @@ do_sdk_image () {
     fi
 
     # Copy the DTB files if they exist.
-    # NOTE: For simplicity remove the uImage- prefix on the dtb files.  Get just the symlink
-    #       files for a cleaner name.  Use the DTB_FILTER variable to allow finding the
-    #       dtb files for only that MACHINE type
+    # NOTE: For simplicity remove the uImage- prefix on the dtb files.  Get
+    # just the symlink files for a cleaner name.  Use the DTB_FILTER variable
+    # to allow finding the dtb files for only that MACHINE type
+    # NOTE: The DTB_FILTER variable is interpreted as a regex which means
+    #       that for cases where the DTB files to be selected do not have
+    #       a common naming you can use something line filter1\|filter2 which
+    #       will be interpreted as an "or" and allow matching both expressions.
+    #       The \| is important for delimiting these values.
     if [ "${DTB_FILTER}" != "unknown" ]
     then
-        for f in `find ${DEPLOY_DIR_IMAGE} -type l -name "*${DTB_FILTER}*.dtb"`
+        for f in `find ${DEPLOY_DIR_IMAGE} -type l -regex ".*\(${DTB_FILTER}\).*\.dtb"`
         do
             dtb_file=`basename $f | sed s/.Image-//`
             cp $f ${prebuilt_dir}/${dtb_file}
-- 
1.7.0.4


