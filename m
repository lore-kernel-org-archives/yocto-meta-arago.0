Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 23ADC52094
	for <meta-arago@arago-project.org>;
	Thu, 20 Sep 2018 22:26:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8KMQ2JC127999
	for <meta-arago@arago-project.org>; Thu, 20 Sep 2018 17:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537482362;
	bh=8SkaLACwW7v5CTAae4Jz4LAhexMGKyGNzQJ5NZne8xQ=;
	h=From:To:CC:Subject:Date;
	b=e04s56f2mcYkiM5cnpNXqkN3HexvjTRDyrf+Ek1kODdm5dOXxVWLRug45xWYpgc7H
	zJn5UJjBFCACQQG4wVE8ihtOkYniWsaonekX79xG7iNS3bcbGi/5/b9V5JXJRa6k1N
	ouBFZsC9+3Do4W09Fyvp+7ou84RG2GYR0ol3s5ww=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8KMQ2CY027102
	for <meta-arago@arago-project.org>; Thu, 20 Sep 2018 17:26:02 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 20 Sep 2018 17:26:02 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 20 Sep 2018 17:26:02 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8KMQ1OO027543;
	Thu, 20 Sep 2018 17:26:02 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Sep 2018 18:25:57 -0400
Message-ID: <1537482357-6935-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [rocko/master/ti2018.03] [PATCH] weston-init: add delay before starting weston when input device is not detected in time
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
X-List-Received-Date: Thu, 20 Sep 2018 22:26:16 -0000
Content-Type: text/plain

* Adding delay to work around the race condition when weston is started
  before detection of input devices (e.g., mouse/keyboard) for EVMs without
  touchscreen LCD

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend | 2 +-
 meta-arago-distro/recipes-graphics/wayland/weston-init/init     | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 4ed6a62..cbe0fe3 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago8"
+PR_append = ".arago9"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index 336e5af..461b078 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -40,6 +40,14 @@ case "$1" in
             chmod 0700 $XDG_RUNTIME_DIR
         fi
 
+        echo "Starting Weston"
+
+        if [ ! -d "/dev/input" ]; then
+            echo "Waiting for input device..."
+            killproc weston
+            sleep 3
+        fi
+
         openvt -c 4 -f runWeston
 
         # If there's no touchscreen device available, done
-- 
1.9.1


