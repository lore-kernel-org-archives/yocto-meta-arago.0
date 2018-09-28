Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 722C852092
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2018 16:18:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGInx2103319
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 11:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151529;
	bh=nosFt3K0vW9FpYbu3s2SOlU3YFOtIQFdZp/V4d301kw=;
	h=From:To:CC:Subject:Date;
	b=qQAxHBwls4s+/g5+PJbDj5SwMigKPD/448FlyxTLXhw5EOUmowfvEYvfB7vYwa/zi
	RjwEWHB+DuCZ8POlSGnyBhIpyjTh5eNx+hajC6D4R0rHli3ETfCW0/j+iDBCemSWVf
	TE5E0VcRtABM4X4YWxHzwvCm120h3TK/ldPgy+hs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGInrl017734
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 11:18:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:18:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:18:50 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGInsg011619;
	Fri, 28 Sep 2018 11:18:49 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Sep 2018 12:18:47 -0400
Message-ID: <1538151527-28218-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [matrix-gui-v2-apps] [PATCH] tidl_demo*: remove timeout to exit a demo
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
X-List-Received-Date: Fri, 28 Sep 2018 16:18:58 -0000
Content-Type: text/plain

* tidl_classification has already mechanism to exit a demo
  (by right-clicking the main window)

* Avoid the side problem of not returning to the demo HTML page
  in time after right-clicking the main window before the timeout

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh                     | 4 +---
 tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh             | 4 +---
 tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh               | 5 +----
 tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh                 | 3 +--
 tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh | 3 +--
 tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh         | 4 +---
 6 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh b/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
index 6b80d0e..e225519 100644
--- a/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
+++ b/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
@@ -1,5 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt & pid=$!
-
-{ sleep 3600; kill $pid; }
+./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh b/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
index 9219f60..9dfd098 100644
--- a/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
+++ b/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
@@ -1,5 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt & pid=$!
-
-{ sleep 3600; kill $pid; }
+./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh b/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
index 37e5ec3..7171f53 100644
--- a/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
+++ b/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
@@ -1,6 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -g 2 -d 1 -e 1 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test2.mp4 -c ./stream_config_j11_v2.txt & pid=$!
-
-{ sleep 3600; kill $pid; }
-
+./tidl_classification -g 2 -d 1 -e 1 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test2.mp4 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh b/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
index 8d9d5d4..7d017d4 100644
--- a/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
+++ b/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
@@ -1,4 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -g 1 -d 2 -e 2 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=$!
-{ sleep 3600; kill $pid; }
+./tidl_classification -g 1 -d 2 -e 2 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh b/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
index b32fe56..64e3c68 100644
--- a/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
+++ b/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
@@ -1,4 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=$!
-{ sleep 3600; kill $pid; }
+./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh b/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
index 83fdab9..4824722 100755
--- a/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
+++ b/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
@@ -1,5 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=$!
-
-{ sleep 3600; kill $pid; }
+./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
-- 
1.9.1


