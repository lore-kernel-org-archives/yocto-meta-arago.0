Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EE6E352092
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2018 21:28:43 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAELSXV7030262
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 15:28:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542230913;
	bh=JnUcoFfNfLTRL+06yG0bnMZchPaCGOZkSAqliqE+D64=;
	h=From:To:CC:Subject:Date;
	b=Hd4czOBxRhWpQhAP4HB6q/LJynIT0Vgo+xLZxcHXuO9fqrACJA6wxbn2iVtmc8RCy
	jZDsAwFG5O0P0Hv1kW00Nt2bQcZ0KczW4WYuXFE+cubEOmF4UeAV17hwG+weBhLBV2
	irKqepbcXFBeTbAmghUYeM5GctIzV34FXgQzqgwY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAELSWLF060109
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 15:28:33 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 14 Nov 2018 15:28:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 14 Nov 2018 15:28:32 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAELSWVn003496;
	Wed, 14 Nov 2018 15:28:32 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 14 Nov 2018 16:16:07 -0500
Message-ID: <1542230167-11306-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-tisdk-setup: create-sdcard update for k3
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
X-List-Received-Date: Wed, 14 Nov 2018 21:28:45 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index a77ba84..4907fc6 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r39"
+PR = "r40"
 
 BRANCH ?= "master"
-SRCREV = "1a951176f9ab2320c4391b7794c66f4f18e0b92b"
+SRCREV = "68829daa05d20c1621476acb6591b741d9bd613b"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
@@ -15,7 +15,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SDCARD_SCRIPT = " create-sdcard.sh"
 SDCARD_SCRIPT_keystone = ""
 SDCARD_SCRIPT_k2g = " create-sdcard.sh"
-SDCARD_SCRIPT_k3 = " k3/create-sdcard.sh"
 
 SETUP_SCRIPTS = " common.sh \
                   setup-host-check.sh \
-- 
2.7.4


