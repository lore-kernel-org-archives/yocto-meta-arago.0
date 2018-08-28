Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id CC3AB529AE
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 09:54:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7S9sb9r102571
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 04:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535450077;
	bh=tfotEciIl3Wf4GD9Y2CYpIxAekEsx52qYoTc2VGCokA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IDz2LwUi318Dyjc1czotiLHEFVi0a3T/RG0lqXdSjppszqxYvkR082wLpXF9AKrve
	g+PsMAII5bjE7lGXiQqjaUu/vFl/Jk7sTsKXnLxu7xWuHMlf/NAielGEkocwsly9Iy
	gHOccM1dbIwxxhu6x9W3LVN5wCoxyw381Aqtq6Eg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7S9sb6G016800
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 04:54:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 04:54:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 04:54:36 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7S9sY29010468;
	Tue, 28 Aug 2018 04:54:36 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Aug 2018 05:54:25 -0400
Message-ID: <1535450068-10151-2-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535450068-10151-1-git-send-email-x0157990@ti.com>
References: <1535450068-10151-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH 2/5] tidl: staticimg_dsponly: DSP only example with pre-recorded video input adapted for new TIDL_API and command line options
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
X-List-Received-Date: Tue, 28 Aug 2018 09:54:46 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../desc_tidl_demo_staticimg_dsponly.html                        | 6 ++++++
 .../tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh      | 4 ++++
 .../tidl_demo_staticimg_dsponly.desktop                          | 9 +++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 tidl_apps/tidl_demo_staticimg_dsponly/desc_tidl_demo_staticimg_dsponly.html
 create mode 100644 tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
 create mode 100644 tidl_apps/tidl_demo_staticimg_dsponly/tidl_demo_staticimg_dsponly.desktop

diff --git a/tidl_apps/tidl_demo_staticimg_dsponly/desc_tidl_demo_staticimg_dsponly.html b/tidl_apps/tidl_demo_staticimg_dsponly/desc_tidl_demo_staticimg_dsponly.html
new file mode 100644
index 0000000..18856f3
--- /dev/null
+++ b/tidl_apps/tidl_demo_staticimg_dsponly/desc_tidl_demo_staticimg_dsponly.html
@@ -0,0 +1,6 @@
+<h1>TIDL Demo with Classification of Common Objects</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning Imagenet classification (1000 classes) based on J11 network topology.</p>
+<p>Both DSP cores are used for processing (frame-based pipeline), of pre-recorded clip with live common objects.</p>
+<p>Exit demo by doing right-click on image window</p>
+
diff --git a/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh b/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
new file mode 100644
index 0000000..d49c289
--- /dev/null
+++ b/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
@@ -0,0 +1,4 @@
+cd /usr/share/ti/tidl/examples/classification
+
+./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=$!
+{ sleep 90; kill $pid; }
diff --git a/tidl_apps/tidl_demo_staticimg_dsponly/tidl_demo_staticimg_dsponly.desktop b/tidl_apps/tidl_demo_staticimg_dsponly/tidl_demo_staticimg_dsponly.desktop
new file mode 100644
index 0000000..9dfa499
--- /dev/null
+++ b/tidl_apps/tidl_demo_staticimg_dsponly/tidl_demo_staticimg_dsponly.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=J11v2 Real Common Objects
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
+Exec=runTidlStaticImg_dsponly.sh
+Type=Application
+ProgramType=gui
+Categories=tidl
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/tidl_demo_staticimg_dsponly/desc_tidl_demo_staticimg_dsponly.html
-- 
1.9.1


