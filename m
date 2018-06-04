Return-Path: <d-senicic1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 15665529BA
	for <meta-arago@arago-project.org>;
	Mon,  4 Jun 2018 14:56:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w54EuncS025152
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 09:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528124209;
	bh=96pqGqqRdnB+ZtRTiOeZz4vWSp11xgwJjjPo1L8MPn0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UwK1x2I6Q1pWRE8N8H6LZHkillWfa9cqQVhcN+JcwQJagueaV71JccRK1jpyzrwE0
	QLhI57O69dVxVoRfXKHIzRZQwIiEPihaOtLtY7wEQcnw7KVboU1RtA66zivwCriUQd
	gAg1G9UJ4ikoq+s40OxOJkjM3AK2sJUD6g/AbvSY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54Eunaq016416
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 09:56:49 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 4 Jun 2018 09:56:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 4 Jun 2018 09:56:48 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54Eumpo003223;
	Mon, 4 Jun 2018 09:56:48 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Jun 2018 10:56:42 -0400
Message-ID: <1528124204-19003-2-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528124204-19003-1-git-send-email-x0157990@ti.com>
References: <1528124204-19003-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH 2/4] csl: update for common-csl-ip 3.3.0.11
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
X-List-Received-Date: Mon, 04 Jun 2018 14:56:56 -0000
Content-Type: text/plain

* csl: new release 3.3.0.11

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend    | 1 +
 2 files changed, 6 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc b/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
new file mode 100644
index 0000000..dca0a73
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.11"
+CSL_SRCREV = "b18c65acf85f9d94226cc573a99ba94bfe822b88"
+
+PV = "03.03.00.11"
+INC_PR = "r0"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
new file mode 100644
index 0000000..dbf994a
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
-- 
1.9.1


