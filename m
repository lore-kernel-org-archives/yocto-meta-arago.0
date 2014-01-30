Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5965D52AB7
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 18:34:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UIYc5M015996
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:38 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UIYcmt002519
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:38 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 12:34:37 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UIYJON003617;	Thu, 30 Jan 2014 12:34:36 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 12:34:12 -0600
Message-ID: <1391106857-17112-7-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] libav: update bbappend to latest version
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
X-List-Received-Date: Thu, 30 Jan 2014 18:34:39 -0000
Content-Type: text/plain

* Update the bbappend to the latest libav version
* New libav also enables x264 which is commercially licensed so
  filter that out of the PACKAGECONFIG options

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../{libav_0.8.4.bbappend => libav_0.8.8.bbappend} |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-arago-distro/recipes-multimedia/libav/{libav_0.8.4.bbappend => libav_0.8.8.bbappend} (92%)

diff --git a/meta-arago-distro/recipes-multimedia/libav/libav_0.8.4.bbappend b/meta-arago-distro/recipes-multimedia/libav/libav_0.8.8.bbappend
similarity index 92%
rename from meta-arago-distro/recipes-multimedia/libav/libav_0.8.4.bbappend
rename to meta-arago-distro/recipes-multimedia/libav/libav_0.8.8.bbappend
index f33cc54..86747f1 100644
--- a/meta-arago-distro/recipes-multimedia/libav/libav_0.8.4.bbappend
+++ b/meta-arago-distro/recipes-multimedia/libav/libav_0.8.8.bbappend
@@ -1,4 +1,6 @@
-PR_append = "-arago1"
+PR_append = "-arago0"
+
+PACKAGECONFIG := "${@oe_filter_out('x264','${PACKAGECONFIG}', d)}"
 
 # Disable features that have potential commercial licensing restrictions
 EXTRA_OECONF += "\
-- 
1.7.9.5


