Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CCD2952972
	for <meta-arago@arago-project.org>;
	Tue, 19 Aug 2014 18:22:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7JIMtYD007867
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 13:22:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7JIMsQq003435
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 13:22:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 13:22:54 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7JIMrxn027829;	Tue, 19 Aug 2014 13:22:54 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7JIMpIZ006744;	Tue, 19 Aug 2014 23:52:52 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Aug 2014 13:22:49 -0500
Message-ID: <1408472569-26630-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/8 v2] libinput: Add new library which is a optional dependency for Weston
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
X-List-Received-Date: Tue, 19 Aug 2014 18:22:56 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Libinput separates some of the input handling from Weston.
* Also it has newer features and bug fixes that the Weston built in variant
  doesn't have.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Add udev dependency

 .../recipes-graphics/wayland/libinput_git.bb       |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/libinput_git.bb

diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb b/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
new file mode 100644
index 0000000..d591f7d
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "libinput is a library to handle input devices in Wayland compositors"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
+
+inherit autotools pkgconfig
+
+DEPENDS = "libevdev udev"
+
+PR = "r0"
+
+BRANCH = "master"
+SRCREV = "bb10ec84d3704fc0fb40591bcbffe90f6c77966d"
+
+PV = "0.5.0"
+
+SRC_URI = "git://anongit.freedesktop.org/wayland/libinput;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+
-- 
1.7.9.5


