Return-Path: <poojaprajod@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 183EB52AEE
	for <meta-arago@arago-project.org>;
	Tue,  7 Feb 2017 10:26:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v17AQZm6006564
	for <meta-arago@arago-project.org>; Tue, 7 Feb 2017 04:26:35 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v17AQZT4006271
	for <meta-arago@arago-project.org>; Tue, 7 Feb 2017 04:26:35 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 04:26:35 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v17AQWla018356;
	Tue, 7 Feb 2017 04:26:34 -0600
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Feb 2017 15:56:27 +0530
Message-ID: <1486463187-89615-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [meta-arago krogoth] gstreamer: Update gst-bad recipe
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
X-List-Received-Date: Tue, 07 Feb 2017 10:26:37 -0000
Content-Type: text/plain

Updated gst-bad recipe to pick
* gstwaylandsink: Fix same process looping issue

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
index 7ceb1b3..b5ccebf 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
@@ -37,7 +37,7 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;bran
 
 S = "${WORKDIR}/git"
 
-SRCREV_omap-a15 = "07050013051af00828be115eb7bce0fc08abb79f"
+SRCREV_omap-a15 = "eb41f1c8fde05f87587c83d157835e3b2d19a298"
 SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
 
-PR = "r24"
+PR = "r25"
-- 
1.9.1


