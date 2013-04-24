Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E611D52AAA
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2013 14:06:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3OE6AaZ028371
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 09:06:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3OE6AXp030833
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 09:06:10 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 24 Apr 2013 09:06:09 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3OE5xsl000444;
	Wed, 24 Apr 2013 09:06:08 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Apr 2013 09:05:56 -0500
Message-ID: <1366812356-29846-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1366812356-29846-1-git-send-email-fcooper@ti.com>
References: <1366812356-29846-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] board-port-labs: Update to the latest version
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
X-List-Received-Date: Wed, 24 Apr 2013 14:06:11 -0000
Content-Type: text/plain

* U-boot board port lab has been updated for AMSDK 05.07
* Bump the PR which is enough to pull in the latest sources for this recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../board-port-labs/board-port-labs_git.bb         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
index 87a6735..82a4fd7 100644
--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
@@ -11,7 +11,7 @@ inherit allarch
 CREATE_SRCIPK = "1"
 SRCIPK_INSTALL_DIR = "board-support/board-port-labs"
 
-PR = "r3"
+PR = "r4"
 
 REPOS ?= "git://gitorious.org/sitara-board-port/sitara-board-port-linux.git \
           git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git \
-- 
1.7.0.4


