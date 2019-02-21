Return-Path: <x0038811@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 365D35298F
	for <meta-arago@arago-project.org>;
	Thu, 21 Feb 2019 09:18:44 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1L9If1a089877
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2019 03:18:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550740721;
	bh=n+O0YhiSRnYzMwxSPdfNEFL5NoUWxhG7K0L88miBtEM=;
	h=From:To:CC:Subject:Date;
	b=kcNGUEaXYPc6GCBZzpbauozJ6XB63LjQGYZ5PXDi+tk3ztS8Qk+OzgSG7tb2jVdmw
	ebR/VvW2YyOklDrupdSU+vkij9362b+r9Qla/0IwT1TTVsmCQj3WL6FJvP/Gr1ikQK
	Mr/nHvcG9S91Q+WPGSHUaCGQFUrLYEvvLxM27wUE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1L9IfsC116262
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2019 03:18:41 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 21 Feb 2019 03:18:41 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 21 Feb 2019 03:18:41 -0600
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1L9IdpE009115;
	Thu, 21 Feb 2019 03:18:40 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Feb 2019 14:48:15 +0530
Message-ID: <1550740703-19443-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master 0/8] Enable Gstreamer 1.14
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
X-List-Received-Date: Thu, 21 Feb 2019 09:18:44 -0000
Content-Type: text/plain

Gstreamer version in Yocto Thud release is changed to 1.14.4 and 
existing patches are not appliable. Reworked patches are created
here and few compilation issues with ducati and vpe are resolved.

Ramprasad N (8):
  gstreamer1.0*-bad: clean-up failing patches
  gstreamer1.0*-bad: Add drmallocator support
  gstreamer1.0*-bad: Enable kmssink with gst 1.14.4
  gstreamer1.0*-bad: Add DRM support to waylandsink
  gstreamer1.0*-bad: Input device support in waylandsink
  gstreamer1.0-plugins-ducati: stop using -export-symbols-regex
  gstreamer1.0-plugins-vpe: stop using -export-symbols-regex
  branding-core: Re-enable mmip

 .../conf/distro/include/branding-core.inc          |   4 -
 ...onfigure.ac-stop-using-export-symbols-reg.patch |  28 +++
 .../gstreamer1.0-plugins-ducati_git.bb             |   3 +-
 ...figure.ac-stop-using-export-symbols-regex.patch |  52 +++++
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |   3 +-
 ...gstdrmallocator-Add-DRM-allocator-support.patch |  87 ++++----
 ...omapdrm-and-tidss-in-the-list-of-drivers.patch} |  62 +++---
 ...Add-omapdrm-in-the-list-of-driver-modules.patch | 165 ---------------
 ...aylandsink-Add-drm-support-in-waylandsink.patch | 229 ++++++++++-----------
 ...0005-waylandsink-Add-input-device-support.patch | 103 ++++-----
 .../gstreamer1.0-plugins-bad_1.14.4.bbappend       |  26 +--
 11 files changed, 326 insertions(+), 436 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
 rename meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch => 0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch} (77%)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch

-- 
1.9.1


