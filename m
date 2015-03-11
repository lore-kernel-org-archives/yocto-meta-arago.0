Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0AA9252A62
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2015 18:07:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2BI7VDM009314
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 13:07:31 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BI7UOO010207
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 13:07:30 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 13:07:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BI7TBv012683	for
	<meta-arago@arago-project.org>; Wed, 11 Mar 2015 13:07:29 -0500
Date: Wed, 11 Mar 2015 14:07:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150311180729.GA23587@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: gitorious.org status
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
X-List-Received-Date: Wed, 11 Mar 2015 18:07:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

So, it appears gitorious.org has disabled "git" access across the board, 
probably to enforce read-only state and prevent people from updating their 
repos further, forcing them to migrate to gitlab...

There are patches for meta-qt5 to switch SRC_URIs to code.qt.io - that will 
take care of Qt5 recipes, once commited to meta-qt5/master, which we track.

We would need to take care of our own repositories (qt-apps, matrix, uim, 
etc.) and decide where to move them over to. Franklin, most of those repos are 
owned by you or your tem. What are your plans?

meta-arago-extras/recipes-connectivity/uim/uim_git.bb:SRC_URI = "git://gitorious.org/uim/uim.git \
meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb:HOMEPAGE = "https://gitorious.org/image-gallery"
meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb:SRC_URI = "git://gitorious.org/image-gallery/image-gallery.git;protocol=git;branch=${BRANCH}"
meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb:HOMEPAGE = "https://gitorious.org/thermostat-demo"
meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb:   git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb:SRC_URI = "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=git;branch=${BRANCH}"
meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb:HOMEPAGE = "https://gitorious.org/oprofile-example"
meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb:SRC_URI = "git://gitorious.org/oprofile-example/oprofile-example.git;protocol=git;branch=${BRANCH}"
meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix_browser"
meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb:SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc:SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/refresh-screen"
meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb:SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb:SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb:HOMEPAGE = "https://gitorious.org/screenshot"
meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb:SRC_URI = "git://gitorious.org/screenshot/screenshot.git;protocol=git;branch=${BRANCH}"
meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb:SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb:SRC_URI = "git://gitorious.org/av_examples/av_examples.git;protocol=git;branch=${BRANCH}"
meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb:HOMEPAGE = "https://gitorious.org/dual-camera-demo/"
meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb:SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH} \

-- 
Denys

