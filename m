Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8BEBA52979
	for <meta-arago@arago-project.org>;
	Wed, 30 Aug 2017 21:12:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7ULC2Am022762
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 16:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504127522;
	bh=xfyrMFyWbCoNrk08yy/rZ6rq5F6IQw5zY1a135Suwik=;
	h=From:To:CC:Subject:Date;
	b=qNZ39KRJiHh0j7jh/M7T51dNQDwG/N/4+rVv5aHNTNgJfEHjuBlOXEMIV4jVUXK6w
	rDMw4UgCpui0N0z38arZI/qCMk8TfYowyKAAZGxRiKcXk9NxsTrXdUeNIwutD4Sesw
	bpJ1VSwM29jXCcxtXrGZTawnFKUJfcdaLhe5vhR4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7ULBvoE008393
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 16:11:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 16:11:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 16:11:57 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7ULBvHf010240;
	Wed, 30 Aug 2017 16:11:57 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnAHF-0003WD-0z; Wed, 30 Aug 2017 16:11:57 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Aug 2017 16:11:54 -0500
Message-ID: <20170830211154.13489-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH v1] hmi_apps : hmi_protection_relays : new demo
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
X-List-Received-Date: Wed, 30 Aug 2017 21:12:12 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../hmi_protection_relays/desc_hmi_protection_relays.html    |  9 +++++++++
 hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop | 12 ++++++++++++
 hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh     | 12 ++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html
 create mode 100644 hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop
 create mode 100755 hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh

diff --git a/hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html b/hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html
new file mode 100644
index 0000000..b8e4264
--- /dev/null
+++ b/hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html
@@ -0,0 +1,9 @@
+<h1> Protection Relays HMI Example </h1>
+
+<p> This example demonstrates HMI for Protection Relays application. QT QWidget tool is used to draw the screen.
+
+<br>
+
+
+</p>
+
diff --git a/hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop b/hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop
new file mode 100644
index 0000000..384431b
--- /dev/null
+++ b/hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop
@@ -0,0 +1,12 @@
+#!/usr/bin/env xdg-open
+
+[Desktop Entry]
+Name=PROTECTION_RELAYS
+GenericName=Demo App
+Icon=/usr/share/matrix-gui-2.0/apps/images/multimedia-icon.png
+Exec=/usr/bin/runHmiProtectionRelays.sh
+Type=Application
+ProgramType=gui
+Categories=hmi
+X-MATRIX-Lock=hmi_protection_relays_lock
+X-MATRIX-Description=/usr/share/matrix-gui-2.0/apps/hmi_protection_relays/desc_hmi_protection_relays.html
diff --git a/hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh b/hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh
new file mode 100755
index 0000000..3d85999
--- /dev/null
+++ b/hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh
@@ -0,0 +1,12 @@
+#!/bin/bash
+
+/etc/init.d/weston stop
+sleep 1
+echo 0 > /sys/class/graphics/fbcon/cursor_blink
+
+protection_relays_hmi -platform linuxfb
+
+echo 1 > /sys/class/graphics/fbcon/cursor_blink
+
+/etc/init.d/weston start
+sleep 1
-- 
2.13.0


