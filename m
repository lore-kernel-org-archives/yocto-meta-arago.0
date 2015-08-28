Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9D06752A08
	for <meta-arago@arago-project.org>;
	Fri, 28 Aug 2015 04:01:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7S41vup024555
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 23:01:57 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7S41vOc030718
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 23:01:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 27 Aug 2015 23:01:57 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t7S41vib027352;	Thu, 27 Aug 2015 23:01:57 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Aug 2015 00:01:49 -0400
Message-ID: <1440734514-16165-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Use null_window DRM from SGX DDK for AM3 and AM4
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
X-List-Received-Date: Fri, 28 Aug 2015 04:01:59 -0000
Content-Type: text/plain

This patch set allows the use of null_window DRM from SGX DDK for AM3 and AM4. 

Graphics SDK is no longer used for AM3 and AM4.

Hongmei Gou (5):
  arago-prefs: use libgbm and omap5-sgx-ddk-um-linux (SGX user module)
    for AM3 and AM4
  img-pvr-sdk: update source of Imagination demo binaries for AM3 and
    AM4
  packagegroup-arago-tisdk-graphics*: use libgbm, SGX kernel module and
    user module, and img-pvr-sdk for AM3 and AM4
  qtbase: add dependency on libdrm for AM3 and AM4 which now use
    null_window DRM from SGX user module
  matrix-gui-3d-demos: update demo dependency for AM3 and AM4

 .../conf/distro/include/arago-prefs.inc            | 10 ++++++++
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb  |  7 +++---
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb | 13 ++++++----
 .../packagegroup-arago-tisdk-graphics.bb           | 15 +++++++++---
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend |  4 +++-
 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb |  5 ++--
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb               | 28 ++++++++++++++++++----
 7 files changed, 63 insertions(+), 19 deletions(-)

-- 
1.9.1


