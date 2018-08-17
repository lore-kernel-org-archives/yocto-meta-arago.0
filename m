Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A1CBA52A7A
	for <meta-arago@arago-project.org>;
	Fri, 17 Aug 2018 14:38:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7HEc6i5035232
	for <meta-arago@arago-project.org>; Fri, 17 Aug 2018 09:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534516686;
	bh=zVLe/tFl9ueK4yyJklOjBIZKNw4kTF38Nuky8c7YsbQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=khuKTE7llCe7wRgioEevCaElt1ffI3KUcR5teXW6mzst2A2UYMHNLkfZoXsPdDU3E
	L7zKKRcHeeWRgju9PYTPb1tSRIGnKtFH7oJ2FMmfrr0PxbCdBywBv0snNbqysgwcXM
	t2zmccC2fPayWJGschzrudRKorFbsohe1cY0G25s=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7HEc61s012883
	for <meta-arago@arago-project.org>; Fri, 17 Aug 2018 09:38:06 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 17 Aug 2018 09:38:06 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 17 Aug 2018 09:38:05 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7HEbpBX012531;
	Fri, 17 Aug 2018 09:38:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Aug 2018 10:25:52 -0400
Message-ID: <1534515953-32644-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
References: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC 2/3] packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Fri, 17 Aug 2018 14:38:13 -0000
Content-Type: text/plain

* Add the secondary toolchain to the devkit
 if SECONDARY_TOOLCHAIN_ARCH is defined.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
index b89c5d0..29dfdb6 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
@@ -11,10 +11,14 @@ BINUTILS = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 GCC = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 GDB = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
+SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
+                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
+
 RDEPENDS_${PN} = "\
     ${@all_multilib_tune_values(d, 'BINUTILS')} \
     ${@all_multilib_tune_values(d, 'GCC')} \
     ${@all_multilib_tune_values(d, 'GDB')} \
+    ${@base_conditional('SECONDARY_TARGET_ARCH', '', '', '${SECONDARY_TOOLCHAIN}', d)} \
     "
 
 #    meta-environment-${MACHINE}
-- 
2.7.4


