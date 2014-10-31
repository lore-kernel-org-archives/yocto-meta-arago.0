Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A97D9529D9
	for <meta-arago@arago-project.org>;
	Fri, 31 Oct 2014 15:48:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9VFmAQN018531
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 10:48:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9VFmAHK024789
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 10:48:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 31 Oct 2014 10:48:10 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s9VFm89e012302;	Fri, 31 Oct 2014 10:48:09 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 Oct 2014 21:13:10 +0530
Message-ID: <1414770194-24178-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [for master v3 0/4] wayland/weston 1.3.0 for DRM backends
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
X-List-Received-Date: Fri, 31 Oct 2014 15:48:12 -0000
Content-Type: text/plain

This is the version 3 of the patches that were reworked based on 
earlier review comments. Intentionally setting the compatible 
machine to dra7xx-evm as this is currently GLSDK specific but 
can be used for other platforms as needed.

Karthik Ramanan (4):
  wayland: Introduce 1.3.0 for DRM based backend
  wayland: GLSDK specific adaptions
  weston: version 1.3.0 for DRM backend
  weston: v1.3.0 for DRM based backend (additional patches)

 .../wayland/{wayland_1.6.0.bb => wayland_1.3.0.bb} |   23 +++--
 ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |   26 ++++++
 ...e-Include-option-to-search-in-include-drm.patch |   47 ++++++++++
 ...urce-prevent-input-disable-during-repaint.patch |   34 ++++++++
 .../0005-temp-hack-to-enable-weston-1.3.patch      |   33 +++++++
 .../0006-weston-drm-Enable-multiple-displays.patch |   43 ++++++++++
 .../recipes-graphics/wayland/weston_1.3.0.bb       |   90 ++++++++++++++++++++
 7 files changed, 284 insertions(+), 12 deletions(-)
 copy meta-arago-extras/recipes-graphics/wayland/{wayland_1.6.0.bb => wayland_1.3.0.bb} (68%)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb

-- 
1.7.9.5


