Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DF12E529C3
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 18:34:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UIYS10024693
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UIYS4f002406
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:28 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 12:34:27 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UIYJOJ003617;	Thu, 30 Jan 2014 12:34:26 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 12:34:08 -0600
Message-ID: <1391106857-17112-3-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 02/11] matrix-gui-apps-image: remove duplicate inclusion
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
X-List-Received-Date: Thu, 30 Jan 2014 18:34:29 -0000
Content-Type: text/plain

* matrix-gui-apps-git.inc already includes matrix-gui-paths.inc
  so the extra inclusion can be removed.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../matrix/matrix-gui-apps-images_2.0.bb           |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
index be93ac6..4d271c7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
-require matrix-gui-paths.inc
 
 PR = "${INC_PR}.0"
 
-- 
1.7.9.5


