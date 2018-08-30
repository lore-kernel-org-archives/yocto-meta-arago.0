Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 744DF529AE
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2018 19:20:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7UJKVJm007376
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 14:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535656831;
	bh=XzK5i02yNwQh7D90vwccNFPYORIbLu7qWRaxr8Z9oVo=;
	h=From:To:CC:Subject:Date;
	b=RrDi4qxzN+4pXvQDBXnHtCfi3HWZHR0x+ihX1w1Woqq2R6LdnFZKC/ChsZbTzBVpe
	znC4+uoh7sVA9Ge+nRCH6slePwqKFvoK+fR2AD+vp9wq6oCNuOam3f4S6teWiDFquQ
	E9+mhcT8fFbPk5FBKkK8wQYOA5L++7NXNuJ1HDQU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UJKVZ4030676
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 14:20:31 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 30 Aug 2018 14:20:31 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 30 Aug 2018 14:20:31 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UJKV0q018722;
	Thu, 30 Aug 2018 14:20:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Aug 2018 15:08:14 -0400
Message-ID: <1535656095-12896-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] tiusdk-uenv: add uEnv.txt for k3
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
X-List-Received-Date: Thu, 30 Aug 2018 19:20:41 -0000
Content-Type: text/plain

* Add a uEnv.txt for k3 to work around the issue auto-detecting the
  specific board.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
new file mode 100644
index 0000000..80ea34f
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
@@ -0,0 +1,19 @@
+# This uEnv.txt file can contain additional environment settings that you
+# want to set in U-Boot at boot time.  This can be simple variables such
+# as the serverip or custom variables.  The format of this file is:
+#    variable=value
+# NOTE: This file will be evaluated after the bootcmd is run and the
+#       bootcmd must be set to load this file if it exists (this is the
+#       default on all newer U-Boot images.  This also means that some
+#       variables such as bootdelay cannot be changed by this file since
+#       it is not evaluated until the bootcmd is run.
+
+# The specific board is not able to be automatically detected. The below is a
+# workaround to set a sane default incase the user has not manually configured
+# a specific board.
+def_board_name="am65x"
+
+# Check if using default board_name when name_overlays is not set
+check_for_board=if test $name_overlays; then echo "Using board_name = $board_name"; else setenv board_name $def_board_name; fi
+
+uenvcmd=run check_for_board; run findfdt
-- 
2.7.4


