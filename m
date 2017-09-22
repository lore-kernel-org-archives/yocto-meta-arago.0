Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 20A0752A69
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 19:30:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MJUlf4012591
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 14:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506108647;
	bh=NYlqSyTwUwnHtD7YyIq4E+A0exdqMlgvK/601tKiSzM=;
	h=From:To:CC:Subject:Date;
	b=gmB6j82iFghoaeqB33SBBeeeMxW1XBKRlpZCQ5P9CQZqKP3LcxCEuYvpKM7mWk9x2
	D71NRpOmjtlvc9tCdSpBW6ZMBmZNCnB2j+/5mqZgGxbfyealTSA9umKif78HHCRTit
	Azikcof4Tm+l9o7ft0dEmp+loukDYMEzdb5UOlEY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MJUl3A025069
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 14:30:47 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 14:30:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 14:30:46 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MJUktO025498;
	Fri, 22 Sep 2017 14:30:46 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Sep 2017 15:30:41 -0400
Message-ID: <1506108641-20088-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processsor-sdk] [PATCH] package_ipk.bbclass: include original recipe's SRC_URI in resulting binary IPK packages
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
X-List-Received-Date: Fri, 22 Sep 2017 19:30:47 -0000
Content-Type: text/plain

* This is reverting the OE commit at http://cgit.openembedded.org/openembedded-core/
  commit/?h=morty&id=4c353eeff45f91533f22392f129bc5a477ee5207 so that the URLs can
  be used to populate the corresponding field in the software manifests

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 classes/package_ipk.bbclass | 300 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 300 insertions(+)
 create mode 100644 classes/package_ipk.bbclass

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
new file mode 100644
index 0000000..933a04c
--- /dev/null
+++ b/classes/package_ipk.bbclass
@@ -0,0 +1,300 @@
+inherit package
+
+IMAGE_PKGTYPE ?= "ipk"
+
+IPKGCONF_TARGET = "${WORKDIR}/opkg.conf"
+IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
+
+PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
+
+# Program to be used to build opkg packages
+OPKGBUILDCMD ??= "opkg-build"
+
+OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
+OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", True) == "1"]}"
+OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE', True) or "").split())][(d.getVar("PACKAGE_EXCLUDE", True) or "") != ""]}"
+
+OPKGLIBDIR = "${localstatedir}/lib"
+
+python do_package_ipk () {
+    import re, copy
+    import textwrap
+    import subprocess
+    import collections
+
+    oldcwd = os.getcwd()
+
+    workdir = d.getVar('WORKDIR', True)
+    outdir = d.getVar('PKGWRITEDIRIPK', True)
+    tmpdir = d.getVar('TMPDIR', True)
+    pkgdest = d.getVar('PKGDEST', True)
+    if not workdir or not outdir or not tmpdir:
+        bb.error("Variables incorrectly set, unable to package")
+        return
+
+    packages = d.getVar('PACKAGES', True)
+    if not packages or packages == '':
+        bb.debug(1, "No packages; nothing to do")
+        return
+
+    # We're about to add new packages so the index needs to be checked
+    # so remove the appropriate stamp file.
+    if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
+        os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))
+
+    def cleanupcontrol(root):
+        for p in ['CONTROL', 'DEBIAN']:
+            p = os.path.join(root, p)
+            if os.path.exists(p):
+                bb.utils.prunedir(p)
+
+    for pkg in packages.split():
+        localdata = bb.data.createCopy(d)
+        root = "%s/%s" % (pkgdest, pkg)
+
+        lf = bb.utils.lockfile(root + ".lock")
+
+        localdata.setVar('ROOT', '')
+        localdata.setVar('ROOT_%s' % pkg, root)
+        pkgname = localdata.getVar('PKG_%s' % pkg, True)
+        if not pkgname:
+            pkgname = pkg
+        localdata.setVar('PKG', pkgname)
+
+        localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
+
+        bb.data.update_data(localdata)
+        basedir = os.path.join(os.path.dirname(root))
+        arch = localdata.getVar('PACKAGE_ARCH', True)
+
+        if localdata.getVar('IPK_HIERARCHICAL_FEED', False) == "1":
+            # Spread packages across subdirectories so each isn't too crowded
+            if pkgname.startswith('lib'):
+                pkg_prefix = 'lib' + pkgname[3]
+            else:
+                pkg_prefix = pkgname[0]
+
+            # Keep -dbg, -dev, -doc, -staticdev, -locale and -locale-* packages
+            # together. These package suffixes are taken from the definitions of
+            # PACKAGES and PACKAGES_DYNAMIC in meta/conf/bitbake.conf
+            if pkgname[-4:] in ('-dbg', '-dev', '-doc'):
+                pkg_subdir = pkgname[:-4]
+            elif pkgname.endswith('-staticdev'):
+                pkg_subdir = pkgname[:-10]
+            elif pkgname.endswith('-locale'):
+                pkg_subdir = pkgname[:-7]
+            elif '-locale-' in pkgname:
+                pkg_subdir = pkgname[:pkgname.find('-locale-')]
+            else:
+                pkg_subdir = pkgname
+
+            pkgoutdir = "%s/%s/%s/%s" % (outdir, arch, pkg_prefix, pkg_subdir)
+        else:
+            pkgoutdir = "%s/%s" % (outdir, arch)
+
+        bb.utils.mkdirhier(pkgoutdir)
+        os.chdir(root)
+        cleanupcontrol(root)
+        from glob import glob
+        g = glob('*')
+        if not g and localdata.getVar('ALLOW_EMPTY', False) != "1":
+            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
+            bb.utils.unlockfile(lf)
+            continue
+
+        controldir = os.path.join(root, 'CONTROL')
+        bb.utils.mkdirhier(controldir)
+        try:
+            ctrlfile = open(os.path.join(controldir, 'control'), 'w')
+        except OSError:
+            bb.utils.unlockfile(lf)
+            bb.fatal("unable to open control file for writing")
+
+        fields = []
+        pe = d.getVar('PKGE', True)
+        if pe and int(pe) > 0:
+            fields.append(["Version: %s:%s-%s\n", ['PKGE', 'PKGV', 'PKGR']])
+        else:
+            fields.append(["Version: %s-%s\n", ['PKGV', 'PKGR']])
+        fields.append(["Description: %s\n", ['DESCRIPTION']])
+        fields.append(["Section: %s\n", ['SECTION']])
+        fields.append(["Priority: %s\n", ['PRIORITY']])
+        fields.append(["Maintainer: %s\n", ['MAINTAINER']])
+        fields.append(["License: %s\n", ['LICENSE']])
+        fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
+        fields.append(["OE: %s\n", ['PN']])
+        if d.getVar('HOMEPAGE', True):
+            fields.append(["Homepage: %s\n", ['HOMEPAGE']])
+
+        def pullData(l, d):
+            l2 = []
+            for i in l:
+                l2.append(d.getVar(i, True))
+            return l2
+
+        ctrlfile.write("Package: %s\n" % pkgname)
+        # check for required fields
+        try:
+            for (c, fs) in fields:
+                for f in fs:
+                    if localdata.getVar(f, False) is None:
+                        raise KeyError(f)
+                # Special behavior for description...
+                if 'DESCRIPTION' in fs:
+                    summary = localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', True) or "."
+                    ctrlfile.write('Description: %s\n' % summary)
+                    description = localdata.getVar('DESCRIPTION', True) or "."
+                    description = textwrap.dedent(description).strip()
+                    if '\\n' in description:
+                        # Manually indent
+                        for t in description.split('\\n'):
+                            # We don't limit the width when manually indent, but we do
+                            # need the textwrap.fill() to set the initial_indent and
+                            # subsequent_indent, so set a large width
+                            ctrlfile.write('%s\n' % textwrap.fill(t.strip(), width=100000, initial_indent=' ', subsequent_indent=' '))
+                    else:
+                        # Auto indent
+                        ctrlfile.write('%s\n' % textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' '))
+                else:
+                    ctrlfile.write(c % tuple(pullData(fs, localdata)))
+        except KeyError:
+            import sys
+            (type, value, traceback) = sys.exc_info()
+            ctrlfile.close()
+            bb.utils.unlockfile(lf)
+            bb.fatal("Missing field for ipk generation: %s" % value)
+        # more fields
+
+        custom_fields_chunk = get_package_additional_metadata("ipk", localdata)
+        if custom_fields_chunk is not None:
+            ctrlfile.write(custom_fields_chunk)
+            ctrlfile.write("\n")
+
+        mapping_rename_hook(localdata)
+
+        def debian_cmp_remap(var):
+            # In debian '>' and '<' do not mean what it appears they mean
+            #   '<' = less or equal
+            #   '>' = greater or equal
+            # adjust these to the '<<' and '>>' equivalents
+            #
+            for dep in var:
+                for i, v in enumerate(var[dep]):
+                    if (v or "").startswith("< "):
+                        var[dep][i] = var[dep][i].replace("< ", "<< ")
+                    elif (v or "").startswith("> "):
+                        var[dep][i] = var[dep][i].replace("> ", ">> ")
+
+        rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
+        debian_cmp_remap(rdepends)
+        rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
+        debian_cmp_remap(rrecommends)
+        rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
+        debian_cmp_remap(rsuggests)
+        # Deliberately drop version information here, not wanted/supported by ipk
+        rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or ""), [])
+        rprovides = collections.OrderedDict(sorted(rprovides.items(), key=lambda x: x[0]))
+        debian_cmp_remap(rprovides)
+        rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
+        debian_cmp_remap(rreplaces)
+        rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")
+        debian_cmp_remap(rconflicts)
+
+        if rdepends:
+            ctrlfile.write("Depends: %s\n" % bb.utils.join_deps(rdepends))
+        if rsuggests:
+            ctrlfile.write("Suggests: %s\n" % bb.utils.join_deps(rsuggests))
+        if rrecommends:
+            ctrlfile.write("Recommends: %s\n" % bb.utils.join_deps(rrecommends))
+        if rprovides:
+            ctrlfile.write("Provides: %s\n" % bb.utils.join_deps(rprovides))
+        if rreplaces:
+            ctrlfile.write("Replaces: %s\n" % bb.utils.join_deps(rreplaces))
+        if rconflicts:
+            ctrlfile.write("Conflicts: %s\n" % bb.utils.join_deps(rconflicts))
+        src_uri = localdata.getVar("SRC_URI", True).strip() or "None"
+        if src_uri:
+            src_uri = re.sub("\s+", " ", src_uri)
+            ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
+
+        ctrlfile.close()
+
+        for script in ["preinst", "postinst", "prerm", "postrm"]:
+            scriptvar = localdata.getVar('pkg_%s' % script, True)
+            if not scriptvar:
+                continue
+            try:
+                scriptfile = open(os.path.join(controldir, script), 'w')
+            except OSError:
+                bb.utils.unlockfile(lf)
+                bb.fatal("unable to open %s script file for writing" % script)
+            scriptfile.write(scriptvar)
+            scriptfile.close()
+            os.chmod(os.path.join(controldir, script), 0o755)
+
+        conffiles_str = ' '.join(get_conffiles(pkg, d))
+        if conffiles_str:
+            try:
+                conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
+            except OSError:
+                bb.utils.unlockfile(lf)
+                bb.fatal("unable to open conffiles for writing")
+            for f in conffiles_str.split():
+                if os.path.exists(oe.path.join(root, f)):
+                    conffiles.write('%s\n' % f)
+            conffiles.close()
+
+        os.chdir(basedir)
+        ret = subprocess.call("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH", True),
+                                                          d.getVar("OPKGBUILDCMD", True), pkg, pkgoutdir), shell=True)
+        if ret != 0:
+            bb.utils.unlockfile(lf)
+            bb.fatal("opkg-build execution failed")
+
+        if d.getVar('IPK_SIGN_PACKAGES', True) == '1':
+            ipkver = "%s-%s" % (d.getVar('PKGV', True), d.getVar('PKGR', True))
+            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH', True))
+            sign_ipk(d, ipk_to_sign)
+
+        cleanupcontrol(root)
+        bb.utils.unlockfile(lf)
+
+    os.chdir(oldcwd)
+}
+# Otherwise allarch packages may change depending on override configuration
+do_package_ipk[vardepsexclude] = "OVERRIDES"
+
+SSTATETASKS += "do_package_write_ipk"
+do_package_write_ipk[sstate-inputdirs] = "${PKGWRITEDIRIPK}"
+do_package_write_ipk[sstate-outputdirs] = "${DEPLOY_DIR_IPK}"
+
+python do_package_write_ipk_setscene () {
+    tmpdir = d.getVar('TMPDIR', True)
+
+    if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
+        os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))
+
+    sstate_setscene(d)
+}
+addtask do_package_write_ipk_setscene
+
+python () {
+    if d.getVar('PACKAGES', True) != '':
+        deps = ' opkg-utils-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
+        d.appendVarFlag('do_package_write_ipk', 'depends', deps)
+        d.setVarFlag('do_package_write_ipk', 'fakeroot', "1")
+}
+
+python do_package_write_ipk () {
+    bb.build.exec_func("read_subpackage_metadata", d)
+    bb.build.exec_func("do_package_ipk", d)
+}
+do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
+do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
+do_package_write_ipk[umask] = "022"
+addtask package_write_ipk after do_packagedata do_package
+
+PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
+PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
+
+do_build[recrdeptask] += "do_package_write_ipk"
-- 
1.9.1


