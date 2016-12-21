Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 99C4952AEE
	for <meta-arago@arago-project.org>;
	Wed, 21 Dec 2016 17:35:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBLHZXae011397
	for <meta-arago@arago-project.org>; Wed, 21 Dec 2016 11:35:33 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBLHZX7D018503
	for <meta-arago@arago-project.org>; Wed, 21 Dec 2016 11:35:33 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Dec 2016 11:35:32 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBLHZRgd021607;
	Wed, 21 Dec 2016 11:35:32 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Dec 2016 23:05:24 +0530
Message-ID: <1482341725-21409-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1482341725-21409-1-git-send-email-a0393906@ti.com>
References: <1482341725-21409-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gstreamer1.0-plugins-bad: kmssink-handle display disable
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
X-List-Received-Date: Wed, 21 Dec 2016 17:35:35 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer1.0-plugins-bad_1.6.3.bbappend        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
index 33291ee..7ceb1b3 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
@@ -37,7 +37,7 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;bran
 
 S = "${WORKDIR}/git"
 
-SRCREV_omap-a15 = "aec06528aca416c7b2c77db5b6dcb24907728ef7"
+SRCREV_omap-a15 = "07050013051af00828be115eb7bce0fc08abb79f"
 SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
 
-PR = "r23"
+PR = "r24"
-- 
1.7.9.5


