Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 494B352A7A
	for <meta-arago@arago-project.org>;
	Fri, 17 Aug 2018 14:38:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7HEc0ao041684
	for <meta-arago@arago-project.org>; Fri, 17 Aug 2018 09:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534516680;
	bh=msxsup+H6S6qYAoJf62ae3wZoEH+EzQ2ggr+eVWSBlE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ibiKIVu8R59EhDJSm89Ayi0UM2ksF+bD4dbioLlmRD+Ob5suGa28F/25bmhC/qstv
	h+s+twWMJL8NGa1taczsUO6Fg21yhOqmKQNI7+v/nd9wkLm7DWGxJxSrUiJyhHNi/t
	fmYPSnDdduVMQSoC/yHX+sbdRu1cvlvvtRKxwSpc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7HEc0q7026202
	for <meta-arago@arago-project.org>; Fri, 17 Aug 2018 09:38:00 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 17 Aug 2018 09:38:00 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 17 Aug 2018 09:38:00 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7HEbpBW012531;
	Fri, 17 Aug 2018 09:37:58 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Aug 2018 10:25:51 -0400
Message-ID: <1534515953-32644-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
References: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC 1/3] external-linaro-secondary-sdk-toolchain: secondary toolchain for devkit
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
X-List-Received-Date: Fri, 17 Aug 2018 14:38:08 -0000
Content-Type: text/plain

* Add a method to install an secondary toolchain in the devkit.
* The architecture for this toolchain can be configured by setting
  "SECONDARY_TOOLCHAIN_ARCH" in some top-level config file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb      | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb
new file mode 100644
index 0000000..941bd94
--- /dev/null
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb
@@ -0,0 +1,4 @@
+TARGET_ARCH := "${SECONDARY_TARGET_ARCH}"
+MACHINEOVERRIDES := "${SECONDARY_TARGET_ARCH}"
+
+require external-linaro-sdk-toolchain.bb
-- 
2.7.4


