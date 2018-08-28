Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4324252A78
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 09:54:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7S9sfOC127312
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 04:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535450081;
	bh=FOEcJo6uPVXqIo8R6BDqz7LziGs963JotopEcE/7AQQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UVNRc8JMA9PCDhaMxxxqFUHNJ3BfcmvfEbXEeHBip4zgjhSF1Cjgn8AJrOdBqCbMW
	Bv/AqhJ5Esr95qDXBjprKVkSzTkIQppK5f4UlYi8D6hVOCLMiWWC1yUevFktX9k0oy
	c/dhG4M/cHJv7OhkRl3uz9VKVInoawzONXOovD2E=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7S9sfIq016922
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 04:54:41 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 04:54:40 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 04:54:40 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7S9sY2C010468;
	Tue, 28 Aug 2018 04:54:40 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Aug 2018 05:54:28 -0400
Message-ID: <1535450068-10151-5-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535450068-10151-1-git-send-email-x0157990@ti.com>
References: <1535450068-10151-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH 5/5] tidl: pnexamples and staticimg demos adapted for new TIDL_API and new command line options
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
X-List-Received-Date: Tue, 28 Aug 2018 09:54:51 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 tidl_apps/tidl_demo_pnexamples/desc_tidl_demo_pnexamples.html | 6 +++---
 tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh           | 3 ++-
 tidl_apps/tidl_demo_staticimg/desc_tidl_demo_staticimg.html   | 5 ++---
 tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh             | 2 +-
 tidl_apps/tidl_demo_staticimg/tidl_demo_staticimg.desktop     | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tidl_apps/tidl_demo_pnexamples/desc_tidl_demo_pnexamples.html b/tidl_apps/tidl_demo_pnexamples/desc_tidl_demo_pnexamples.html
index abf9814..81a0a6b 100644
--- a/tidl_apps/tidl_demo_pnexamples/desc_tidl_demo_pnexamples.html
+++ b/tidl_apps/tidl_demo_pnexamples/desc_tidl_demo_pnexamples.html
@@ -1,7 +1,7 @@
-<h1>TIDL Demo with Positive and Negative Detection Examples</h1>
+<h1>TIDL Demo with Positive and Negative Detection Examples (1xDSP+1xEVE)</h1>
 <h2>Purpose:</h2>
 <p>This application demonstrates Deep Learning Imagenet classification (1000 classes) based on J11 network topology.</p>
-<p>Both DSP cores are used for processing (frame-based pipeline), of pre-recorded clip with common objects.</p>
-<p>This clip includes positive and negative detection examples (i.e. objects that are not recognized as expected)</p>
+<p>One DSP and one EVE cores are used for processing (frame-based pipeline), of pre-recorded clip made from static images. </p>
+<p>This clip includes positive and negative detection examples (i.e. objects that are not in the list of 'expected' classes)</p>
 <p>Exit demo by doing right-click on image window</p>
 
diff --git a/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh b/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
index 4633f20..0033fde 100644
--- a/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
+++ b/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
@@ -1,5 +1,6 @@
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -n 2 -t d -l ./imagenet.txt -s ./classlist.txt -i ./clips/test2.mp4 -c ./stream_config_j11_v2.txt & pid=$!
+./tidl_classification -g 2 -d 1 -e 1 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test2.mp4 -c ./stream_config_j11_v2.txt & pid=$!
+
 { sleep 90; kill $pid; }
 
diff --git a/tidl_apps/tidl_demo_staticimg/desc_tidl_demo_staticimg.html b/tidl_apps/tidl_demo_staticimg/desc_tidl_demo_staticimg.html
index 679c9b8..1861837 100644
--- a/tidl_apps/tidl_demo_staticimg/desc_tidl_demo_staticimg.html
+++ b/tidl_apps/tidl_demo_staticimg/desc_tidl_demo_staticimg.html
@@ -1,7 +1,6 @@
-<h1>TIDL Demo with Static Image Sequence</h1>
+<h1>TIDL Demo with Classification of Common Objects, 2xEVE+2xDSP</h1>
 <h2>Purpose:</h2>
 <p>This application demonstrates Deep Learning Imagenet classification (1000 classes) based on J11 network topology.</p>
-<p>Both DSP cores are used for processing (frame-based pipeline), of pre-recorded clip with common objects.</p>
-<p>Clip is created from static images </p>
+<p>Both EVE and both DSP cores are used for processing (frame-based pipeline), of pre-recorded clip with live common objects.</p>
 <p>Exit demo by doing right-click on image window</p>
 
diff --git a/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh b/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
index 12f80a5..30ece7a 100644
--- a/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
+++ b/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
@@ -1,4 +1,4 @@
 cd /usr/share/ti/tidl/examples/classification
 
-./tidl_classification -n 2 -t d -l ./imagenet.txt -s ./classlist.txt -i ./clips/test1.mp4 -c ./stream_config_j11_v2.txt & pid=$!
+./tidl_classification -g 1 -d 2 -e 2 -l ./imagenet.txt -s ./classlist.txt -i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=$!
 { sleep 90; kill $pid; }
diff --git a/tidl_apps/tidl_demo_staticimg/tidl_demo_staticimg.desktop b/tidl_apps/tidl_demo_staticimg/tidl_demo_staticimg.desktop
index 1d91173..47324fa 100644
--- a/tidl_apps/tidl_demo_staticimg/tidl_demo_staticimg.desktop
+++ b/tidl_apps/tidl_demo_staticimg/tidl_demo_staticimg.desktop
@@ -1,6 +1,6 @@
 #!/usr/bin/env xdg-open
 [Desktop Entry]
-Name=J11v2 Static Image
+Name=J11v2 Real Common Objects
 Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
 Exec=runTidlStaticImg.sh
 Type=Application
-- 
1.9.1


