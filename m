Return-Path: <ceh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B3DD852ABD
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2015 12:08:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2BC85Ie006399
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 07:08:05 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BC84U3003002
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 07:08:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 07:08:04 -0500
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BC849j019291;
	Wed, 11 Mar 2015 07:08:04 -0500
Message-ID: <55003024.5050008@ti.com>
Date: Wed, 11 Mar 2015 08:08:04 -0400
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Dmytriyenko, Denys" <denys@ti.com>
References: <B0581B5571079145BA1CD78C126DBDE7322241C4@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE7322241C4@DLEE08.ent.ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] recipes-devtools: New ltp-ddt_1.0.0 recipe
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
X-List-Received-Date: Wed, 11 Mar 2015 12:08:07 -0000
Content-Type: multipart/alternative;
	boundary="------------040105020409010600050202"

--------------040105020409010600050202
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

I sent it to meta-oe yesterday. Feel free to send your newer version to 
meta-oe.
Thanks,
Carlos

On 03/10/2015 11:19 PM, Dmytriyenko, Denys wrote:
>
> Thanks. Mostly good, but I'd like to fix couple more minor things - 
> I'll send a fixed version tomorrow. If you haven't sent it to meta-oe 
> yet, please wait.
>
> -- 
> Denys
>
> On Mar 10, 2015 4:49 PM, "Hernandez, Carlos" <ceh@ti.com> wrote:
>
>     Latest ltp release was recently merge to ltp-ddt and there is a new
>     way to configure and compile ltp-ddt.
>
>     Signed-off-by: Carlos Hernandez <ceh@ti.com>
>     ---
>      .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 84
>     ++++++++++++++++++++++
>      1 file changed, 84 insertions(+)
>      create mode 100644
>     meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
>
>     diff --git
>     a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
>     b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
>     new file mode 100644
>     index 0000000..db66ed4
>     --- /dev/null
>     +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
>     @@ -0,0 +1,84 @@
>     +SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test
>     Project"
>     +HOMEPAGE =
>     "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
>     +SECTION = "console/utils"
>     +LICENSE = "GPLv2"
>     +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 <%20%20>"
>     +
>     +PROVIDES += "ltp"
>     +DEPENDS += "zip-native virtual/kernel alsa-lib"
>     +RDEPENDS_${PN} += "linaro-pm-qa-utils serialcheck"
>     +
>     +inherit autotools module-base kernel-module-split
>     +
>     +PACKAGE_ARCH = "${MACHINE_ARCH}"
>     +
>     +SRCREV = "eef6281052f36f6fe41059eadcf3b4a94f0d85ea"
>     +BRANCH ?= "master"
>     +PR = "r1-arago10+gitr${SRCPV}"
>     +
>     +SRC_URI =
>     "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}
>     \
>     +          "
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +LTPROOT = "/opt/ltp"
>     +
>     +EXTRA_OEMAKE_append = " \
>     +    prefix=${LTPROOT} \
>     +    CROSS_COMPILE=${HOST_PREFIX} \
>     +    SKIP_IDCHECK=1 \
>     +    KERNEL_INC=${STAGING_KERNEL_DIR} \
>     +    KERNEL_USR_INC=${STAGING_INCDIR} \
>     +    ALSA_INCPATH=${STAGING_INCDIR} \
>     +    ALSA_LIBPATH=${STAGING_LIBDIR} \
>     +    PLATFORM=${MACHINE} \
>     +    RANLIB=${RANLIB} \
>     +    KERNEL_PATH=${STAGING_KERNEL_DIR} \
>     +"
>     +
>     +TARGET_CC_ARCH += "${LDFLAGS}"
>     +
>     +FILES_${PN}-dbg += " \
>     +    ${LTPROOT}/.debug \
>     +    ${LTPROOT}/bin/.debug \
>     +    ${LTPROOT}/runtest/.debug \
>     +    ${LTPROOT}/testcases/bin/.debug \
>     +    ${LTPROOT}/testcases/bin/*/bin/.debug \
>     +    ${LTPROOT}/testcases/bin/*/test/.debug \
>     +    ${LTPROOT}/testcases/bin/ddt/.debug \
>     +    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
>     +    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
>     +    ${LTPROOT}/testcases/realtime/*/*/.debug \
>     +"
>     +
>     +FILES_${PN}-staticdev += "${LTPROOT}/lib"
>     +FILES_${PN} += "${LTPROOT}/*"
>     +
>     +KERNEL_MODULES_META_PACKAGE = "${PN}"
>     +
>     +kmoddir = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
>     +
>     +# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode
>     configure call.
>     +# we explicitly force regeneration of that directory and pass
>     configure options.
>     +do_configure_append() {
>     +    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure
>     ${CONFIGUREOPTS})
>     +}
>     +
>     +
>     +do_compile_append () {
>     +    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>     +    oe_runmake KERNEL_CC="${KERNEL_CC}" DESTDIR=${D} modules
>     +}
>     +
>     +do_install() {
>     +    oe_runmake DESTDIR=${D} install
>     +    install -d ${D}${datadir}
>     +    install -d ${D}${kmoddir}
>     +    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
>     +}
>     +
>     +
>     +# do_make_scripts should be a separate task for the lock to work
>     +addtask make_scripts before do_compile
>     +do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>     +do_make_scripts[deptask] = "do_populate_sysroot"
>     -- 
>     1.9.1
>
>     _______________________________________________
>     meta-arago mailing list
>     meta-arago@arago-project.org
>     http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>


--------------040105020409010600050202
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">I sent it to meta-oe yesterday. Feel
      free to send your newer version to meta-oe.<br>
      Thanks,<br>
      Carlos<br>
      <br>
      On 03/10/2015 11:19 PM, Dmytriyenko, Denys wrote:<br>
    </div>
    <blockquote
      cite="mid:B0581B5571079145BA1CD78C126DBDE7322241C4@DLEE08.ent.ti.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p dir="ltr">Thanks. Mostly good, but I'd like to fix couple more
        minor things - I'll send a fixed version tomorrow. If you
        haven't sent it to meta-oe yet, please wait.</p>
      <p dir="ltr">-- <br>
        Denys</p>
      <div class="gmail_quote">On Mar 10, 2015 4:49 PM, "Hernandez,
        Carlos" <a class="moz-txt-link-rfc2396E" href="mailto:ceh@ti.com">&lt;ceh@ti.com&gt;</a> wrote:<br type="attribution">
        <blockquote class="quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div><font size="2"><span style="font-size:10pt"></span></font>
            <div>Latest ltp release was recently merge to ltp-ddt and
              there is a new<br>
              way to configure and compile ltp-ddt.<br>
              <br>
              Signed-off-by: Carlos Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:ceh@ti.com">&lt;ceh@ti.com&gt;</a><br>
              ---<br>
               .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 84
              ++++++++++++++++++++++<br>
               1 file changed, 84 insertions(+)<br>
               create mode 100644
              meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb<br>
              <br>
              diff --git
              a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb<br>
              new file mode 100644<br>
              index 0000000..db66ed4<br>
              --- /dev/null<br>
              +++
              b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb<br>
              @@ -0,0 +1,84 @@<br>
              +SUMMARY = "Embedded Linux Device Driver Tests based on
              Linux Test Project"<br>
              +HOMEPAGE = "<a moz-do-not-send="true"
                href="http://arago-project.org/git/projects/test-automation/ltp-ddt.git">http://arago-project.org/git/projects/test-automation/ltp-ddt.git</a>"<br>
              +SECTION = "console/utils"<br>
              +LICENSE = "GPLv2"<br>
              +LIC_FILES_CHKSUM = "<a moz-do-not-send="true"
                href="%20%20">file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3</a>"<br>
              +<br>
              +PROVIDES += "ltp"<br>
              +DEPENDS += "zip-native virtual/kernel alsa-lib"<br>
              +RDEPENDS_${PN} += "linaro-pm-qa-utils serialcheck"<br>
              +<br>
              +inherit autotools module-base kernel-module-split<br>
              +<br>
              +PACKAGE_ARCH = "${MACHINE_ARCH}"<br>
              +<br>
              +SRCREV = "eef6281052f36f6fe41059eadcf3b4a94f0d85ea"<br>
              +BRANCH ?= "master"<br>
              +PR = "r1-arago10+gitr${SRCPV}"<br>
              +<br>
              +SRC_URI =
              "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}
              \<br>
              +          "<br>
              +<br>
              +S = "${WORKDIR}/git"<br>
              +<br>
              +LTPROOT = "/opt/ltp"<br>
              +<br>
              +EXTRA_OEMAKE_append = " \<br>
              +    prefix=${LTPROOT} \<br>
              +    CROSS_COMPILE=${HOST_PREFIX} \<br>
              +    SKIP_IDCHECK=1 \<br>
              +    KERNEL_INC=${STAGING_KERNEL_DIR} \<br>
              +    KERNEL_USR_INC=${STAGING_INCDIR} \<br>
              +    ALSA_INCPATH=${STAGING_INCDIR} \<br>
              +    ALSA_LIBPATH=${STAGING_LIBDIR} \<br>
              +    PLATFORM=${MACHINE} \<br>
              +    RANLIB=${RANLIB} \<br>
              +    KERNEL_PATH=${STAGING_KERNEL_DIR} \<br>
              +"<br>
              +<br>
              +TARGET_CC_ARCH += "${LDFLAGS}"<br>
              +<br>
              +FILES_${PN}-dbg += " \<br>
              +    ${LTPROOT}/.debug \<br>
              +    ${LTPROOT}/bin/.debug \<br>
              +    ${LTPROOT}/runtest/.debug \<br>
              +    ${LTPROOT}/testcases/bin/.debug \<br>
              +    ${LTPROOT}/testcases/bin/*/bin/.debug \<br>
              +    ${LTPROOT}/testcases/bin/*/test/.debug \<br>
              +    ${LTPROOT}/testcases/bin/ddt/.debug \<br>
              +    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \<br>
              +    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \<br>
              +    ${LTPROOT}/testcases/realtime/*/*/.debug \<br>
              +"<br>
              +<br>
              +FILES_${PN}-staticdev += "${LTPROOT}/lib"<br>
              +FILES_${PN} += "${LTPROOT}/*"<br>
              +<br>
              +KERNEL_MODULES_META_PACKAGE = "${PN}"<br>
              +<br>
              +kmoddir =
              "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"<br>
              +<br>
              +# ltp doesn't regenerate ffsb-6.0-rc2 configure and
              hardcode configure call.<br>
              +# we explicitly force regeneration of that directory and
              pass configure options.<br>
              +do_configure_append() {<br>
              +    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure
              ${CONFIGUREOPTS})<br>
              +}<br>
              +<br>
              +<br>
              +do_compile_append () {<br>
              +    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS<br>
              +    oe_runmake KERNEL_CC="${KERNEL_CC}" DESTDIR=${D}
              modules<br>
              +}<br>
              +<br>
              +do_install() {<br>
              +    oe_runmake DESTDIR=${D} install<br>
              +    install -d ${D}${datadir}<br>
              +    install -d ${D}${kmoddir}<br>
              +    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko
              ${D}${kmoddir}<br>
              +}<br>
              +<br>
              +<br>
              +# do_make_scripts should be a separate task for the lock
              to work<br>
              +addtask make_scripts before do_compile<br>
              +do_make_scripts[lockfiles] =
              "${TMPDIR}/kernel-scripts.lock"<br>
              +do_make_scripts[deptask] = "do_populate_sysroot"<br>
              -- <br>
              1.9.1<br>
              <br>
              _______________________________________________<br>
              meta-arago mailing list<br>
              <a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a><br>
              <a moz-do-not-send="true"
                href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------040105020409010600050202--
