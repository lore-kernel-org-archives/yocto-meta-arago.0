Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 04C3552099
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2015 22:52:37 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLB00DL0U6W8GB0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Mar 2015 17:52:21 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Pd9IXZlY c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=iWkq9tAsQ6zA-99HRgkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6211520199;	Mon,
	16 Mar 2015 18:52:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Mar 2015 18:51:59 -0400
Message-id: <1426546322-25230-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1426546322-25230-1-git-send-email-denis@denix.org>
References: <1426546322-25230-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/7] gcc: handle different TARGET_SYS of OE vs. Linaro via symlinks
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
X-List-Received-Date: Mon, 16 Mar 2015 22:52:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/gcc/gcc_linaro-4.7.bbappend   | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend

diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend b/meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend
new file mode 100644
index 0000000..91db51a
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend
@@ -0,0 +1,73 @@
+PR_append = "-arago0"
+
+FILES_${PN} = "\
+  ${bindir}/${TARGET_PREFIX}gcc* \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/collect2 \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/cc* \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/lto* \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/lib*${SOLIBS} \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
+  ${gcclibdir}/${ELT_TARGET_SYS}/${BINV}/*.o \
+  ${gcclibdir}/${ELT_TARGET_SYS}/${BINV}/specs \
+  ${gcclibdir}/${ELT_TARGET_SYS}/${BINV}/lib*${SOLIBS} \
+  ${gcclibdir}/${ELT_TARGET_SYS}/${BINV}/include \
+  ${gcclibdir}/${ELT_TARGET_SYS}/${BINV}/include-fixed \
+  ${libexecdir}/gcc/${TARGET_SYS} \
+  ${gcclibdir}/${TARGET_SYS} \
+"
+
+FILES_${PN}-dbg += "\
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/.debug/ \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/plugin/.debug/ \
+"
+
+FILES_${PN}-dev = "\
+  ${gcclibdir}/${ELT_TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
+"
+
+FILES_${PN}-plugin-dev = "\
+  ${gcclibdir}/${ELT_TARGET_SYS}/${BINV}/plugin/include/ \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/plugin/gengtype \
+  ${gcclibdir}/${ELT_TARGET_SYS}/${BINV}/plugin/gtype.state \
+"
+
+FILES_${PN}-plugins = "\
+  ${gcclibdir}/${ELT_TARGET_SYS}/${BINV}/plugin \
+"
+
+FILES_g77 = "\
+  ${bindir}/${TARGET_PREFIX}g77 \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/f771 \
+"
+
+FILES_gfortran = "\
+  ${bindir}/${TARGET_PREFIX}gfortran \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/f951 \
+"
+
+FILES_cpp = "\
+  ${bindir}/${TARGET_PREFIX}cpp \
+  ${base_libdir}/cpp \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/cc1 \
+"
+
+FILES_g++ = "\
+  ${bindir}/${TARGET_PREFIX}g++ \
+  ${libexecdir}/gcc/${ELT_TARGET_SYS}/${BINV}/cc1plus \
+"
+
+FILES_${PN}-doc = "\
+  ${infodir} \
+  ${mandir} \
+  ${gcclibdir}/${ELT_TARGET_SYS}/${BINV}/include/README \
+"
+
+do_install_append() {
+  cd ${D}/${libexecdir}/gcc/
+  mv ${TARGET_SYS} ${ELT_TARGET_SYS}
+  ln -sf ${ELT_TARGET_SYS} ${TARGET_SYS}
+  cd ${D}/${gcclibdir}
+  mv ${TARGET_SYS} ${ELT_TARGET_SYS}
+  ln -sf ${ELT_TARGET_SYS} ${TARGET_SYS}
+}
-- 
2.2.0


