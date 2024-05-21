Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28625C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 21:21:32 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.36.1716326482045431542
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 May 2024 14:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eFLiV2PV;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44LLLJsu025911;
	Tue, 21 May 2024 16:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716326479;
	bh=EnYO3k6nZB44vxI9RqJeYuuxFghg+Vc6YgpJT0HPzN0=;
	h=From:To:CC:Subject:Date;
	b=eFLiV2PV/9GmE90Yy2H1YLwSIM9e7nkMG3hQsY3gE8GBUBx4Jj/RYAIrgYJIobfGy
	 avBeVOMxEOCP+DJ0i4quy6vGpYmay4GEkb0y9DtC/sNu/JnpDcWSmad66hQJCj/wby
	 S92n52ZvdAYSprHFPQkvoyUwn98ixDadg8QxSK1M=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44LLLJen033174
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 May 2024 16:21:19 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 May 2024 16:21:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 May 2024 16:21:19 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44LLLJBb018869;
	Tue, 21 May 2024 16:21:19 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH] oe-layertool-setup: fix dldir logic for templates
Date: Tue, 21 May 2024 16:20:46 -0500
Message-ID: <20240521212045.105324-2-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 May 2024 21:21:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15338

From: Randolph Sapp <rs@ti.com>

Previously templates were always being overridden with this internal
value that just so happened to be functionally equivalent to the
template DL_DIR.

Template:
	DL_DIR = "${OEBASE}/downloads"

Internal override:
	DL_DIR = "$oebase/downloads"

Functionally equivalent, but the internal override would be expanded to
include the full path of "$oebase" before being written to the file. In
the end it was unnecessarily bound to the context in which oe-layersetup
was executed.

This change lets us keep the local.conf sample/template value unless a
value is specified over cmdline or a backup value is found. It also
explicitly warns the user when a backup value is used.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 oe-layertool-setup.sh | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 2bee538..eb412ff 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -808,21 +808,21 @@ EOM
     # First copy the template file
     cp -f "$OECORELOCALCONFPATH" "$confdir/local.conf"
 
-    # Find if old DL_DIR was set
-    if [ -e "$confdir/local.conf.bak" ]
-    then
-        old_dldir=$(grep -e "^DL_DIR =" "$confdir/local.conf.bak" | sed 's|DL_DIR = ||' | sed 's/"//g')
-    else
-        old_dldir="$oebase/downloads"
-    fi
-
     # If command line option was not set use the old dldir
     if [ -z "$dldir" ]
     then
-        dldir=$old_dldir
+        if [ -e "$confdir/local.conf.bak" ]
+        then
+            dldir=$(grep -e "^DL_DIR =" "$confdir/local.conf.bak" | sed 's|DL_DIR = ||' | sed 's/"//g')
+            printf '%s\n' "WARNING: Loading old DL_DIR from $confdir/local.conf" \
+                          "DL_DIR = $dldir";
+        fi
     fi
 
-    sed -i "s|^DL_DIR.*|DL_DIR = \"${dldir}\"|" "$confdir/local.conf"
+    if [ -n "$dldir" ]
+    then
+        sed -i "s|^DL_DIR.*|DL_DIR = \"${dldir}\"|" "$confdir/local.conf"
+    fi
 
     if [ -e "$oebase/tmp_append_local.conf" ]
     then
-- 
2.45.1


