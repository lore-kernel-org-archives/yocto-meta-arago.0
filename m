Return-Path: <sam.nelson@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 0984852A34
	for <meta-arago@arago-project.org>;
	Fri, 28 Apr 2017 17:58:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SHwg3r015594
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 12:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493402322;
	bh=9G4udbfdBau+/7TkXSuX05hpbC15UUihXV78floCh4I=;
	h=From:To:CC:Subject:Date;
	b=UIrCikrcS2K3G1mp1Gp4AkIa+9rbEJCalNSGLXjPHRD4P7tFyM5hd9Q3jnhHPaV8b
	zgeAgRF4X7v1z3v++KPcsrKyd+aOZ2XBdNMuUMfjyt1PFXOOOIXDfArrF59EQQ5KNq
	QZuqaGghrQqcM2GR4P4NGGOfbxJfzB+HyFpnb+fo=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SHwgZ0023146
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 12:58:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 12:58:41 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3SHwfrN008305;	Fri, 28 Apr 2017 12:58:41 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Apr 2017 13:58:39 -0400
Message-ID: <1493402320-11537-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 1/2] arago-tisdk-addons: Add ti-ipc-rtos-fw for omapl138
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
X-List-Received-Date: Fri, 28 Apr 2017 17:58:44 -0000
Content-Type: text/plain

Adds ipc rtos test binaries

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous patch
- Include only content for omapl138
- Seperated the ti-ipc-examples-linux into seperate patch
---
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 5ad6655..f527fbc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -57,6 +57,9 @@ UTILS_append_omap-a15 = " mmc-utils \
                           uio-module-drv-test \
 "
 
+UTILS_append_omapl138 = " ti-ipc-rtos-fw"
+"
+
 UTILS_append_dra7xx = " canutils \
                         dsptop \
                         gdbc6x \
-- 
1.9.1


