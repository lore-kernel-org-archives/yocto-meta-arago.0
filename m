Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9BA1352A0D
	for <meta-arago@arago-project.org>;
	Mon, 12 Jun 2017 23:04:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5CN4jtx011074
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 18:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497308685;
	bh=dbac0jbXq9QuHMI5mE47ctfKwFtaccoSHDnKdoGfZos=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=UrFGhQxxY/2C2TIcIBod1o6pbB0uL8SGCplTUEUJiYIb+6da8HkQomD5X7tYO5siK
	hXyOEP3qD1V2QmTFUKLwdG6vdyETUHrbO/Yl1HYjZCip3/vCa+I8UUJRmYn5STTz3Y
	mW8xmxUVJZECSCJ5xfQWoGGG6OtYsnDq1bAxjmbg=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5CN4evf008101
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 18:04:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Jun 2017 18:04:40 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5CN4d3i023863	for <meta-arago@arago-project.org>;
	Mon, 12 Jun 2017 18:04:40 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 12 Jun 2017 19:04:34 -0400
Message-ID: <1497308675-64220-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1497308675-64220-1-git-send-email-e-ruei1@ti.com>
References: <1497308675-64220-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v4 2/3] packagegroup-arago-tisdk-qte: add qtwebbrowser demo application to the list and sort it
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
X-List-Received-Date: Mon, 12 Jun 2017 23:04:55 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index f2f87be..30bac7b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -24,6 +24,8 @@ QT5_DEMOS = "\
     qtscript-examples \
     qtsvg-examples \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
+    qtwebbrowser \
+    qtwebbrowser-examples \
     qtwebengine-examples \
     qtwebkit-examples-examples \
 "
-- 
1.9.1


