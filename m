Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id EBF4F529C9
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2020 17:19:32 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00LHHiJi086380
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2020 11:17:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579627064;
	bh=i+l3RIwWfZppTR9DEiH7SValOJCpxcmMV6w0hnaL9mw=;
	h=From:To:CC:Subject:Date;
	b=jpdqocxe2zsNMhOGZxDGfYhYjXSw3dcMGPHycMIFjZPok//XMzRCMNsjk8vLd6LdM
	rUonOkI+AUeWnQEkATJ3tp+Bzrh7AEqSrGQA34+qEHFMFvTZuGjqXCxppCfYtnYOob
	e+Xl2vhm7ugGJT6HdzzApuCBPY4N2o4dStYdiFpA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00LHHiJw056622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2020 11:17:44 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 21 Jan 2020 11:17:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 21 Jan 2020 11:17:43 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00LHHhGh064280;
	Tue, 21 Jan 2020 11:17:43 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Jan 2020 11:58:42 -0500
Message-ID: <1579625923-14558-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH 1/2] opkg-bash-completion: add simple completions for opkg
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
X-List-Received-Date: Tue, 21 Jan 2020 17:19:33 -0000
Content-Type: text/plain

This is a simpe start to bash completions for opkg. Initialy, this can
complete current supported verbs (static) and complete package names
(dynamic).

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-devtools/opkg/opkg-bash-completion.bb  | 15 +++++++++++++
 .../opkg/opkg-bash-completion/opkg-bash-completion | 26 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
 create mode 100644 meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion

diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
new file mode 100644
index 0000000..74e4964
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
@@ -0,0 +1,15 @@
+SUMMARY = "bash-completions for opkg"
+LICENSE = "MIT"
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
index 0000000..5b0b4e1
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion
@@ -0,0 +1,26 @@
+#!/bin/bash
+
+# TBD: parse "opkg --help" to get this list
+OPKG_COMMANDS="update upgrade install configure remove clean flag list list-installed list-upgradable list-changed-conffiles files search find info status download compare-versions print-architecture depends whatdepends whatdependsrec whatrecommends whatsuggests whatprovides whatconflicts whatreplaces"
+
+_opkg_completions() {
+    if [ ${#COMP_WORDS[@]} -eq 2 ]
+    then
+        COMPREPLY=($(compgen -W "${OPKG_COMMANDS}" "${COMP_WORDS[1]}"))
+        return
+    fi
+
+    # TBD: add more cases, support options
+    case "${COMP_WORDS[1]}" in
+        install|files|info|status|download)
+            COMPREPLY=($(compgen -W "$(opkg list | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
+        depends|whatdepends|whatdependsrec|whatrecommends|whatsuggests|whatprovides|whatconflicts|whatreplaces)
+            COMPREPLY=($(compgen -W "-A $(opkg list | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
+        remove)
+            COMPREPLY=($(compgen -W "$(opkg list-installed | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
+        upgrade)
+            COMPREPLY=($(compgen -W "$(opkg list-upgradable | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
+    esac
+}
+
+complete -F _opkg_completions opkg
-- 
2.7.4


