Return-Path: <jake@udc0866934>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8DEEA52A12
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2020 21:07:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 016L5SKA033621
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2020 15:05:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581023128;
	bh=uoTUhRljlUTpmR9AQcKIOnw9ZSbVDz4YEuus1eZP8u8=;
	h=From:To:CC:Subject:Date;
	b=FwccK4A1mEJqh6vPXdoiIMoyAAy3NQKpfUt1IGhoMXOFHfmv+XpUiLaJ9eivfHDR+
	Hlmzy7fAwKr2jH+3B5Bs+Bg/jmFcDtIUpEQnalF7WLW2GxyahfMPwhh8klUjPfac/t
	f48xEaEc5wGpqn2szxt/lBhvGzMSE5iRPkH9X8qI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 016L5S31072015
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2020 15:05:28 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 6 Feb 2020 15:05:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 6 Feb 2020 15:05:27 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 016L5RX0109189;
	Thu, 6 Feb 2020 15:05:27 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1izoL1-0008QI-5e; Thu, 06 Feb 2020 16:05:27 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2020 16:05:19 -0500
Message-ID: <1581023119-32346-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH] opkg-bash-completions: add enhancements to completions
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
X-List-Received-Date: Thu, 06 Feb 2020 21:07:22 -0000
Content-Type: text/plain

* Use helpers (e.g. _init_completion, _count_args) to enhance usability
* Add support for search and flag verbs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-devtools/opkg/opkg-bash-completion.bb  |  2 +
 .../opkg/opkg-bash-completion/opkg-bash-completion | 43 ++++++++++++++++++----
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
index 74e4964..6055507 100644
--- a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
@@ -1,6 +1,8 @@
 SUMMARY = "bash-completions for opkg"
 LICENSE = "MIT"
 
+PR = "r1"
+
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://opkg-bash-completion"
diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion
index 5b0b4e1..82b6c6f 100644
--- a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion
@@ -2,24 +2,51 @@
 
 # TBD: parse "opkg --help" to get this list
 OPKG_COMMANDS="update upgrade install configure remove clean flag list list-installed list-upgradable list-changed-conffiles files search find info status download compare-versions print-architecture depends whatdepends whatdependsrec whatrecommends whatsuggests whatprovides whatconflicts whatreplaces"
+OPKG_FLAGS="hold noprune user ok installed unpacked"
+OPKG_LONGOPTS="--help --verbosity --conf --dest --offline-root --add-arch --add-dest --add-exclude --add-ignore-recommends --prefer-arch-to-version --combine --force-depends --force-maintainer --force-reinstall --force-overwrite --force-downgrade --force-space --force-postinstall --force-remove --force-checksum --noaction --size --download-only --nodeps --no-install-recommends --force-removal-of-dependent-packages --autoremove --tmp-dir --lists-dir --cache-dir --host-cache-dir --volatile-cache"
 
 _opkg_completions() {
-    if [ ${#COMP_WORDS[@]} -eq 2 ]
+    # Use this helpful helper to beautify things and catch vars and redirects
+    local cur prev words cword
+    _init_completion -s || return 0
+
+    # Catch options first
+    if [[ "$cur" == -* ]]
     then
-        COMPREPLY=($(compgen -W "${OPKG_COMMANDS}" "${COMP_WORDS[1]}"))
+        COMPREPLY=($(compgen -W "${OPKG_LONGOPTS}" -- "$cur"))
         return
     fi
 
-    # TBD: add more cases, support options
-    case "${COMP_WORDS[1]}" in
+    # Now catch args
+    # opkg supports a single verb, so that will be the first arg,
+    local arg args
+    _get_first_arg
+    _count_args
+
+    case "$arg" in
         install|files|info|status|download)
-            COMPREPLY=($(compgen -W "$(opkg list | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
+            COMPREPLY=($(compgen -W "$(opkg list | sed -e 's| .*$||')" -- "$cur"));;
         depends|whatdepends|whatdependsrec|whatrecommends|whatsuggests|whatprovides|whatconflicts|whatreplaces)
-            COMPREPLY=($(compgen -W "-A $(opkg list | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
+            COMPREPLY=($(compgen -W "-A $(opkg list | sed -e 's| .*$||')" -- "$cur"));;
         remove)
-            COMPREPLY=($(compgen -W "$(opkg list-installed | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
+            COMPREPLY=($(compgen -W "$(opkg list-installed | sed -e 's| .*$||')" -- "$cur"));;
         upgrade)
-            COMPREPLY=($(compgen -W "$(opkg list-upgradable | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
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
     esac
 }
 
-- 
1.9.1


