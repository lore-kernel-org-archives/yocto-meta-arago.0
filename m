Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 72FFF52978
	for <meta-arago@arago-project.org>;
	Wed, 20 Feb 2019 15:41:34 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1KFfWYC047911
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2019 09:41:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550677292;
	bh=BVXfszgFC9arFRASLpFTfkGzFlrn+na6jTWcm95UqZk=;
	h=From:To:Subject:Date;
	b=mnEvwTZl9lAXul54pD5fKGT1OQsokJTMtaMY7Uxpv9sdaCmoZSeFeV9++niV0wTVa
	VpM4TgIs/mj6ZZELu99awpfJ7iAic4H6RSHsjpu3PcAP/DJbkj3Svwh+K5VQFxy85O
	3JI4mlezCWswhthT+QIXJWTs2hnES6SwSE73MHpk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1KFfWa6006010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2019 09:41:32 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 20 Feb 2019 09:41:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 20 Feb 2019 09:41:31 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1KFfVJD014268
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2019 09:41:31 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Feb 2019 10:41:27 -0500
Message-ID: <1550677287-61590-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] arm_multimedia: add kmssink support
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
X-List-Received-Date: Wed, 20 Feb 2019 15:41:35 -0000
Content-Type: text/plain

- use kmssink as video sink for AM4 and AM6 SoCs
- cleanup indentations

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../arm_multimedia_h264dec/runH264Dec.sh           | 15 ++++++-
 .../arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh   | 52 +++++++++++++---------
 .../arm_multimedia_mpeg4dec/runMpeg4Dec.sh         | 13 +++++-
 3 files changed, 55 insertions(+), 25 deletions(-)

diff --git a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
index f1ea7dd..9a3b47b 100644
--- a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
+++ b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
@@ -1,7 +1,9 @@
 #!/bin/sh
 
 machine_type="`cat /etc/hostname`"
+VIDEO_SINK="kmssink"
 if [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
+        VIDEO_SINK="fbdevsink"
 	resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
 	if [ "$resolution" = "480x272" ]; then
 		filename="/usr/share/ti/video/TearOfSteel-Short-400x240.264"
@@ -25,7 +27,8 @@ then
         fi
 elif [ "$machine_type" = "am65xx-evm" ]
 then
-     filename="/usr/share/ti/video/TearOfSteel-Short-1280x540.h264"
+     VIDEO_SINK="kmssink_am6"
+     filename="/usr/share/ti/video/TearOfSteel-Short-720x406.264"
 else
 	default_display="`cat /sys/devices/platform/omapdss/manager0/display`"
 	if [ "$default_display" = "dvi" ]; then
@@ -50,4 +53,12 @@ echo ""
 echo "Launch GStreamer pipeline"
 echo ""
 echo "Length of video clip: 21 seconds"
-gst-launch-1.0 filesrc location=$filename ! queue ! h264parse ! avdec_h264 ! videoconvert ! fbdevsink device=/dev/fb0
+if [ "$VIDEO_SINK" = "fbdevsink" ]
+then
+	gst-launch-1.0 filesrc location=$filename ! queue ! h264parse ! avdec_h264 ! videoconvert ! fbdevsink device=/dev/fb0
+elif [ "$VIDEO_SINK" = "kmssink_am6" ]
+then
+	gst-launch-1.0 filesrc location=$filename ! queue ! h264parse ! avdec_h264 ! videoconvert ! 'video/x-raw, format=(string)BGRA' ! kmssink
+else
+	gst-launch-1.0 filesrc location=$filename ! queue ! h264parse ! avdec_h264 ! videoconvert ! kmssink
+fi
\ No newline at end of file
diff --git a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
index 18ee0ea..d968435 100644
--- a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
+++ b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
@@ -8,28 +8,34 @@ elif grep -q "no soundcards" /proc/asound/cards; then
         echo "No sound devices found!"
 else
 	machine_type="`cat /etc/hostname`"
+	VIDEO_SINK="kmssink"
 	if [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
+		VIDEO_SINK="fbdevsink"
 		resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
-		 if [ "$resolution" = "480x272" ]; then
+		if [ "$resolution" = "480x272" ]; then
 			filename="/usr/share/ti/video/TearOfSteel-AV-Short-400x240.mp4"
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
+	elif [ "$machine_type" = "am65xx-evm" ]
+	then
+		VIDEO_SINK="kmssink_am6"
+		filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
+	elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]
+	then
+		resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
+		if [ "$resolution" = "480x272" ]; then
+			filename="/usr/share/ti/video/TearOfSteel-AV-Short-400x240.mp4"
+		else
+			filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
+		fi
 	else
 		default_display="`cat /sys/devices/platform/omapdss/manager0/display`"
 		if [ "$default_display" = "dvi" ]; then
@@ -52,14 +58,12 @@ else
 		amixer -c 0 set Headset 1+ unmute
 	elif [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
 		amixer cset name='PCM Playback Volume' 127
-    elif [ "$machine_type" = "omap5-evm" ]; then
+	elif [ "$machine_type" = "omap5-evm" ]; then
 		amixer cset name='PCM Playback Volume' 127
-    elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]; then
-
+	elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]; then
 		# EPOS uses a different configuration so check if
 		# we are running on that board
 		model_name=`cat /proc/device-tree/model | grep -i epos`
-
 		if [ "$?" = '0' ]; then
 			amixer cset name='DAC Playback Volume' 127
 			amixer cset name='HP Analog Playback Volume' 66
@@ -72,5 +76,11 @@ else
 			amixer cset name='PCM Playback Volume' 127
 		fi
 	fi
-	gst-launch-1.0 filesrc location=$filename ! queue ! qtdemux name=demux demux.audio_0 ! queue ! faad ! alsasink demux.video_0 ! queue ! avdec_mpeg4 ! videoconvert ! fbdevsink device=/dev/fb0
+	if [ "$VIDEO_SINK" = "fbdevsink" ]; then
+		gst-launch-1.0 filesrc location=$filename ! queue ! qtdemux name=demux demux.audio_0 ! queue ! faad ! alsasink demux.video_0 ! queue ! avdec_mpeg4 ! videoconvert ! fbdevsink device=/dev/fb0
+	elif [ "$VIDEO_SINK" = "kmssink_am6" ]; then
+		gst-launch-1.0 filesrc location=$filename ! queue ! qtdemux name=demux demux.audio_0 ! queue ! faad ! alsasink demux.video_0 ! queue ! avdec_mpeg4 ! videoconvert ! 'video/x-raw, format=(string)BGRA' ! kmssink
+	else
+		gst-launch-1.0 filesrc location=$filename ! queue ! qtdemux name=demux demux.audio_0 ! queue ! faad ! alsasink demux.video_0 ! queue ! avdec_mpeg4 ! videoconvert ! kmssink
+	fi
 fi
diff --git a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
index 82fcb2c..bb565c2 100644
--- a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
+++ b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
@@ -1,7 +1,9 @@
 #!/bin/sh
 
 machine_type="`cat /etc/hostname`"
+VIDEO_SINK="kmssink"
 if [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
+        VIDEO_SINK="fbdevsink"
 	resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
 	if [ "$resolution" = "480x272" ]; then
 		filename="/usr/share/ti/video/TearOfSteel-Short-400x240.m4v"
@@ -25,7 +27,8 @@ then
     fi
 elif [ "$machine_type" = "am65xx-evm" ]
 then
-     filename="/usr/share/ti/video/TearOfSteel-Short-1280x540.m4v"
+     VIDEO_SINK="kmssink_am6"
+     filename="/usr/share/ti/video/TearOfSteel-Short-720x406.m4v"
 else
 	default_display="`cat /sys/devices/platform/omapdss/manager0/display`"
 	if [ "$default_display" = "dvi" ]; then
@@ -46,4 +49,10 @@ if [ ! -f $filename ]; then
         echo "Video clip not found"
         exit 1
 fi
-gst-launch-1.0 playbin uri=file://$filename video-sink=fbdevsink audio-sink=fakesink
+if [ "$VIDEO_SINK" = "fbdevsink" ]; then
+	gst-launch-1.0 playbin uri=file://$filename video-sink=fbdevsink audio-sink=fakesink
+elif [ "$VIDEO_SINK" = "kmssink_am6" ]; then
+	gst-launch-1.0 filesrc location=$filename ! queue ! qtdemux name=demux demux.video_0 ! queue ! avdec_mpeg4 ! videoconvert ! 'video/x-raw, format=(string)BGRA' ! kmssink
+else
+	gst-launch-1.0 filesrc location=$filename ! queue ! qtdemux name=demux demux.video_0 ! queue ! avdec_mpeg4 ! videoconvert ! kmssink
+fi
-- 
1.9.1


