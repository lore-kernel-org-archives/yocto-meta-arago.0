Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B423A52093
	for <meta-arago@arago-project.org>;
	Sat,  7 Feb 2015 23:53:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t17Nr9xY025006
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:09 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t17Nr8Sn015442
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:08 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 7 Feb 2015 17:53:07 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t17Nr6MW007950;	Sat, 7 Feb 2015 17:53:07 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t17NqxIe010769;	Sun, 8 Feb 2015 05:23:05 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 7 Feb 2015 17:52:53 -0600
Message-ID: <1423353177-8325-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1423353177-8325-1-git-send-email-fcooper@ti.com>
References: <1423353177-8325-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/9] quick-playground: Update Matrix description page
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
X-List-Received-Date: Sat, 07 Feb 2015 23:53:09 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt-apps/quick-playground_1.0.bb     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
index 2da5a36..f285ff1 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://Licence.txt;md5=7cc88160b55ec5db6c6c5bb8e3238c0b"
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "master"
-SRCREV = "4bcf4e7f5aa68dcd28f54bf921c6cc3985ce4305"
+SRCREV = "b055cefbe2ecb9e8009c08abe2c9dcfe447cfc9d"
 
 SRC_URI = "git://arago-project.org/git/projects/qt4-demos.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.9.5


