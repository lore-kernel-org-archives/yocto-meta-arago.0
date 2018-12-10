Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B556F529AE
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2018 15:58:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBAFw0Kw100133
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 09:58:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544457480;
	bh=8alAuS6bYUj9ZSp8namn7eauoHTovJAR5CsbQg/oXVs=;
	h=From:To:Subject:Date;
	b=LE4ak3iAfNX0WK0FcRQ+GFATst3Ff/rC79PHY8oO4wdib0OSZ4zLWBdepG93JCvIW
	Yi7Z1I5MZtetm6+kb2Mn878oDRBzLvrSpLK2zTPmJj8EaMp/rJyBwMXj3ugUjS0NbH
	sl4Pxj3UVYW2Yj2qX8Dtoeo5xHHvv+eD+VGS3aDI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBAFw02S086791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 09:58:00 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 10 Dec 2018 09:58:00 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 10 Dec 2018 09:58:00 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBAFvxQb032367
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 09:57:59 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Dec 2018 10:57:56 -0500
Message-ID: <1544457476-42896-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] arm_multimedia: use higher resolution video image for AM654x EVM
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
X-List-Received-Date: Mon, 10 Dec 2018 15:58:12 -0000
Content-Type: text/plain

AM654x EVM: play 1280x540 video image on 1280x800 LCD

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../arm_multimedia_h264dec/runH264Dec.sh           |  5 ++-
 .../arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh   | 37 ++++++++++++----------
 .../arm_multimedia_mpeg4dec/runMpeg4Dec.sh         |  5 ++-
 3 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
index be8b2dc..f1ea7dd 100644
--- a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
+++ b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
@@ -15,7 +15,7 @@ then
 elif [ "$machine_type" = "omap5-evm" ]
 then
     filename="/usr/share/ti/video/TearOfSteel-Short-720x406.264"
-elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ] || [ "$machine_type" = "am65xx-evm" ]
+elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]
 then
         resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
         if [ "$resolution" = "480x272" ]; then
@@ -23,6 +23,9 @@ then
         else
                 filename="/usr/share/ti/video/TearOfSteel-Short-720x406.264"
         fi
+elif [ "$machine_type" = "am65xx-evm" ]
+then
+     filename="/usr/share/ti/video/TearOfSteel-Short-1280x540.h264"
 else
 	default_display="`cat /sys/devices/platform/omapdss/manager0/display`"
 	if [ "$default_display" = "dvi" ]; then
diff --git a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
index 18ee0ea..93e6eae 100644
--- a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
+++ b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
@@ -15,21 +15,24 @@ else
 		else
 			# Use WVGA for all other resolutions
 			filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x420.mp4"
-	fi
-    elif [ "$machine_type" = "dra7xx-evm" ]
-    then
-	    filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x420.mp4"
-    elif [ "$machine_type" = "omap5-evm" ]
-    then
-        filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
-    elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]|| [ "$machine_type" = "am65xx-evm" ]
-    then
-            resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
-            if [ "$resolution" = "480x272" ]; then
-                filename="/usr/share/ti/video/TearOfSteel-AV-Short-400x240.mp4"
-            else
-                filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
-            fi
+		fi
+	elif [ "$machine_type" = "dra7xx-evm" ]
+	then
+		filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x420.mp4"
+	elif [ "$machine_type" = "omap5-evm" ]
+	then
+		filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
+	elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]
+	then
+		resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
+		if [ "$resolution" = "480x272" ]; then
+			filename="/usr/share/ti/video/TearOfSteel-AV-Short-400x240.mp4"
+		else
+			filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
+		fi
+	elif [ "$machine_type" = "am65xx-evm" ]
+	then
+		filename="/usr/share/ti/video/TearOfSteel-Short-1280x540.m4v"
 	else
 		default_display="`cat /sys/devices/platform/omapdss/manager0/display`"
 		if [ "$default_display" = "dvi" ]; then
@@ -52,9 +55,9 @@ else
 		amixer -c 0 set Headset 1+ unmute
 	elif [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
 		amixer cset name='PCM Playback Volume' 127
-    elif [ "$machine_type" = "omap5-evm" ]; then
+	elif [ "$machine_type" = "omap5-evm" ]; then
 		amixer cset name='PCM Playback Volume' 127
-    elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]; then
+	elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]; then
 
 		# EPOS uses a different configuration so check if
 		# we are running on that board
diff --git a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
index 410d8ea..82fcb2c 100644
--- a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
+++ b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
@@ -15,7 +15,7 @@ then
 elif [ "$machine_type" = "omap5-evm" ]
 then
     filename="/usr/share/ti/video/TearOfSteel-Short-720x406.m4v"
-elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ] || [ "$machine_type" = "am65xx-evm" ]
+elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]
 then
     resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
     if [ "$resolution" = "480x272" ]; then
@@ -23,6 +23,9 @@ then
     else
             filename="/usr/share/ti/video/TearOfSteel-Short-720x406.m4v"
     fi
+elif [ "$machine_type" = "am65xx-evm" ]
+then
+     filename="/usr/share/ti/video/TearOfSteel-Short-1280x540.m4v"
 else
 	default_display="`cat /sys/devices/platform/omapdss/manager0/display`"
 	if [ "$default_display" = "dvi" ]; then
-- 
1.9.1


