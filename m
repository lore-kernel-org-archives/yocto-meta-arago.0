Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id E7487529E2
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 11:45:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92BjJNM024183
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 06:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506944719;
	bh=4rcUT7IWAy+ybipWKnQDLJHWKRLxf1NppX7w0gFPbKc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=sFUVcGLc66SD5UnrYEX4DSF6Cc64lx6t5I/ZlqYyh/NaWBHQVKimcsAMVJLCVvNb+
	BJno1hoDKWAHY3WuCWFSwNUCdxugr2+M2VJpThVQqlnMbOM7HySCgVlOWxDvPsf2nJ
	lDMSSWHzztID7nVIDmFYqob7NuMVEoaKXN+qcZjo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92BjJQH009998
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 06:45:19 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 06:45:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 06:45:19 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92BjJJl020991;
	Mon, 2 Oct 2017 06:45:19 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4ef6bf5f-7491-3114-e218-73314c3a5248@ti.com>
Date: Mon, 2 Oct 2017 07:45:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][morty-x11-experimen tal][PATCH 00/ Add X11 Build Support
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
X-List-Received-Date: Mon, 02 Oct 2017 11:45:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Eric,


It seems that with the long subject prefix, that the commit message gets 
corrupted. Can you resubmit with out the 'morty-x11-experimental' in the 
prefix? I will know to place the patches in the set on a branch.


Thank you,

Jake


On 9/29/2017 2:23 PM, Eric Ruei wrote:
> Add X11 Build Support based on SGX DDK 1.15 X11 package
> - Add SGX DDK 1.15 UM/KM recipes
> - Add new Machine Feature xsgx for SGX X11 package
> - Enable qt5 eglfs.x11 build
>    - add x11 modules to package list
>    - replace x11 original component dependency list with img-egl (um)
>    - add include/lib search paths to point to SGX DDK UM X11 directories
> - Remove unsupported modules based on the availability of xsgx
>
> Note: This is a tentative hack to provide X11 support as a build option.
>        It is not intended to be upstreamed to meta-arago and will be
>        removed when the official solution is available.
>
> Eric Ruei (23):
>    branding-processor-sdk.inc: select xsgx-ddk for X11 build
>    layer.conf: select sgx-ddk based on ddk window support (xsgx vs, sgx)
>    arago-core-tisdk-image: add additional packagegroup for X11 (xsgx)
>      build
>    tisdk-rootfs-image: add packagegroup-arago-tisdk-graphics for omap-a15
>      unconditionally
>    ti-xsgx-ddk-km: sgx ddk km recipe for X11 support
>    ti-xsgx-ddk-um: sgx ddk um recipe for X11 support
>    img-pvr-sdk: add X11 demo programs for X11 build
>    qtbase: add x11 build support for (x)sgx ddk
>    qtbase-conf: add qt_env.sh for X11 support
>    qtwebbrowser: add additional include/lib search path for X11 build
>    refresh_screen: add additional include/lib search path for X11 build
>    matrix-gui-browser: add additional include/lib search path for X11
>      build
>    matrix-gui: add X11 support
>    matrix-gui-3d-demos: remove kmscube-based demos for X11 (xsgx) build
>    packagegroup-arago-test-addons: remove omapdrmtest for X11(xsgx) build
>    ti-tisdk-makefile: add/remove modules for X11(xsgx) build
>    packagegroup-arago-tisdk-graphics-sdk-host(target): select sgx ddk
>      package based om MACHINE_FEATURES (xsgx vs. sgx)
>    packagegroup-arago-tisdk-graphics: add X11 build support
>    packagegroup-arago-tisdk-multimedia(-sdk): remove unsupported tests
>      for X11
>    packagegroup-arago-tisdk-hmi(-sdk): remove HMI demos for X11(xsgx)
>      build
>    packagegroup-arago-tisdk-matrix: remove unsupported matrix-gui demos
>      for X11(xsgx) build
>    matrix-gui-hmi-demos: remove unsupported HMI demos for X11(xsgx) build
>    packagegroup-arago-tisdk-addons(-sdk-target): removed unsupported
>      modules for X11(xsgx) build
>
>   conf/distro/include/branding-processor-sdk.inc     | 13 ++++
>   conf/layer.conf                                    |  6 ++
>   .../powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb | 46 ++++++++++++
>   .../images/arago-core-tisdk-image.bbappend         |  4 +-
>   recipes-core/images/tisdk-rootfs-image.bbappend    |  3 +-
>   .../matrix/matrix-gui-3d-demos_2.0.bbappend        | 16 ++++
>   .../matrix/matrix-gui-browser_2.0.bbappend         |  4 +
>   recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb    |  5 +-
>   ...mand-X11-Stop-matrix-when-running-a-GUI-d.patch | 83 +++++++++++++++++++++
>   recipes-core/matrix/matrix-gui_2.0.bbappend        | 12 ++-
>   recipes-core/matrix/refresh-screen_2.0.bbappend    |  4 +
>   .../packagegroup-arago-test-addons.bbappend        |  6 +-
>   ...agegroup-arago-tisdk-addons-sdk-target.bbappend | 10 ++-
>   .../packagegroup-arago-tisdk-addons.bbappend       | 10 ++-
>   ...agegroup-arago-tisdk-graphics-sdk-host.bbappend |  4 +-
>   ...egroup-arago-tisdk-graphics-sdk-target.bbappend |  5 +-
>   .../packagegroup-arago-tisdk-graphics.bbappend     | 21 +++---
>   .../packagegroup-arago-tisdk-hmi-sdk-host.bb       | 10 +--
>   .../packagegroups/packagegroup-arago-tisdk-hmi.bb  | 10 +--
>   .../packagegroup-arago-tisdk-matrix.bbappend       | 52 +++++++++++--
>   ...egroup-arago-tisdk-multimedia-sdk-host.bbappend | 24 +++++-
>   ...roup-arago-tisdk-multimedia-sdk-target.bbappend | 21 ++++++
>   .../packagegroup-arago-tisdk-multimedia.bbappend   | 24 ++++--
>   .../img-pvr-sdk/img-pvr-sdk_3.3.2.bbappend         | 19 +++++
>   .../libgles/ti-xsgx-ddk-um_1.15.4564147.bb         | 86 ++++++++++++++++++++++
>   recipes-qt/examples/qtwebbrowser_1.0.bbappend      |  4 +
>   recipes-qt/qt5/nativesdk-qtbase_git.bbappend       |  2 +
>   recipes-qt/qt5/qt3d_git.bbappend                   |  2 +
>   recipes-qt/qt5/qt5-creator_3.5.1.bbappend          |  2 +
>   recipes-qt/qt5/qt5-path-hack.inc                   |  2 +
>   .../qt5/qt5-plugin-generic-vboxtouch_git.bbappend  |  2 +
>   recipes-qt/qt5/qtbase-conf/qt_env_xsgx.sh          |  6 ++
>   recipes-qt/qt5/qtbase-conf_1.0.bbappend            |  9 ++-
>   recipes-qt/qt5/qtbase_%.bbappend                   | 21 +++++-
>   recipes-qt/qt5/qtcanvas3d_git.bbappend             |  2 +
>   recipes-qt/qt5/qtcharts_git.bbappend               |  2 +
>   recipes-qt/qt5/qtconnectivity_git.bbappend         |  2 +
>   recipes-qt/qt5/qtdatavis3d_git.bbappend            |  2 +
>   recipes-qt/qt5/qtdeclarative-render2d_git.bbappend |  2 +
>   recipes-qt/qt5/qtdeclarative_git.bbappend          |  2 +
>   recipes-qt/qt5/qtenginio_git.bbappend              |  2 +
>   recipes-qt/qt5/qtgraphicaleffects_git.bbappend     |  2 +
>   recipes-qt/qt5/qtimageformats_git.bbappend         |  2 +
>   recipes-qt/qt5/qtlocation_git.bbappend             |  2 +
>   recipes-qt/qt5/qtmultimedia_git.bbappend           |  2 +
>   recipes-qt/qt5/qtquick1_git.bbappend               |  2 +
>   recipes-qt/qt5/qtquickcontrols2_git.bbappend       |  2 +
>   recipes-qt/qt5/qtquickcontrols_git.bbappend        |  2 +
>   recipes-qt/qt5/qtscript_git.bbappend               |  2 +
>   recipes-qt/qt5/qtsensors_git.bbappend              |  2 +
>   recipes-qt/qt5/qtserialbus_git.bbappend            |  2 +
>   recipes-qt/qt5/qtserialport_git.bbappend           |  2 +
>   recipes-qt/qt5/qtsvg_git.bbappend                  |  2 +
>   recipes-qt/qt5/qtsystems_git.bbappend              |  2 +
>   recipes-qt/qt5/qttools_git.bbappend                |  2 +
>   recipes-qt/qt5/qttranslations_git.bbappend         |  2 +
>   recipes-qt/qt5/qtvirtualkeyboard_git.bbappend      |  2 +
>   recipes-qt/qt5/qtwayland-native_git.bbappend       |  2 +
>   recipes-qt/qt5/qtwayland_git.bbappend              |  2 +
>   recipes-qt/qt5/qtwebchannel_git.bbappend           |  2 +
>   recipes-qt/qt5/qtwebengine_git.bbappend            |  2 +
>   recipes-qt/qt5/qtwebkit-examples_git.bbappend      |  2 +
>   recipes-qt/qt5/qtwebkit_git.bbappend               |  2 +
>   recipes-qt/qt5/qtwebsockets_git.bbappend           |  2 +
>   recipes-qt/qt5/qtx11extras_git.bbappend            |  2 +
>   recipes-qt/qt5/qtxmlpatterns_git.bbappend          |  2 +
>   .../ti-tisdk-makefile/Makefile_ti-xsgx-ddk-km      | 25 +++++++
>   .../ti-tisdk-makefile_1.0.bbappend                 | 31 +++++---
>   68 files changed, 600 insertions(+), 68 deletions(-)
>   create mode 100644 recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb
>   create mode 100644 recipes-core/matrix/matrix-gui-3d-demos_2.0.bbappend
>   create mode 100644 recipes-core/matrix/matrix-gui-browser_2.0.bbappend
>   mode change 100755 => 100644 recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
>   create mode 100755 recipes-core/matrix/matrix-gui/0001-execute_command-X11-Stop-matrix-when-running-a-GUI-d.patch
>   create mode 100644 recipes-core/matrix/refresh-screen_2.0.bbappend
>   create mode 100644 recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bbappend
>   create mode 100644 recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bbappend
>   create mode 100644 recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
>   create mode 100644 recipes-qt/examples/qtwebbrowser_1.0.bbappend
>   create mode 100644 recipes-qt/qt5/nativesdk-qtbase_git.bbappend
>   create mode 100644 recipes-qt/qt5/qt3d_git.bbappend
>   create mode 100644 recipes-qt/qt5/qt5-creator_3.5.1.bbappend
>   create mode 100644 recipes-qt/qt5/qt5-path-hack.inc
>   create mode 100644 recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtbase-conf/qt_env_xsgx.sh
>   mode change 100644 => 100755 recipes-qt/qt5/qtbase_%.bbappend
>   create mode 100644 recipes-qt/qt5/qtcanvas3d_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtcharts_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtconnectivity_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtdatavis3d_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtdeclarative-render2d_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtdeclarative_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtenginio_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtgraphicaleffects_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtimageformats_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtlocation_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtmultimedia_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtquick1_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtquickcontrols2_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtquickcontrols_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtscript_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtsensors_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtserialbus_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtserialport_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtsvg_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtsystems_git.bbappend
>   create mode 100644 recipes-qt/qt5/qttools_git.bbappend
>   create mode 100644 recipes-qt/qt5/qttranslations_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtvirtualkeyboard_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtwayland-native_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtwayland_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtwebchannel_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtwebengine_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtwebkit-examples_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtwebkit_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtwebsockets_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtx11extras_git.bbappend
>   create mode 100644 recipes-qt/qt5/qtxmlpatterns_git.bbappend
>   create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-xsgx-ddk-km
>


