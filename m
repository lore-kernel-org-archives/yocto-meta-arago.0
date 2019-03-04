Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2F04352976
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 00:03:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25035Fg062584
	for <meta-arago@arago-project.org>; Mon, 4 Mar 2019 18:03:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551744185;
	bh=no5yO04KbscR9bOjIJKyn/2PksK+F7g/Rx0hK6NO5qc=;
	h=From:To:CC:Subject:Date;
	b=eMQokP46uNOxKH1avNxeOGtVeAOTMXgikjlUTxvv/kPUcqHhFQo25HWTr1iMIdUax
	ybXqaXgZwdW1mX34/sqLG6i7Gj0lpNx687JMgTsxBuazWtdnCbwFr+bTH+U1tOr4xy
	8R/zQsOj1wk0Zj9q1UQbhAZI9mogwuPzTm6nRTeE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25035Zj113556
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 4 Mar 2019 18:03:05 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 18:03:04 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 18:03:05 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25034pl002274;
	Mon, 4 Mar 2019 18:03:04 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Mar 2019 13:56:46 -0500
Message-ID: <20190304185648.12035-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH 1/3] [tidl] Add classification example with dogbreeds model
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
X-List-Received-Date: Tue, 05 Mar 2019 00:03:12 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../desc_tidl_demo_dogbreeds.html                  |  7 +++++++
 tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh  | 14 ++++++++++++++
 .../tidl_demo_dogbreeds.desktop                    |  9 +++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 tidl_apps/tidl_demo_dogbreeds/desc_tidl_demo_dogbreeds.html
 create mode 100644 tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh
 create mode 100644 tidl_apps/tidl_demo_dogbreeds/tidl_demo_dogbreeds.desktop

diff --git a/tidl_apps/tidl_demo_dogbreeds/desc_tidl_demo_dogbreeds.html b/tidl_apps/tidl_demo_dogbreeds/desc_tidl_demo_dogbreeds.html
new file mode 100644
index 0000000..1c1744c
--- /dev/null
+++ b/tidl_apps/tidl_demo_dogbreeds/desc_tidl_demo_dogbreeds.html
@@ -0,0 +1,7 @@
+<h1>TIDL Demo with Classification of Several Dog Breeds, 2xEVE+1xDSP</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning custom (TI prepared) classification of similar objects, based on J11 network topology.</p>
+<p>Both EVE and one DSP cores are used for processing (frame-based pipeline), using pre-recorded clip (320x320).</p>
+<p>On devices without only DSPs are used</p>
+<p>Exit demo by doing right-click on image window</p>
+
diff --git a/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh b/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh
new file mode 100644
index 0000000..7896417
--- /dev/null
+++ b/tidl_apps/tidl_demo_dogbreeds/runTidlDogBreeds.sh
@@ -0,0 +1,14 @@
+cd /usr/share/ti/tidl/examples/classification
+
+if cat /proc/device-tree/model | grep "AM574"
+then
+  ./tidl_classification -g 2 -d 1 -e 2 -l ./toydogs/toydogsnet.txt -s ./toydogs/toydogclasses.txt -i ./clips/toydogs_854x480.mp4 -c ./stream_config_j11_toydogs.txt
+else
+  numdsp=2
+  if cat /proc/device-tree/model | grep "AM571"
+  then
+    numdsp=1
+  fi
+  echo "NUMDSPs is $numdsp"
+  ./tidl_classification -g 1 -d $numdsp -e 0 -l ./toydogs/toydogsnet.txt -s ./toydogs/toydogclasses.txt -i ./clips/toydogs_854x480.mp4 -c ./stream_config_j11_toydogs.txt
+fi
diff --git a/tidl_apps/tidl_demo_dogbreeds/tidl_demo_dogbreeds.desktop b/tidl_apps/tidl_demo_dogbreeds/tidl_demo_dogbreeds.desktop
new file mode 100644
index 0000000..c1fe5d5
--- /dev/null
+++ b/tidl_apps/tidl_demo_dogbreeds/tidl_demo_dogbreeds.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=J11v2 Dog Breeds using pre-recorded clip (1xDSP+2xEVE)
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
+Exec=runTidlDogBreeds.sh
+Type=Application
+ProgramType=gui
+Categories=tidl
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/tidl_demo_dogbreeds/desc_tidl_demo_dogbreeds.html
-- 
2.17.1


