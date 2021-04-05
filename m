Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 5572F52BB2
	for <meta-arago@arago-project.org>;
	Mon,  5 Apr 2021 20:39:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135KdVcv007514;
	Mon, 5 Apr 2021 15:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617655172;
	bh=DBAyONSAuYa6giLX3/46q/5ONViF6ER9kmZREHdfoK4=;
	h=From:To:CC:Subject:Date;
	b=N5TJTBLzFciiih1LbuwASaaG/TYlSteZrZk4UwFgNFXuEEwW8AVXDVLsBUliIxaVK
	L43MQl8nrUC83xNQ062mBOU7Kqu2w2nf72QP1xFass07Ws28JL9FgedbA8YK74VfoM
	ND/XJv+lqhjCjWAcqNmYp8B2mPaH3m6a7NeeDgqc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135KdVVN012845
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 15:39:31 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 5 Apr 2021 15:39:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 5 Apr 2021 15:39:31 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 135KdV6g124258;
	Mon, 5 Apr 2021 15:39:31 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	135KdV3n031788; Mon, 5 Apr 2021 15:39:31 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Mon, 5 Apr 2021 15:39:25 -0500
Message-ID: <20210405203928.7783-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Krunal Bhargav <k-bhargav@ti.com>
Subject: [dunfell][PATCH v2 0/3] qtwebkit: Fix no x11 build
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
X-List-Received-Date: Mon, 05 Apr 2021 20:39:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

qtwebkit build was failing when x11 is enabled for the platform. This was due to
qtwebkit build not picking up the EGL_NO_X11 flag from the packageconfig. This
was earlier fixed by enabling the flag directly in the khrplatform header file.
Fixing up to pass the flag to build environment itself.

Also cleaned up some of the old patches.

v2:
  - fixed typo in patch 2/3 (qtwebkit: Fix no X11 build)

Gowtham Tammana (3):
  Revert "HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at
    ANGLE/khrplatform.h"
  qtwebkit: Fix no X11 build
  qtwebkit: Cleanup old patches

 ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 30 ------------
 ...e-to-use-GL_NoX-version-of-GraphicsS.patch | 29 ------------
 ...re-PlatformQt.cmake-Fix-no-x11-build.patch | 46 +++++++++++++++++++
 .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch | 33 -------------
 .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch | 17 -------
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |  8 +---
 6 files changed, 48 insertions(+), 115 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch

-- 
2.31.1


