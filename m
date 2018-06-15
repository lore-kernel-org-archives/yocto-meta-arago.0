Return-Path: <x0038811@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 48E3F529A9
	for <meta-arago@arago-project.org>;
	Fri, 15 Jun 2018 06:42:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5F6g4h4023618
	for <meta-arago@arago-project.org>; Fri, 15 Jun 2018 01:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529044924;
	bh=FCiVjSyd9UCvxyAnabFDBArluLbTwmLBWz2TL0HHYR8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ssnqforQdt1MvoECMu3ZoRpbWC7RtmtjlQtFqezNQ7NWLXCZ6zqoQlFZ5EmJmuRVU
	XZjkrUq/5AZUQzcJY3jmDjkfbB2eTJCMirMdHKGf9+h5n4VUh5auvULeZSlFN7DQDP
	pYXQiND6SYCCCfpZk/6TyEHjba5OaIo8bnOCTo5g=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5F6g4vF025032
	for <meta-arago@arago-project.org>; Fri, 15 Jun 2018 01:42:04 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 15 Jun 2018 01:42:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 15 Jun 2018 01:42:04 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5F6g13Z018762;
	Fri, 15 Jun 2018 01:42:03 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Jun 2018 12:11:59 +0530
Message-ID: <1529044919-10825-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529044919-10825-1-git-send-email-x0038811@ti.com>
References: <1529044919-10825-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 1/1] omapdrmtest: Update SRCREV
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
X-List-Received-Date: Fri, 15 Jun 2018 06:42:11 -0000
Content-Type: text/plain

This update addresses the following:
   *fix build issue with Android O
   *Replace scaler wayland API with viewporter wayland API

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 47d3245..51f06ae 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -7,8 +7,8 @@ DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r25"
-SRCREV = "6d81a5c7dc998a914c482bd8aef0d6b2ffd3aa09"
+PR = "r26"
+SRCREV = "6877f56301e46e2ba377fc3dc18fcc1f333a3cce"
 
 EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.9.1


