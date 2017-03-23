Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9E7CA52A1D
	for <meta-arago@arago-project.org>;
	Thu, 23 Mar 2017 22:24:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2NMOEuB010791
	for <meta-arago@arago-project.org>; Thu, 23 Mar 2017 17:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490307854;
	bh=JOFowJIADc2/mviWFDVYjw+Q9c45QLJccwaxjHvdmlo=;
	h=From:To:CC:Subject:Date;
	b=lUAbMqHk9p9YpldKSnP4BHyDxXdsMM77b+OeTbl8FJCdFR5HQvd1zrPWvgI02Q8Ap
	8tHAqgsVNTbiq2NCAEulA/t+OPMO+5HYIRNZ9gX5NY9oEGLGQAtmidDNEzhuZTFXdb
	RKpir+CRQI8NOT7CKOaNoVfWeOYfiVEpyJizvXp0=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2NMO9Qc024066
	for <meta-arago@arago-project.org>; Thu, 23 Mar 2017 17:24:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 23 Mar 2017 17:24:08 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2NMO8X7002269;	Thu, 23 Mar 2017 17:24:09 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Mar 2017 18:24:07 -0400
Message-ID: <1490307847-23237-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH] opencv: bump SRCREV
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
X-List-Received-Date: Thu, 23 Mar 2017 22:24:30 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
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


