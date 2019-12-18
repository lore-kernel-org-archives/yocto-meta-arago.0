Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4390C529C0
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 17:52:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIHoOo6118141
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 11:50:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576691424;
	bh=UHzDYz4u8iYHtyanx1adMNYyxS7kkrIZmS7nY/xL+YM=;
	h=From:To:CC:Subject:Date;
	b=WRj6i+WL1uB4t+04Y4HheewHhjEp8INgf/vbGgQ+Imudaz4sViImNXm/BJuHz26jH
	WxpfHEOLoSx4bbHV8R2Kl66+8r+ESfZ45pnGlkoiekQm6mjNi4M7YwgkiatL4yvkry
	o9vXDWjTmnb0aHWnpWcVCG+U/jmKCAHLIiTpKjYg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIHoO7e035810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 11:50:24 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 11:50:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 18 Dec 2019 11:50:24 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIHoNfm112296;
	Wed, 18 Dec 2019 11:50:24 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Dec 2019 12:31:11 -0500
Message-ID: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: [meta-processor-sdk][PATCH 1/5] licenses: add Unlicense license text file
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
X-List-Received-Date: Wed, 18 Dec 2019 17:52:03 -0000
Content-Type: text/plain

* This license is used by neo-ai-dlr

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/layer.conf    |  1 +
 licenses/Unlicense | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 licenses/Unlicense

diff --git a/conf/layer.conf b/conf/layer.conf
index 0334463..260a274 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-processor-sdk"
 BBFILE_PATTERN_meta-processor-sdk := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-processor-sdk = "15"
+LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/licenses/Unlicense b/licenses/Unlicense
new file mode 100644
index 0000000..cf1ab25
--- /dev/null
+++ b/licenses/Unlicense
@@ -0,0 +1,24 @@
+This is free and unencumbered software released into the public domain.
+
+Anyone is free to copy, modify, publish, use, compile, sell, or
+distribute this software, either in source code form or as a compiled
+binary, for any purpose, commercial or non-commercial, and by any
+means.
+
+In jurisdictions that recognize copyright laws, the author or authors
+of this software dedicate any and all copyright interest in the
+software to the public domain. We make this dedication for the benefit
+of the public at large and to the detriment of our heirs and
+successors. We intend this dedication to be an overt act of
+relinquishment in perpetuity of all present and future rights to this
+software under copyright law.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+OTHER DEALINGS IN THE SOFTWARE.
+
+For more information, please refer to <http://unlicense.org>
-- 
2.7.4


