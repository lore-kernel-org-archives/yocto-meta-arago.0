Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id EED3E520EA
	for <meta-arago@arago-project.org>;
	Thu, 14 Mar 2019 16:45:45 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2EGjaoX096759
	for <meta-arago@arago-project.org>; Thu, 14 Mar 2019 11:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552581936;
	bh=YVB4ymyZwZOBBmNb/KnMW27bnttemcqMr6051keAOGQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=M/KHsjULP47vt8j0vkFBN/urHw7wd5vseaBryEhIhy0gYM/i/BepWHRcJjrzJZTjs
	5DcvQxSVkwlnYcx2prYvlvETjuMHTv26bidZ2gmrEn4ntYarwXFSmzcUFMkXD93odd
	hBz9MBaTX1AiieR8MpoITN/Gs1oaTJxO5+SepXl0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2EGjZo5002938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 14 Mar 2019 11:45:36 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 14 Mar 2019 11:45:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 14 Mar 2019 11:45:35 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2EGjX2X008166;
	Thu, 14 Mar 2019 11:45:35 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Mar 2019 07:39:01 -0400
Message-ID: <20190314113901.16746-2-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190314113901.16746-1-x0157990@ti.com>
References: <20190314113901.16746-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH 2/2] [tidl] Fix camera name for object detection live demogit
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
X-List-Received-Date: Thu, 14 Mar 2019 16:45:46 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 tidl_apps/tidl_demo_objdet_livecam/runTidlObjdet_livecam.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tidl_apps/tidl_demo_objdet_livecam/runTidlObjdet_livecam.sh b/tidl_apps/tidl_demo_objdet_livecam/runTidlObjdet_livecam.sh
index e163542..88ee369 100644
--- a/tidl_apps/tidl_demo_objdet_livecam/runTidlObjdet_livecam.sh
+++ b/tidl_apps/tidl_demo_objdet_livecam/runTidlObjdet_livecam.sh
@@ -1,6 +1,6 @@
 cd /usr/share/ti/tidl/examples/ssd_multibox
 if cat /proc/device-tree/model | grep "AM574"
 then
-  ./ssd_multibox -p 40 -d 1 -e 2 -f 1000 -i 1
+  ./ssd_multibox -p 40 -d 1 -e 2 -f 1000 -i camera1
 fi
 
-- 
2.17.1


