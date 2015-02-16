Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5757252093
	for <meta-arago@arago-project.org>;
	Mon, 16 Feb 2015 08:53:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1G8r77K013580
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 02:53:07 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1G8r6Q4022250
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 02:53:06 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Feb 2015 02:53:05 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1G8r42X031542;
	Mon, 16 Feb 2015 02:53:05 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Feb 2015 14:23:02 +0530
Message-ID: <1424076782-23655-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-arago 1/1] wayland/weston: Deprecate 1.3.0
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
X-List-Received-Date: Mon, 16 Feb 2015 08:53:08 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../wayland/wayland/just-scanner.patch             |   36 --------
 .../recipes-graphics/wayland/wayland_1.3.0.bb      |   40 ---------
 ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |   26 ------
 ...e-Include-option-to-search-in-include-drm.patch |   47 ----------
 ...urce-prevent-input-disable-during-repaint.patch |   34 --------
 .../0005-temp-hack-to-enable-weston-1.3.patch      |   33 -------
 .../0006-weston-drm-Enable-multiple-displays.patch |   43 ----------
 .../recipes-graphics/wayland/weston_1.3.0.bb       |   90 --------------------
 8 files changed, 349 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch b/meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch
deleted file mode 100644
index 234a9c5..0000000
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
deleted file mode 100644
index ae68dac..0000000
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
deleted file mode 100644
index cd0581a..0000000
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch
deleted file mode 100644
index 557373d..0000000
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch
deleted file mode 100644
index 74e82fb..0000000
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
deleted file mode 100644
index 0c860b3..0000000
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
deleted file mode 100644
index abc4295..0000000
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
deleted file mode 100644
index cf81a33..0000000
-- 
1.7.9.5


