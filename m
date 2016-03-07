Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E88DE52AE5
	for <meta-arago@arago-project.org>;
	Mon,  7 Mar 2016 08:32:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u278WmA6014577
	for <meta-arago@arago-project.org>; Mon, 7 Mar 2016 02:32:48 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u278Wm1P000726
	for <meta-arago@arago-project.org>; Mon, 7 Mar 2016 02:32:48 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 7 Mar 2016 02:32:47 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u278WkQh010788;
	Mon, 7 Mar 2016 02:32:47 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 7 Mar 2016 14:02:43 +0530
Message-ID: <1457339564-4992-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] gstreamer1.0-plugins-bad: Update SRCREV
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
X-List-Received-Date: Mon, 07 Mar 2016 08:32:49 -0000
Content-Type: text/plain

This update brings in two feature additions:
 * Ability to provide the start position by setting the title
 * Add crop support to waylandsink

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
index 64ff162..1a619ac 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -26,9 +26,9 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "12b0d2ac50aba19da53d2e1ac40d6ada70a79930"
+SRCREV = "9396248f2daf0b28b83ab0f01c4d17a8af46b1ca"
 SRCREV_ti43x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
 SRCREV_ti33x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
 
-PR_append = "-arago6"
+PR_append = "-arago7"
 
-- 
1.7.9.5


