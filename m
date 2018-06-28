Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 22111529A9
	for <meta-arago@arago-project.org>;
	Thu, 28 Jun 2018 21:37:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5SLb8wQ118275
	for <meta-arago@arago-project.org>; Thu, 28 Jun 2018 16:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530221828;
	bh=Ynn+aXTPo+ybK7/b6ld3zEuI/d0n6N/dhqHo3msh3XY=;
	h=From:To:CC:Subject:Date;
	b=JxQ4QO2/vJ8xPgZOZE+d9cMADWI1QiW9BnxUkPL3jokiHN0Kb8gVTMuuY1CwvtMBO
	Is2c6BUowsYfO4lwd2tlsYe4Qwrf/BHxlOjH5kzWdSou6xNk62/k93MqM9s6W1FLNX
	NGqgrcjnZLpyZHFwEhi+0vYLe+kYe0ob2hYbJvY8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5SLb7QE003929
	for <meta-arago@arago-project.org>; Thu, 28 Jun 2018 16:37:07 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 28 Jun 2018 16:37:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 28 Jun 2018 16:37:07 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5SLb75T013773;
	Thu, 28 Jun 2018 16:37:07 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Jun 2018 17:37:05 -0400
Message-ID: <1530221825-8546-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [matrix-gui-v2-apps] [PATCH] arm_multimedia_*: script fix for am3/am4 HS EVMs and am438x EPOS EVM
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
X-List-Received-Date: Thu, 28 Jun 2018 21:37:14 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 multimedia_apps/arm_multimedia_aacdec/runAACDec.sh             | 4 ++--
 multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh | 4 ++--
 multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh           | 4 ++--
 multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh   | 8 ++++----
 multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh         | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh b/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh
index 2db214e..111d107 100644
--- a/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh
+++ b/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh
@@ -18,7 +18,7 @@ else
 		amixer cset name='HeadsetL Mixer AudioL1' on
 		amixer cset name='HeadsetR Mixer AudioR1' on
 		amixer -c 0 set Headset 1+ unmute
-	elif [ "$machine_type" = "am335x-evm" ]; then
+	elif [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
 		amixer cset name='PCM Playback Volume' 127
 	elif [ "$machine_type" = "omap5-evm" ]; then
 		amixer cset name='PCM Playback Volume' 127
@@ -36,7 +36,7 @@ else
                   AUDIO_SINK="$AUDIO_SINK device=hw:$AUDIO_CARD,0"
                   amixer cset -c $AUDIO_CARD name='PCM Playback Volume' 127
                 fi
-	elif [ "$machine_type" = "am437x-evm" ]; then
+	elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]; then
 
 		# EPOS uses a different configuration
 		# we are running on that board
diff --git a/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh b/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh
index fe2e3ea..c7b2b3f 100755
--- a/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh
+++ b/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh
@@ -27,7 +27,7 @@ else
         amixer cset name='Analog Left AUXL Capture Switch' 1  > /dev/null
         amixer cset name='Analog Right AUXR Capture Switch' 1 > /dev/null
         amixer sset 'Headset' 60%,60% > /dev/null
-    elif [ "$machine_type" = "am335x-evm" ]; then
+    elif [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
         amixer cset name='PCM Playback Volume' 80%,80% > /dev/null
         amixer cset name='PGA Capture Volume' 65%,65% > /dev/null
         amixer sset 'Right PGA Mixer Line1R' on > /dev/null
@@ -55,7 +55,7 @@ else
         amixer -c BeagleBoardX15 sset 'Left PGA Mixer Mic2L' on
         amixer -c BeagleBoardX15 sset 'Right PGA Mixer Mic2R' on
         amixer -c BeagleBoardX15 sset 'PGA' 40
-    elif [ "$machine_type" = "am437x-evm" ]; then
+    elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]; then
         # EPOS uses a different configuration
         # we are running on that board
         model_name=`cat /proc/device-tree/model | grep -i epos`
diff --git a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
index 1377371..3f15084 100644
--- a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
+++ b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 machine_type="`cat /etc/hostname`"
-if [ "$machine_type" = "am335x-evm" ]; then
+if [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
 	resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
 	if [ "$resolution" = "480x272" ]; then
 		filename="/usr/share/ti/video/TearOfSteel-Short-400x240.264"
@@ -15,7 +15,7 @@ then
 elif [ "$machine_type" = "omap5-evm" ]
 then
     filename="/usr/share/ti/video/TearOfSteel-Short-720x406.264"
-elif [ "$machine_type" = "am437x-evm" ]
+elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]
 then
         resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
         if [ "$resolution" = "480x272" ]; then
diff --git a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
index 2d6f96e..f4a860e 100644
--- a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
+++ b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
@@ -6,7 +6,7 @@ if [ ! -f $amixer_find ]; then
         echo "Please connect audio output and install ALSA soundcard driver"
 else
 	machine_type="`cat /etc/hostname`"
-	if [ "$machine_type" = "am335x-evm" ]; then
+	if [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
 		resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
 		 if [ "$resolution" = "480x272" ]; then
 			filename="/usr/share/ti/video/TearOfSteel-AV-Short-400x240.mp4"
@@ -20,7 +20,7 @@ else
     elif [ "$machine_type" = "omap5-evm" ]
     then
         filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
-    elif [ "$machine_type" = "am437x-evm" ]
+    elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]
     then
             resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
             if [ "$resolution" = "480x272" ]; then
@@ -48,11 +48,11 @@ else
 		amixer cset name='HeadsetL Mixer AudioL1' on
 		amixer cset name='HeadsetR Mixer AudioR1' on
 		amixer -c 0 set Headset 1+ unmute
-	elif [ "$machine_type" = "am335x-evm" ]; then
+	elif [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
 		amixer cset name='PCM Playback Volume' 127
     elif [ "$machine_type" = "omap5-evm" ]; then
 		amixer cset name='PCM Playback Volume' 127
-    elif [ "$machine_type" = "am437x-evm" ]; then
+    elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]; then
 
 		# EPOS uses a different configuration so check if
 		# we are running on that board
diff --git a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
index 2b7b3a6..92a44e0 100644
--- a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
+++ b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 machine_type="`cat /etc/hostname`"
-if [ "$machine_type" = "am335x-evm" ]; then
+if [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
 	resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
 	if [ "$resolution" = "480x272" ]; then
 		filename="/usr/share/ti/video/TearOfSteel-Short-400x240.m4v"
@@ -15,7 +15,7 @@ then
 elif [ "$machine_type" = "omap5-evm" ]
 then
     filename="/usr/share/ti/video/TearOfSteel-Short-720x406.m4v"
-elif [ "$machine_type" = "am437x-evm" ]
+elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]
 then
     resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
     if [ "$resolution" = "480x272" ]; then
-- 
1.9.1


