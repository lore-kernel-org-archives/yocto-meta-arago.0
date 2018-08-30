Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D0F86529AE
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2018 19:31:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7UJVBrr009915
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 14:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535657471;
	bh=j0RDd6te6E/FMPUwqDRdUi56VGqqEmMmSssJJLZv0Xs=;
	h=From:To:CC:Subject:Date;
	b=lLPCJZy31qw+h/a1XJ7YAwdSisKtgS33iIr/EKMkOaAiyJx5vo3IGq6j0ac2T8S50
	1N7Nz9GTzQFDnuJhX+PCs4ziJa/jm//4Wluos/thxn6oswijyfbjv5rTqGkkMrygZi
	fpP3mX2KqACgCfAc20F/vNTZecqWLqb/A4YDI95w=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UJVBLL019718
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 14:31:11 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 30 Aug 2018 14:31:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 30 Aug 2018 14:31:11 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UJVBgv031686;
	Thu, 30 Aug 2018 14:31:11 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Aug 2018 15:18:55 -0400
Message-ID: <1535656735-16400-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-tisdk-setup: k3: install k3-specific create-sdcard
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
X-List-Received-Date: Thu, 30 Aug 2018 19:31:20 -0000
Content-Type: text/plain

* This is temporarily needed while board auto-detection is not
  supported.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index d6921d0..1408b47 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r35"
+PR = "r36"
 
 BRANCH ?= "master"
-SRCREV = "c6517247c9bc5564bbe63d7322314010ac28b1c3"
+SRCREV = "81862f79b19bf4f312555863d247de88921a019b"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
@@ -15,6 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SDCARD_SCRIPT = " create-sdcard.sh"
 SDCARD_SCRIPT_keystone = ""
 SDCARD_SCRIPT_k2g = " create-sdcard.sh"
+SDCARD_SCRIPT_k3 = " k3/create-sdcard.sh"
 
 SETUP_SCRIPTS = " common.sh \
                   setup-host-check.sh \
-- 
2.7.4


