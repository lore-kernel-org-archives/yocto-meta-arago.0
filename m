Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 80A3652998
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:12:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JIBrkO028714
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521483113;
	bh=Q0jLaHU6VXr4AJ4s4YnhzdfHdjfL4RfFA5Abhhp2GWQ=;
	h=From:To:Subject:Date;
	b=Kh/ooZvgjWlSGc4Xy5FIVFbYZ+o4nN3MYdvUhFCDz/Q0jChggcO8SIMG4lS71tTKb
	6n+q/bbJWnu7WS50buIf8fWABAd/ny5CRRbVo9JCrs1NUIwLNXELnEAWRD4NII71UM
	k4ekI8YQq16GuflXnKZG6FeD37ZA3Xg7uUlK2N2k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIBrPG009483
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:11:53 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:11:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 13:11:52 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIBq6S007207
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:11:52 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 14:11:51 -0400
Message-ID: <1521483111-25020-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH] posix-smp-demo: Updating to version 01.01.00.00
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
X-List-Received-Date: Mon, 19 Mar 2018 18:12:51 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
index b0abd2b..3d78727 100644
--- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
+++ b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
@@ -7,14 +7,14 @@ POSIX_SMP_GIT_URI = "git://git.ti.com/keystone-demos/posix-smp.git"
 POSIX_SMP_GIT_PROTOCOL = "git"
 POSIX_SMP_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.POSIX-SMP.01.00.01.07"
-POSIX_SMP_SRCREV = "2614d4cbe9d83c8345e051c7f3767f86226398ea"
+# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.00"
+POSIX_SMP_SRCREV = "139fe7ec58939dc2743355e5fede0735f8693ebd"
 
 BRANCH = "${POSIX_SMP_GIT_BRANCH}"
 SRC_URI = "${POSIX_SMP_GIT_URI};protocol=${POSIX_SMP_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${POSIX_SMP_SRCREV}"
-PV = "01.00.01.07"
+PV = "01.01.00.00"
 INC_PR = "r0"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


