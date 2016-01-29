Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5FCCE52A2A
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 15:10:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TFAM8c010179
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:22 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFAMP2028791
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:22 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 09:10:22 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFAMXZ011098;
	Fri, 29 Jan 2016 09:10:22 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aPAgo-0001oL-0z; Fri, 29 Jan 2016 10:10:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 10:10:12 -0500
Message-ID: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Video Analytics Demo
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
X-List-Received-Date: Fri, 29 Jan 2016 15:10:23 -0000
Content-Type: text/plain

Fully integrate the qt-opencv-opencl-opengl video analytics demo into
the SDK.

Jacob Stiffler (7):
  qt-opencv-opencl-opengl-multithreaded: Add version 1.3.3
  arago-source-ipk: Enable qt-opencv-opencl-opengl-multithreaded-src
  matrix-gui-apps-git: Bump SRCREV for multiple fixes
  matrix-gui-video-analytics-demos: Add demo and submenu
  packagegroup-arago-tisdk-multimedia*: Add
    qt-opencv-opencl-opengl-multithreaded
  packagegroup-arago-tisdk-matrix: Add video analytics demo
  ti-tisdk-makefile: Add video analytics target

 .../conf/distro/arago-source-ipk.conf              |  3 ++
 .../packagegroup-arago-tisdk-matrix.bb             |  3 +-
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  6 +++-
 ...ckagegroup-arago-tisdk-multimedia-sdk-target.bb |  3 +-
 .../packagegroup-arago-tisdk-multimedia.bb         |  3 +-
 .../Makefile_qt-opencv-opencl-opengl-multithreaded | 24 +++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 ++-
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |  4 +--
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |  5 ++-
 .../matrix/matrix-gui-video-analytics-demos_2.0.bb | 29 ++++++++++++++++
 .../qt-opencv-opencl-opengl-multithreaded_git.bb   | 39 ++++++++++++++++++++++
 11 files changed, 115 insertions(+), 8 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-opencv-opencl-opengl-multithreaded
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-demo-applications/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb

-- 
1.9.1


