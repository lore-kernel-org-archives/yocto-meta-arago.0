Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id AA82E5298A
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2018 18:19:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBAIJ3Bg091907
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 12:19:03 -0600
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBAIJ3Tq041604
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 12:19:03 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 10 Dec 2018 12:19:02 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 10 Dec 2018 12:19:02 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBAIJ2Ks014629
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 12:19:02 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Dec 2018 13:18:57 -0500
Message-ID: <1544465937-40675-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH v2] arm_multimedia: use higher resolution video image for AM654x EVM
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
X-List-Received-Date: Mon, 10 Dec 2018 18:19:15 -0000
Content-Type: text/plain

AM654x EVM: play 1280x540 video image on 1280x800 LCD

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh   | 5 ++++-
 multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

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


