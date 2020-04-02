Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BBA04529A5
	for <meta-arago@arago-project.org>;
	Thu,  2 Apr 2020 17:12:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 032H9ukx004927
	for <meta-arago@arago-project.org>; Thu, 2 Apr 2020 12:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1585847396;
	bh=KG4dCcqZTwAHU0TDW93UbuV3ccnjPhvfjDWUympSQG8=;
	h=From:To:CC:Subject:Date;
	b=RINDVYNQWqkN9MGY2+sa+DHcOBWQ69LPf9MVdVLBhWM+6CF6XJ1gWwQXoZK5dCrFa
	X6jsQrNlVO2NTSfNI/8+japHP9gAVl0WdgUxpz2tncWHm8Tt61ldjXJpFITsCwZ8Ui
	Lbre3ny3otiM3MJMyWl15PWLgOU972cqWm0MXee4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 032H9uvi125671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 2 Apr 2020 12:09:56 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 2 Apr 2020 12:09:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 2 Apr 2020 12:09:55 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 032H9tqd016709;
	Thu, 2 Apr 2020 12:09:55 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Apr 2020 13:09:53 -0400
Message-ID: <1585847393-14558-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master[PATCH] meta-toolchain-arago: toolchain_env_script: append subscripts
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
X-List-Received-Date: Thu, 02 Apr 2020 17:12:09 -0000
Content-Type: text/plain

* Append environment subscripts to devkit environment
* This allows cmake projects to build against the devkit without
  further configuration.
* Borrowed from oe-core's toolchain-scripts.bbclass

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 065531e..1a082ba 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -69,6 +69,23 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH_NATIVE/usr/share/aclocal"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
+
+        # Borrowed from oe-core/meta/classes/toolchain-scripts.bbclass
+	cat >> $script <<EOF
+
+# Append environment subscripts
+if [ -d "\$OECORE_TARGET_SYSROOT/environment-setup.d" ]; then
+    for envfile in \$OECORE_TARGET_SYSROOT/environment-setup.d/*.sh; do
+	    . \$envfile
+    done
+fi
+if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
+    for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
+	    . \$envfile
+    done
+fi
+EOF
+
 }
 
 SDK_POSTPROCESS_COMMAND_prepend = "arago_sdk_fixup; "
-- 
2.7.4


