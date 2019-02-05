Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B0CB452974
	for <meta-arago@arago-project.org>;
	Tue,  5 Feb 2019 07:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A8AD940A35;
	Tue,  5 Feb 2019 07:40:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6zM37spfScuY; Tue,  5 Feb 2019 07:40:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8421440951;
	Tue,  5 Feb 2019 07:40:25 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9D43516A69A;
	Tue,  5 Feb 2019 02:40:24 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Feb 2019 02:40:23 -0500
Message-Id: <1549352423-55168-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] FIXME: overlay .inc files for external-arm-toolchain
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
X-List-Received-Date: Tue, 05 Feb 2019 07:40:41 -0000

Remove later when using external-arm-toolchain from meta-linaro-toolchain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../include/external-arm-toolchain-versions.inc    | 128 +++++++++++++++++++++
 .../conf/distro/include/tcmode-external-arm.inc    | 113 ++++++++++++++++++
 2 files changed, 241 insertions(+)
 create mode 100644 meta-arago-extras/conf/distro/include/external-arm-toolchain-versions.inc
 create mode 100644 meta-arago-extras/conf/distro/include/tcmode-external-arm.inc

diff --git a/meta-arago-extras/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arago-extras/conf/distro/include/external-arm-toolchain-versions.inc
new file mode 100644
index 0000000..6c3acec
--- /dev/null
+++ b/meta-arago-extras/conf/distro/include/external-arm-toolchain-versions.inc
@@ -0,0 +1,128 @@
+def eat_run(d, cmd, *args):
+    import bb.process
+    import subprocess
+
+    topdir = d.getVar('TOPDIR', True)
+    toolchain_path = d.getVar('EXTERNAL_TOOLCHAIN', True)
+    if not toolchain_path:
+        return 'UNKNOWN', 'UNKNOWN'
+
+    target_prefix = d.getVar('TARGET_PREFIX', True)
+    path = os.path.join(toolchain_path, 'bin', target_prefix + cmd)
+    args = [path] + list(args)
+
+    return bb.process.run(args, cwd=topdir, stderr=subprocess.PIPE)
+
+def eat_get_version(d):
+    try:
+        stdout, stderr = eat_run(d, 'gcc', '-v')
+    except bb.process.CmdError as exc:
+        bb.error('Failed to obtain external Arm toolchain version: %s' % exc)
+        return 'UNKNOWN'
+    else:
+        last_line = stderr.splitlines()[-1]
+        return last_line
+
+# Extract the YYYY.MM version
+def eat_get_main_version(d):
+    version = eat_get_version(d)
+    bb.debug(2, 'Trying for parse version info from: %s' % version)
+    if version != 'UNKNOWN':
+        if version.split()[4] == '(GNU':
+            # gcc version 8.2.1 20180802 (GNU Toolchain for the A-profile Architecture 8.2-2018.11 (arm-rel-8.26)) 
+            return version.split()[10].split('-')[1]
+        bb.error('Failed to parse external Arm toolchain version from: %s' % version)
+    else:
+        return version
+
+# Extract the x.y.z version from 'gcc version 4.9.1'
+def eat_get_gcc_version(d):
+    version = eat_get_version(d)
+    if version != 'UNKNOWN':
+        return version.split()[2]
+    else:
+        return version
+
+def eat_get_libc_version(d):
+    import os,bb
+    syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
+    if not syspath:
+        return 'UNKNOWN'
+
+    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
+
+    if os.path.exists(libpath):
+        for file in os.listdir(libpath):
+            if file.find('libc-') == 0:
+                return file[5:-3]
+
+    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/', d)
+
+    if os.path.exists(libpath):
+        for file in os.listdir(libpath):
+            if file.find('libc-') == 0:
+                return file[5:-3]
+
+    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
+
+    if os.path.exists(libpath):
+        for file in os.listdir(libpath):
+            if file.find('libc-') == 0:
+                return file[5:-3]
+
+    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/', d)
+
+    if os.path.exists(libpath):
+        for file in os.listdir(libpath):
+            if file.find('libc-') == 0:
+                return file[5:-3]
+    return 'UNKNOWN'
+
+def eat_get_kernel_version(d):
+    import os,bb
+    syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
+    if not syspath:
+        return 'UNKNOWN'
+
+    vf = syspath + '/libc/usr/include/linux/version.h'
+
+    try:
+        f = open(vf, 'r')
+    except (OSError, IOError):
+        return 'UNKNOWN'
+
+    l = f.readlines();
+    f.close();
+    for s in l:
+        if s.find('LINUX_VERSION_CODE') > 0:
+            ver = int(s.split()[2])
+            maj = ver / 65536
+            ver = ver % 65536
+            min = ver / 256
+            ver = ver % 256
+            return str(maj)+'.'+str(min)+'.'+str(ver)
+    return 'UNKNOWN'
+
+def eat_get_gdb_version(d):
+    try:
+        stdout, stderr = eat_run(d, 'gdb', '-v')
+    except bb.process.CmdError:
+        return 'UNKNOWN'
+    else:
+        first_line = stdout.splitlines()[0]
+        return first_line.split()[-1]
+
+python external_arm_toolchain_version_handler () {
+    if not isinstance(e, bb.event.ConfigParsed):
+        return
+    d = e.data
+    ld = d.createCopy()
+    ld.finalize()
+
+    d.setVar('EAT_VER_MAIN', eat_get_main_version(ld))
+    d.setVar('EAT_VER_GCC', eat_get_gcc_version(ld))
+    d.setVar('EAT_VER_LIBC', eat_get_libc_version(ld))
+    d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
+    d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
+}
+addhandler external_arm_toolchain_version_handler
diff --git a/meta-arago-extras/conf/distro/include/tcmode-external-arm.inc b/meta-arago-extras/conf/distro/include/tcmode-external-arm.inc
new file mode 100644
index 0000000..4074d6d
--- /dev/null
+++ b/meta-arago-extras/conf/distro/include/tcmode-external-arm.inc
@@ -0,0 +1,113 @@
+#
+# Configuration to use an external Arm binary toolchain
+#
+
+EXTERNAL_TOOLCHAIN ?= "/usr/local/arm-binary-toolchain/${TARGET_ARCH}"
+
+TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
+PATH =. "${TOOLCHAIN_PATH_ADD}"
+
+EAT_TARGET_SYS_arm ?= "arm-linux-gnueabihf"
+EAT_TARGET_SYS_aarch64 ?= "aarch64-linux-gnu"
+EAT_TARGET_SYS = "${TARGET_SYS}"
+TARGET_PREFIX = "${EAT_TARGET_SYS}-"
+
+EAT_LIBDIR_arm = "lib"
+EAT_LIBDIR_aarch64 = "lib64"
+
+GCCMULTILIB_forcevariable = "--disable-multilib"
+IMAGE_LINGUAS_forcevariable = ""
+
+# Blacklist toolchain recipes as a belt-and-suspenders way to use the external toolchain
+PNBLACKLIST[glibc] = "Using external toolchain"
+PNBLACKLIST[libgcc] = "Using external toolchain"
+PNBLACKLIST[gcc-cross] = "Using external toolchain"
+PNBLACKLIST[gcc-runtime] = "Using external toolchain"
+
+PREFERRED_PROVIDER_linux-libc-headers = "external-arm-toolchain"
+PREFERRED_PROVIDER_linux-libc-headers-dev = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-arm-toolchain"
+PREFERRED_PROVIDER_glibc = "external-arm-toolchain"
+PREFERRED_PROVIDER_libgcc = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/libc = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/libintl = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/libiconv = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/crypt = "external-arm-toolchain"
+PREFERRED_PROVIDER_glibc-thread-db = "external-arm-toolchain"
+PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
+PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
+
+TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include "
+TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib "
+
+TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
+
+DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-crypt \
+			libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
+			libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big \
+			libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
+			libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
+			libc-posix-wchar-io"
+
+ENABLE_BINARY_LOCALE_GENERATION = "0"
+GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
+
+ERROR_QA[type] ?= "list"
+python toolchain_metadata_setup () {
+    import subprocess
+    if not isinstance(e, bb.event.ConfigParsed):
+        return
+
+    d = e.data
+    l = d.createCopy()
+    l.finalize()
+    oe_import(l)
+
+    external_toolchain = l.getVar('EXTERNAL_TOOLCHAIN', True)
+    if not external_toolchain or external_toolchain == 'UNDEFINED':
+        bb.fatal("Error: EXTERNAL_TOOLCHAIN must be set to the path to your arm toolchain")
+
+    if not os.path.exists(external_toolchain):
+        bb.fatal("Error: EXTERNAL_TOOLCHAIN path '%s' does not exist" % external_toolchain)
+
+    # The external toolchain may not have been built with the oe-core preferred
+    # gnu hash setting, so ensure that the corresponding sanity check is not an error.
+    error_qa = oe.data.typed_value('ERROR_QA', l)
+    if 'ldflags' in error_qa:
+        error_qa.remove('ldflags')
+        d.setVar('ERROR_QA', ' '.join(error_qa))
+}
+addhandler toolchain_metadata_setup
+
+def populate_toolchain_links(d):
+    import errno
+    import os
+    from glob import glob
+
+    d = d.createCopy()
+    d.finalize()
+
+    pattern = bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*', d)
+    files = glob(pattern)
+    if not files:
+        bb.fatal("Unable to populate toolchain binary symlinks")
+
+    bindir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
+    bb.mkdirhier(bindir)
+    for f in files:
+        base = os.path.basename(f)
+        newpath = os.path.join(bindir, base)
+        try:
+            os.symlink(f, newpath)
+        except OSError as exc:
+            if exc.errno == errno.EEXIST:
+                break
+            bb.fatal("Unable to populate toolchain binary symlink for %s: %s" % (newpath, exc))
+
+require conf/distro/include/external-arm-toolchain-versions.inc
-- 
2.7.4


