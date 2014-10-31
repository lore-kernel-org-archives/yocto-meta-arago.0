Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6E94D529D9
	for <meta-arago@arago-project.org>;
	Fri, 31 Oct 2014 15:48:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9VFmCwh025692
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 10:48:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9VFmCWp024811
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 10:48:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 31 Oct 2014 10:48:12 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s9VFm89g012302;	Fri, 31 Oct 2014 10:48:11 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 Oct 2014 21:13:12 +0530
Message-ID: <1414770194-24178-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1414770194-24178-1-git-send-email-a0393906@ti.com>
References: <1414770194-24178-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master v3 2/4] wayland: GLSDK specific adaptions
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
X-List-Received-Date: Fri, 31 Oct 2014 15:48:13 -0000
Content-Type: text/plain

* Switch to git
* Update source directory

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-graphics/wayland/wayland_1.3.0.bb      |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
index 212e08a..ae68dac 100644
--- a/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
@@ -10,9 +10,13 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
-SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
+
+SRC_URI = "git://anongit.freedesktop.org/wayland/wayland;protocol=git"
+SRCREV = "2c3dbb89031f120fb191492634e53a583f99d57d"
+
+S = "${WORKDIR}/git"
+
+PR = "r1"
 
 SRC_URI_append_class-native = " file://just-scanner.patch"
 
-- 
1.7.9.5


