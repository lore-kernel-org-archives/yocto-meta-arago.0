Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id ECD3E529AE
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 09:54:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7S9seGM116936
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 04:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535450080;
	bh=AOKKMmLJnnoDDuO0b4/z4s4OhESfXIdYI1Ep8RJV2K4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XGIBjEQD6bpWheybjDezVw1QW1pjqaw5kZ4Ic8OvHby1wI6bbx79bsVk37lKojIe7
	NF6h+Q5FzBYWVgQt7yqgKXW6qhSEojTII0I6ElDKBu4Tr6eZqxEsaKOCjcf8AoON3w
	SfT/TNSQNgIiLoynQKO/D8uuLm8xusU41Sk7jYI0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7S9seBv013419
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 04:54:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 04:54:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 04:54:39 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7S9sY2B010468;
	Tue, 28 Aug 2018 04:54:39 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Aug 2018 05:54:27 -0400
Message-ID: <1535450068-10151-4-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535450068-10151-1-git-send-email-x0157990@ti.com>
References: <1535450068-10151-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH 4/5] tidl: staticimg_lg2: Using 2xEVE and 1xDSP in demo with two layer groups and pre-recorded video input
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
X-List-Received-Date: Tue, 28 Aug 2018 09:54:48 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../tidl_demo_staticimg_lg2/desc_tidl_demo_staticimg_lg2.html    | 7 +++++++
 tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh        | 5 +++++
 .../tidl_demo_staticimg_lg2/tidl_demo_staticimg_lg2.desktop      | 9 +++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 tidl_apps/tidl_demo_staticimg_lg2/desc_tidl_demo_staticimg_lg2.html
 create mode 100755 tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
 create mode 100644 tidl_apps/tidl_demo_staticimg_lg2/tidl_demo_staticimg_lg2.desktop

diff --git a/tidl_apps/tidl_demo_staticimg_lg2/desc_tidl_demo_staticimg_lg2.html b/tidl_apps/tidl_demo_staticimg_lg2/desc_tidl_demo_staticimg_lg2.html
new file mode 100644
index 0000000..1d40d85
--- /dev/null
+++ b/tidl_apps/tidl_demo_staticimg_lg2/desc_tidl_demo_staticimg_lg2.html
@@ -0,0 +1,7 @@
+<h1>TIDL Demo with Classification of Common Objects, with Two Layers Groups, 2xEVE+1xDSP</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning Imagenet classification (1000 classes) based on J11 network topology.</p>
+<p>Both EVE cores and one DSP core are used for processing (frame-based pipeline), of pre-recorded clip with common objects.</p>
+<p>Clip is created from static images. Last 3 layers are executed on DSP, forming layers group 2. </p>
+<p>Exit demo by doing right-click on image window</p>
+
diff --git a/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh b/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
new file mode 100755
index 0000000..197c218
--- /dev/null
+++ b/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
@@ -0,0 +1,5 @@
+cd /usr/share/ti/tidl/examples/classification
+
+./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=$!
+
+{ sleep 90; kill $pid; }
diff --git a/tidl_apps/tidl_demo_staticimg_lg2/tidl_demo_staticimg_lg2.desktop b/tidl_apps/tidl_demo_staticimg_lg2/tidl_demo_staticimg_lg2.desktop
new file mode 100644
index 0000000..aa07fc3
--- /dev/null
+++ b/tidl_apps/tidl_demo_staticimg_lg2/tidl_demo_staticimg_lg2.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=J11v2 Static Image
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
+Exec=runTidlStaticImg_lg2.sh
+Type=Application
+ProgramType=gui
+Categories=tidl
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/tidl_demo_staticimg_lg2/desc_tidl_demo_staticimg_lg2.html
-- 
1.9.1


