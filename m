Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4828A52986
	for <meta-arago@arago-project.org>;
	Tue, 14 Aug 2012 21:11:19 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7ELBIhX031713
	for <meta-arago@arago-project.org>; Tue, 14 Aug 2012 16:11:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7ELBId9032441
	for <meta-arago@arago-project.org>; Tue, 14 Aug 2012 16:11:18 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 14 Aug 2012 16:11:18 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7ELBIQM000585;	Tue, 14 Aug 2012 16:11:18 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T1OXR-0001N8-IV; Tue, 14 Aug 2012 16:20:33 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Aug 2012 16:20:14 -0500
Message-ID: <1344979214-5237-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1344979214-5237-1-git-send-email-fcooper@ti.com>
References: <1344979214-5237-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] task-arago-gst: Remove software that have license restrictions
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
X-List-Received-Date: Tue, 14 Aug 2012 21:11:19 -0000
Content-Type: text/plain

* In oe-core, gst-plugins-ugly and some of its dependencies have been
  flagged with a commercial license restriction. This patch removes
  these packages from the task until it is clear what needs to be done
  to include these packages in our Arago distribution.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/tasks/task-arago-gst.bb          |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb
index b094c4b..d34402a 100644
--- a/meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb
+++ b/meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb
@@ -12,11 +12,9 @@ GSTREAMER = " \
     gst-plugins-base \
     gst-plugins-good \
     gst-plugins-bad \
-    gst-plugins-ugly \
     gst-plugins-base-meta \
     gst-plugins-good-meta \
     gst-plugins-bad-meta \
-    gst-plugins-ugly-meta \
     "
 
 RDEPENDS_${PN} = "\
-- 
1.7.0.4


