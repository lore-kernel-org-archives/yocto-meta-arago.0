Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 240B552986
	for <meta-arago@arago-project.org>;
	Thu, 15 Feb 2018 17:46:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1FHkHt1024701
	for <meta-arago@arago-project.org>; Thu, 15 Feb 2018 11:46:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518716777;
	bh=+SAgw48TAwuczyiVpivNcziYLpo7w3VZI6FYnPAkr6E=;
	h=From:To:CC:Subject:Date;
	b=JgZMcFxqXgLjE7/sa0LcWGZGhgrJ+NAaB54zBwSt5xS6iLXV9EXoxm6kWEiW7ILxg
	jdQtgYcrDj+v2/T9yVGJsQYY0BEkaTLHTd9oG6AM0G8H7HgUiflLlqbLSYprJQLY5l
	6rtdT5//sPF/1olhou2xODL8srK8THlbuGx/R1r8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1FHkHP2024448
	for <meta-arago@arago-project.org>; Thu, 15 Feb 2018 11:46:17 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 15 Feb 2018 11:46:17 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 15 Feb 2018 11:46:17 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1FHkGEs009193;
	Thu, 15 Feb 2018 11:46:16 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Feb 2018 12:37:50 -0500
Message-ID: <1518716270-17171-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] arago.conf: add TI_MIRROR to mirrors
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
X-List-Received-Date: Thu, 15 Feb 2018 17:46:37 -0000
Content-Type: text/plain

* Add the TI_MIRROR as a fallback to any upstream fetch issues.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 00db445..bc7c18c 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -7,9 +7,21 @@ FEEDURIPREFIX ?= "packages/${DISTRO}-morty/${BUILD_VARIANT}/"
 
 OPKG_ARGS_remove = "--prefer-arch-to-version"
 
+TI_MIRROR = "http://software-dl.ti.com/processor-sdk-mirror/sources/"
 MIRRORS += " \
 ftp://.*/.*       http://arago-project.org/files/sources/ \n \
 https?$://.*/.*   http://arago-project.org/files/sources/ \n \
+bzr://.*/.*      ${TI_MIRROR} \n \
+cvs://.*/.*      ${TI_MIRROR} \n \
+git://.*/.*      ${TI_MIRROR} \n \
+gitsm://.*/.*    ${TI_MIRROR} \n \
+hg://.*/.*       ${TI_MIRROR} \n \
+osc://.*/.*      ${TI_MIRROR} \n \
+p4://.*/.*       ${TI_MIRROR} \n \
+npm://.*/.*      ${TI_MIRROR} \n \
+ftp://.*/.*      ${TI_MIRROR} \n \
+https?$://.*/.*  ${TI_MIRROR} \n \
+svn://.*/.*      ${TI_MIRROR} \n \
 "
 
 # SDK paths and names
-- 
2.7.4


