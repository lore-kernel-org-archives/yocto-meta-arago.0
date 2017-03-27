Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 19ADA5299E
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 18:43:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RIhRhY023914
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 13:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490640207;
	bh=SnkXEly9WolAO7JEelHfVrcCVY0g/o8La9W8SxRoz0I=;
	h=From:To:CC:Subject:Date;
	b=uj4LzyjRiM/i9Yu5KWU6G7+uvt0GbxaAENzYlRsz6HUW1hnjJRSyqdRJgXCs56qH5
	2I4FxgCkqLDAZaqVm73X8kAnCK3U5rNWMWmniTjNKwcrsAYkbr7v3a3UIizgnBGHRT
	FdkRXvnp9W/kbdZQKxlKjJb/N7UC4wVLDpAqlm4M=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RIhRNc022307
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 13:43:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 13:43:27 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2RIhRZe028504;	Mon, 27 Mar 2017 13:43:27 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Mar 2017 14:43:25 -0400
Message-ID: <1490640205-1304-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [morty/krogoth][PATCH v2] opencv: bump SRCREV to pick up enhancement and bug fix
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
X-List-Received-Date: Mon, 27 Mar 2017 18:43:29 -0000
Content-Type: text/plain

* Two more kernels are added for OpenCL DSP offload: minmax and absdiff

* Change priority of gstreamer videoconvert plugin so that it can be
  selected over autovideoconvert. This is to address the decoding
  issue with test clip 768x576.avi.

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
V2 changes:
* Update commit message to describe the changes picked up by the new commit id

 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
index eea040f..bcfd8dd 100644
--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
@@ -1,4 +1,4 @@
-PR = "r2"
+PR = "r3"
 
 BRANCH = "tiopencvrelease_3.1"
 
@@ -11,7 +11,7 @@ SRC_URI_append += "\
      file://setupEnv.sh \
 "
 
-SRCREV_opencv = "b4f54ac48ced0ade8223eafab9cd3ad6dbb1b515"
+SRCREV_opencv = "ffb1eb48afbb1888670f461135c023dcdb6c9aca"
 
 DEPENDS_remove_keystone = "qtbase"
 
-- 
1.9.1


