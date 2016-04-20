Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id EE58C52A65
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:50 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00DI96BX0R40@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=-LCu6K_DAAAA:8
	a=JhjYIh8xqhW1-PlMzUwA:9
Received: by 100.15.86.14 with SMTP id 7aa628c3; Wed, 20 Apr 2016 19:33:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C07D4161FBC;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:18 -0400
Message-id: <1461180805-25733-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 09/16] nodejs: available from meta-oe, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../nodejs/nodejs/no-registry.patch                | 59 ---------------
 .../recipes-devtools/nodejs/nodejs_4.2.3.bb        | 84 ----------------------
 2 files changed, 143 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/nodejs/nodejs/no-registry.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/nodejs/nodejs_4.2.3.bb

diff --git a/meta-arago-extras/recipes-devtools/nodejs/nodejs/no-registry.patch b/meta-arago-extras/recipes-devtools/nodejs/nodejs/no-registry.patch
deleted file mode 100644
index ed24738..0000000
--- a/meta-arago-extras/recipes-devtools/nodejs/nodejs/no-registry.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Bugfix for --no-registry in nodejs-v0.12.2
-
-diff -u -r node-v0.12.2_def/deps/npm/lib/cache/caching-client.js node-v0.12.2/deps/npm/lib/cache/caching-client.js
---- node-v0.12.2_def/deps/npm/lib/cache/caching-client.js	2015-04-01 01:13:01.000000000 +0300
-+++ node-v0.12.2/deps/npm/lib/cache/caching-client.js	2015-05-18 00:47:10.738599686 +0300
-@@ -67,6 +67,22 @@
-   var cacheBase = cacheFile(npm.config.get("cache"))(uri)
-   var cachePath = path.join(cacheBase, ".cache.json")
- 
-+  if (parsed.host === "noregistry") (function() {
-+    var stat = null
-+    var file = npm.config.get("cache") + parsed.pathname + "/.cache.json"
-+    try {
-+      stat = fs.statSync(cachePath)
-+    } catch (ex) {}
-+    if (!stat) try {
-+      stat = fs.statSync(file) 
-+      cachePath = file
-+    } catch (ex) {
-+      stat = "Registry not defined and registry files not found: \"" +
-+             cachePath + "\", \"" + file + "\"."
-+      throw new Error(stat)
-+    }
-+  })()
-+
-   // If the GET is part of a write operation (PUT or DELETE), then
-   // skip past the cache entirely, but still save the results.
-   if (uri.match(/\?write=true$/)) {
-@@ -83,12 +99,17 @@
-         }
-         catch (ex) {
-           data = null
-+          if (parsed.host === "noregistry")
-+            throw new Error("File \"" + cachePath+"\"" + " corrupted.")
-         }
- 
-         params.stat = stat
-         params.data = data
- 
--        get_.call(client, uri, cachePath, params, cb)
-+        if (parsed.host === "noregistry")
-+          cb(null, data, JSON.stringify(data), { statusCode : 304 })
-+        else
-+          get_.call(client, uri, cachePath, params, cb)
-       })
-     }
-     else {
-diff -u -r node-v0.12.2_def/deps/npm/lib/utils/map-to-registry.js node-v0.12.2/deps/npm/lib/utils/map-to-registry.js
---- node-v0.12.2_def/deps/npm/lib/utils/map-to-registry.js	2015-04-01 01:13:01.000000000 +0300
-+++ node-v0.12.2/deps/npm/lib/utils/map-to-registry.js	2015-05-18 01:15:10.030569613 +0300
-@@ -45,6 +45,8 @@
- 
-   log.silly("mapToRegistry", "registry", registry)
- 
-+  if (!registry) return cb(null, "http://noregistry/" + name, {})
-+
-   var auth = config.getCredentialsByURI(registry)
- 
-   // normalize registry URL so resolution doesn't drop a piece of registry URL
diff --git a/meta-arago-extras/recipes-devtools/nodejs/nodejs_4.2.3.bb b/meta-arago-extras/recipes-devtools/nodejs/nodejs_4.2.3.bb
deleted file mode 100644
index 66a3c11..0000000
--- a/meta-arago-extras/recipes-devtools/nodejs/nodejs_4.2.3.bb
+++ /dev/null
@@ -1,84 +0,0 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ee90ba97d933fc8d56e97812b7dd62e9"
-
-DEPENDS = "openssl"
-
-COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
-COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
-COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
-
-SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
-    file://no-registry.patch \
-"
-SRC_URI[md5sum] = "529a8abd4ca5a2225636767d3f14c382"
-SRC_URI[sha256sum] = "5008ade5feb4b089f59163f66bffddc113f27de5d78edf203e39435c2c5d554f"
-
-S = "${WORKDIR}/node-v${PV}"
-
-# v8 errors out if you have set CCACHE
-CCACHE = ""
-
-def map_nodejs_arch(a, d):
-    import re
-
-    if   re.match('i.86$', a): return 'ia32'
-    elif re.match('x86_64$', a): return 'x64'
-    elif re.match('aarch64$', a): return 'arm64'
-    elif re.match('powerpc64$', a): return 'ppc64'
-    elif re.match('powerpc$', a): return 'ppc'
-    return a
-
-ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '--with-arm-float-abi=hard', '--with-arm-float-abi=softfp', d)}"
-GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
-ARCHFLAGS ?= ""
-
-# Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
-do_configure () {
-    export LD="${CXX}"
-    GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
-    # $TARGET_ARCH settings don't match --dest-cpu settings
-   ./configure --prefix=${prefix} --without-snapshot --shared-openssl \
-               --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH', True), d)}" \
-               --dest-os=linux \
-               ${ARCHFLAGS}
-}
-
-do_compile () {
-    export LD="${CXX}"
-    oe_runmake BUILDTYPE=Release
-}
-
-do_install () {
-    oe_runmake install DESTDIR=${D}
-}
-
-do_install_append_class-native() {
-    # use node from PATH instead of absolute path to sysroot
-    # node-v0.10.25/tools/install.py is using:
-    # shebang = os.path.join(node_prefix, 'bin/node')
-    # update_shebang(link_path, shebang)
-    # and node_prefix can be very long path to bindir in native sysroot and
-    # when it exceeds 128 character shebang limit it's stripped to incorrect path
-    # and npm fails to execute like in this case with 133 characters show in log.do_install:
-    # updating shebang of /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/work/x86_64-linux/nodejs-native/0.10.15-r0/image/home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/npm to /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/node
-    # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
-    # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
-    # npm-cli.js continues to use old shebang
-    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
-}
-
-do_install_append_class-target() {
-    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
-}
-
-PACKAGES =+ "${PN}-npm"
-FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm"
-RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils"
-
-PACKAGES =+ "${PN}-systemtap"
-FILES_${PN}-systemtap = "${datadir}/systemtap"
-
-
-BBCLASSEXTEND = "native"
-- 
2.2.0


