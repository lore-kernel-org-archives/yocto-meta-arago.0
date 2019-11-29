Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 87FDB52A10
	for <meta-arago@arago-project.org>;
	Fri, 29 Nov 2019 14:24:53 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xATENNmc016269
	for <meta-arago@arago-project.org>; Fri, 29 Nov 2019 08:23:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575037403;
	bh=UTBt3Zw/QW0w5NRK4oS3Z8HAqpVgEoQXCDcBHxKMDLw=;
	h=From:To:CC:Subject:Date;
	b=V5ORBCFxNMuLZ6jn5In/HIKhGfbDy9w2NYuK1bBKjcR6TdiWoZnjiNtqe8+tudUv6
	/zGZSp+Kv2953hZvFERiFDGH50o8PEK9/56WpyIOCVeD4cQ1VxQH6U8TmX3diCFAq0
	MxrYH5eco1zOKpywufweaIdGXLef65QAszLFkQQ0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xATENMrb002556
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 29 Nov 2019 08:23:22 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 29 Nov 2019 08:23:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 29 Nov 2019 08:23:22 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xATENMtF019679;
	Fri, 29 Nov 2019 08:23:22 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Nov 2019 09:21:31 -0500
Message-ID: <20191129142131.23877-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH] tidl_apps: Add autodetection of EVE and DSP count in matrix-gui tidl scripts
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
X-List-Received-Date: Fri, 29 Nov 2019 14:24:53 -0000
Content-Type: text/plain

- EVE and DSP count is reported by opencl example 'platforms'
- For several scripts, TIDL network heap size is adjusted to allow execution on BBAI (CMEM=384MB)

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../tidl_demo_dogbreeds/runTidlDogBreeds.sh      | 16 ++++++++--------
 .../tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh  |  9 +++++++--
 tidl_apps/tidl_demo_objdet/runTidlObjdet.sh      |  7 +++++--
 .../runTidlObjdet_livecam.sh                     |  6 ++++--
 .../tidl_demo_pnexamples/runTidlPnExamples.sh    |  5 +++++
 tidl_apps/tidl_demo_segment/runTidlSegment.sh    |  8 ++++++--
 .../tidl_demo_staticimg/runTidlStaticImg.sh      |  7 +++++--
 .../runTidlStaticImg_lg2.sh                      |  9 +++++++--
 8 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh b/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh
index 20bc008..133062e 100644
--- a/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh
+++ b/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh
@@ -1,14 +1,14 @@
 cd /usr/share/ti/tidl/examples/classification
-
-if cat /proc/device-tree/model | grep "AM574"
+export numeve=$(/usr/share/ti/examples/opencl/platforms/platforms  | grep "Embedded Vision Engine" | wc -l)
+export numdsp=$(find /proc/device-tree/ocp/ -name "dsp_system*" | wc -l)
+if ((numeve > 0))
 then
-  ./tidl_classification -g 2 -d 1 -e 2 -l ./toydogsnet.txt -s ./toydogsclasses.txt -i ./clips/toydogs_854x480.mp4 -c ./stream_config_toydogs.txt
+  echo "NUMEVEs is $numeve"
+  echo "NUMDSPs is $numdsp"
+  export TIDL_NETWORK_HEAP_SIZE_EVE=56623104
+  export TIDL_NETWORK_HEAP_SIZE_DSP=56623104
+  ./tidl_classification -g 2 -d 1 -e $numeve -l ./toydogsnet.txt -s ./toydogsclasses.txt -i ./clips/toydogs_854x480.mp4 -c ./stream_config_toydogs.txt
 else
-  numdsp=2
-  if cat /proc/device-tree/model | grep "AM571"
-  then
-    numdsp=1
-  fi
   echo "NUMDSPs is $numdsp"
   ./tidl_classification -g 1 -d $numdsp -e 0 -l ./toydogsnet.txt -s ./toydogsclasses.txt -i ./clips/toydogs_854x480.mp4 -c ./stream_config_toydogs.txt
 fi
diff --git a/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh b/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
index 9dfd098..fe5e59c 100644
--- a/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
+++ b/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
@@ -1,3 +1,8 @@
+export numeve=$(/usr/share/ti/examples/opencl/platforms/platforms  | grep "Embedded Vision Engine" | wc -l)
+export numdsp=$(find /proc/device-tree/ocp/ -name "dsp_system*" | wc -l)
+export TIDL_NETWORK_HEAP_SIZE_EVE=56623104
+export TIDL_NETWORK_HEAP_SIZE_DSP=56623104
+echo "NUMEVEs is $numeve"
+echo "NUMDSPs is $numdsp"
 cd /usr/share/ti/tidl/examples/classification
-
-./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt
+./tidl_classification -g 2 -d $numdsp -e $numeve -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_objdet/runTidlObjdet.sh b/tidl_apps/tidl_demo_objdet/runTidlObjdet.sh
index 15bf433..8f9a721 100644
--- a/tidl_apps/tidl_demo_objdet/runTidlObjdet.sh
+++ b/tidl_apps/tidl_demo_objdet/runTidlObjdet.sh
@@ -1,6 +1,9 @@
+export numeve=$(/usr/share/ti/examples/opencl/platforms/platforms  | grep "Embedded Vision Engine" | wc -l)
+export numdsp=$(find /proc/device-tree/ocp/ -name "dsp_system*" | wc -l)
 cd /usr/share/ti/tidl/examples/ssd_multibox
-if cat /proc/device-tree/model | grep "AM574"
+if ((numeve > 0))
 then
-  ./ssd_multibox -p 40 -d 1 -e 2 -f 1000 -i ./clips/pexels_videos_3623.mp4
+  echo "NUMEVEs is $numeve"
+  ./ssd_multibox -p 40 -d 1 -e $numeve -f 1000 -i ./clips/pexels_videos_3623.mp4
 fi
 
diff --git a/tidl_apps/tidl_demo_objdet_livecam/runTidlObjdet_livecam.sh b/tidl_apps/tidl_demo_objdet_livecam/runTidlObjdet_livecam.sh
index 88ee369..7826628 100644
--- a/tidl_apps/tidl_demo_objdet_livecam/runTidlObjdet_livecam.sh
+++ b/tidl_apps/tidl_demo_objdet_livecam/runTidlObjdet_livecam.sh
@@ -1,6 +1,8 @@
+export numeve=$(/usr/share/ti/examples/opencl/platforms/platforms  | grep "Embedded Vision Engine" | wc -l)
+export numdsp=$(find /proc/device-tree/ocp/ -name "dsp_system*" | wc -l)
 cd /usr/share/ti/tidl/examples/ssd_multibox
-if cat /proc/device-tree/model | grep "AM574"
+if $((numeve > 0))
 then
-  ./ssd_multibox -p 40 -d 1 -e 2 -f 1000 -i camera1
+  ./ssd_multibox -p 40 -d 1 -e $numeve -f 1000 -i camera1
 fi
 
diff --git a/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh b/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
index 7171f53..668459d 100644
--- a/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
+++ b/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
@@ -1,3 +1,8 @@
+xport numeve=$(/usr/share/ti/examples/opencl/platforms/platforms  | grep "Embedded Vision Engine" | wc -l)
+export numdsp=$(find /proc/device-tree/ocp/ -name "dsp_system*" | wc -l)
+export TIDL_NETWORK_HEAP_SIZE_EVE=56623104
+export TIDL_NETWORK_HEAP_SIZE_DSP=56623104
+
 cd /usr/share/ti/tidl/examples/classification
 
 ./tidl_classification -g 2 -d 1 -e 1 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test2.mp4 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_segment/runTidlSegment.sh b/tidl_apps/tidl_demo_segment/runTidlSegment.sh
index d83f03d..397eaf9 100644
--- a/tidl_apps/tidl_demo_segment/runTidlSegment.sh
+++ b/tidl_apps/tidl_demo_segment/runTidlSegment.sh
@@ -1,5 +1,9 @@
-cd /usr/share/ti/tidl/examples/segmentation
-if cat /proc/device-tree/model | grep "AM574"
+export numeve=$(/usr/share/ti/examples/opencl/platforms/platforms  | grep "Embedded Vision Engine" | wc -l)
+export numdsp=$(find /proc/device-tree/ocp/ -name "dsp_system*" | wc -l)
+if ((numeve > 0))
 then
+  echo "NUMEVEs is $numeve"
+  echo "NUMDSPs is $numdsp"
+  cd /usr/share/ti/tidl/examples/segmentation
   ./segmentation -i ./clips/traffic_pixabay_298.mp4 -f 2000 -w 720
 fi
diff --git a/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh b/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
index 7d017d4..ed2597b 100644
--- a/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
+++ b/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
@@ -1,3 +1,6 @@
+export numeve=$(/usr/share/ti/examples/opencl/platforms/platforms  | grep "Embedded Vision Engine" | wc -l)
+export numdsp=$(find /proc/device-tree/ocp/ -name "dsp_system*" | wc -l)
+export TIDL_NETWORK_HEAP_SIZE_EVE=56623104
+export TIDL_NETWORK_HEAP_SIZE_DSP=56623104
 cd /usr/share/ti/tidl/examples/classification
-
-./tidl_classification -g 1 -d 2 -e 2 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
+./tidl_classification -g 1 -d $numdsp -e $numeve -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh b/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
index 4824722..c8a9386 100755
--- a/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
+++ b/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
@@ -1,3 +1,8 @@
+export numeve=$(/usr/share/ti/examples/opencl/platforms/platforms  | grep "Embedded Vision Engine" | wc -l)
+export numdsp=$(find /proc/device-tree/ocp/ -name "dsp_system*" | wc -l)
+export TIDL_NETWORK_HEAP_SIZE_EVE=56623104
+export TIDL_NETWORK_HEAP_SIZE_DSP=56623104
+echo "NUMEVEs is $numeve"
+echo "NUMDSPs is $numdsp"
 cd /usr/share/ti/tidl/examples/classification
-
-./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
+./tidl_classification -g 2 -d 1 -e $numeve -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
-- 
2.17.1


