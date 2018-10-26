Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 51B9552960
	for <meta-arago@arago-project.org>;
	Fri, 26 Oct 2018 16:11:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9QGB1Ek011659
	for <meta-arago@arago-project.org>; Fri, 26 Oct 2018 11:11:01 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id w9QGB1gA045733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 26 Oct 2018 11:11:01 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 26 Oct 2018 11:11:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 26 Oct 2018 11:11:01 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9QGB190013260;
	Fri, 26 Oct 2018 11:11:01 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 26 Oct 2018 12:10:58 -0400
Message-ID: <1540570258-2881-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [matrix-gui-v2-apps] [PATCH] arm_multimedia_*: script change to enable audio for AM5-HS EVM
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
X-List-Received-Date: Fri, 26 Oct 2018 16:11:12 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 multimedia_apps/arm_multimedia_aacdec/runAACDec.sh             | 2 +-
 multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh b/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh
index dce07ee..48c5a39 100644
--- a/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh
+++ b/multimedia_apps/arm_multimedia_aacdec/runAACDec.sh
@@ -26,7 +26,7 @@ else
 		amixer cset name='PCM Playback Volume' 127
 	elif [ "$machine_type" = "am65xx-evm" ]; then
 		amixer cset name='PCM Playback Volume' 127
-        elif [ "$machine_type" = "am57xx-evm" ]; then
+        elif [ "$machine_type" = "am57xx-evm" ] || [ "$machine_type" = "am57xx-hs-evm" ]; then
                 # Exit for AM5 IDK when HDMI is disconnected
                 if cat /proc/device-tree/model | grep "IDK"
                 then
diff --git a/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh b/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh
index 9e63590..20c9e5b 100644
--- a/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh
+++ b/multimedia_apps/arm_multimedia_audiocapture/runAudioCapture.sh
@@ -36,7 +36,7 @@ else
         amixer sset 'Left PGA Mixer Line1L' on > /dev/null
         amixer sset 'Left Line1R Mux' differential > /dev/null
         amixer sset 'Right Line1L Mux' differential > /dev/null
-    elif [ "$machine_type" = "am57xx-evm" ]; then
+    elif [ "$machine_type" = "am57xx-evm" ] || [ "$machine_type" = "am57xx-hs-evm" ]; then
         # Exit for AM5 IDK
         if cat /proc/device-tree/model | grep "IDK"
         then
-- 
1.9.1


