Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 50DDD52987
	for <meta-arago@arago-project.org>;
	Mon, 18 May 2015 17:27:35 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOK00ITK3592ZN0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 18 May 2015 12:27:10 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Ap5ZB14n c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8 a=9c4GchTaAAAA:8	a=D3BNXdTDAAAA:8
	a=cwsjouV1xUdBfSdkvh0A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F1E6120076;	Mon,
	18 May 2015 13:27:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 18 May 2015 13:27:06 -0400
Message-id: <1431970028-25239-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/3] gcc: overlay remaining gcc 4.7 pieces, will need to fix nativesdk deps
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
X-List-Received-Date: Mon, 18 May 2015 17:27:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/gcc/gcc-cross-initial.inc     |  81 +++++++++
 .../recipes-devtools/gcc/gcc-cross-initial_4.7.bb  |   2 +
 .../recipes-devtools/gcc/gcc-cross.inc             | 185 +++++++++++++++++++++
 .../recipes-devtools/gcc/gcc-cross_4.7.bb          |   3 +
 .../recipes-devtools/gcc/gcc-crosssdk-initial.inc  |   8 +
 .../gcc/gcc-crosssdk-initial_4.7.bb                |   3 +
 .../recipes-devtools/gcc/gcc-crosssdk.inc          |  10 ++
 .../recipes-devtools/gcc/gcc-crosssdk_4.7.bb       |   2 +
 .../recipes-devtools/gcc/gcc-runtime.inc           | 166 ++++++++++++++++++
 .../recipes-devtools/gcc/gcc-runtime_4.7.bb        |   3 +
 meta-arago-distro/recipes-devtools/gcc/libgcc.inc  | 143 ++++++++++++++++
 .../recipes-devtools/gcc/libgcc_4.7.bb             |   3 +
 12 files changed, 609 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-cross-initial.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-cross-initial_4.7.bb
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-cross.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-cross_4.7.bb
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk-initial.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bb
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk_4.7.bb
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-runtime.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-runtime_4.7.bb
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/libgcc.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/libgcc_4.7.bb

diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-cross-initial.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-cross-initial.inc
new file mode 100644
index 0000000..8184538
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -0,0 +1,81 @@
+DEPENDS = "virtual/${TARGET_PREFIX}binutils ${NATIVEDEPS}"
+PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial"
+PACKAGES = ""
+
+INHIBIT_AUTOTOOLS_DEPS = "1"
+INHIBIT_DEFAULT_DEPS = "1"
+
+CROSS_TARGET_SYS_DIR_append = ".${PN}"
+
+# This is intended to be a -very- basic config
+# sysroot is needed in case we use libc-initial
+EXTRA_OECONF = "--with-newlib \
+		--without-headers \
+		--disable-shared \
+		--disable-threads \
+		--disable-multilib \
+		--disable-__cxa_atexit \
+		--enable-languages=c \
+                ${OPTSPACE} \
+		--program-prefix=${TARGET_PREFIX} \
+		--with-sysroot=${STAGING_DIR_TARGET} \
+		--with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
+		${EXTRA_OECONF_INITIAL} \
+		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
+		${EXTRA_OECONF_FPU}"
+
+EXTRA_OECONF += " --with-native-system-header-dir=${SYSTEMHEADERS} "
+
+GCCCROSS_BUILDSYSROOT = "${B}/tmpsysroot"
+
+do_configure_prepend () {
+	sysr=${GCCCROSS_BUILDSYSROOT}${target_includedir}
+	mkdir -p $sysr
+	for t in linux asm asm-generic; do
+		rm -f $sysr/$t
+		ln -s ${STAGING_DIR_TARGET}${target_includedir}/$t $sysr/
+	done
+}
+
+do_compile () {
+    oe_runmake all-gcc all-target-libgcc
+}
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install-gcc install-target-libgcc
+
+	# We don't really need this (here shares/ contains man/, info/, locale/).
+	rm -rf ${D}${datadir}/
+
+	# We use libiberty from binutils
+	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
+	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
+
+	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
+	# found. These need to be relative paths so they work in different locations.
+	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
+	install -d $dest
+	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
+	done
+	# fixed limits.h infact includes the so called real limits.h
+	# which should come from libc but when we build libc-initial
+	# then bunch of configure tests include fixed limits.h which in turn
+	# includes real limits.h but this real limits.h is not staged yet
+	# so we overwirte the generated include-fixed/limits.h for gcc-cross-initial
+	# to get rid references to real limits.h
+	cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed/limits.h
+}
+#
+# Override the default sysroot staging copy since this won't look like a target system
+#
+sysroot_stage_all() {
+	sysroot_stage_dir ${D} ${SYSROOT_DESTDIR}
+	install -d ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}/
+	install -d ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/
+	mv ${SYSROOT_DESTDIR}${target_base_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}/ || true
+	mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/ || true
+}
+
+do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST}/ ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}/"
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST}/ ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}/"
+
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-cross-initial_4.7.bb b/meta-arago-distro/recipes-devtools/gcc/gcc-cross-initial_4.7.bb
new file mode 100644
index 0000000..4c73e5c
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-cross-initial_4.7.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-cross_${PV}.bb
+require gcc-cross-initial.inc
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-cross.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-cross.inc
new file mode 100644
index 0000000..25a3142
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-cross.inc
@@ -0,0 +1,185 @@
+inherit cross
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXTRADEPENDS = ""
+DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${EXTRADEPENDS} ${NATIVEDEPS}"
+PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+python () {
+    if d.getVar("TARGET_OS", True).startswith("linux"):
+        d.setVar("EXTRADEPENDS", "linux-libc-headers")
+}
+
+require gcc-configure-common.inc
+
+EXTRA_OECONF += " --enable-poison-system-directories"
+EXTRA_OECONF_append_sh4 = " --with-multilib-list= --enable-incomplete-targets "
+
+EXTRA_OECONF += "--disable-libunwind-exceptions \
+                 --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
+                 --with-system-zlib "
+
+EXTRA_OECONF_PATHS = " \
+                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
+                      --with-sysroot=${STAGING_DIR_TARGET} \
+                      --with-build-sysroot=${STAGING_DIR_TARGET}"
+
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
+
+do_configure_prepend () {
+	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure
+}
+
+do_compile () {
+	export CC="${BUILD_CC}"
+	export AR_FOR_TARGET="${TARGET_SYS}-ar"
+	export RANLIB_FOR_TARGET="${TARGET_SYS}-ranlib"
+	export LD_FOR_TARGET="${TARGET_SYS}-ld"
+	export NM_FOR_TARGET="${TARGET_SYS}-nm"
+	export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc ${TARGET_CC_ARCH}"
+	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
+	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
+	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
+
+	oe_runmake all-host all-target-libgcc
+	# now generate script to drive testing
+	echo "#!/usr/bin/env sh" >${B}/${TARGET_PREFIX}testgcc
+	set >> ${B}/${TARGET_PREFIX}testgcc
+	# prune out the unneeded vars
+	sed -i -e "/^BASH/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^USER/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^OPT/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^DIRSTACK/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^EUID/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^FUNCNAME/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^GROUPS/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^HOST/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^HOME/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^IFS/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^LC_ALL/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^LOGNAME/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^MACHTYPE/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^OSTYPE/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PIPE/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^SHELL/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^'/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^UID/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^TERM/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PATCH_GET/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PKG_/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^POSIXLY_/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PPID/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PS4/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^Q/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^SHLVL/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^STAGING/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^LD_LIBRARY_PATH/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PSEUDO/d" ${B}/${TARGET_PREFIX}testgcc
+
+	# append execution part of the script
+cat >> ${B}/${TARGET_PREFIX}testgcc << STOP
+target="\$1"
+usage () {
+	echo "Usage:"
+	echo "\$0 user@target 'extra options to dejagnu'"
+	echo "\$0 target 'extra options to dejagnu'"
+	echo "\$0 target"
+	echo "e.g. \$0 192.168.7.2 ' dg.exp=visibility-d.c'"
+	echo "will only run visibility-d.c test case"
+	echo "e.g. \$0 192.168.7.2 '/-mthumb dg.exp=visibility-d.c'"
+	echo "will only run visibility-d.c test case in thumb mode"
+	echo "You need to have dejagnu autogen expect installed"
+	echo "on the build host"
+    }
+if [ "x\$target" = "x" ]
+then
+	echo "Please specify the target machine and remote user in form of user@target\n"
+	usage
+	exit 1;
+fi
+
+shift
+
+echo "\$target" | grep "@" 2>&1 > /dev/null
+if [ "x\$?" = "x0" ]
+then
+   user=\$(echo \$target | cut -d '@' -f 1)
+   target=\$(echo \$target | cut -d '@' -f 2)
+else
+   user=\$USER
+fi
+ssh \$user@\$target date 2>&1 > /dev/null
+if [ "x\$?" != "x0" ]
+then
+	echo "Failed connecting to \$user@\$target it could be because"
+	echo "you don't have passwordless ssh setup to access \$target"
+	echo "or sometimes host key has been changed"
+	echo "in such case do something like below on build host"
+	echo "ssh-keygen -f "~/.ssh/known_hosts" -R \$target"
+	echo "and then try ssh \$user@\$target"
+
+	usage
+	exit 1
+fi
+	echo "lappend boards_dir [pwd]/../../.." > ${B}/site.exp
+	echo "load_generic_config \"unix\"" > ${B}/${PACKAGE_ARCH}.exp
+	echo "set_board_info username \$user" >> ${B}/${PACKAGE_ARCH}.exp
+	echo "set_board_info rsh_prog ssh" >> ${B}/${PACKAGE_ARCH}.exp
+	echo "set_board_info rcp_prog scp" >> ${B}/${PACKAGE_ARCH}.exp
+	echo "set_board_info hostname \$target" >> ${B}/${PACKAGE_ARCH}.exp
+	DEJAGNU=${B}/site.exp make -k check RUNTESTFLAGS="--target_board=${PACKAGE_ARCH}\$@"
+
+STOP
+
+	chmod +x ${B}/${TARGET_PREFIX}testgcc
+
+}
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+# Compute how to get from libexecdir to bindir in python (easier than shell)
+BINRELPATH = "${@oe.path.relative(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}"))}"
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install-host
+
+	install -d ${D}${target_base_libdir}
+	install -d ${D}${target_libdir}
+    
+	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
+	# gfortran is fully backwards compatible. This is a safe and practical solution. 
+	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
+
+	
+	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
+	# found. These need to be relative paths so they work in different locations.
+	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
+	install -d $dest
+	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
+		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
+	done
+
+	# Remove things we don't need but keep share/java
+	for d in info man share/doc share/locale share/man share/info; do
+		rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/$d
+	done
+
+	# We use libiberty from binutils
+	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
+	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
+
+	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
+	case ${PN} in
+		*gcc-cross|*gcc-crosssdk)
+			dest=${D}/${includedir}/gcc-build-internal-${MULTIMACH_TARGET_SYS}
+			cp -fpPR . $dest
+		;;
+	esac
+}
+
+do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
+do_package_write_deb[noexec] = "1"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-cross_4.7.bb b/meta-arago-distro/recipes-devtools/gcc/gcc-cross_4.7.bb
new file mode 100644
index 0000000..b43cca0
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-cross_4.7.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-cross.inc
+
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk-initial.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk-initial.inc
new file mode 100644
index 0000000..c6f74a6
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk-initial.inc
@@ -0,0 +1,8 @@
+inherit crosssdk
+
+SYSTEMHEADERS = "${SDKPATHNATIVE}${prefix_nativesdk}/include"
+SYSTEMLIBS = "${SDKPATHNATIVE}${base_libdir_nativesdk}/"
+SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
+
+DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk gettext-native ${NATIVEDEPS}"
+PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial-crosssdk"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bb b/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bb
new file mode 100644
index 0000000..fd90e11
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-cross-initial_${PV}.bb
+require gcc-crosssdk-initial.inc
+
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk.inc
new file mode 100644
index 0000000..5fe0b94
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -0,0 +1,10 @@
+inherit crosssdk
+
+SYSTEMHEADERS = "${SDKPATHNATIVE}${prefix_nativesdk}/include"
+SYSTEMLIBS = "${SDKPATHNATIVE}${base_libdir_nativesdk}/"
+SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
+
+GCCMULTILIB = "--disable-multilib"
+
+DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/nativesdk-${TARGET_PREFIX}libc-for-gcc gettext-native ${NATIVEDEPS}"
+PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk_4.7.bb b/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk_4.7.bb
new file mode 100644
index 0000000..40a6c4f
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk_4.7.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-cross_${PV}.bb
+require gcc-crosssdk.inc
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-runtime.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-runtime.inc
new file mode 100644
index 0000000..2599760
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-runtime.inc
@@ -0,0 +1,166 @@
+require gcc-configure-common.inc
+
+CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
+
+EXTRA_OECONF_PATHS = " \
+    --with-gxx-include-dir=${includedir}/c++/ \
+    --with-sysroot=${STAGING_DIR_TARGET} \
+    --with-build-sysroot=${STAGING_DIR_TARGET}"
+
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
+
+EXTRA_OECONF += "--disable-libunwind-exceptions"
+EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
+
+RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
+#  ?
+# libiberty
+# libmudflap
+# libgfortran
+
+do_configure () {
+	export CXX="${CXX} -nostdinc++ -nostdlib++"
+	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/* ${B}
+	for d in libgcc ${RUNTIMETARGET}; do
+		echo "Configuring $d"
+		rm -rf ${B}/$target/$d/
+		mkdir -p ${B}/$target/$d/
+		cd ${B}/$target/$d/
+		chmod a+x ${S}/$d/configure
+		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+	done
+}
+
+do_compile () {
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	for d in libgcc ${RUNTIMETARGET}; do
+		cd ${B}/$target/$d/
+		oe_runmake MULTIBUILDTOP=${B}/$target/$d/
+	done
+}
+
+do_install () {
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	for d in ${RUNTIMETARGET}; do
+		cd ${B}/$target/$d/
+		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
+	done
+	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
+	rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
+	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
+		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
+	fi
+	if [ -d ${D}${infodir} ]; then
+		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
+	fi
+	chown -R root:root ${D}
+}
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ libgcc"
+PROVIDES = "virtual/${TARGET_PREFIX}compilerlibs"
+
+BBCLASSEXTEND = "nativesdk"
+
+PACKAGES = "\
+  ${PN}-dbg \
+  libstdc++ \
+  libstdc++-precompile-dev \
+  libstdc++-dev \
+  libstdc++-staticdev \
+  libg2c \
+  libg2c-dev \
+  libssp \
+  libssp-dev \
+  libssp-staticdev \
+  libgfortran \
+  libgfortran-dev \
+  libgfortran-staticdev \
+  libmudflap \
+  libmudflap-dev \
+  libmudflap-staticdev \
+  libquadmath \
+  libquadmath-dev \
+  libquadmath-staticdev \
+  libgomp \
+  libgomp-dev \
+  libgomp-staticdev \
+"
+# The base package doesn't exist, so we clear the recommends.
+RRECOMMENDS_${PN}-dbg = ""
+
+# include python debugging scripts
+FILES_${PN}-dbg += "\
+  ${libdir}/libstdc++.so.*-gdb.py \
+  ${datadir}/gcc-${BINV}/python/libstdcxx"
+
+FILES_libg2c = "${target_libdir}/libg2c.so.*"
+FILES_libg2c-dev = "\
+  ${libdir}/libg2c.so \
+  ${libdir}/libg2c.a \
+  ${libdir}/libfrtbegin.a"
+
+FILES_libstdc++ = "${libdir}/libstdc++.so.*"
+FILES_libstdc++-dev = "\
+  ${includedir}/c++/ \
+  ${libdir}/libstdc++.so \
+  ${libdir}/libstdc++.la \
+  ${libdir}/libsupc++.la"
+FILES_libstdc++-staticdev = "\
+  ${libdir}/libstdc++.a \
+  ${libdir}/libsupc++.a"
+
+FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
+
+FILES_libssp = "${libdir}/libssp.so.*"
+FILES_libssp-dev = " \
+  ${libdir}/libssp*.so \
+  ${libdir}/libssp*_nonshared.a \
+  ${libdir}/libssp*.la \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp"
+FILES_libssp-staticdev = " \
+  ${libdir}/libssp*.a"
+
+FILES_libgfortran = "${libdir}/libgfortran.so.*"
+FILES_libgfortran-dev = " \
+  ${libdir}/libgfortran*.so \
+  ${libdir}/libgfortran.spec \
+  ${libdir}/libgfortran.la \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single*"
+FILES_libgfortran-staticdev = " \
+  ${libdir}/libgfortran.a"
+
+INSANE_SKIP_${MLPREFIX}libgfortran-dev = "staticdev"
+
+FILES_libquadmath = "${libdir}/libquadmath*.so.*"
+FILES_libquadmath-dev = "\
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
+  ${libdir}/libquadmath*.so \
+  ${libdir}/libquadmath.la"
+FILES_libquadmath-staticdev = "\
+  ${libdir}/libquadmath.a"
+
+FILES_libmudflap = "${libdir}/libmudflap*.so.*"
+FILES_libmudflap-dev = "\
+  ${libdir}/libmudflap*.so \
+  ${libdir}/libmudflap.la"
+FILES_libmudflap-staticdev = "\
+  ${libdir}/libmudflap.a"
+
+FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
+FILES_libgomp-dev = "\
+  ${libdir}/libgomp*${SOLIBSDEV} \
+  ${libdir}/libgomp*.la \
+  ${libdir}/libgomp.spec \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
+  "
+FILES_libgomp-staticdev = "\
+  ${libdir}/libgomp*.a \
+  "
+
+do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-runtime_4.7.bb b/meta-arago-distro/recipes-devtools/gcc/gcc-runtime_4.7.bb
new file mode 100644
index 0000000..497d691
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-runtime_4.7.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-runtime.inc
+
diff --git a/meta-arago-distro/recipes-devtools/gcc/libgcc.inc b/meta-arago-distro/recipes-devtools/gcc/libgcc.inc
new file mode 100644
index 0000000..fe98238
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/libgcc.inc
@@ -0,0 +1,143 @@
+INHIBIT_DEFAULT_DEPS = "1"
+
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+
+PACKAGES = "\
+  ${PN} \
+  ${PN}-dev \
+  ${PN}-dbg \
+  libgcov-dev \
+  "
+
+FILES_${PN} = "${base_libdir}/libgcc*.so.*"
+FILES_${PN}-dev = " \
+  ${base_libdir}/libgcc*.so \
+  ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
+  ${libdir}/${TARGET_SYS}/${BINV}/64 \
+  ${libdir}/${TARGET_SYS}/${BINV}/32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/x32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/n32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
+FILES_libgcov-dev = " \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
+  "
+FILES_${PN}-dbg += "${base_libdir}/.debug/"
+
+do_configure () {
+	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	install -d ${D}${base_libdir} ${D}${libdir}
+	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
+	mkdir -p ${B}/${BPN}
+	cd ${B}/${BPN}
+	chmod a+x ${S}/${BPN}/configure
+	${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+}
+
+do_compile () {
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	cd ${B}/${BPN}
+	oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/
+}
+
+do_install () {
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	cd ${B}/${BPN}
+	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ install
+
+	# Move libgcc_s into /lib
+	mkdir -p ${D}${base_libdir}
+	if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
+		mv ${D}${libdir}/nof/libgcc* ${D}${base_libdir}
+	else
+		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
+	fi
+
+	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target
+	# so that cross-gcc can find it in the sysroot
+
+	mv ${D}${libdir}/gcc/* ${D}${libdir}
+	rm -rf ${D}${libdir}/gcc/
+	# unwind.h is installed here which is shipped in gcc-cross
+	# as well as target gcc and they are identical so we dont
+	# ship one with libgcc here
+	rm -rf ${D}${libdir}/${TARGET_SYS}/${BINV}/include
+}
+
+do_package[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+
+BBCLASSEXTEND = "nativesdk"
+
+INSANE_SKIP_${PN}-dev = "staticdev"
+INSANE_SKIP_${MLPREFIX}libgcov-dev = "staticdev"
+
+addtask multilib_install after do_install before do_package do_populate_sysroot
+# this makes multilib gcc files findable for target gcc
+# e.g.
+#    /usr/lib/i586-pokymllib32-linux/4.7/
+# by creating this symlink to it
+#    /usr/lib64/x86_64-poky-linux/4.7/32
+
+python do_multilib_install() {
+    import re
+
+    multilibs = d.getVar('MULTILIB_VARIANTS', True)
+    if not multilibs or bb.data.inherits_class('nativesdk', d):
+        return
+
+    binv = d.getVar('BINV', True)
+
+    mlprefix = d.getVar('MLPREFIX', True)
+    if ('%slibgcc' % mlprefix) != d.getVar('PN', True):
+        return
+
+    if mlprefix:
+        orig_tune = d.getVar('DEFAULTTUNE_MULTILIB_ORIGINAL', True)
+        orig_tune_params = get_tune_parameters(orig_tune, d)
+        orig_tune_baselib = orig_tune_params['baselib']
+        orig_tune_bitness = orig_tune_baselib.replace('lib', '')
+        if not orig_tune_bitness:
+            orig_tune_bitness = '32'
+
+        src = '../../../' + orig_tune_baselib + '/' + \
+            d.getVar('TARGET_SYS_MULTILIB_ORIGINAL', True) + '/' + binv + '/'
+
+        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
+            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + orig_tune_bitness
+
+        if os.path.lexists(dest):
+            os.unlink(dest)
+        os.symlink(src, dest)
+        return
+
+
+    for ml in multilibs.split():
+        tune = d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml, True)
+        if not tune:
+            bb.warn('DEFAULTTUNE_virtclass-multilib-%s is not defined. Skipping...' % ml)
+            continue
+
+        tune_parameters = get_tune_parameters(tune, d)
+        tune_baselib = tune_parameters['baselib']
+        if not tune_baselib:
+            bb.warn("Tune %s doesn't have a baselib set. Skipping..." % tune)
+            continue
+
+        tune_arch = tune_parameters['arch']
+        tune_bitness = tune_baselib.replace('lib', '')
+        if not tune_bitness:
+            tune_bitness = '32' # /lib => 32bit lib
+
+        src = '../../../' + tune_baselib + '/' + \
+            tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
+            '-' + d.getVar('TARGET_OS', True) + '/' + binv + '/'
+
+        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
+            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + tune_bitness
+
+        if os.path.lexists(dest):
+            os.unlink(dest)
+        os.symlink(src, dest)
+}
diff --git a/meta-arago-distro/recipes-devtools/gcc/libgcc_4.7.bb b/meta-arago-distro/recipes-devtools/gcc/libgcc_4.7.bb
new file mode 100644
index 0000000..9716e2e
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/libgcc_4.7.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libgcc.inc
+
-- 
2.2.0


