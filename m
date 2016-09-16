Return-Path: <g-tammana@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id C3DE252007
	for <meta-arago@arago-project.org>;
	Fri, 16 Sep 2016 22:30:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8GMUidw011281
	for <meta-arago@arago-project.org>; Fri, 16 Sep 2016 17:30:44 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8GMUid9030524
	for <meta-arago@arago-project.org>; Fri, 16 Sep 2016 17:30:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Sep 2016 17:30:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8GMUhr1002083;
	Fri, 16 Sep 2016 17:30:43 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: meta-arago <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
In-Reply-To: <1474063608-3969-1-git-send-email-g-tammana@ti.com>
References: <1474063608-3969-1-git-send-email-g-tammana@ti.com>
Date: Fri, 16 Sep 2016 17:30:43 -0500
Message-ID: <1474064645-sup-5253@uda0271916>
User-Agent: Sup/git
MIME-Version: 1.0
Subject: Re: [PATCH] ti-gc320-tests: add recipe for gc320 tests
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
X-List-Received-Date: Fri, 16 Sep 2016 22:30:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

I used the `meta-arago-extras/recipes-graphics` path as placeholder for the
2d sample unit-tests as it is hosting all graphics related tests. Let me know
if that is not the appropriate place.

Thanks,
Gowtham

Excerpts from Gowtham Tammana's message of 2016-09-16 17:06:48 -0500:
> Samples tests for GC320 chipset in TI SoCs.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb     | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> 
> diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> new file mode 100644
> index 0000000..ef0b6c0
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "Test application for GC320 2D API"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=22a001855467f373c47f45de5330e3c9"
> +
> +DEPENDS = "ti-gc320-libs"
> +
> +BRANCH = "ti-${PV}"
> +
> +SRC_URI = "git://git.ti.com/graphics/ti-gc320-test.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "d8df0699308179b20d4a0ce69972db92eca914af"
> +PR = "r1"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE += "AQROOT=${S}/tests/src -f makefile.linux TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH} CPU_TYPE=cortex-a15 VIVANTE_SDK_INC=${S}/sdk/include VIVANTE_SDK_LIB=${STAGING_DIR_TARGET}/usr/lib DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} LIBDIR=${libdir} SDK_DIR=${S}/build/tests/ EGL_API_FB=1"
> +
> +do_install() {
> +    cd ${S}/tests/src/test/hal/common/UnitTest
> +    oe_runmake install
> +    cd ${S}/tests/src/test/hal/common/UnitTest/galRunTest2
> +    oe_runmake install
> +
> +    install -d ${D}${bindir}/GC320/tests/unit_test/
> +
> +    for file in ${S}/build/tests/samples/hal/unit_test/*; do
> +        install -m 755 $file ${D}${bindir}/GC320/tests/unit_test/
> +    done
> +}
> +
> +INSANE_SKIP_${PN} += "ldflags"

