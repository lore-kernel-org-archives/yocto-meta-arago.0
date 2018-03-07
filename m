Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 81B8652983
	for <meta-arago@arago-project.org>;
	Wed,  7 Mar 2018 20:18:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w27KHWI0010410
	for <meta-arago@arago-project.org>; Wed, 7 Mar 2018 14:17:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520453852;
	bh=8FAYHJ98lBsRHhiCRtI8IxnPZzKtSyNUFwE7V+4nCqY=;
	h=From:To:CC:Subject:Date;
	b=NDrRUq6AWBGwNfpcKvDJB/DKBdsgq6SmI/KN6bExRde9iF/sermZ+aj8KOqJSTcQh
	xuWuMYzEWOYjArvfNhw6rJvf1Fpgs6PZAKFk+RDLLjKGo/69vWJCY4Y/0UKo7VCDvs
	8E+rYRfNFtnoJU/vhyMK0+hBKOuOPdikobFaGTUc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w27KHWDn012936
	for <meta-arago@arago-project.org>; Wed, 7 Mar 2018 14:17:32 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 7 Mar 2018 14:17:31 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 7 Mar 2018 14:17:31 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w27KHQj9012274;
	Wed, 7 Mar 2018 14:17:29 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 7 Mar 2018 15:17:23 -0500
Message-ID: <1520453843-11149-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [matrix-gui-v2-apps] [patch]ivahd_multimedia_h264dec: update the audio sink for AM5 IDKs
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
X-List-Received-Date: Wed, 07 Mar 2018 20:18:15 -0000
Content-Type: text/plain

* Use fakesink as the audio sink since AM5 IDKs do not have on-board audio ports.
  Meanwhile, the primary display of AM5 IDKs is LCD instead of HDMI.

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 multimedia_apps/ivahd_multimedia_h264dec/runIvahdH264Dec.sh | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/multimedia_apps/ivahd_multimedia_h264dec/runIvahdH264Dec.sh b/multimedia_apps/ivahd_multimedia_h264dec/runIvahdH264Dec.sh
index 028fea8..a0cbd37 100644
--- a/multimedia_apps/ivahd_multimedia_h264dec/runIvahdH264Dec.sh
+++ b/multimedia_apps/ivahd_multimedia_h264dec/runIvahdH264Dec.sh
@@ -8,11 +8,8 @@ AUDIO_SINK="alsasink"
 
 if cat /proc/device-tree/model | grep "IDK"
 then
-  if modetest | grep "HDMI" | grep "disconnected" > /dev/null
-  then
-    # Use audio fakesink for IDK when HDMI is disconnected
-    AUDIO_SINK="fakesink"
-  fi
+  # Use fakesink for IDKs as they do not have audio ports
+  AUDIO_SINK="fakesink"
 else
   # Detect audio card for GP EVM
   AUDIO_CARD=$(aplay -l | grep -i -v hdmi | grep -i -o 'card [0-9]*' | grep -o [0-9])
-- 
1.9.1


