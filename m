Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A959152990
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 15:12:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QFC8Y3006656
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:12:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QFC7Zv015263
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:12:07 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 10:12:07 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QFBsFj032671;
	Wed, 26 Jun 2013 10:12:06 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2013 10:24:58 -0500
Message-ID: <1372260299-3134-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372260299-3134-1-git-send-email-fcooper@ti.com>
References: <1372260299-3134-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/6] ti-crypto-examples: Remove unneeded variable
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
X-List-Received-Date: Wed, 26 Jun 2013 15:12:08 -0000
Content-Type: text/plain

* Change in ti-crypto-example's git tree makes this variable obsolete.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-crypto-examples_git.bbappend                |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bbappend b/meta-arago-distro/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bbappend
index 3afd154..25c53dd 100644
--- a/meta-arago-distro/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bbappend
+++ b/meta-arago-distro/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bbappend
@@ -1,3 +1 @@
-PR_append = "-arago0"
-
-SRCIPK_SRC_DIR = "${SOURCE_DIR}"
+PR_append = "-arago1"
-- 
1.7.0.4


