Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id AA1A5529AE
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 09:54:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7S9sZcg102567
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 04:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535450075;
	bh=hIe1uYBqwxH+ea/JR6EZml1yXvFRdq0DyuIGm8a6bBo=;
	h=From:To:CC:Subject:Date;
	b=SSwb8CLjfLhPPTHRxB5Mi3qWGrZABgI5EzOJag6gXSBa1pFeLlGqLAvYysuDCvJ8b
	4TBa2jA2ntOrWcnPrQH3VzQ5fMSpPub5+tm01/xr68hnjmPwt93IYa9Wte8wNmKDok
	Kuot51Nkvh0/OhZsUnvyxq9npA1qdRI/0Z72R4Y4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7S9sZ8m013353
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 04:54:35 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 04:54:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 04:54:35 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7S9sY28010468;
	Tue, 28 Aug 2018 04:54:35 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Aug 2018 05:54:24 -0400
Message-ID: <1535450068-10151-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH 1/5] tidl: livecam: DSP only live camera input example adapted for new TIDL_API and command line options
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
X-List-Received-Date: Tue, 28 Aug 2018 09:54:44 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh         | 3 ++-
 tidl_apps/tidl_demo_livecam/tidl_demo_livecam.desktop | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh b/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
index d7372f5..02fb4a2 100644
--- a/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
+++ b/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
@@ -1,4 +1,5 @@
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -n 2 -t d -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt & pid=$!
+./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt & pid=$!
+
 { sleep 90; kill $pid; }
diff --git a/tidl_apps/tidl_demo_livecam/tidl_demo_livecam.desktop b/tidl_apps/tidl_demo_livecam/tidl_demo_livecam.desktop
index fe85946..e3d2be4 100644
--- a/tidl_apps/tidl_demo_livecam/tidl_demo_livecam.desktop
+++ b/tidl_apps/tidl_demo_livecam/tidl_demo_livecam.desktop
@@ -1,6 +1,6 @@
 #!/usr/bin/env xdg-open
 [Desktop Entry]
-Name=J11v2 Camera
+Name=J11v2 Camera Input
 Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
 Exec=runTidlLiveCam.sh
 Type=Application
-- 
1.9.1


