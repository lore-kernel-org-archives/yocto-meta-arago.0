Return-Path: <sam.nelson@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 0FC595209B
	for <meta-arago@arago-project.org>;
	Fri, 28 Apr 2017 20:20:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SKKPk1032511
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 15:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493410825;
	bh=BJ+9uVuTxXCWGnPjhPbX4x9oeqer1kvkU3Jz+wgfCT4=;
	h=From:To:CC:Subject:Date;
	b=aRhzlMfGlgmw0b6oNRfmzJaj6Fnnyp2PI3dL1ZQkpz6stLN/8G/ZHqG/87SD89puf
	u/y/3T3nDmO3waw3YEr/GkFvLXXW8PC+WJd/64AxWsLf59MkgfwpepJ8XeASwcivF8
	H9HwybkJaeZn7I1PcPucsFSFZ3ogPYRYDyb4ojDA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SKKPIM022327
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 15:20:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 15:20:25 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3SKKPT7003599;	Fri, 28 Apr 2017 15:20:25 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Apr 2017 16:20:23 -0400
Message-ID: <1493410824-49935-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH v3 1/2] arago-tisdk-addons: Add ti-ipc-rtos-fw for omapl138
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
X-List-Received-Date: Fri, 28 Apr 2017 20:20:26 -0000
Content-Type: text/plain

Adds ipc rtos test binaries

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous patch
Fix error with quotes
---
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 5ad6655..9ed9bc2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -57,6 +57,8 @@ UTILS_append_omap-a15 = " mmc-utils \
                           uio-module-drv-test \
 "
 
+UTILS_append_omapl138 = " ti-ipc-rtos-fw"
+
 UTILS_append_dra7xx = " canutils \
                         dsptop \
                         gdbc6x \
-- 
1.9.1


