Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id CC7EA52985
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2018 11:30:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87BUR5F118358
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 06:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536319827;
	bh=O8LeIemvu3JjNPoI7r+VRMDBpyKJ+nvrk9iaIxRE0Cg=;
	h=From:To:CC:Subject:Date;
	b=U0Map3SbO9HHjG8zAraVrL4BfTBH7lufTJZN+NWI9ZB9Gcae0Q81ghmcgWgRnY2s2
	Csi9zAZJhL4HlkkfqtV0BbOBu64G3LOCZGV0TrX3cOhLn/jFP9AKh1s0wWdp0nB6AA
	jrwi3ccpCeHRVCWI37S+eMNPXNAd0J/CZiaclEJ0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87BURwQ026688
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 06:30:27 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 06:30:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 06:30:27 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87BURlp007955;
	Fri, 7 Sep 2018 06:30:27 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Sep 2018 07:30:25 -0400
Message-ID: <1536319825-22121-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH] tidl: Add description of cores used, to demo icon; also increase demo timeout to 3600 seconds
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
X-List-Received-Date: Fri, 07 Sep 2018 11:30:36 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh                           | 2 +-
 tidl_apps/tidl_demo_livecam/tidl_demo_livecam.desktop                   | 2 +-
 tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh                   | 2 +-
 tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh                     | 2 +-
 tidl_apps/tidl_demo_pnexamples/tidl_demo_pnexamples.desktop             | 2 +-
 tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh                       | 2 +-
 tidl_apps/tidl_demo_staticimg/tidl_demo_staticimg.desktop               | 2 +-
 tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh       | 2 +-
 .../tidl_demo_staticimg_dsponly/tidl_demo_staticimg_dsponly.desktop     | 2 +-
 tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh               | 2 +-
 tidl_apps/tidl_demo_staticimg_lg2/tidl_demo_staticimg_lg2.desktop       | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh b/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
index 02fb4a2..6b80d0e 100644
--- a/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
+++ b/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
@@ -2,4 +2,4 @@ cd /usr/share/ti/tidl/examples/classification
 
 ./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt & pid=$!
 
-{ sleep 90; kill $pid; }
+{ sleep 3600; kill $pid; }
diff --git a/tidl_apps/tidl_demo_livecam/tidl_demo_livecam.desktop b/tidl_apps/tidl_demo_livecam/tidl_demo_livecam.desktop
index e3d2be4..7b214e8 100644
--- a/tidl_apps/tidl_demo_livecam/tidl_demo_livecam.desktop
+++ b/tidl_apps/tidl_demo_livecam/tidl_demo_livecam.desktop
@@ -1,6 +1,6 @@
 #!/usr/bin/env xdg-open
 [Desktop Entry]
-Name=J11v2 Camera Input
+Name=J11v2 Camera Input (2xDSP+0xEVE)
 Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
 Exec=runTidlLiveCam.sh
 Type=Application
diff --git a/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh b/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
index 5feabc3..9219f60 100644
--- a/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
+++ b/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
@@ -2,4 +2,4 @@ cd /usr/share/ti/tidl/examples/classification
 
 ./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt & pid=$!
 
-{ sleep 90; kill $pid; }
+{ sleep 3600; kill $pid; }
diff --git a/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh b/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
index 0033fde..37e5ec3 100644
--- a/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
+++ b/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
@@ -2,5 +2,5 @@ cd /usr/share/ti/tidl/examples/classification
 
 ./tidl_classification -g 2 -d 1 -e 1 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test2.mp4 -c ./stream_config_j11_v2.txt & pid=$!
 
-{ sleep 90; kill $pid; }
+{ sleep 3600; kill $pid; }
 
diff --git a/tidl_apps/tidl_demo_pnexamples/tidl_demo_pnexamples.desktop b/tidl_apps/tidl_demo_pnexamples/tidl_demo_pnexamples.desktop
index 0baa386..c2e3dee 100644
--- a/tidl_apps/tidl_demo_pnexamples/tidl_demo_pnexamples.desktop
+++ b/tidl_apps/tidl_demo_pnexamples/tidl_demo_pnexamples.desktop
@@ -1,6 +1,6 @@
 #!/usr/bin/env xdg-open
 [Desktop Entry]
-Name=J11v2 Pos/Neg Examples
+Name=J11v2 Pos/Neg Examples (1xDSP+1xEVE)
 Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
 Exec=runTidlPnExamples.sh
 Type=Application
diff --git a/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh b/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
index 30ece7a..8d9d5d4 100644
--- a/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
+++ b/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
@@ -1,4 +1,4 @@
 cd /usr/share/ti/tidl/examples/classification
 
 ./tidl_classification -g 1 -d 2 -e 2 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=$!
-{ sleep 90; kill $pid; }
+{ sleep 3600; kill $pid; }
diff --git a/tidl_apps/tidl_demo_staticimg/tidl_demo_staticimg.desktop b/tidl_apps/tidl_demo_staticimg/tidl_demo_staticimg.desktop
index 47324fa..742fac0 100644
--- a/tidl_apps/tidl_demo_staticimg/tidl_demo_staticimg.desktop
+++ b/tidl_apps/tidl_demo_staticimg/tidl_demo_staticimg.desktop
@@ -1,6 +1,6 @@
 #!/usr/bin/env xdg-open
 [Desktop Entry]
-Name=J11v2 Real Common Objects
+Name=J11v2 Real Common Objects (2xDSP+2xEVE)
 Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
 Exec=runTidlStaticImg.sh
 Type=Application
diff --git a/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh b/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
index d49c289..b32fe56 100644
--- a/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
+++ b/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
@@ -1,4 +1,4 @@
 cd /usr/share/ti/tidl/examples/classification
 
 ./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=$!
-{ sleep 90; kill $pid; }
+{ sleep 3600; kill $pid; }
diff --git a/tidl_apps/tidl_demo_staticimg_dsponly/tidl_demo_staticimg_dsponly.desktop b/tidl_apps/tidl_demo_staticimg_dsponly/tidl_demo_staticimg_dsponly.desktop
index 9dfa499..f56cbed 100644
--- a/tidl_apps/tidl_demo_staticimg_dsponly/tidl_demo_staticimg_dsponly.desktop
+++ b/tidl_apps/tidl_demo_staticimg_dsponly/tidl_demo_staticimg_dsponly.desktop
@@ -1,6 +1,6 @@
 #!/usr/bin/env xdg-open
 [Desktop Entry]
-Name=J11v2 Real Common Objects
+Name=J11v2 Real Common Objects (2xDSP+0xEVE)
 Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
 Exec=runTidlStaticImg_dsponly.sh
 Type=Application
diff --git a/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh b/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
index 197c218..83fdab9 100755
--- a/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
+++ b/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
@@ -2,4 +2,4 @@ cd /usr/share/ti/tidl/examples/classification
 
 ./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=$!
 
-{ sleep 90; kill $pid; }
+{ sleep 3600; kill $pid; }
diff --git a/tidl_apps/tidl_demo_staticimg_lg2/tidl_demo_staticimg_lg2.desktop b/tidl_apps/tidl_demo_staticimg_lg2/tidl_demo_staticimg_lg2.desktop
index aa07fc3..215f4e9 100644
--- a/tidl_apps/tidl_demo_staticimg_lg2/tidl_demo_staticimg_lg2.desktop
+++ b/tidl_apps/tidl_demo_staticimg_lg2/tidl_demo_staticimg_lg2.desktop
@@ -1,6 +1,6 @@
 #!/usr/bin/env xdg-open
 [Desktop Entry]
-Name=J11v2 Static Image
+Name=J11v2 Static Image (1xDSP+2xEVE)
 Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
 Exec=runTidlStaticImg_lg2.sh
 Type=Application
-- 
1.9.1


