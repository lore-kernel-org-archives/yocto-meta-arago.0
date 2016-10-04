Return-Path: <poojaprajod@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3467C52987
	for <meta-arago@arago-project.org>;
	Tue,  4 Oct 2016 11:39:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u94BdW4q008239
	for <meta-arago@arago-project.org>; Tue, 4 Oct 2016 06:39:32 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u94BdVro018062
	for <meta-arago@arago-project.org>; Tue, 4 Oct 2016 06:39:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 4 Oct 2016 06:39:31 -0500
Received: from uda0132412.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u94BdTMf019307;	Tue, 4 Oct 2016 06:39:30 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Oct 2016 17:09:28 +0530
Message-ID: <1475581168-4503-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [V2] gstreamer: Update SRCREV for gstreamer-plugins-bad
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
X-List-Received-Date: Tue, 04 Oct 2016 11:39:33 -0000
Content-Type: text/plain

Update recipe to pick include patch -
gstkmssink: Store encoder and plane data

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
index bfcd750..6dd3117 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
@@ -35,7 +35,7 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;bran
 
 S = "${WORKDIR}/git"
 
-SRCREV_omap-a15 = "f0694b5fcec997036ef7df4d382b28e833c8ebfd"
+SRCREV_omap-a15 = "aec06528aca416c7b2c77db5b6dcb24907728ef7"
 SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
 
-PR = "r21"
+PR = "r22"
-- 
1.9.1


