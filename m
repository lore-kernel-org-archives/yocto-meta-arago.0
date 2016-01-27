Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 78FBD52961
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 20:14:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RKEJLv010506
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 14:14:19 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RKEJB0003544
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 14:14:19 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 14:14:19 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0RKEJeU021144;	Wed, 27 Jan 2016 14:14:19 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 15:14:17 -0500
Message-ID: <1453925657-16950-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] opencv: update to version 3.1
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
X-List-Received-Date: Wed, 27 Jan 2016 20:14:20 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
v2 changes: update commit message

 .../recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 copy meta-arago-extras/recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb} (97%)

diff --git a/meta-arago-extras/recipes-support/opencv/opencv_3.0.bb b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
similarity index 97%
copy from meta-arago-extras/recipes-support/opencv/opencv_3.0.bb
copy to meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
index ef56a78..54ddee8 100644
--- a/meta-arago-extras/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
@@ -11,13 +11,13 @@ DEFAULT_PREFERENCE = "-1"
 
 DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
 
-SRCREV_opencv = "b3ac274617beb8e54c8bfebcb141090a57165ea2"
-SRCREV_contrib = "c8053da4f2621169746ef8670dc6145ee5958e9c"
+SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
+SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
 SRCREV_FORMAT = "opencv"
 SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
            git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
 
-PV = "3.0+git${SRCPV}"
+PV = "3.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


