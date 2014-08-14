Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 52AE352A63
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 18:19:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7EIJJTj011781
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 13:19:19 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EIJJhN015147
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 13:19:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 13:19:18 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7EIJIe1027652;	Thu, 14 Aug 2014 13:19:18 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7EIJCJJ013320;	Thu, 14 Aug 2014 23:49:16 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Aug 2014 13:19:10 -0500
Message-ID: <1408040350-30527-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408040350-30527-1-git-send-email-fcooper@ti.com>
References: <1408040350-30527-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] weston-init: Unset env variable that are set by scripts in /etc/profile.d/
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
X-List-Received-Date: Thu, 14 Aug 2014 18:19:20 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* The current weston-init runs all the scripts found in /etc/profile.d/
* There is a bug in the current init script that assumes if XDG_RUNTIME_DIR is
  already set then the proper folders have already been created.
* Also unset WAYLAND_DISPLAY since wayland will try to use a backend that
* doesn't exist.

* Some of these changes will be upstreamed.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/wayland/weston-init.bbappend  |    2 +-
 .../recipes-graphics/wayland/weston-init/init      |   10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-extras/recipes-graphics/wayland/weston-init.bbappend
index 6e18371..1b427fe 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-extras/recipes-graphics/wayland/weston-init.bbappend
@@ -1,3 +1,3 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init/init b/meta-arago-extras/recipes-graphics/wayland/weston-init/init
index 8e662e0..cf02490 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-extras/recipes-graphics/wayland/weston-init/init
@@ -27,11 +27,17 @@ case "$1" in
   start)
         . /etc/profile
 
+        # Weston for some reason dies if these environment variables are set
+        unset WAYLAND_DISPLAY
+
         # This is all a nasty hack
         if test -z "$XDG_RUNTIME_DIR"; then
                 export XDG_RUNTIME_DIR=/run/user/root
-                mkdir --parents $XDG_RUNTIME_DIR
-                chmod 0700 $XDG_RUNTIME_DIR
+        fi
+
+        if [ ! -d "$XDG_RUNTIME_DIR" ] ; then
+            mkdir --parents $XDG_RUNTIME_DIR
+            chmod 0700 $XDG_RUNTIME_DIR
         fi
 
         openvt -s weston
-- 
1.7.9.5


