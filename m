Return-Path: <meta-arago@emagii.com>
Received: from mxf4.bahnhof.se (mxf4.bahnhof.se [213.80.101.28])
	by arago-project.org (Postfix) with ESMTP id C2A8F52099
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 11:09:05 +0000 (UTC)
Received: from localhost (mxf4.local [127.0.0.1])
	by mxf4-reinject (Postfix) with ESMTP id B5EE28170FB
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 12:09:04 +0100 (CET)
X-Virus-Scanned: by amavisd-new using ClamAV at bahnhof.se (MXF2)
X-Spam-Score: 0
X-Spam-Level: 
X-Spam-Status: No, score=0 tagged_above=-99 required=5 tests=[none]
Received: from mxf4.bahnhof.se ([127.0.0.1])
	by localhost (mxf4.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxdjQD4nddiy for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 12:09:02 +0100 (CET)
Received: from smtp-auth3.bahnhof.se (smtp-auth.bahnhof.se [213.136.33.6])
	by mxf4.bahnhof.se (Postfix) with ESMTP id 83D688170D7
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 12:09:02 +0100 (CET)
Received: from [10.175.196.199] (h-169-18.a454.priv.bahnhof.se [37.123.169.18])
	(Authenticated sender: mb782575)
	by smtp-auth3.bahnhof.se (Postfix) with ESMTPA id 112BF28703
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 12:09:01 +0100 (CET)
Message-ID: <55080B4D.7080409@emagii.com>
Date: Tue, 17 Mar 2015 12:09:01 +0100
From: Ulf Samuelsson <meta-arago@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: meta-arago@arago-project.org
References: <20150311180729.GA23587@edge>
	<8665E2433BC68541A24DFFCA87B70F5B23636F88@DFRE01.ent.ti.com>
In-Reply-To: <8665E2433BC68541A24DFFCA87B70F5B23636F88@DFRE01.ent.ti.com>
Subject: Re: gitorious.org status
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
X-List-Received-Date: Tue, 17 Mar 2015 11:09:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Den 2015-03-12 08:57, Reizer, Eyal skrev:
> Hi Denys,
>
> The uim code base has been moved to the following internal git:
> https://git.ti.com/ti-bt/uim
>
> Next, we need to update the uim_git.bb recipe to point to the new location, and remove the patching that was done inside the recipe as the new git is updated with it.
>
> Best Regards,
> Eyal
Any news on this?
The build log is really not reflecting the situation, if you cannot 
check out the git repos.

BR
Ulf Samuelsson


>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
>> Sent: Wednesday, March 11, 2015 8:07 PM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] gitorious.org status
>>
>> So, it appears gitorious.org has disabled "git" access across the board,
>> probably to enforce read-only state and prevent people from updating their
>> repos further, forcing them to migrate to gitlab...
>>
>> There are patches for meta-qt5 to switch SRC_URIs to code.qt.io - that will
>> take care of Qt5 recipes, once commited to meta-qt5/master, which we track.
>>
>> We would need to take care of our own repositories (qt-apps, matrix, uim,
>> etc.) and decide where to move them over to. Franklin, most of those repos
>> are owned by you or your tem. What are your plans?
>>
>> meta-arago-extras/recipes-connectivity/uim/uim_git.bb:SRC_URI =
>> "git://gitorious.org/uim/uim.git \ meta-arago-extras/recipes-qt/qt-apps/image-
>> gallery_git.bb:HOMEPAGE = "https://gitorious.org/image-gallery"
>> meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb:SRC_URI =
>> "git://gitorious.org/image-gallery/image-
>> gallery.git;protocol=git;branch=${BRANCH}"
>> meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb:HOMEPAGE =
>> "https://gitorious.org/thermostat-demo"
>> meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb:
>> git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
>> meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb:SRC_URI =
>> "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=git;branch=${BRANCH
>> }"
>> meta-arago-extras/recipes-core/oprofile-example/oprofile-
>> example_git.bb:HOMEPAGE = "https://gitorious.org/oprofile-example"
>> meta-arago-extras/recipes-core/oprofile-example/oprofile-
>> example_git.bb:SRC_URI = "git://gitorious.org/oprofile-example/oprofile-
>> example.git;protocol=git;branch=${BRANCH}"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-
>> browser_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-
>> v2/matrix_browser"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb:SRC_URI =
>> "git://gitorious.org/matrix-gui-
>> v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb:HOMEPAGE
>> = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-
>> submenus_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-
>> gui-v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-generic-
>> pm_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-
>> apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-settings-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc:SRC_URI =
>> "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-
>> apps.git;protocol=git;branch=${BRANCH}"
>> meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb:HOMEPAGE =
>> "https://gitorious.org/matrix-gui-v2/refresh-screen"
>> meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb:SRC_URI =
>> "git://gitorious.org/matrix-gui-v2/refresh-
>> screen.git;protocol=git;branch=${BRANCH}"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-pru-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-3d-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
>> images_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-helper-
>> scripts.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-
>> apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb:SRC_URI =
>> "git://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2.git;protocol=git;branch=${BRANCH} \ meta-arago-extras/recipes-
>> core/matrix/matrix-gui-wifi-demos_2.0.bb:HOMEPAGE =
>> "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-display-
>> control_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-usb-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-camera-
>> loopback_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-
>> gui-v2-apps"
>> meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-
>> demos_2.0.bb:HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-
>> v2-apps"
>> meta-arago-extras/recipes-
>> graphics/screenshot/screenshot_1.0.bb:HOMEPAGE =
>> "https://gitorious.org/screenshot"
>> meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb:SRC_URI
>> =
>> "git://gitorious.org/screenshot/screenshot.git;protocol=git;branch=${BRANCH
>> }"
>> meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-
>> benchmarks_1.3.bb:SRC_URI =
>> "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=git;branc
>> h=${BRANCH}"
>> meta-arago-extras/recipes-multimedia/av-examples/av-
>> examples_1.0.bb:SRC_URI =
>> "git://gitorious.org/av_examples/av_examples.git;protocol=git;branch=${BRA
>> NCH}"
>> meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
>> demo_1.0.bb:HOMEPAGE = "https://gitorious.org/dual-camera-demo/"
>> meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
>> demo_1.0.bb:SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-
>> demo.git;protocol=git;branch=${BRANCH} \
>>
>> --
>> Denys
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


