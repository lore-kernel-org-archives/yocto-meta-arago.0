Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6FE7652A49
	for <meta-arago@arago-project.org>;
	Fri,  5 Sep 2014 14:52:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s85EqrI4002997
	for <meta-arago@arago-project.org>; Fri, 5 Sep 2014 09:52:53 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s85EqrMx017411
	for <meta-arago@arago-project.org>; Fri, 5 Sep 2014 09:52:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 5 Sep 2014 09:52:53 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s85EqpBs003986;
	Fri, 5 Sep 2014 09:52:52 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Sep 2014 20:22:43 +0530
Message-ID: <1409928767-11517-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
MIME-Version: 1.0
Subject: [for master] [PATCH v2 0/4] Adding support for Wayland for DRM backends
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
X-List-Received-Date: Fri, 05 Sep 2014 14:52:54 -0000
Content-Type: text/plain

This patchset first brings in the default Wayland and Weston 1.3.0
version from the oe-core. Correspondin commit ID in the oe-core
: 7508b61d1cb869233f3d841183edd6fd19d5102e

The remaining two patches, bring in the TI specific adaptions 
to the recipes to use the underlying layers. Note that there are 
some issues with the current omapdrm (kernel driver) 
and related dependencies on the TI platform such as dra7xx.
This patch set aims to provide solution to some of it.

Weston version 1.3.0 has been very highly tested and is 
currently shipping to customers who are using wayland with 
DRM backend. 

This patch set brings in support for Weston and also includes 
patches that help resolve some important issues in the Weston. 
These issues are specific to TI platforms and cannot be 
submitted upstream.


Karthik Ramanan (2):
  wayland: add support for version 1.3.0 for drm backend
  weston: weston 1.3.0 for DRM backend

Ross Burton (2):
  wayland: upgrade to 1.3.0
  weston: upgrade to 1.3.0

 .../recipes-graphics/wayland/wayland.inc           |   5 +
 .../recipes-graphics/wayland/wayland_1.3.0.bb      |  34 +++++
 ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |  26 ++++
 ...e-Include-option-to-search-in-include-drm.patch |  47 +++++++
 ...urce-prevent-input-disable-during-repaint.patch |  34 +++++
 .../0005-temp-hack-to-enable-weston-1.3.patch      |  33 +++++
 .../0006-weston-drm-Enable-multiple-displays.patch |  43 ++++++
 .../recipes-graphics/wayland/weston/pattern.png    | Bin 0 -> 1846 bytes
 .../recipes-graphics/wayland/weston/profile        |   9 ++
 .../recipes-graphics/wayland/weston/terminal.png   | Bin 0 -> 1005 bytes
 .../recipes-graphics/wayland/weston_1.3.0.bb       | 148 +++++++++++++++++++++
 11 files changed, 379 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland.inc
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
 create mode 100755 meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
 create mode 100755 meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/pattern.png
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/profile
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/terminal.png
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb

-- 
2.0.1


