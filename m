Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9C1A052A52
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 13:01:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99D1l63027541
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 08:01:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99D1kJo029424
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 08:01:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 08:01:47 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99D1kNf009499;
	Fri, 9 Oct 2015 08:01:46 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZkXIw-00050y-6V; Fri, 09 Oct 2015 09:01:46 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 09:01:43 -0400
Message-ID: <1444395703-19242-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] img-pvr-sdk: Bump SRCREV for am3 and am4
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
X-List-Received-Date: Fri, 09 Oct 2015 13:01:48 -0000
Content-Type: text/plain

* Pick up the latest PVR SDK development tools
    - PVRTune
    - PVRTrace
    - PVRScope

* Update a few scripts due to minor PVRTrace configuration changes
* Create symbolic links of the PVRTrace logging libraries because
  some applications are linked with lib*.so.* instead of lib*.so

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 290cb91..96b7d5a 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -10,10 +10,10 @@ BRANCH_ti43x = "am4/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
 SRCREV_omap-a15 = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
-SRCREV_ti33x = "c4df891d6842600a5affdc479269540099e20fda"
-SRCREV_ti43x = "c4df891d6842600a5affdc479269540099e20fda"
+SRCREV_ti33x = "f24650bc8243b25c23d6a0a502ed79fc472ac424"
+SRCREV_ti43x = "f24650bc8243b25c23d6a0a502ed79fc472ac424"
 
-PR = "r3"
+PR = "r4"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x"
 
-- 
1.9.1


