Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id BF17D52C9B
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 16:33:34 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131GXtPa087459;
	Thu, 1 Apr 2021 11:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617294835;
	bh=MroDquKRiv7PE1PTU8bKzn2Zik364v4xJ0D6J/215UI=;
	h=From:To:CC:Subject:Date;
	b=h9exGlOozIodTN2wuQuL+prWvxAWPP/4mgx+CkmOYSkO2WXw5RUu/Llwj5ZsenJOo
	T1vDd8jrQGURaf8o49X7GP6fK+gZPBO1HOeyeQkm+PGq3zPvAhwBDD3PQF3aOTuX1H
	/qG/1vKizt4F0Ik9wsld1LLAzHcSbQ8NIOQSDHdE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131GXt4g038769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Apr 2021 11:33:55 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 1 Apr 2021 11:33:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 1 Apr 2021 11:33:55 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 131GXs8j018285;
	Thu, 1 Apr 2021 11:33:55 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 131GXsVV015613;
	Thu, 1 Apr 2021 11:33:54 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Thu, 1 Apr 2021 11:33:37 -0500
Message-ID: <20210401163340.12248-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Krunal Bhargav <k-bhargav@ti.com>
Subject: [dunfell][PATCH 0/3] qtwebkit: Fix no x11 build
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
X-List-Received-Date: Thu, 01 Apr 2021 16:33:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

qtwebkit build was failing when x11 is enabled for the platform. This was due to
qtwebkit build not picking up the EGL_NO_X11 flag from the packageconfig. This
was earlier fixed by enabling the flag directly in the khrplatform header file.
Fixing up to pass the flag to build environment itself.

Also cleaned up some of the old patches.

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


