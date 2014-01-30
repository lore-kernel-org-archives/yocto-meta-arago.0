Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3EC35529C3
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 18:34:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UIYXu0030200
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:33 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UIYXIj012717
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:33 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 12:34:33 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UIYJOL003617;	Thu, 30 Jan 2014 12:34:31 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 12:34:10 -0600
Message-ID: <1391106857-17112-5-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 04/11] eglibc-initial: remove duplicate include
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
X-List-Received-Date: Thu, 30 Jan 2014 18:34:34 -0000
Content-Type: text/plain

* egligc-common.inc is already included by the egligc_${PV}.inc
  inclusion which includes the eglibc.inc file so there is
  no need to include it directly.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../recipes-core/eglibc/eglibc-initial.inc         |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-initial.inc b/meta-arago-extras/recipes-core/eglibc/eglibc-initial.inc
index 9062516..b90a7d8 100644
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta-arago-extras/recipes-core/eglibc/eglibc-initial.inc
@@ -1,5 +1,3 @@
-require eglibc-common.inc
-
 DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 
-- 
1.7.9.5


