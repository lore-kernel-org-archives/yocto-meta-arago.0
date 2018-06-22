Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id F1F7D529F7
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 18:32:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5MIWqlR016143
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529692372;
	bh=tAKiFrFUGvpi4tfiKpxItxNopCjgnNn8XlbeFaJPx2U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=j4xfPNuiRiUXCk94iXOwnm6za87rlNNrfdtinSSALNwJXTx6ypNg8bzgFE8wNZoqv
	FXUqYLFvjPqbHQQKSdqGXR0xZs/aqkYyagHPnGpKXaAIwHzBYyfUPzBfnAoF/lLnvR
	EuNwvSZmZAtYtLTC916hal9OmtxOj2qaKwxyxJP4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWqql015337
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:52 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 13:32:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 13:32:51 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWn0g021857;
	Fri, 22 Jun 2018 13:32:51 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Jun 2018 14:21:15 -0400
Message-ID: <1529691675-25624-7-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
References: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: ajayj@ti.com
Subject: [meta-processor-sdk][PATCH 6/6] nativesdk-packagegroup-arago-sdk-host: add tidl-viewer
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

* Add tidl-viewer to the host sysroot in the devkit

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend       | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend

diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend b/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
new file mode 100644
index 0000000..514d125
--- /dev/null
+++ b/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".tisdk0"
+
+EXTRA_TI_TOOLS_append = " nativesdk-tidl-viewer"
-- 
2.7.4


