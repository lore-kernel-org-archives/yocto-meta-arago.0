Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 27AFE520EA
	for <meta-arago@arago-project.org>;
	Thu, 14 Mar 2019 18:51:16 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2EIp6UQ061999
	for <meta-arago@arago-project.org>; Thu, 14 Mar 2019 13:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552589466;
	bh=GAY2t9iq8KA90hZjSmLyTxIfnkxOKgpQbfAf0VeYb9k=;
	h=From:To:CC:Subject:Date;
	b=fSndu/vF2kyJMOM1BS+JTLTvcu98lTvK2QSQB5XTyHgc7tmEK3PTF8BOd+YfDh58T
	mCAXFCD0rJ9eU3aYKeCYr50B9fWigc4Khka5njXyeLCa3umwCSCMz95J+MWbflR+vX
	3m/mSkw29ZgjIy0BAorHE39EM8DroglX7m0LPWQY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2EIp6BU102447
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 14 Mar 2019 13:51:06 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 14 Mar 2019 13:51:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 14 Mar 2019 13:51:05 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2EIp5Xm013992;
	Thu, 14 Mar 2019 13:51:05 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Mar 2019 09:44:30 -0400
Message-ID: <20190314134431.17205-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCHv2 1/2] [tidl] Fix config paths for dog breeds classification demo; fix subset class filename
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
X-List-Received-Date: Thu, 14 Mar 2019 18:51:16 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh b/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh
index 7896417..20bc008 100644
--- a/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh
+++ b/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh
@@ -2,7 +2,7 @@ cd /usr/share/ti/tidl/examples/classification
 
 if cat /proc/device-tree/model | grep "AM574"
 then
-  ./tidl_classification -g 2 -d 1 -e 2 -l ./toydogs/toydogsnet.txt -s ./toydogs/toydogclasses.txt -i ./clips/toydogs_854x480.mp4 -c ./stream_config_j11_toydogs.txt
+  ./tidl_classification -g 2 -d 1 -e 2 -l ./toydogsnet.txt -s ./toydogsclasses.txt -i ./clips/toydogs_854x480.mp4 -c ./stream_config_toydogs.txt
 else
   numdsp=2
   if cat /proc/device-tree/model | grep "AM571"
@@ -10,5 +10,5 @@ else
     numdsp=1
   fi
   echo "NUMDSPs is $numdsp"
-  ./tidl_classification -g 1 -d $numdsp -e 0 -l ./toydogs/toydogsnet.txt -s ./toydogs/toydogclasses.txt -i ./clips/toydogs_854x480.mp4 -c ./stream_config_j11_toydogs.txt
+  ./tidl_classification -g 1 -d $numdsp -e 0 -l ./toydogsnet.txt -s ./toydogsclasses.txt -i ./clips/toydogs_854x480.mp4 -c ./stream_config_toydogs.txt
 fi
-- 
2.17.1


