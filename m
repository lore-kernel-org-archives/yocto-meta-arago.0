Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 39C1652990
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 15:12:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QFCAnn006683
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:12:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QFCAuK015407
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:12:10 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 10:12:10 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QFBsFk032671;
	Wed, 26 Jun 2013 10:12:08 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2013 10:24:59 -0500
Message-ID: <1372260299-3134-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372260299-3134-1-git-send-email-fcooper@ti.com>
References: <1372260299-3134-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 6/6] oprofile-example: Pull in Makefile and CCS project changes
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
X-List-Received-Date: Wed, 26 Jun 2013 15:12:11 -0000
Content-Type: text/plain

* Pull in commit that updates the Makefile to remove hard coding architecture
  and softfp.
* Pull in commit that updates the CCS project to use toolchain alias that will
  be updated during SDK installation.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../oprofile-example/oprofile-example_git.bb       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
index 681a47d..5799f6c 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
@@ -7,10 +7,10 @@ SECTION = "system"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
-PR = "r1"
+PR = "r2"
 
 BRANCH ?= "master"
-SRCREV = "875147fcaf0706f91b1bcbf9d80821de78257955"
+SRCREV = "3aa2de4bb698c96f8a481c4048e3140503b26082"
 
 SRC_URI = "git://gitorious.org/oprofile-example/oprofile-example.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


