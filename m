Return-Path: <d-senicic1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id EB81252A20
	for <meta-arago@arago-project.org>;
	Mon,  4 Jun 2018 18:48:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w54ImduH017369
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 13:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528138119;
	bh=2PHtkLQ1JzUZASjYqpMINcb8Z5rqX4Oya5eEIG0oUWo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=x5KMnGUXyzcDii4AegmiMYN1lWE5PlXLq0U3Stc2W9x7kC7kjWr31VnvE+9sg3hDH
	NxQSOq34Vn6o+RkxKCZ6UtvTJmw+9IaK2hDDEe5rd8AJeZ+8YbeEZhF9e6OEtL4i8T
	IeUsYIt84lSRgTxz7nZ7sfLnrbX06XYZp+zV1qoY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54ImdId026334
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 13:48:39 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 4 Jun 2018 13:48:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 4 Jun 2018 13:48:39 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54Imckb026353;
	Mon, 4 Jun 2018 13:48:39 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Jun 2018 14:48:35 -0400
Message-ID: <1528138116-20563-2-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528138116-20563-1-git-send-email-x0157990@ti.com>
References: <1528138116-20563-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-procesor-sdk][PATCHv2 2/3] pm-lld: update for DEV.PM_LLD.01.04.00.05
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
X-List-Received-Date: Mon, 04 Jun 2018 18:48:46 -0000
Content-Type: text/plain

* pm-lld: New release 01.04.00.05

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend b/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
new file mode 100644
index 0000000..5fd59ef
--- /dev/null
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
@@ -0,0 +1,9 @@
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.04"
+PM_LLD_SRCREV = "1c0cae9b001137f68f34bf9168d7c3fa9036b1a6"
+
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05"
+PM_LLD_SRCREV_dra7xx-evm = "945d7ce376c9d9ab748312c48c36994ee7c03dc7"
+PM_LLD_SRCREV_am57xx-evm = "945d7ce376c9d9ab748312c48c36994ee7c03dc7"
+
+PV = "01.04.00.05"
+PR = "r0"
-- 
1.9.1


