Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 73DE3529E8
	for <meta-arago@arago-project.org>;
	Wed,  4 May 2016 09:28:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u449SqWr030456
	for <meta-arago@arago-project.org>; Wed, 4 May 2016 04:28:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u449SqHH008500
	for <meta-arago@arago-project.org>; Wed, 4 May 2016 04:28:52 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 May 2016 04:28:52 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u449So2X007062;	Wed, 4 May 2016 04:28:51 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 May 2016 14:58:49 +0530
Message-ID: <1462354129-15014-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master][PATCH] gstreamer1.0-plugins-bad: Update SRCREV
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
X-List-Received-Date: Wed, 04 May 2016 09:28:52 -0000
Content-Type: text/plain

This update ignores the frame_cropping flag set in the SPS
and calculates width and height correctly

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
index 5f4652c..6518c7a 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -35,8 +35,8 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "9396248f2daf0b28b83ab0f01c4d17a8af46b1ca"
+SRCREV = "3a7dce1011d2ad002f9341c8f0be2e409d73ea7b"
 SRCREV_ti43x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
 SRCREV_ti33x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
 
-PR_append = "-arago9"
+PR_append = "-arago10"
-- 
1.9.1


