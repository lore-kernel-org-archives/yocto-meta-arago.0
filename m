Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 3A8B6520C0
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2018 01:14:46 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB61EZiT071786
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2018 19:14:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544058875;
	bh=InxQgRIslspq/Svx1caOE7vqvJ4RA9pXF1fHmfhL7+M=;
	h=From:To:CC:Subject:Date;
	b=S3HC/qqf9csISLVQ7G53J8Zq9Mf8vtvc/2wVo9M4oR1kvRc6Nofowoi3Z4pyUkBHk
	uyvBfpnPpsQ757W/4qKdfnpy1GxAU8NQZXcUxyXVfpysuGyyGFX8zTjHwWstvi+xE7
	DjPuwFvuKRB0E05s0XVo3dnKFF0/g3fqh19acWGE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB61EZ5F106813
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2018 19:14:35 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 5 Dec 2018 19:14:34 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 5 Dec 2018 19:14:34 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB61EYVb010562;
	Wed, 5 Dec 2018 19:14:34 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Dec 2018 15:11:13 -0500
Message-ID: <20181205201113.31706-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH] tidl: Detect AM571x, to invoke TIDL classification demo with only one DSP
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
X-List-Received-Date: Thu, 06 Dec 2018 01:14:46 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh            | 9 ++++++++-
 .../runTidlStaticImg_dsponly.sh                          | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh b/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
index e225519..6f5b464 100644
--- a/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
+++ b/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
@@ -1,3 +1,10 @@
+numdsp=2
+if cat /proc/device-tree/model | grep "AM571"
+then
+  numdsp=1
+fi
+echo "NUMDSPs is $numdsp"
+
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt
+./tidl_classification -g 1 -d $numdsp -e 0 -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh b/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
index 64e3c68..4819ace 100644
--- a/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
+++ b/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
@@ -1,3 +1,10 @@
+numdsp=2
+if cat /proc/device-tree/model | grep "AM571"
+then
+  numdsp=1
+fi
+echo "NUMDSPs is $numdsp"
+
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
+./tidl_classification -g 1 -d $numdsp -e 0 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
-- 
2.17.1


