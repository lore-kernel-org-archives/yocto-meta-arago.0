Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971A0C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 02:44:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1113.1669776247844237769
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Nov 2022 18:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HzFzCAl+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AU2i4c1020728;
	Tue, 29 Nov 2022 20:44:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669776244;
	bh=ALIaeo5Wel9YfWM4FS7ptZ+LDQCGuKstIUGs3C92TXE=;
	h=From:To:Subject:Date;
	b=HzFzCAl+IpHv9PMC5+yA6BMUL2UAbhqjPfft6LLBT+HFTvL1uMmh3QcHpRZW1c3XC
	 s9ALXgnxzZYOLPzWMyCYl4u6UbaYzUITeR5Eb8DRl01hRhbUWXdwRAShwF0iSlGzBW
	 jiqV2pAVlNNQPugBIQFaaQ4DMVZ0cfj6pKkgg7Kg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AU2i4Sn093938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Nov 2022 20:44:04 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 29
 Nov 2022 20:44:04 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 29 Nov 2022 20:44:04 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AU2i4Fj128966;
	Tue, 29 Nov 2022 20:44:04 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1p0D4u-0007qR-0S; Tue, 29 Nov 2022 20:44:04 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] go: Update reproducibility patch to fix panic errors
Date: Tue, 29 Nov 2022 20:44:03 -0600
Message-ID: <20221130024403.30115-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Nov 2022 02:44:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14118

Temporary patch until oe-core picks up the patch upstream.

https://lists.openembedded.org/g/openembedded-core/message/173973

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../go/go-cross-canadian_%.bbappend           |   3 +
 .../recipes-devtools/go/go-cross_%.bbappend   |   3 +
 .../go/go-crosssdk_%.bbappend                 |   3 +
 .../recipes-devtools/go/go-native_%.bbappend  |   3 +
 .../recipes-devtools/go/go-patch.inc          |   6 +
 .../recipes-devtools/go/go-runtime_%.bbappend |   3 +
 .../go/go/0001-panic-fix.patch                | 175 ++++++++++++++++++
 .../recipes-devtools/go/go_%.bbappend         |   3 +
 8 files changed, 199 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/go/go-cross-canadian_%.bbappend
 create mode 100644 meta-arago-distro/recipes-devtools/go/go-cross_%.bbappend
 create mode 100644 meta-arago-distro/recipes-devtools/go/go-crosssdk_%.bbappend
 create mode 100644 meta-arago-distro/recipes-devtools/go/go-native_%.bbappend
 create mode 100644 meta-arago-distro/recipes-devtools/go/go-patch.inc
 create mode 100644 meta-arago-distro/recipes-devtools/go/go-runtime_%.bbappend
 create mode 100644 meta-arago-distro/recipes-devtools/go/go/0001-panic-fix.patch
 create mode 100644 meta-arago-distro/recipes-devtools/go/go_%.bbappend

diff --git a/meta-arago-distro/recipes-devtools/go/go-cross-canadian_%.bbappend b/meta-arago-distro/recipes-devtools/go/go-cross-canadian_%.bbappend
new file mode 100644
index 00000000..56e50fcc
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/go/go-cross-canadian_%.bbappend
@@ -0,0 +1,3 @@
+
+require go-patch.inc
+
diff --git a/meta-arago-distro/recipes-devtools/go/go-cross_%.bbappend b/meta-arago-distro/recipes-devtools/go/go-cross_%.bbappend
new file mode 100644
index 00000000..56e50fcc
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/go/go-cross_%.bbappend
@@ -0,0 +1,3 @@
+
+require go-patch.inc
+
diff --git a/meta-arago-distro/recipes-devtools/go/go-crosssdk_%.bbappend b/meta-arago-distro/recipes-devtools/go/go-crosssdk_%.bbappend
new file mode 100644
index 00000000..56e50fcc
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/go/go-crosssdk_%.bbappend
@@ -0,0 +1,3 @@
+
+require go-patch.inc
+
diff --git a/meta-arago-distro/recipes-devtools/go/go-native_%.bbappend b/meta-arago-distro/recipes-devtools/go/go-native_%.bbappend
new file mode 100644
index 00000000..56e50fcc
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/go/go-native_%.bbappend
@@ -0,0 +1,3 @@
+
+require go-patch.inc
+
diff --git a/meta-arago-distro/recipes-devtools/go/go-patch.inc b/meta-arago-distro/recipes-devtools/go/go-patch.inc
new file mode 100644
index 00000000..402759bf
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/go/go-patch.inc
@@ -0,0 +1,6 @@
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/go:"
+
+SRC_URI:remove = "file://0001-cmd-go-make-content-based-hash-generation-less-pedan.patch"
+SRC_URI:append = "file://0001-panic-fix.patch"
+
diff --git a/meta-arago-distro/recipes-devtools/go/go-runtime_%.bbappend b/meta-arago-distro/recipes-devtools/go/go-runtime_%.bbappend
new file mode 100644
index 00000000..56e50fcc
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/go/go-runtime_%.bbappend
@@ -0,0 +1,3 @@
+
+require go-patch.inc
+
diff --git a/meta-arago-distro/recipes-devtools/go/go/0001-panic-fix.patch b/meta-arago-distro/recipes-devtools/go/go/0001-panic-fix.patch
new file mode 100644
index 00000000..b9b4a2e9
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/go/go/0001-panic-fix.patch
@@ -0,0 +1,175 @@
+
+Temporary patch until oe-core picks up the patch.
+
+https://lists.openembedded.org/g/openembedded-core/message/173973
+
+Upstream-Status: Pending
+
+
+
+
+From fb22e586871cc6be0b7041e86d2daceee06ea568 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 28 Mar 2022 10:59:03 -0700
+Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
+
+Go 1.10's build tool now uses content-based hashes to
+determine when something should be built or re-built.
+This same mechanism is used to maintain a built-artifact
+cache for speeding up builds.
+
+However, the hashes it generates include information that
+doesn't work well with OE, nor with using a shared runtime
+library.
+
+First, it embeds path names to source files, unless
+building within GOROOT.  This prevents the building
+of a package in GOPATH for later staging into GOROOT.
+
+This patch adds support for the environment variable
+GOPATH_OMIT_IN_ACTIONID.  If present, path name
+embedding is disabled.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
+Signed-off-by: Matt Madison <matt@madison.systems>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/cmd/go/internal/envcmd/env.go |  2 +-
+ src/cmd/go/internal/work/exec.go  | 42 ++++++++++++++++++++++++-------
+ 2 files changed, 34 insertions(+), 10 deletions(-)
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 81ee859..2db3898 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -176,7 +176,7 @@ func ExtraEnvVars() []cfg.EnvVar {
+ func ExtraEnvVarsCostly() []cfg.EnvVar {
+ 	b := work.NewBuilder("")
+ 
+-	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
++	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
+ 	if err != nil {
+ 		// Should not happen - b.CFlags was given an empty package.
+ 		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index c88b315..a06455c 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -213,6 +213,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
+ 	writeActionGraph()
+ }
+ 
++var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
++
+ // buildActionID computes the action ID for a build action.
+ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	p := a.Package
+@@ -234,7 +236,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 		if p.Module != nil {
+ 			fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
+ 		}
+-	} else if p.Goroot {
++	} else if p.Goroot || omitGopath {
+ 		// The Go compiler always hides the exact value of $GOROOT
+ 		// when building things in GOROOT.
+ 		//
+@@ -266,9 +268,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	}
+ 	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
+ 		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
+-		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
++		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
+ 
+-		ccExe := b.ccExe()
++		ccExe := filterCompilerFlags(b.ccExe(), true)
+ 		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
+ 		// Include the C compiler tool ID so that if the C
+ 		// compiler changes we rebuild the package.
+@@ -281,14 +283,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 			}
+ 		}
+ 		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
+-			cxxExe := b.cxxExe()
++			cxxExe := filterCompilerFlags(b.cxxExe(), true)
+ 			fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
+ 			if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
+ 				fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
+ 			}
+ 		}
+ 		if len(p.FFiles) > 0 {
+-			fcExe := b.fcExe()
++			fcExe := filterCompilerFlags(b.fcExe(), true)
+ 			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
+ 			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
+ 				fmt.Fprintf(h, "FC ID=%q\n", fcID)
+@@ -305,7 +307,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 		}
+ 	}
+ 	if p.Internal.BuildInfo != "" {
+-		fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
++		//fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
+ 	}
+ 
+ 	// Configuration specific to compiler toolchain.
+@@ -2705,8 +2707,25 @@ func envList(key, def string) []string {
+ 	return args
+ }
+ 
++var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
++
++func filterCompilerFlags(flags []string, keepfirst bool) []string {
++	var newflags []string
++   var realkeepfirst bool = keepfirst
++	if !filterFlags {
++		return flags
++	}
++	for _, flag := range flags {
++		if strings.HasPrefix(flag, "-m") || realkeepfirst {
++			newflags = append(newflags, flag)
++           realkeepfirst = false
++		}
++	}
++	return newflags
++}
++
+ // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
+-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
+ 	defaults := "-g -O2"
+ 
+ 	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
+@@ -2724,6 +2743,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+ 	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
+ 		return
+ 	}
++	if filtered {
++		cppflags = filterCompilerFlags(cppflags, false)
++		cflags = filterCompilerFlags(cflags, false)
++		cxxflags = filterCompilerFlags(cxxflags, false)
++		fflags = filterCompilerFlags(fflags, false)
++		ldflags = filterCompilerFlags(ldflags, false)
++	}
+ 
+ 	return
+ }
+@@ -2739,7 +2765,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+ 
+ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
+ 	p := a.Package
+-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p)
++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p, false)
+ 	if err != nil {
+ 		return nil, nil, err
+ 	}
+@@ -3246,7 +3272,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+ 
+ // Run SWIG on one SWIG input file.
+ func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
+-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p, false)
+ 	if err != nil {
+ 		return "", "", err
+ 	}
diff --git a/meta-arago-distro/recipes-devtools/go/go_%.bbappend b/meta-arago-distro/recipes-devtools/go/go_%.bbappend
new file mode 100644
index 00000000..56e50fcc
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/go/go_%.bbappend
@@ -0,0 +1,3 @@
+
+require go-patch.inc
+
-- 
2.17.1


