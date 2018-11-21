Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 6F0B552977
	for <meta-arago@arago-project.org>;
	Wed, 21 Nov 2018 18:57:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wALIv1ou004857
	for <meta-arago@arago-project.org>; Wed, 21 Nov 2018 12:57:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542826621;
	bh=w0e2x941HILvMVKXm/Wyb7v+7USJYbLlKInRN9J4te8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=k99SniSQAB3mrcb65gcw4HzWlSd1Sw1BNOxJBhiHlGWQ/uRfHRyYJD4yaCu77Ovd7
	2OfKT1jZTbUayaCdMKjVimuiSMQfA0NgbOvf204tCHo0u9ptHYqlqMWB6axMnR+W4f
	bCljllftu9yP2vh33k8s2nDrDeRWJa6Kz0CGvZb0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wALIv15E019150
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Nov 2018 12:57:01 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 21 Nov 2018 12:57:00 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 21 Nov 2018 12:57:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wALIv0Kn021771;
	Wed, 21 Nov 2018 12:57:00 -0600
Date: Wed, 21 Nov 2018 13:57:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Su, Qin" <qsu@ti.com>
Message-ID: <20181121185700.GB21933@beryl>
References: <1542397342-28389-1-git-send-email-qsu@ti.com>
	<20181119201855.GB2540@beryl>
	<17152a7a53f84571acb35c0d423ace8c@ti.com>
MIME-Version: 1.0
In-Reply-To: <17152a7a53f84571acb35c0d423ace8c@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arm-compute-library: bump SRCREV and add benchmark test group.
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
X-List-Received-Date: Wed, 21 Nov 2018 18:57:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 21, 2018 at 01:55:05PM -0500, Su, Qin wrote:
> 
> 
> >-----Original Message-----
> >From: Dmytriyenko, Denys
> >Sent: Monday, November 19, 2018 3:19 PM
> >To: Su, Qin
> >Cc: meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [PATCH] arm-compute-library: bump SRCREV and
> >add benchmark test group.
> >
> >On Fri, Nov 16, 2018 at 02:42:22PM -0500, Qin Su wrote:
> >> updated to the latest version of 18.08 updated to generate versioned
> >> library added benchmark preset group for squeezenet and inceptionnet
> >
> >Upstream-Status is missing for all the new pathces.
> >
> >Also see below.
> 
> Fixed in patch v2
> 
> >
> >> Signed-off-by: Qin Su <qsu@ti.com>
> >> ---
> >>  .../0001-add-ti-benchmark-test-group.patch         | 62
> >+++++++++++++++++++
> >>  .../0002-add-ti-benchmark-test-group.patch         | 72
> >++++++++++++++++++++++
> >>  .../0003-add-ti-benchmark-test-group.patch         | 40 ++++++++++++
> >>  .../0004-add-ti-benchmark-test-group.patch         | 47 ++++++++++++++
> >>  .../0005-add-ti-benchmark-test-group.patch         | 44 +++++++++++++
> >>  .../0006-add-ti-benchmark-test-group.patch         | 42 +++++++++++++
> >>  .../0007-add-ti-benchmark-test-group.patch         | 42 +++++++++++++
> >>  .../0008-add-ti-benchmark-test-group.patch         | 29 +++++++++
> >>  .../0009-add-ti-benchmark-test-group.patch         | 42 +++++++++++++
> >>  .../0010-add-ti-benchmark-test-group.patch         | 48 +++++++++++++++
> >>  .../0011-add-ti-benchmark-test-group.patch         | 35 +++++++++++
> >>  .../arm-compute-library/arm-compute-library_git.bb | 32 ++++++----
> >>  12 files changed, 524 insertions(+), 11 deletions(-)
> >
> >[snip]
> >
> >> diff --git
> >> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> >> brary_git.bb
> >> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> >> brary_git.bb
> >> index 8a65ade..fc038f9 100644
> >> ---
> >> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> >> brary_git.bb
> >> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-
> >comput
> >> +++ e-library_git.bb
> >> @@ -1,18 +1,30 @@
> >>  SUMMARY = "The ARM Computer Vision and Machine Learning library"
> >>  DESCRIPTION = "The ARM Computer Vision and Machine Learning library is
> >a set of functions optimised for both ARM CPUs and GPUs."
> >>  LICENSE = "MIT"
> >> -LIC_FILES_CHKSUM =
> >"file://LICENSE;md5=e2c93841b20cd522af621cabaea3aef8"
> >> +LIC_FILES_CHKSUM =
> >"file://LICENSE;md5=762a7ba8d2ddc3b38d88742fbaf0b62d"
> >
> >Please explain license change.
> 
> The Copyright was updated from 2017 to 2017-2018 in LICENSE file.

In the commit log, please.


> >> -COMPATIBLE_MACHINE = "armv7a"
> >> +COMPATIBLE_MACHINE = "armv7a|aarch64"
> >>
> >>  SRC_URI = " \
> >>      git://github.com/ARM-software/ComputeLibrary.git;branch=${BRANCH}
> >> \
> >> +    file://0001-add-ti-benchmark-test-group.patch \
> >> +    file://0002-add-ti-benchmark-test-group.patch \
> >> +    file://0003-add-ti-benchmark-test-group.patch \
> >> +    file://0004-add-ti-benchmark-test-group.patch \
> >> +    file://0005-add-ti-benchmark-test-group.patch \
> >> +    file://0006-add-ti-benchmark-test-group.patch \
> >> +    file://0007-add-ti-benchmark-test-group.patch \
> >> +    file://0008-add-ti-benchmark-test-group.patch \
> >> +    file://0009-add-ti-benchmark-test-group.patch \
> >> +    file://0010-add-ti-benchmark-test-group.patch \
> >> +    file://0011-add-ti-benchmark-test-group.patch \
> >>  "
> >>
> >> -PV  = "18.05"
> >> +PV  = "18.08"
> >> +PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
> >>
> >>  BRANCH = "master"
> >> -SRCREV = "e2542c9f35ca427286822cd0c9296f49914f78b0"
> >> +SRCREV = "52ba29e936b8e711e8acdfe819e36f884d4f3fe1"
> >>
> >>  S = "${WORKDIR}/git"
> >>
> >> @@ -22,7 +34,8 @@ do_compile_prepend() {
> >>
> >>  inherit scons
> >>
> >> -EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC"
> >benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0"
> >> +EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC"
> >benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0
> >set_soname=1"
> >> +EXTRA_OESCONS_aarch64 = "arch=arm64-v8a extra_cxx_flags="-fPIC"
> >benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0
> >set_soname=1"
> >>
> >>  LIBS += "-larmpl_lp64_mp"
> >>
> >> @@ -30,7 +43,7 @@ do_install() {
> >>      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >>
> >>      install -m 0755 -d ${D}${libdir}
> >> -    for lib in ${S}/build/*.so
> >> +    for lib in ${WORKDIR}/git/build/*.so*
> >
> >Why this change?
> >
> 
> Unnecessary change, revised back in patch v2
> 
> >
> >>      do
> >>          install -m 0755 $lib ${D}${libdir}
> >>      done
> >> @@ -45,14 +58,11 @@ do_install() {
> >>      cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}  }
> >>
> >> -SOLIBS = ".so"
> >> -FILES_SOLIBSDEV = ""
> >> -INSANE_SKIP_${PN} = "ldflags"
> >> +INSANE_SKIP_${PN} = "ldflags dev-so"
> >
> >Since you now have "versioned library", you don't need to force *.so into the
> >main package.
> >
> 
> Fixed in patch v2
> 
> >
> >>  INSANE_SKIP_${PN}-dev = "dev-elf ldflags"
> >>
> >> -PACKAGES =+ "${PN}-source"
> >>  FILES_${PN} += "${bindir}/*"
> >> -FILES_${PN} += "${libdir}/*.so"
> >> +FILES_${PN} += "${libdir}/*.so*"
> >>  FILES_${PN}-source = "${datadir}/${BPN}"
> >>  INSANE_SKIP_${PN}-source = "ldflags libdir staticdev"
> >>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >> --
> >> 1.9.1
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

