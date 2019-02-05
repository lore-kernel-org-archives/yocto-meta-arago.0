Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A5751520EA
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2019 00:10:45 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x160AVtA048952
	for <meta-arago@arago-project.org>; Tue, 5 Feb 2019 18:10:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1549411831;
	bh=bICaW03twz6/hZhfXDivacyB3wRfMSs2n5KouxCdIYk=;
	h=From:To:CC:Subject:Date;
	b=K2kTGUHzvNgv14gBhvSF//AIhx3iuQVQNh7+epmpnjoeod9A6SELhk6RobsddUOnC
	Y//czra36PfxiD1PG05rqOJrmWrS1hYGFxNw9ycBg2HEk+m9HS1OWu1ksybG6DRg93
	yDuzPn67eyYjYc7egx4nYCNeRDDMhmNUr452IVhQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x160AVnd039781
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Feb 2019 18:10:31 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Feb 2019 18:10:31 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Feb 2019 18:10:31 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x160AVnD024293;
	Tue, 5 Feb 2019 18:10:31 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Feb 2019 14:05:09 -0500
Message-ID: <20190205190509.13680-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] voxelsdk: Add stdout reports for automated testing
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
X-List-Received-Date: Wed, 06 Feb 2019 00:10:46 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 ...e-count-report-in-stdout-for-testing.patch | 25 +++++++++++++++++++
 .../recipes-apps/voxelsdk/voxelsdk_git.bb     |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0006-Include-people-count-report-in-stdout-for-testing.patch

diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0006-Include-people-count-report-in-stdout-for-testing.patch b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0006-Include-people-count-report-in-stdout-for-testing.patch
new file mode 100644
index 00000000..5fd163e0
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0006-Include-people-count-report-in-stdout-for-testing.patch
@@ -0,0 +1,25 @@
+From 05d08ba8e4559024852b3d4b5187d2c4d9c496bc Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Tue, 5 Feb 2019 09:56:47 -0500
+Subject: [PATCH] Include people count report in stdout, for testing
+
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
+---
+ Demos/Horus.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Demos/Horus.cpp b/Demos/Horus.cpp
+index de1837e..7ee3e88 100644
+--- a/Demos/Horus.cpp
++++ b/Demos/Horus.cpp
+@@ -189,6 +189,7 @@ void Horus::update(Frame *frame)
+            }
+         }
+         putText(drawing, "Cnt="+to_string(peopleCount), cv::Point(40, 30), FONT_HERSHEY_PLAIN, 1, Scalar(255, 0, 0));
++        cout << endl << "Cnt=" << peopleCount << endl;
+       }
+ 
+       if(main_thread_image_cnt < 2)
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
index fe27c166..f207f5a6 100644
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
+++ b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
             file://0003-Add-more-command-line-options-and-move-OpenCV-render.patch;patchdir=${S} \
             file://0004-Platform-specific-op_clk_freq-setting.patch;patchdir=${S} \
             file://0005-Exit-on-window-touch-mouse-even-left-button-click.patch;patchdir=${S} \
+            file://0006-Include-people-count-report-in-stdout-for-testing.patch;patchdir=${S} \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


