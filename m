Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 21713529ED
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 04:42:28 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MW4009VUVQHTVH1@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Nov 2013 22:42:27 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1D4DF2004B; Mon,
	11 Nov 2013 23:42:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 Nov 2013 23:42:07 -0500
Message-id: <1384231333-26952-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/6] Add Qt5 SDK
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
X-List-Received-Date: Tue, 12 Nov 2013 04:42:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

This patchset adds necessary nativesdk tools and updates corresponding
packagegroup and meta-toolchain recipes to enable building Qt5 SDK.

Denys Dmytriyenko (6):
  qt-provider: split out setting variables into own class
  nativesdk-qtbase: add nativesdk version of qtbase necessary for SDK
    tools
  nativesdk-qttools: add nativesdk version of qttools necessary for SDK
    tools
  nativesdk-packagegroup-arago-qte-toolchain-host: update to support Qt4
    and Qt5
  packagegroup-arago-qt5-toolchain-target: add Qt5-specific version
  meta-toolchain-arago-qte: update to support Qt4 and Qt5 SDK

 meta-arago-distro/classes/qt-provider.bbclass      |  12 +-
 meta-arago-distro/classes/qt-vars.bbclass          |  16 ++
 meta-arago-distro/recipes-qt/qt5/nativesdk-qt5.inc |  12 +
 .../recipes-qt/qt5/nativesdk-qtbase.inc            | 188 +++++++++++++
 .../0001-Add-linux-oe-g-platform.patch             | 304 +++++++++++++++++++++
 .../nativesdk-qtbase/0001-Always-build-uic.patch   |  40 +++
 ...ump-path-length-from-256-to-512-character.patch |  29 ++
 ...reserve-built-qmake-and-swap-with-native-.patch |  29 ++
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  36 +++
 .../0003-Add-external-hostbindir-option.patch      | 219 +++++++++++++++
 ..._functions-temporary-remove-isEmpty-check.patch |  51 ++++
 ...-building-a-separate-qmake-for-the-target.patch |  29 ++
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  29 ++
 .../0008-qt_module-Fix-pkgconfig-replacement.patch |  70 +++++
 .../0009-qt_module-Fix-paths-in-.prl-files.patch   |  62 +++++
 ...on-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch |  44 +++
 ....prf-Allow-to-add-extra-arguments-to-make.patch |  37 +++
 .../0013-Disable-mkv8snapshot.patch                |  47 ++++
 ...tslib-device-to-be-read-from-env-variable.patch |  35 +++
 .../0015-qtbase-allow-build-of-examples.patch      |  48 ++++
 ...ure-make-pulseaudio-a-configurable-option.patch |  36 +++
 ...configure-make-alsa-a-configurable-option.patch |  35 +++
 ...igure-make-freetype-a-configurable-option.patch |  35 +++
 ...E_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch |  84 ++++++
 .../recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb       |   5 +
 .../recipes-qt/qt5/nativesdk-qttools.inc           |  32 +++
 ...w-to-build-only-lrelease-lupdate-lconvert.patch | 138 ++++++++++
 .../recipes-qt/qt5/nativesdk-qttools_5.1.1.bb      |  10 +
 .../recipes-core/meta/meta-toolchain-arago-qte.bb  |  31 ++-
 ...ivesdk-packagegroup-arago-qte-toolchain-host.bb |   4 +-
 .../packagegroup-arago-qt5-toolchain-target.bb     |  33 +++
 31 files changed, 1756 insertions(+), 24 deletions(-)
 create mode 100644 meta-arago-distro/classes/qt-vars.bbclass
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qt5.inc
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-Add-linux-oe-g-platform.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-Always-build-uic.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-bump-path-length-from-256-to-512-character.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-preserve-built-qmake-and-swap-with-native-.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0003-Add-external-hostbindir-option.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0004-qt_functions-temporary-remove-isEmpty-check.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0006-Allow-building-a-separate-qmake-for-the-target.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0008-qt_module-Fix-pkgconfig-replacement.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0009-qt_module-Fix-paths-in-.prl-files.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0013-Disable-mkv8snapshot.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0014-enables-tslib-device-to-be-read-from-env-variable.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0015-qtbase-allow-build-of-examples.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0021-configure-make-pulseaudio-a-configurable-option.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0022-configure-make-alsa-a-configurable-option.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0023-configure-make-freetype-a-configurable-option.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
 create mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb

-- 
1.8.3.2


