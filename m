Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5CE35529C7
	for <meta-arago@arago-project.org>;
	Mon, 11 Mar 2019 15:52:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2BFqGNi087370
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 10:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552319536;
	bh=akZbdDUnlMpr13Cxp4+P8Io1DKQxPDnOLlKuQfnOkwo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MsRmL36zrYIIKbCzaOzyspCmAC9eE8hloF0ZjSSKvIc0uyCx40dixVO1o0CAMn9bm
	7RpCAuEXs/qL0uh1e1aUODm1Jwdtf1mkrFlQw2I57v8149/No5tXBJzt2wD7qwxklU
	pJdraUdwV9xFUqztl859KInNGgzWZ2v7qKp7Ygzw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2BFqGAx077397
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 10:52:16 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 10:52:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 11 Mar 2019 10:52:15 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2BFq67J031358;
	Mon, 11 Mar 2019 10:52:15 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Mar 2019 11:39:48 -0400
Message-ID: <1552318790-23095-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552318790-23095-1-git-send-email-j-stiffler@ti.com>
References: <1552318790-23095-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/rocko][PATCH 2/4] mbedtls: extend to native/nativesdk
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
X-List-Received-Date: Mon, 11 Mar 2019 15:52:25 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bbappend b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bbappend
new file mode 100644
index 0000000..608377e
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


