Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 206AB52A81
	for <meta-arago@arago-project.org>;
	Sat, 29 Feb 2020 16:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7525C40BCC;
	Sat, 29 Feb 2020 16:15:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hS7Eyl8TZGYG; Sat, 29 Feb 2020 16:15:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 529F040C2F;
	Sat, 29 Feb 2020 16:15:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9E0A317442D;
	Sat, 29 Feb 2020 11:14:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 29 Feb 2020 11:14:48 -0500
Message-Id: <1582992888-3508-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582992888-3508-1-git-send-email-denis@denix.org>
References: <1582992888-3508-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 9/9] opkg-bash-completion: add bash-completions for opkg
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
X-List-Received-Date: Sat, 29 Feb 2020 16:17:11 -0000

From: Jacob Stiffler <j-stiffler@ti.com>

* This is a simpe start to bash completions for opkg. Initialy, this can
  complete current supported verbs (static) and complete package names
  (dynamic).
* Use helpers (e.g. _init_completion, _count_args) to enhance usability
* Add support for search and flag verbs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-base.bb       |  1 +
 .../recipes-devtools/opkg/opkg-bash-completion.bb  | 17 +++++++
 .../opkg/opkg-bash-completion/opkg-bash-completion | 53 ++++++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
 create mode 100644 meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 4094d90..e3f1916 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -20,6 +20,7 @@ ARAGO_BASE = "\
     ethtool \
     thermal-init \
     bash \
+    opkg-bash-completion \
     udev-extraconf \
     "
 
diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
new file mode 100644
index 0000000..6055507
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
@@ -0,0 +1,17 @@
+SUMMARY = "bash-completions for opkg"
+LICENSE = "MIT"
+
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://opkg-bash-completion"
+
+do_install() {
+    install -d ${D}${datadir}/bash-completion/completions
+    install -m 0644 ${WORKDIR}/opkg-bash-completion \
+                    ${D}${datadir}/bash-completion/completions/opkg
+}
+
+FILES_${PN} = "${datadir}/bash-completion/completions/opkg"
+RDEPENDS_${PN} = "bash-completion"
diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion
new file mode 100644
index 0000000..82b6c6f
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion
@@ -0,0 +1,53 @@
+#!/bin/bash
+
+# TBD: parse "opkg --help" to get this list
+OPKG_COMMANDS="update upgrade install configure remove clean flag list list-installed list-upgradable list-changed-conffiles files search find info status download compare-versions print-architecture depends whatdepends whatdependsrec whatrecommends whatsuggests whatprovides whatconflicts whatreplaces"
+OPKG_FLAGS="hold noprune user ok installed unpacked"
+OPKG_LONGOPTS="--help --verbosity --conf --dest --offline-root --add-arch --add-dest --add-exclude --add-ignore-recommends --prefer-arch-to-version --combine --force-depends --force-maintainer --force-reinstall --force-overwrite --force-downgrade --force-space --force-postinstall --force-remove --force-checksum --noaction --size --download-only --nodeps --no-install-recommends --force-removal-of-dependent-packages --autoremove --tmp-dir --lists-dir --cache-dir --host-cache-dir --volatile-cache"
+
+_opkg_completions() {
+    # Use this helpful helper to beautify things and catch vars and redirects
+    local cur prev words cword
+    _init_completion -s || return 0
+
+    # Catch options first
+    if [[ "$cur" == -* ]]
+    then
+        COMPREPLY=($(compgen -W "${OPKG_LONGOPTS}" -- "$cur"))
+        return
+    fi
+
+    # Now catch args
+    # opkg supports a single verb, so that will be the first arg,
+    local arg args
+    _get_first_arg
+    _count_args
+
+    case "$arg" in
+        install|files|info|status|download)
+            COMPREPLY=($(compgen -W "$(opkg list | sed -e 's| .*$||')" -- "$cur"));;
+        depends|whatdepends|whatdependsrec|whatrecommends|whatsuggests|whatprovides|whatconflicts|whatreplaces)
+            COMPREPLY=($(compgen -W "-A $(opkg list | sed -e 's| .*$||')" -- "$cur"));;
+        remove)
+            COMPREPLY=($(compgen -W "$(opkg list-installed | sed -e 's| .*$||')" -- "$cur"));;
+        upgrade)
+            COMPREPLY=($(compgen -W "$(opkg list-upgradable | sed -e 's| .*$||')" -- "$cur"));;
+        flag)
+            if [ $args -eq 2 ]
+            then
+                COMPREPLY=($(compgen -W "${OPKG_FLAGS}" "$cur"))
+            else
+                COMPREPLY=($(compgen -W "-A $(opkg list | sed -e 's| .*$||')" -- "$cur"))
+            fi
+            ;;
+        search)
+            # Only search for a single file
+            [ $args -gt 2 ] || _longopt;;
+        "")
+            COMPREPLY=($(compgen -W "${OPKG_COMMANDS}" -- "$cur"));;
+        *)
+            COMPREPLY=( "*" "I DONT KNOW WHAT TO DO!!!" )
+    esac
+}
+
+complete -F _opkg_completions opkg
-- 
2.7.4


