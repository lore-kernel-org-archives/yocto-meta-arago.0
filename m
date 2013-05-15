Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6FAEC52A5D
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 03:54:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4F3sq8s016613
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:52 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4F3sq7S014587
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:52 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 22:54:52 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4F3sXkU004084;
	Tue, 14 May 2013 22:54:50 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 May 2013 22:54:27 -0500
Message-ID: <1368590069-6700-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1368590069-6700-1-git-send-email-fcooper@ti.com>
References: <1368590069-6700-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 7/9] qt-stat: Pull in fix for "taking address of temporary"
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
X-List-Received-Date: Wed, 15 May 2013 03:54:53 -0000
Content-Type: text/plain

* Newer versions of gcc are alot stricter and previous warnings are not becoming
  errors.
* Update commit to pull in patch that fixes the "taking address of temporary"
  error message.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
index 9b9704c..19c29fb 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=93a105adb99011afa5baee932b560714 \
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r2"
+PR = "r3"
 
 BRANCH ?= "master"
-SRCREV = "1d3f0ecc0e9c9358166db94965b9075b5ae73723"
+SRCREV = "27e033a0ac59928cc3acbb45f4d9bc2101fcf024"
 
 SRC_URI = "git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git"
 
-- 
1.7.0.4


