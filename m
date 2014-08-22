Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6CA6152993
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 13:28:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7MDSWZa025392
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 08:28:32 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7MDSWvb022665
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 08:28:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 08:28:32 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7MDSUD0019668;	Fri, 22 Aug 2014 08:28:31 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Aug 2014 18:55:21 +0530
Message-ID: <1408713923-25284-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: nikhil.nd@ti.com
Subject: [PATCH 0/2] Adding support for Wayland for DRM backends
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
X-List-Received-Date: Fri, 22 Aug 2014 13:28:33 -0000
Content-Type: text/plain

There are some issues with the current omapdrm (kernel driver) and related
dependencies on the TI platform such as dra7xx.

Weston version 1.3.0 has been very highly tested and is currently shipping
to customers who are using wayland with DRM backend. This patch set brings
in support for Weston and also includes patches that help resolve some
important issues in the Weston. These issues are specific to TI platforms
and cannot be submitted upstream.

Karthik Ramanan (2):
  wayland: add support for version 1.3.0 for drm backend
  wayland: adding support for weston 1.3.0 for DRM backend

 ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |   26 ++++
 ...e-Include-option-to-search-in-include-drm.patch |   47 +++++++
 ...urce-prevent-input-disable-during-repaint.patch |   34 +++++
 .../0005-temp-hack-to-enable-weston-1.3.patch      |   33 +++++
 .../0006-weston-drm-Enable-multiple-displays.patch |   43 ++++++
 .../recipes-graphics/wayland/just-scanner.patch    |   36 +++++
 .../recipes-graphics/wayland/pattern.png           |  Bin 0 -> 1846 bytes
 meta-arago-extras/recipes-graphics/wayland/profile |    9 ++
 .../recipes-graphics/wayland/terminal.png          |  Bin 0 -> 1005 bytes
 .../recipes-graphics/wayland/wayland.inc           |    5 +
 .../recipes-graphics/wayland/wayland_1.3.0.bb      |   34 +++++
 .../recipes-graphics/wayland/weston.desktop        |   91 ++++++++++++
 .../recipes-graphics/wayland/weston.png            |  147 +++++++++++++++++++
 .../recipes-graphics/wayland/weston_1.3.0.bb       |  148 ++++++++++++++++++++
 14 files changed, 653 insertions(+)
 create mode 100755 meta-arago-extras/recipes-graphics/wayland/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
 create mode 100755 meta-arago-extras/recipes-graphics/wayland/0002-Makefile-Include-option-to-search-in-include-drm.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/0003-input-source-prevent-input-disable-during-repaint.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/0005-temp-hack-to-enable-weston-1.3.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/0006-weston-drm-Enable-multiple-displays.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/just-scanner.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/pattern.png
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/profile
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/terminal.png
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland.inc
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston.desktop
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston.png
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb

-- 
1.7.9.5


