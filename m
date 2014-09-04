Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 474B052AB8
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:35:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84HZmbi014621
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:35:48 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HZmdJ000462
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:35:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:35:48 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s84HZl2d026640;	Thu, 4 Sep 2014 12:35:47 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s84HZgk2032659;	Thu, 4 Sep 2014 23:05:45 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 12:35:40 -0500
Message-ID: <1409852140-13616-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409852140-13616-1-git-send-email-fcooper@ti.com>
References: <1409852140-13616-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/3] libinput: Fix touch calibration issue
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
X-List-Received-Date: Thu, 04 Sep 2014 17:35:50 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Libinput and Weston have a calibration problem when using resistive touch
  screens.
* Bug report and additional information can be found here:
    https://bugs.freedesktop.org/show_bug.cgi?id=82742
* Update to latest commit of libinput that includes the 9 patches that fixes
  this issue.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/wayland/libinput_git.bb       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb b/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
index d591f7d..967d5db 100644
--- a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
@@ -8,10 +8,10 @@ inherit autotools pkgconfig
 
 DEPENDS = "libevdev udev"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
-SRCREV = "bb10ec84d3704fc0fb40591bcbffe90f6c77966d"
+SRCREV = "0647574c46e5e930063ace7b35385213dca33dc1"
 
 PV = "0.5.0"
 
-- 
1.7.9.5


