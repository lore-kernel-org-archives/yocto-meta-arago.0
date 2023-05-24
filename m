Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958EAC7EE32
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:11:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1270.1684951892083345854
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 11:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SZiSPwQ3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOcN032083;
	Wed, 24 May 2023 13:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684951884;
	bh=wRpyno7jgmt2UL9uSlMcWEr9yF3THcf4d1xybePs38g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SZiSPwQ3oqNmiKOOg45FYiCq4F63v3lD4b/UxmQLpdwEV/uoPfEUBG9GrjySoBzKT
	 TRa0QDZbi6zRETMc/7CIReJEmWDIelyNslT+Fje800zVxbyrMdY5gRQVQ3xj+V+bPl
	 0XpJXdd2fuS7CiFDhf8JleUUM29qxehd3psvGs94=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OIBOhX124223
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 13:11:24 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 13:11:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 13:11:24 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOq5005029;
	Wed, 24 May 2023 13:11:24 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [arago][kirkstone][PATCH 6/7] weston: drop the fix-virtual-keyboard-display-issue patch
Date: Wed, 24 May 2023 13:11:21 -0500
Message-ID: <20230524181122.35202-7-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524181122.35202-1-rs@ti.com>
References: <20230524181122.35202-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 May 2023 18:11:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14469

From: Randolph Sapp <rs@ti.com>

Weston 10 changed the way it handles focus grabbing. This shouldn't be
relevant anymore.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...al-keyboard-display-issue-for-QT5-ap.patch | 41 -------------------
 .../wayland/weston_10.0.2.bbappend            |  1 -
 2 files changed, 42 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
deleted file mode 100644
index 32901db9..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8034bc1862bbebb332e91917c6458ef8efb5b54e Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Fri, 8 Mar 2019 18:49:07 -0500
-Subject: [PATCH] weston: Fix virtual keyboard display issue for QT5 
- application
-
-The virtual keyboard does pop up as expected, however, it will never hide
-even when the application is terminated. This problem is due to the order
-of the text APIs( text_input_activate and test_input_show_input_panel) are
-invoked in QT5 and a potential bug of the API implementation. The virtual
-keyboard works as expected if the test_input_show_input_panel() is invoked
-prior to the test_input_activate() as most of the weston sample applications
-do. However, the problem will show up if that order is reversed and the reason
-why is that the current_panel is not set in this case and hence this panel
-cannot be hidden.
-
-It is required to set the current_panel to the text_input when the input_panel
-becomes visible at the first time.
-
-Upstream status: Pending
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- compositor/text-backend.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/compositor/text-backend.c b/compositor/text-backend.c
-index 664c36f..b610dfb 100644
---- a/compositor/text-backend.c
-+++ b/compositor/text-backend.c
-@@ -349,6 +349,7 @@ text_input_show_input_panel(struct wl_client *client,
- 			       text_input->surface);
- 		wl_signal_emit(&ec->update_input_panel_signal,
- 			       &text_input->cursor_rectangle);
-+		text_input->manager->current_text_input = text_input;
- 	}
- }
- 
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
index edc1bebd..698ff03e 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
@@ -7,7 +7,6 @@ PR:append = ".arago1"
 # upstream
 
 SRC_URI += " \
-        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0001-backend-drm-Select-plane-based-on-current-attached-C.patch \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
 "
-- 
2.40.1


