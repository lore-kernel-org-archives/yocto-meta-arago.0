Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.9883.1638953923550049245
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 00:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=v+m8jppA;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B88wfNa117557;
	Wed, 8 Dec 2021 02:58:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638953921;
	bh=h3/Glz+cTuvy3fefZQTzKWd59Of3YKpkbaKlkr3ciC4=;
	h=From:To:Subject:Date;
	b=v+m8jppAqukhFxQR7FqaiElQT/p3LV2WnBNJRKMGKEBfLmdoCz9vwYBip0TMCduMx
	 IUfEfzHgFWjop0s+lScQs+fCm1VyjVsIZmIkrGLZQF+UBhVT569A3egR0KSXGIx7bo
	 i9FkC8DynwQ+n75XiAS+6zv+6bObZ/mMiz6uyyPc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B88wfco112082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Dec 2021 02:58:41 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Dec 2021 02:58:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Dec 2021 02:58:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B88wfFo006676;
	Wed, 8 Dec 2021 02:58:41 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [tisdk-build-scripts][PATCH] secdev: Add script to update k3 secdev package
Date: Wed, 8 Dec 2021 08:58:41 +0000
Message-ID: <20211208085841.45926-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 build-oesdk.sh             | 3 +++
 lib/oesdk/update_secdev.sh | 7 +++++++
 2 files changed, 10 insertions(+)
 create mode 100755 lib/oesdk/update_secdev.sh

diff --git a/build-oesdk.sh b/build-oesdk.sh
index 038a7ab..3d32fb2 100755
--- a/build-oesdk.sh
+++ b/build-oesdk.sh
@@ -14,6 +14,9 @@ source ./lib/oesdk/machine-specific-functions
 source ./lib/oesdk/package-sdks
 source ./lib/oesdk/generate-report
 
+# Update secdev package
+./lib/oesdk/update_secdev.sh
+
 # This variable holds the architectures that are being built based
 # on the machines.
 ARCHS=""
diff --git a/lib/oesdk/update_secdev.sh b/lib/oesdk/update_secdev.sh
new file mode 100755
index 0000000..1f0a409
--- /dev/null
+++ b/lib/oesdk/update_secdev.sh
@@ -0,0 +1,7 @@
+#!/bin/bash
+
+cd $TI_SECURE_DEV_PKG_K3
+git pull origin master
+if [ $? != 0 ]; then
+        echo "Updating the secdev failed"
+fi
-- 
2.17.1

