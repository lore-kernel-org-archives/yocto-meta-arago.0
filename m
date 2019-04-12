Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 98BB952974
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2019 17:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 54B1840BA5;
	Fri, 12 Apr 2019 17:22:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Fpi-2zOvxHIA; Fri, 12 Apr 2019 17:22:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 36E9040A9E;
	Fri, 12 Apr 2019 17:22:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 674A016DFE1;
	Fri, 12 Apr 2019 13:22:04 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Apr 2019 13:22:03 -0400
Message-Id: <1555089723-28301-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] external-arm-toolchain-versions.inc: drop local copy
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
X-List-Received-Date: Fri, 12 Apr 2019 17:22:27 -0000

It was overlayed locally some time ago while fixes were upstreamed to meta-linaro.
It is no longer needed locally, as everything has been fixed upstream.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../include/external-arm-toolchain-versions.inc    | 128 ---------------------
 1 file changed, 128 deletions(-)
 delete mode 100644 meta-arago-extras/conf/distro/include/external-arm-toolchain-versions.inc

diff --git a/meta-arago-extras/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arago-extras/conf/distro/include/external-arm-toolchain-versions.inc
deleted file mode 100644
index 6c3acec..0000000
--- a/meta-arago-extras/conf/distro/include/external-arm-toolchain-versions.inc
+++ /dev/null
@@ -1,128 +0,0 @@
-def eat_run(d, cmd, *args):
-    import bb.process
-    import subprocess
-
-    topdir = d.getVar('TOPDIR', True)
-    toolchain_path = d.getVar('EXTERNAL_TOOLCHAIN', True)
-    if not toolchain_path:
-        return 'UNKNOWN', 'UNKNOWN'
-
-    target_prefix = d.getVar('TARGET_PREFIX', True)
-    path = os.path.join(toolchain_path, 'bin', target_prefix + cmd)
-    args = [path] + list(args)
-
-    return bb.process.run(args, cwd=topdir, stderr=subprocess.PIPE)
-
-def eat_get_version(d):
-    try:
-        stdout, stderr = eat_run(d, 'gcc', '-v')
-    except bb.process.CmdError as exc:
-        bb.error('Failed to obtain external Arm toolchain version: %s' % exc)
-        return 'UNKNOWN'
-    else:
-        last_line = stderr.splitlines()[-1]
-        return last_line
-
-# Extract the YYYY.MM version
-def eat_get_main_version(d):
-    version = eat_get_version(d)
-    bb.debug(2, 'Trying for parse version info from: %s' % version)
-    if version != 'UNKNOWN':
-        if version.split()[4] == '(GNU':
-            # gcc version 8.2.1 20180802 (GNU Toolchain for the A-profile Architecture 8.2-2018.11 (arm-rel-8.26)) 
-            return version.split()[10].split('-')[1]
-        bb.error('Failed to parse external Arm toolchain version from: %s' % version)
-    else:
-        return version
-
-# Extract the x.y.z version from 'gcc version 4.9.1'
-def eat_get_gcc_version(d):
-    version = eat_get_version(d)
-    if version != 'UNKNOWN':
-        return version.split()[2]
-    else:
-        return version
-
-def eat_get_libc_version(d):
-    import os,bb
-    syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
-    if not syspath:
-        return 'UNKNOWN'
-
-    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
-
-    if os.path.exists(libpath):
-        for file in os.listdir(libpath):
-            if file.find('libc-') == 0:
-                return file[5:-3]
-
-    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/', d)
-
-    if os.path.exists(libpath):
-        for file in os.listdir(libpath):
-            if file.find('libc-') == 0:
-                return file[5:-3]
-
-    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
-
-    if os.path.exists(libpath):
-        for file in os.listdir(libpath):
-            if file.find('libc-') == 0:
-                return file[5:-3]
-
-    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/', d)
-
-    if os.path.exists(libpath):
-        for file in os.listdir(libpath):
-            if file.find('libc-') == 0:
-                return file[5:-3]
-    return 'UNKNOWN'
-
-def eat_get_kernel_version(d):
-    import os,bb
-    syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
-    if not syspath:
-        return 'UNKNOWN'
-
-    vf = syspath + '/libc/usr/include/linux/version.h'
-
-    try:
-        f = open(vf, 'r')
-    except (OSError, IOError):
-        return 'UNKNOWN'
-
-    l = f.readlines();
-    f.close();
-    for s in l:
-        if s.find('LINUX_VERSION_CODE') > 0:
-            ver = int(s.split()[2])
-            maj = ver / 65536
-            ver = ver % 65536
-            min = ver / 256
-            ver = ver % 256
-            return str(maj)+'.'+str(min)+'.'+str(ver)
-    return 'UNKNOWN'
-
-def eat_get_gdb_version(d):
-    try:
-        stdout, stderr = eat_run(d, 'gdb', '-v')
-    except bb.process.CmdError:
-        return 'UNKNOWN'
-    else:
-        first_line = stdout.splitlines()[0]
-        return first_line.split()[-1]
-
-python external_arm_toolchain_version_handler () {
-    if not isinstance(e, bb.event.ConfigParsed):
-        return
-    d = e.data
-    ld = d.createCopy()
-    ld.finalize()
-
-    d.setVar('EAT_VER_MAIN', eat_get_main_version(ld))
-    d.setVar('EAT_VER_GCC', eat_get_gcc_version(ld))
-    d.setVar('EAT_VER_LIBC', eat_get_libc_version(ld))
-    d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
-    d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
-}
-addhandler external_arm_toolchain_version_handler
-- 
2.7.4


