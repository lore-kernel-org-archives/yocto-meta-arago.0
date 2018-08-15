Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A462152A49
	for <meta-arago@arago-project.org>;
	Wed, 15 Aug 2018 19:28:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7FJSaf6020275
	for <meta-arago@arago-project.org>; Wed, 15 Aug 2018 14:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534361316;
	bh=rQ5lnssGa2PhTFyDHpRl78cRO6BUF+o4kSWOBI7okc8=;
	h=From:To:Subject:Date;
	b=uMENEkR4dfPnrpgzuTiL4isWOlPzT+ERSYDa9hqufYssBF3w/xCza62VV2a1myu0q
	cxZp7NXGf/q6L0B2kvcIWjRqqzU197axkJYd5YYrMQ9lXcAQon1d26szYDdI87BSiC
	1B24BkkdDUHnFCHSfnepGGkR+a5XvXHV5Mq3WKwg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7FJSakB028041
	for <meta-arago@arago-project.org>; Wed, 15 Aug 2018 14:28:36 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 15 Aug 2018 14:28:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 15 Aug 2018 14:28:35 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7FJSZJA023223
	for <meta-arago@arago-project.org>; Wed, 15 Aug 2018 14:28:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 Aug 2018 15:28:31 -0400
Message-ID: <1534361311-56287-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] arm_multimedia: add AM65xx (Maxwell) support
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
X-List-Received-Date: Wed, 15 Aug 2018 19:28:44 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 multimedia_apps/arm_multimedia_aacdec/runAACDec.sh             | 4 ++++
 multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh | 4 ++++
 multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh           | 2 +-
 multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh   | 4 +++-
 multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh         | 2 +-
 5 files changed, 13 insertions(+), 3 deletions(-)
 mode change 100755 => 100644 multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh

diff --git a/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh b/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh
index 111d107..dce07ee 100644
--- a/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh
+++ b/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh
@@ -4,6 +4,8 @@ amixer_find="/usr/bin/amixer"
 if [ ! -f $amixer_find ]; then
         echo "amixer not found"
         echo "Please connect audio output and install ALSA soundcard driver"
+elif grep -q "no soundcards" /proc/asound/cards; then
+        echo "No sound devices found!"
 else
 	machine_type="`cat /etc/hostname`"
 	filename="/usr/share/ti/audio/HistoryOfTI.aac"
@@ -22,6 +24,8 @@ else
 		amixer cset name='PCM Playback Volume' 127
 	elif [ "$machine_type" = "omap5-evm" ]; then
 		amixer cset name='PCM Playback Volume' 127
+	elif [ "$machine_type" = "am65xx-evm" ]; then
+		amixer cset name='PCM Playback Volume' 127
         elif [ "$machine_type" = "am57xx-evm" ]; then
                 # Exit for AM5 IDK when HDMI is disconnected
                 if cat /proc/device-tree/model | grep "IDK"
diff --git a/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh b/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh
old mode 100755
new mode 100644
index c7b2b3f..9e63590
--- a/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh
+++ b/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh
@@ -92,6 +92,10 @@ else
                 amixer -c AM437xGPEVM sset 'PGA' 40
             fi
         fi
+    elif [ "$machine_type" = "am65xx-evm" ]; then
+        # Exit for AM65 for now until audio card info is available
+            echo "Exit as there is no audio port"
+            exit 1
     fi
 
     echo "Recording of 1000 buffers from Line-In will begin in 5 seconds..."
diff --git a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
index 3f15084..be8b2dc 100644
--- a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
+++ b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
@@ -15,7 +15,7 @@ then
 elif [ "$machine_type" = "omap5-evm" ]
 then
     filename="/usr/share/ti/video/TearOfSteel-Short-720x406.264"
-elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]
+elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ] || [ "$machine_type" = "am65xx-evm" ]
 then
         resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
         if [ "$resolution" = "480x272" ]; then
diff --git a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
index f4a860e..18ee0ea 100644
--- a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
+++ b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
@@ -4,6 +4,8 @@ amixer_find="/usr/bin/amixer"
 if [ ! -f $amixer_find ]; then
         echo "amixer not found"
         echo "Please connect audio output and install ALSA soundcard driver"
+elif grep -q "no soundcards" /proc/asound/cards; then
+        echo "No sound devices found!"
 else
 	machine_type="`cat /etc/hostname`"
 	if [ "$machine_type" = "am335x-evm" ] || [ "$machine_type" = "am335x-hs-evm" ]; then
@@ -20,7 +22,7 @@ else
     elif [ "$machine_type" = "omap5-evm" ]
     then
         filename="/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
-    elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]
+    elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]|| [ "$machine_type" = "am65xx-evm" ]
     then
             resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
             if [ "$resolution" = "480x272" ]; then
diff --git a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
index 92a44e0..410d8ea 100644
--- a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
+++ b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
@@ -15,7 +15,7 @@ then
 elif [ "$machine_type" = "omap5-evm" ]
 then
     filename="/usr/share/ti/video/TearOfSteel-Short-720x406.m4v"
-elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ]
+elif [ "$machine_type" = "am437x-evm" ] || [ "$machine_type" = "am437x-hs-evm" ] || [ "$machine_type" = "am438x-epos-evm" ] || [ "$machine_type" = "am65xx-evm" ]
 then
     resolution="`fbset | awk '/geometry/ {print $2"x"$3}'`"
     if [ "$resolution" = "480x272" ]; then
-- 
1.9.1


