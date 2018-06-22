Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 57BF3529B3
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 18:32:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5MIWpQT113914
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529692371;
	bh=6nlFfi9Xmoo+XvacJrZxhNHgHiQQZB+okksRQiWhGrc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yBOsuRiDCyoX+aK9rhYa9bHMOvrIS2Nez2t+dcofJBadRGWLCQhK8h1rP3cRwtOP3
	vw+YBPu1sASlTerjuinaxCxTdP53fKRV9pobfOFoM7XXRnXzuoz4GsJVE+YLf1ee54
	IXPmjdexVfvEo4IIqAIa2WA8/N2VcV0J85JGd1f8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWpOL015326
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 13:32:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 13:32:51 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWn0e021857;
	Fri, 22 Jun 2018 13:32:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Jun 2018 14:21:13 -0400
Message-ID: <1529691675-25624-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
References: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: ajayj@ti.com
Subject: [meta-processor-sdk][PATCH 4/6] packagegroup-arago-tisdk-opencl-sdk-host: add tidl-examples-src
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
X-List-Received-Date: Fri, 22 Jun 2018 18:33:00 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bbappend   | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bbappend

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bbappend
new file mode 100644
index 0000000..48bef98
--- /dev/null
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bbappend
@@ -0,0 +1,4 @@
+PR_append = ".tisdk0"
+
+UTILS_append_am57xx-evm = "tidl-examples-src"
+UTILS_append_am57xx-hs-evm = "tidl-examples-src"
-- 
2.7.4


