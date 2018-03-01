Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 2563952976
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 20:04:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21K3UwP012173
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 14:03:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519934610;
	bh=jsjc1Ek5Or12Ku2SNmHKAMEazua0Hju3qrQ0TVjhyr8=;
	h=From:To:CC:Subject:Date;
	b=xVqJ69axmtXKCGDXfz1eCiWE3y7/5al/nMH2xLuSicgSfBEsGfqe4bM8Eyn7DNZtr
	iAWrcCXPiDuKKLLdZZFtiETWclXc7viocw957UTKYoKuFOZE0d1hRLPml7BAMyYauS
	6pfu0mqrSNphIqU8NP+wvsMY2mqDMQMFkJCGppfE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21K3Ulu017670
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 14:03:30 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 14:03:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 14:03:29 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21K3Tp7001935;
	Thu, 1 Mar 2018 14:03:29 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Mar 2018 14:55:06 -0500
Message-ID: <1519934106-27603-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] external-linaro-bfd-version: Use ?= for default TOOLCHAIN_PATH
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
X-List-Received-Date: Thu, 01 Mar 2018 20:04:06 -0000
Content-Type: text/plain

If using meta-arago-extras in another distro, there is a parsing error
if TOOLCHAIN_PATH is not set. There is an apparent conflict between
very weak assignment (??=) and immediate assignment (:=) where during
parsing, the immediate assignment occurs before the very weak
assignment. This causes a parsing error as TOOLCHAIN_PATH resovled as
the none type when it is appended to a string.

Use weak assignment (?=) to resolve this parsing issue.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc b/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
index 47911a2..f2764cc 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
@@ -1,4 +1,4 @@
-TOOLCHAIN_PATH ??= "${STAGING_BINDIR_TOOLCHAIN}"
+TOOLCHAIN_PATH ?= "${STAGING_BINDIR_TOOLCHAIN}"
 
 def elt_get_bfd_version(d):
 	import subprocess,os,bb
-- 
2.7.4


